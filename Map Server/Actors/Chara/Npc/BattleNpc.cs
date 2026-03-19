/*
===========================================================================
Copyright (C) 2015-2019 Project Meteor Dev Team

This file is part of Project Meteor Server.

Project Meteor Server is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Project Meteor Server is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with Project Meteor Server. If not, see <https:www.gnu.org/licenses/>.
===========================================================================
*/

using Google.Protobuf.WellKnownTypes;
using Meteor.Common;
using Meteor.Map.actors.chara;
using Meteor.Map.actors.chara.ai;
using Meteor.Map.actors.chara.ai.controllers;
using Meteor.Map.actors.chara.ai.state;
using Meteor.Map.actors.chara.ai.utils;
using Meteor.Map.actors.chara.npc;
using Meteor.Map.actors.group;
using Meteor.Map.Actors.Chara;
using Meteor.Map.packets.send.actor;
using Meteor.Map.packets.send.actor.battle;
using Meteor.Map.utils;
using NLog.Filters;
using System;
using System.Collections.Generic;

namespace Meteor.Map.Actors
{
    [Flags]
    enum DetectionType
    {
        None                  = 0x00,
        Sight                 = 0x01,
        Scent                 = 0x02,
        Sound                 = 0x04,
        LowHp                 = 0x08,
        IgnoreLevelDifference = 0x10,
        Magic                 = 0x20,
    }

    enum KindredType
    {
        Unknown   = 0,
        Beast     = 1,
        Plantoid  = 2,
        Aquan     = 3,
        Spoken    = 4,
        Reptilian = 5,
        Insect    = 6,
        Avian     = 7,
        Undead    = 8,
        Cursed    = 9,
        Voidsent  = 10,
    }

    class BattleNpc : Npc
    {
        public HateContainer hateContainer;
        public DetectionType detectionType;
        public KindredType kindredType;
        public bool isHostile;
        protected uint despawnTime;
        protected uint respawnTime;
        protected uint spawnDistance;
        protected uint bnpcId;
        public Character lastAttacker;
        //public string uniqueIdentifier;
        public bool preserveScriptedActiveState = false;

        public uint spellListId, skillListId, dropListId;
        public Dictionary<uint, BattleCommand> skillList = new Dictionary<uint, BattleCommand>();
        public Dictionary<uint, BattleCommand> spellList = new Dictionary<uint, BattleCommand>();


        protected Dictionary<MobModifier, Int64> mobModifiers = new Dictionary<MobModifier, Int64>();      

        // BattleNpc setup to use custom displayed name as scripted or databased.
        // Currently used to handle overworld mobs.
        public BattleNpc(int actorNumber, ActorClass bnpcId, string uniqueId, Area spawnedArea, float posX, float posY, float posZ, float rot, ushort actorState, uint animId, string displayName)
            : base(actorNumber, bnpcId, uniqueId, spawnedArea, posX, posY, posZ, rot, actorState, animId, displayName)  
        {
            this.aiContainer = new AIContainer(this, new BattleNpcController(this), new PathFind(this), new TargetFind(this));

            //this.currentSubState = SetActorStatePacket.SUB_STATE_MONSTER;
            //this.currentMainState = SetActorStatePacket.MAIN_STATE_ACTIVE;

            //this.currentMainState = actorState;
            //this.animationId = animId;

            charaWork.property[2] = 1;
            //npcWork.hateType = 1;
            
            this.hateContainer = new HateContainer(this);
            this.allegiance = CharacterTargetingAllegiance.BattleNpcs;

            this.uniqueIdentifier = uniqueId;

            spawnX = posX;
            spawnY = posY;
            spawnZ = posZ;

            despawnTime = 10;
            this.CalculateStats();
            this.RecalculateStats();
        }

        public override List<SubPacket> GetSpawnPackets(Player player, ushort spawnType)
        {
            List<SubPacket> subpackets = new List<SubPacket>();
            if (IsAlive())
            {
                subpackets.Add(CreateAddActorPacket());
                subpackets.AddRange(GetEventConditionPackets());
                subpackets.Add(CreateSpeedPacket());
                subpackets.Add(CreateSpawnPositonPacket(0x0));

                subpackets.Add(CreateAppearancePacket());

                subpackets.Add(CreateNamePacket());
                subpackets.Add(CreateStatePacket());
                subpackets.Add(CreateSubStatePacket());
                subpackets.Add(CreateInitStatusPacket());
                subpackets.Add(CreateSetActorIconPacket());
                subpackets.Add(CreateIsZoneingPacket());
                subpackets.Add(CreateScriptBindPacket(player));
                subpackets.Add(GetHateTypePacket(player));
            }
            return subpackets;
        }

        //NEW - Attach AI Preset from AIContainer
        public void AttachAI(string presetName)
        {
            if (string.IsNullOrWhiteSpace(presetName))
                return;

            switch (presetName.Trim().ToUpperInvariant())
            {
                case "DPS":
                    aiContainer.ApplyPreset(AIContainer.AIPreset.DPS);
                    break;

                case "TANK":
                    aiContainer.ApplyPreset(AIContainer.AIPreset.Tank);
                    break;

                case "HEALER":
                    aiContainer.ApplyPreset(AIContainer.AIPreset.Healer);
                    break;
            }
        }

        public string GetAIPreset()
        {
            return aiContainer.GetAIPreset().ToString();
        }

        //This might need more work
        //I think there migh be something that ties mobs to parties 
        //and the client checks if any mobs are tied to the current party
        //and bases the color on that. Adding mob to party obviously doesn't work
        //Based on depictionjudge script:
        //HATE_TYPE_NONE is for passive
        //HATE_TYPE_ENGAGED is for aggroed mobs
        //HATE_TYPE_ENGAGED_PARTY is for claimed mobs, client uses occupancy group to determine if mob is claimed by player's party
        //for now i'm just going to assume that occupancygroup will be BattleNpc's currentparties when they're in combat, 
        //so if party isn't null, they're claimed.
        public SubPacket GetHateTypePacket(Player player)
        {
            npcWork.hateType = NpcWork.HATE_TYPE_NONE;
            if (player != null)
            {
                if (aiContainer.IsEngaged())
                {
                    npcWork.hateType = NpcWork.HATE_TYPE_ENGAGED;

                    if (this.currentParty != null)
                    {
                        npcWork.hateType = NpcWork.HATE_TYPE_ENGAGED_PARTY;
                    }
                }
            }
            //  Force hate type for testing.
            //  1 = yellow nameplate. 
            //  2 = Orange nameplate.
            //  3 = purple nameplate.
            //npcWork.hateType = 1; 

            var propPacketUtil = new ActorPropertyPacketUtil("npcWork/hate", this);
            propPacketUtil.AddProperty("npcWork.hateType");
            return propPacketUtil.Done()[0];
        }

        public uint GetDetectionType()
        {
            return (uint)detectionType;
        }
        
        public void SetDetectionType(uint detectionType)
        {
            this.detectionType = (DetectionType)detectionType;
        }

        public override void Update(DateTime tick)
        {
            this.aiContainer.Update(tick);
            this.statusEffects.Update(tick);
        }

        public override void PostUpdate(DateTime tick, List<SubPacket> packets = null)
        {
            // todo: should probably add another flag for battleTemp since all this uses reflection
            packets = new List<SubPacket>();
            if ((updateFlags & ActorUpdateFlags.HpTpMp) != 0)
            {
                var propPacketUtil = new ActorPropertyPacketUtil("charaWork/stateAtQuicklyForAll", this);
                propPacketUtil.AddProperty("charaWork.parameterSave.state_mainSkill[0]");
                propPacketUtil.AddProperty("charaWork.parameterSave.state_mainSkillLevel");
                propPacketUtil.AddProperty("charaWork.parameterSave.hp[0]");
                propPacketUtil.AddProperty("charaWork.parameterSave.hpMax[0]");

                propPacketUtil.AddProperty("charaWork.battleTemp.castGauge_speed[0]");
                propPacketUtil.AddProperty("charaWork.battleTemp.castGauge_speed[1]");
                packets.AddRange(propPacketUtil.Done());
            }
            base.PostUpdate(tick, packets);
        }

        public override bool CanAttack()
        {
            // todo:
            return true;
        }

        public override uint GetAttackRange()
        {
            return (uint)Math.Round(GetAutoAttackRange());
        }

        public override float GetAutoAttackRange()
        {
            const float meleeRange = 3.0f;
            const float lanceRange = 4.0f;
            const float rangedRange = 20.0f;

            switch (GetCurrentClassOrJob())
            {
                case Job.Archer:
                case Job.Bard:
                    return rangedRange;

                case Job.Lancer:
                case Job.Dragoon:
                    return lanceRange;

                default:
                    return meleeRange;
            }
        }

        public override bool IsRangedAutoAttack()
        {
            switch (GetCurrentClassOrJob())
            {
                case Job.Archer:
                case Job.Bard:
                    return true;

                default:
                    return false;
            }
        }

        public override bool CanUse(Character target, BattleCommand spell, CommandResult error = null)
        {
            if (target == null)
                return false;

            float allowedRange = spell.range;
            float allowedHeight = spell.rangeHeight;

            if (Utils.XZDistance(positionX, positionZ, target.positionX, target.positionZ) > allowedRange)
                return false;

            if (Math.Abs(target.positionY - positionY) > (allowedHeight / 2.0f))
                return false;

            if (!IsValidTarget(target, spell.mainTarget) || !spell.IsValidMainTarget(this, target))
                return false;

            return true;
        }

        public uint GetDespawnTime()
        {
            return despawnTime;
        }

        public void SetDespawnTime(uint seconds)
        {
            despawnTime = seconds;
        }

        public uint GetRespawnTime()
        {
            return respawnTime;
        }

        public void SetRespawnTime(uint seconds)
        {
            respawnTime = seconds;
        }

        ///<summary> // todo: create an action object? </summary>
        public bool OnAttack(AttackState state)
        {
            return false;
        }

        public override void Spawn(DateTime tick)
        {
            if (respawnTime > 0)
            {
                ForceRespawn();
            }
        }

        public void ForceRespawn()
        {
            base.Spawn(Program.Tick);

            this.isMovingToSpawn = false;
            this.hateContainer.ClearHate();
            CurrentArea.BroadcastPacketsAroundActor(this, GetSpawnPackets(null, 0x01));
            CurrentArea.BroadcastPacketsAroundActor(this, GetInitPackets());
            CalculateStats(true, ModifierOrigin.Equipment, ModifierOrigin.StatusEffect);

            OnSpawn();
            updateFlags |= ActorUpdateFlags.AllNpc;
        }

        public override void Die(DateTime tick, CommandResultContainer actionContainer = null)
        {
            if (IsAlive())
            {
                if (lastAttacker is Pet pet &&
                    pet.aiContainer.GetController<PetController>() != null &&
                    pet.aiContainer.GetController<PetController>().GetPetMaster() is Player petMaster)
                {
                    lastAttacker = petMaster;
                }

                var credited = new HashSet<uint>();
                var creditedPlayers = new List<Player>();

                void AddCreditedPlayer(Player player)
                {
                    if (player == null)
                        return;

                    if (credited.Add(player.Id))
                        creditedPlayers.Add(player);
                }

                // If Player Kills
                if (lastAttacker is Player killer)
                {
                    AddCreditedPlayer(killer);

                    if (killer.currentParty is Party party)
                    {
                        foreach (var memberId in party.members)
                        {
                            var partyMember = CurrentArea.FindActorInArea<Character>(memberId);
                            if (partyMember is Player pm)
                                AddCreditedPlayer(pm);
                        }
                    }
                }
                // If Ally Party Member kills
                else if (lastAttacker is Ally ally)
                {
                    if (ally.currentParty is Party party)
                    {
                        foreach (var memberId in party.members)
                        {
                            var partyMember = CurrentArea.FindActorInArea<Character>(memberId);
                            if (partyMember is Player pm)
                                AddCreditedPlayer(pm);
                        }
                    }
                    else if (ally.currentContentGroup != null)
                    {
                        foreach (var memberId in ally.currentContentGroup.GetMembers())
                        {
                            var member = CurrentArea.FindActorInArea<Character>(memberId);
                            if (member is Player pm)
                                AddCreditedPlayer(pm);
                        }
                    }
                }

                foreach (var player in creditedPlayers)
                {
                    player.HandleBNpcKill(GetActorClassId());
                    lua.LuaEngine.CallLuaBattleFunction(this, "onDeath", this, player, lastAttacker);
                    BattleUtils.AddBattleBonusEXP(player, this, actionContainer);
                }

                if (positionUpdates != null)
                    positionUpdates.Clear();

                aiContainer.InternalDie(tick, despawnTime);

                lua.LuaEngine.GetInstance().OnSignal("mobkill");
            }
            else
            {
                var err = String.Format("[{0}][{1}] {2} {3} {4} {5} tried to die ded", Id, GetUniqueId(), positionX, positionY, positionZ, CurrentArea.GetName());
                Program.Log.Error(err);
            }
        }

        public override void Despawn(DateTime tick)
        {
            // todo: probably didnt need to make a new state...
            aiContainer.InternalDespawn(tick, respawnTime);
            lua.LuaEngine.CallLuaBattleFunction(this, "onDespawn", this);
            this.isAtSpawn = true;
        }

        public void OnRoam(DateTime tick)
        {
            // leash back to spawn
            if (!IsCloseToSpawn())
            {
                if (!isMovingToSpawn)
                {
                    aiContainer.Reset();
                    isMovingToSpawn = true;
                }
                else
                {
                    if (target == null && !aiContainer.pathFind.IsFollowingPath())
                        aiContainer.pathFind.PathInRange(spawnX, spawnY, spawnZ, 1.5f, 15.0f);
                }
            }
            else
            {
                // recover hp
                if (HPP < 100)
                {
                    AddHP(MaxHP / 1);
                }
                else
                {
                    this.isMovingToSpawn = false;
                }
            }
        }

        public bool IsCloseToSpawn()
        {
            return this.isAtSpawn = Utils.DistanceSquared(positionX, positionY, positionZ, spawnX, spawnY, spawnZ) <= 2500.0f;
        }

        public override void OnAttack(State state, CommandResult action, ref CommandResult error)
        {
            base.OnAttack(state, action, ref error);
            // todo: move this somewhere else prolly and change based on model/appearance (so maybe in Character.cs instead)
            action.animation = 0x11001000; // (temporary) wolf anim

            if (GetMobMod((uint)MobModifier.AttackScript) != 0)
                lua.LuaEngine.CallLuaBattleFunction(this, "onAttack", this, state.GetTarget(), action.amount);
        }

        public override void OnCast(State state, CommandResult[] actions, BattleCommand spell, ref CommandResult[] errors)
        {
            base.OnCast(state, actions, spell, ref errors);

            if (GetMobMod((uint)MobModifier.SpellScript) != 0)
                foreach (var action in actions)
                    lua.LuaEngine.CallLuaBattleFunction(this, "onCast", this, CurrentArea.FindActorInArea<Character>(action.targetId), ((MagicState)state).GetSpell(), action);
        }

        public override void OnAbility(State state, CommandResult[] actions, BattleCommand ability, ref CommandResult[] errors)
        {
            base.OnAbility(state, actions, ability, ref errors);

            /*
            if (GetMobMod((uint)MobModifier.AbilityScript) != 0)
                foreach (var action in actions)
                    lua.LuaEngine.CallLuaBattleFunction(this, "onAbility", this, zone.FindActorInArea<Character>(action.targetId), ((AbilityState)state).GetAbility(), action);
            */
        }

        public override void OnWeaponSkill(State state, CommandResult[] actions, BattleCommand skill, ref CommandResult[] errors)
        {
            base.OnWeaponSkill(state, actions, skill, ref errors);

            if (GetMobMod((uint)MobModifier.WeaponSkillScript) != 0)
                foreach (var action in actions)
                    lua.LuaEngine.CallLuaBattleFunction(this, "onWeaponSkill", this, CurrentArea.FindActorInArea<Character>(action.targetId), ((WeaponSkillState)state).GetWeaponSkill(), action);
        }

        public override void OnSpawn()
        {
            base.OnSpawn();
            lua.LuaEngine.CallLuaBattleFunction(this, "onSpawn", this);
        }

        public override void OnDeath()
        {
            base.OnDeath();
        }

        public override void OnDespawn()
        {
            base.OnDespawn();
        }

        public uint GetBattleNpcId()
        {
            return bnpcId;
        }

        public void SetBattleNpcId(uint id)
        {
            this.bnpcId = id;
        }

        public Int64 GetMobMod(MobModifier mobMod)
        {
            return GetMobMod((uint)mobMod);
        }

        public Int64 GetMobMod(uint mobModId)
        {
            Int64 res;
            if (mobModifiers.TryGetValue((MobModifier)mobModId, out res))
                return res;
            return 0;
        }

        public void SetMobMod(uint mobModId, Int64 val)
        {
            if (mobModifiers.ContainsKey((MobModifier)mobModId))
                mobModifiers[(MobModifier)mobModId] = val;
            else
                mobModifiers.Add((MobModifier)mobModId, val);
        }

        public void SetMobMod(MobModifier mobMod, long val)
{
    if (mobModifiers.ContainsKey(mobMod))
        mobModifiers[mobMod] = val;
    else
        mobModifiers.Add(mobMod, val);
}

        public override void OnDamageTaken(Character attacker, BattleCommand skill, CommandResult action,  CommandResultContainer actionContainer = null)
        {
            if (GetMobMod((uint)MobModifier.DefendScript) != 0)
                lua.LuaEngine.CallLuaBattleFunction(this, "onDamageTaken", this, attacker, action.amount);
            base.OnDamageTaken(attacker, skill, action, actionContainer);
        }
    }
}
