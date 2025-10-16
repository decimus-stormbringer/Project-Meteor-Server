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


using Meteor.Common;
using Meteor.Map.actors.chara.player;
using Meteor.Map.actors.group;
using Meteor.Map.Actors.Chara;
using Meteor.Map.DataObjects;
using Meteor.Map.packets.send.actor;
using Meteor.Map.packets.send.actor.inventory;
using Meteor.Map.utils;
using Meteor.Map.actors.chara.ai;
using System;
using System.Collections.Generic;
using Meteor.Map.actors.chara;
using Meteor.Map.packets.send.actor.battle;
using Meteor.Map.actors.chara.ai.state;
using Meteor.Map.actors.chara.ai.utils;
using Meteor.Map.actors.chara.npc;
using System.Linq;
using System.Collections.Immutable;


namespace Meteor.Map.Actors
{
    /// <summary> Which Character types am I friendly with </summary>
    enum CharacterTargetingAllegiance
    {
        /// <summary> Friendly to BattleNpcs </summary>
        BattleNpcs,
        /// <summary> Friendly to Players </summary>
        Player
    }

    enum DamageTakenType
    {
        None,
        Attack,
        Magic,
        Weaponskill,
        Ability
    }

    class Character : Actor
    {
        public const int CLASSID_PUG = 2;
        public const int CLASSID_GLA = 3;
        public const int CLASSID_MRD = 4;
        public const int CLASSID_ARC = 7;
        public const int CLASSID_LNC = 8;
        public const int CLASSID_THM = 22;
        public const int CLASSID_CNJ = 23;

        public const int CLASSID_CRP = 29;
        public const int CLASSID_BSM = 30;
        public const int CLASSID_ARM = 31;
        public const int CLASSID_GSM = 32;
        public const int CLASSID_LTW = 33;
        public const int CLASSID_WVR = 34;
        public const int CLASSID_ALC = 35;
        public const int CLASSID_CUL = 36;

        public const int CLASSID_MIN = 39;
        public const int CLASSID_BTN = 40;
        public const int CLASSID_FSH = 41;

        public const int SIZE = 0;
        public const int COLORINFO = 1;
        public const int FACEINFO = 2;
        public const int HIGHLIGHT_HAIR = 3;
        public const int VOICE = 4;
        public const int MAINHAND = 5;
        public const int OFFHAND = 6;
        public const int SPMAINHAND = 7;
        public const int SPOFFHAND = 8;
        public const int THROWING = 9;
        public const int PACK = 10;
        public const int POUCH = 11;
        public const int HEADGEAR = 12;
        public const int BODYGEAR = 13;
        public const int LEGSGEAR = 14;
        public const int HANDSGEAR = 15;
        public const int FEETGEAR = 16;
        public const int WAISTGEAR = 17;
        public const int NECKGEAR = 18;
        public const int L_EAR = 19;
        public const int R_EAR = 20;
        public const int R_WRIST = 21;
        public const int L_WRIST = 22;
        public const int R_RINGFINGER = 23;
        public const int L_RINGFINGER = 24;
        public const int R_INDEXFINGER = 25;
        public const int L_INDEXFINGER = 26;
        public const int UNKNOWN = 27;

        public bool isStatic = false;

        public bool isMovingToSpawn = false;
        public bool isAutoAttackEnabled = true;

        public uint modelId;
        public uint[] appearanceIds = new uint[28];

        public uint animationId = 0;

        public uint currentTarget = Actor.INVALID_ACTORID;
        public uint currentLockedTarget = Actor.INVALID_ACTORID;

        public uint currentActorIcon = 0;

        public Work work = new Work();
        public CharaWork charaWork = new CharaWork();

        public Group currentParty = null;
        public ContentGroup currentContentGroup = null;
        
        //public DateTime lastAiUpdate;

        public AIContainer aiContainer;
        public StatusEffectContainer statusEffects;

        public CharacterTargetingAllegiance allegiance;

        public Pet pet;

        private ModifierContainer modifiers;

        protected ushort hpBase, hpMaxBase, mpBase, mpMaxBase, tpBase;
        protected BattleTemp baseStats = new BattleTemp();
        public ushort currentJob;
        public ushort newMainState;
        public float spawnX, spawnY, spawnZ;

        //I needed some values I could reuse for random stuff, delete later
        public int extraInt;
        public uint extraUint;
        public float extraFloat;

        protected Dictionary<string, UInt64> tempVars = new Dictionary<string, UInt64>();
        
        //Inventory        
        protected Dictionary<ushort, ItemPackage> itemPackages = new Dictionary<ushort, ItemPackage>();
        protected ReferencedItemPackage equipment;

        public Character(uint actorID)
            : base(actorID)
        {
            //Init timer array to "notimer"
            for (int i = 0; i < charaWork.statusShownTime.Length; i++)
                charaWork.statusShownTime[i] = 0;

            this.statusEffects = new StatusEffectContainer(this);
            modifiers = new ModifierContainer();

            // TODO: try to remove the concept of a "defualt mod"? move these into where the values are retrieved?
            SetModDefault(Modifier.AttackRange, 3);
            SetModDefault(Modifier.Delay, (Program.Random.Next(30, 60) * 100));
            SetModDefault(Modifier.HitCount, 1);
            SetModDefault(Modifier.AttackType, (double)ActionProperty.Slashing);
            SetModDefault(Modifier.MovementSpeed, (uint)moveSpeeds[2]);

            spawnX = positionX;
            spawnY = positionY;
            spawnZ = positionZ;
        }

        public SubPacket CreateAppearancePacket()
        {
            SetActorAppearancePacket setappearance = new SetActorAppearancePacket(modelId, appearanceIds);
            return setappearance.BuildPacket(Id);
        }

        public SubPacket CreateInitStatusPacket()
        {
            return (SetActorStatusAllPacket.BuildPacket(Id, charaWork.status));
        }

        public SubPacket CreateSetActorIconPacket()
        {
            return SetActorIconPacket.BuildPacket(Id, currentActorIcon);
        }

        public SubPacket CreateSubStatePacket()
        {
            return SetActorSubStatePacket.BuildPacket(Id, currentSubState);
        }

        public void SetQuestGraphic(Player player, int graphicNum)
        {
            player.QueuePacket(SetActorQuestGraphicPacket.BuildPacket(Id, graphicNum));
        }

        public void SetCurrentContentGroup(ContentGroup group)
        {
            if (group != null)
                charaWork.currentContentGroup = group.GetTypeId();
            else
                charaWork.currentContentGroup = 0;

            currentContentGroup = group;

            ActorPropertyPacketUtil propPacketUtil = new ActorPropertyPacketUtil("charaWork/currentContentGroup", this);
            propPacketUtil.AddProperty("charaWork.currentContentGroup");
            CurrentArea.BroadcastPacketsAroundActor(this, propPacketUtil.Done());
        }

        //This logic isn't correct, order of GetStatusEffects() is not necessarily the same as the actual effects in game. Also sending every time at once isn't needed
        public List<SubPacket> GetActorStatusPackets()
        {
            var propPacketUtil = new ActorPropertyPacketUtil("charaWork/status", this);
            var i = 0;
            foreach (var effect in statusEffects.GetStatusEffects())
            {
                if (!effect.GetHidden())
                {
                    propPacketUtil.AddProperty(String.Format("charaWork.statusShownTime[{0}]", i));
                    propPacketUtil.AddProperty(String.Format("charaWork.statusShownTime[{0}]", i));
                    i++;
                }
            }
            return propPacketUtil.Done();
        }
        
        public void PlayAnimation(uint animId, bool onlySelf = false)
        {
            if (onlySelf)
            {
                if (this is Player)
                    ((Player)this).QueuePacket(PlayAnimationOnActorPacket.BuildPacket(Id, animId));
            }
            else
                CurrentArea.BroadcastPacketAroundActor(this, PlayAnimationOnActorPacket.BuildPacket(Id, animId));
        }
        
        public void DoBattleAction(ushort commandId, uint animationId)
        {
            CurrentArea.BroadcastPacketAroundActor(this, CommandResultX00Packet.BuildPacket(Id, animationId, commandId));
        }

        public void DoBattleAction(ushort commandId, uint animationId, CommandResult result)
        {
            CurrentArea.BroadcastPacketAroundActor(this, CommandResultX01Packet.BuildPacket(Id, animationId, commandId, result));
        }

        public void DoBattleAction(ushort commandId, uint animationId, CommandResult[] results)
        {
            int currentIndex = 0;

            while (true)
            {
                if (results.Length - currentIndex >= 10)
                    CurrentArea.BroadcastPacketAroundActor(this, CommandResultX18Packet.BuildPacket(Id, animationId, commandId, results, ref currentIndex));
                else if (results.Length - currentIndex > 1)
                    CurrentArea.BroadcastPacketAroundActor(this, CommandResultX10Packet.BuildPacket(Id, animationId, commandId, results, ref currentIndex));
                else if (results.Length - currentIndex == 1)
                {
                    CurrentArea.BroadcastPacketAroundActor(this, CommandResultX01Packet.BuildPacket(Id, animationId, commandId, results[currentIndex]));
                    currentIndex++;
                }
                else
                    break;
            }
        }

        public void DoBattleAction(ushort commandId, uint animationId, List<CommandResult> results)
        {
            int currentIndex = 0;

            while (true)
            {
                if (results.Count - currentIndex >= 10)
                    CurrentArea.BroadcastPacketAroundActor(this, CommandResultX18Packet.BuildPacket(Id, animationId, commandId, results, ref currentIndex));
                else if (results.Count - currentIndex > 1)
                    CurrentArea.BroadcastPacketAroundActor(this, CommandResultX10Packet.BuildPacket(Id, animationId, commandId, results, ref currentIndex));
                else if (results.Count - currentIndex == 1)
                {
                    CurrentArea.BroadcastPacketAroundActor(this, CommandResultX01Packet.BuildPacket(Id, animationId, commandId, results[currentIndex]));
                    currentIndex++;
                }
                else
                    break;

                //Sending multiple packets at once causes some issues. Setting any combination of these to zero changes what breaks
                //animationId = 0; //If more than one packet is sent out, only send the animation once to avoid double playing.
                //commandId = 0;
                //sourceActorId = 0;
            }            
        }


        public short GetClass()
        {
            return charaWork.parameterSave.state_mainSkill[0];
        }

        public short ClassId
        {
            get
            {
                return charaWork.parameterSave.state_mainSkill[0];
            }
        }

        public short GetLevel()
        {
            return charaWork.parameterSave.state_mainSkillLevel;
        }

        public Job CurrentClass
        {
            get
            {
                ushort classId = (ushort)ClassId;
                return Enum.IsDefined(typeof(Job), classId) ? (Job)classId : Job.Adventurer;
            }
        }

        //Gets the id of the player's current job. If they aren't a job, gets the id of their class
        public byte GetCurrentClassOrJobId()
        {
            if (currentJob != 0)
                return (byte)currentJob;
            return charaWork.parameterSave.state_mainSkill[0];
        }
        public byte CurrentJobOrClassId
        {
            get
            {
                if (currentJob != 0)
                    return (byte)currentJob;
                return (byte)ClassId;
            }
        }
        public Job CurrentJobOrClass
        {
            get
            {
                ushort classOrJobId = (ushort)CurrentJobOrClassId;
                return Enum.IsDefined(typeof(Job), classOrJobId) ? (Job)classOrJobId : Job.Adventurer;
            }
        }

        public Job GetCurrentClassOrJob()
        {
            var classOrJobId = (ushort)GetCurrentClassOrJobId();
            return Enum.IsDefined(typeof(Job), classOrJobId) ? (Job)classOrJobId : Job.Adventurer;
        }

        public bool HasTrait(ushort id)
        {
            BattleTrait trait = Server.GetWorldManager().GetBattleTrait(id);

            return HasTrait(trait);
        }

        public bool HasTrait(BattleTrait trait)
        {
            return (trait != null) && (trait.job == GetClass()) && (trait.level <= GetLevel());
        }

        public ReferencedItemPackage GetEquipment()
        {
            return equipment;
        }

        #region HP, MP, TP, Stats, and Mods

        public short Level
        {
            get
            {
                return charaWork.parameterSave.state_mainSkillLevel;
            }
            set
            {
                value = value.Clamp<short>(1, 50);
                charaWork.parameterSave.state_mainSkillLevel = value;
            }
        }
         

        public short HP
        {
            get
            {
                return charaWork.parameterSave.hp[0];
            }

            set
            {
                value = value.Clamp(MinHP, MaxHP);

                charaWork.parameterSave.hp[0] = value;

                updateFlags |= ActorUpdateFlags.HpTpMp;
            }
        }

        public short MaxHP
        {
            get
            {
                return charaWork.parameterSave.hpMax[0];
            }

            set
            {
                value = value.Clamp(MinHP, short.MaxValue);

                charaWork.parameterSave.hpMax[0] = value;

                if (MaxHP < HP)
                {
                    HP = MaxHP;
                }

                updateFlags |= ActorUpdateFlags.HpTpMp;
            }
        }

        public short MinHP
        { 
           get
            {
                double minHp = GetMod(Modifier.MinimumHpLock);
                return (short) (minHp >= 0 ? minHp : 0);
            }
        }   

        public short MP
        {
            get
            {
                return charaWork.parameterSave.mp;
            }

            set
            {
                value = value.Clamp(MinMP, MaxMP);

                charaWork.parameterSave.mp = value;

                updateFlags |= ActorUpdateFlags.HpTpMp;
            }
        }

        public short MaxMP
        {
            get
            {
                return charaWork.parameterSave.mpMax;
            }

            set
            {
                value = value.Clamp(MinMP, value);

                charaWork.parameterSave.mpMax = value;

                if (MaxMP < MP)
                {
                    MP = MaxMP;
                }

                updateFlags |= ActorUpdateFlags.HpTpMp;
            }
        }

        public short MinMP
        {
            get
            {
                double minMp = GetMod(Modifier.MinimumMpLock);
                return (short)(minMp >= 0 ? minMp : 0);
            }
        }

        public short TP
        {
            get
            {
                return charaWork.parameterTemp.tp;
            }
            set
            {
                value = value.Clamp(MinTP, MaxTP);
                charaWork.parameterTemp.tp = value;

                updateFlags |= ActorUpdateFlags.HpTpMp;
            }
        }

        public short MaxTP
        {
            get
            {
                return 3000;
            }
        }

        public short MinTP
        {
            get
            {
                double minTp = GetMod(Modifier.MinimumTpLock);
                return (short)(minTp >= 0 ? minTp : 0);
            }
        }

        public byte HPP
        {
            get
            {
                return (byte)(HP <= 0 || MaxHP <= 0 ? 0 : (double)HP / MaxHP * 100);
            }
        }

        public byte MPP
        {
            get
            {
                return (byte)(MP <= 0 || MaxMP <= 0 ? 0 : (double)MP / MaxMP * 100);
            }
        }

        public byte TPP
        {
            get
            {
                return (byte)(TP <= 0 || MaxTP <= 0 ? 0 : (double)TP / MaxTP * 100);
            }
        }

        public void AddHP(int hp, CommandResultContainer resultContainer = null)
        {
            if (!IsAlive() || hp == 0)
            {
                return;
            }

            HP = (short)(HP + hp);

            if (HP < 1)
            {
                Die(Program.Tick, resultContainer);
            }
        }

        public void AddMP(int mp)
        {
            if (!IsAlive() || mp == 0)
            {
                return;
            }

            MP = (short)(MP + mp);

            // todo: check hidden effects and shit
        }

        public void AddTP(int tp)
        {
            if (!IsAlive() || tp == 0)
            {
                return;
            }

            TP = (short)(TP + tp);

            if (TP >= 1000)
            {
                lua.LuaEngine.GetInstance().OnSignal("tpOver1000");
            }
        }

        public void DelHP(int hp, CommandResultContainer resultContainer = null)
        {
            AddHP((short)-hp, resultContainer);
        }

        public void DelMP(int mp)
        {
            AddMP(-mp);
        }

        public void DelTP(int tp)
        {
            AddTP(-tp);
        }

        public double GetMod(Modifier modifier)
        {
            return modifiers.GetMod(modifier);
        }

        public double GetMod(uint modifier)
        {
            return GetMod((Modifier)modifier);
        }

        public void SetMod(Modifier modifier, double val, ModifierOrigin origin)
        {
            modifiers.SetMod(modifier, val, origin);
        }

        public void SetMod(uint modifier, double val, ModifierOrigin origin = ModifierOrigin.Miscellaneous)
        {
            SetMod((Modifier)modifier, val, origin);
        }

        public void SetMod(string modName, int value)
        {
            if (!Enum.TryParse(modName, true, out Modifier mod))
                throw new ArgumentException($"Invalid modifier name: {modName}");

            SetMod((uint)mod, value, ModifierOrigin.Base);
        }

        public void SetModDefault(Modifier modifier, double val)
        {
            modifiers.SetModDefault(modifier, val);
        }

        public void AddMod(Modifier modifier, double val, ModifierOrigin origin)
        {
            modifiers.AddMod(modifier, val, origin);
        }

        public void AddMod(uint modifier, double val, ModifierOrigin origin = ModifierOrigin.Miscellaneous)
        {
            AddMod((Modifier)modifier, val, origin);
        }

        public void SubtractMod(Modifier modifier, double val, ModifierOrigin origin)
        {
            modifiers.SubtractMod(modifier, val, origin);
        }

        public void SubtractMod(uint modifier, double val, ModifierOrigin origin = ModifierOrigin.Miscellaneous)
        {
            SubtractMod((Modifier)modifier, val, origin);
        }

        public void MultiplyMod(Modifier modifier, double val)
        {
            modifiers.MultiplyMod(modifier, val);
        }

        public void MultiplyMod(uint modifier, double val)
        {
            MultiplyMod((Modifier)modifier, val);
        }

        public void DivideMod(Modifier modifier, double val)
        {
            modifiers.DivideMod(modifier, val);
        }

        public void DivideMod(uint modifier, double val)
        {
            DivideMod((Modifier)modifier, val);
        }

        public void ClearMods(params ModifierOrigin[] origins)
        {
            modifiers.ClearMods(origins);
        }

        public virtual float GetSpeed()
        {
            // todo: for battlenpc/player calculate speed
            return (float)GetMod(Modifier.MovementSpeed);
        }

        private static readonly IEnumerable<Modifier> StatModifiers = new List<Modifier>
        {
            Modifier.Strength,
            Modifier.Vitality,
            Modifier.Dexterity,
            Modifier.Intelligence,
            Modifier.Mind,
            Modifier.Piety,
            Modifier.FireResistance,
            Modifier.IceResistance,
            Modifier.WindResistance,
            Modifier.EarthResistance,
            Modifier.LightningResistance,
            Modifier.WaterResistance,
            Modifier.Accuracy,
            Modifier.Evasion,
            Modifier.Attack,
            Modifier.Defense,
            Modifier.AttackMagicPotency,
            Modifier.HealingMagicPotency,
            Modifier.EnhancementMagicPotency,
            Modifier.EnfeeblingMagicPotency,
            Modifier.MagicAccuracy,
            Modifier.MagicEvasion,
            Modifier.Craftsmanship,
            Modifier.MagicCraftsmanship,
            Modifier.Control,
            Modifier.Gathering,
            Modifier.Output,
            Modifier.Perception
        };

        private int GetStatIndex(Modifier modifier)
        {
            switch (modifier)
            {
                case Modifier.Strength: return (int)GeneralParameterIndex.Strength;
                case Modifier.Vitality: return (int)GeneralParameterIndex.Vitality;
                case Modifier.Dexterity: return (int)GeneralParameterIndex.Dexterity;
                case Modifier.Intelligence: return (int)GeneralParameterIndex.Intelligence;
                case Modifier.Mind: return (int)GeneralParameterIndex.Mind;
                case Modifier.Piety: return (int)GeneralParameterIndex.Piety;
                case Modifier.FireResistance: return (int)GeneralParameterIndex.FireResistance;
                case Modifier.IceResistance: return (int)GeneralParameterIndex.IceResistance;
                case Modifier.WindResistance: return (int)GeneralParameterIndex.WindResistance;
                case Modifier.EarthResistance: return (int)GeneralParameterIndex.EarthResistance;
                case Modifier.LightningResistance: return (int)GeneralParameterIndex.LightningResistance;
                case Modifier.WaterResistance: return (int)GeneralParameterIndex.WaterResistance;
                case Modifier.Accuracy: return (int)GeneralParameterIndex.Accuracy;
                case Modifier.Evasion: return (int)GeneralParameterIndex.Evasion;
                case Modifier.Attack: return (int)GeneralParameterIndex.Attack;
                case Modifier.Defense: return (int)GeneralParameterIndex.Defense;
                case Modifier.AttackMagicPotency: return (int)GeneralParameterIndex.AttackMagicPotency;
                case Modifier.HealingMagicPotency: return (int)GeneralParameterIndex.HealingMagicPotency;
                case Modifier.EnhancementMagicPotency: return (int)GeneralParameterIndex.EnhancementMagicPotency;
                case Modifier.EnfeeblingMagicPotency: return (int)GeneralParameterIndex.EnfeeblingMagicPotency;
                case Modifier.MagicAccuracy: return (int)GeneralParameterIndex.MagicAccuracy;
                case Modifier.MagicEvasion: return (int)GeneralParameterIndex.MagicEvasion;
                case Modifier.Craftsmanship: return (int)GeneralParameterIndex.Craftsmanship;
                case Modifier.MagicCraftsmanship: return (int)GeneralParameterIndex.MagicCraftsmanship;
                case Modifier.Control: return (int)GeneralParameterIndex.Control;
                case Modifier.Gathering: return (int)GeneralParameterIndex.Gathering;
                case Modifier.Output: return (int)GeneralParameterIndex.Output;
                case Modifier.Perception: return (int)GeneralParameterIndex.Perception;
                default: return -1;
            }
        }

        private void SetStat(Modifier modifier, short value)
        {
            int statIndex = GetStatIndex(modifier);
            if (statIndex < 0 || statIndex >= charaWork.battleTemp.generalParameter.Length)
            {
                return;
            }

            charaWork.battleTemp.generalParameter[statIndex] = value;

            updateFlags |= ActorUpdateFlags.Stats;
        }

        private short GetStat(Modifier modifier)
        {
            int statIndex = GetStatIndex(modifier);
            if (statIndex < 0 || statIndex >= charaWork.battleTemp.generalParameter.Length)
            {
                return 0;
            }

            return charaWork.battleTemp.generalParameter[statIndex];
        }

        public IEnumerable<ModifierData> GetStats()
        {
            return StatModifiers.Select(m => new ModifierData { Modifier = m, EndValue = GetStat(m) });
        }

        public virtual void CalculateStats(bool resetHpMp = true, params ModifierOrigin[] modifiersToCalculate)
        {
            // Calculate all modifiers for the character, then set stats based on modifiers

            if (modifiersToCalculate.Length == 0 || modifiersToCalculate.Contains(ModifierOrigin.BattleTrait))
            {
                CalculateClassBattleTraitMods();
            }

            if (modifiersToCalculate.Length == 0 || modifiersToCalculate.Contains(ModifierOrigin.Job))
            {
                CalculateJobClassLevelMods();
            }

            if (modifiersToCalculate.Length == 0 || modifiersToCalculate.Contains(ModifierOrigin.Equipment) || modifiersToCalculate.Contains(ModifierOrigin.StatusEffect))
            {
                CalculateEquipmentMods();
            }

            CalculateModsDependentOnMods();

            // Set HP, MP and Stats after calculating all modifiers
            SetMaxHpFromMods();
            SetMaxMpFromMods();
            SetStatsFromMods();

            if (resetHpMp)
            {
                HP = MaxHP;
                MP = MaxMP;
            }
        }

        public void RecalculateStats(params ModifierOrigin[] modifiersToCalculate)
        {
            // Recalculate all modifiers for the character, then set stats based on modifiers
            CalculateStats(false, modifiersToCalculate);
        }

        private void CalculateClassBattleTraitMods()
        {
            // Calculate and set modifiers received from battle traits applicable to the character's class/job and level

            ClearMods(ModifierOrigin.BattleTrait);

            WorldManager worldManager = Server.GetWorldManager();
            List<ushort> traitIds = worldManager.GetAllBattleTraitIdsForClass((byte)GetClass());

            foreach (ushort traitId in traitIds)
            {
                BattleTrait trait = worldManager.GetBattleTrait(traitId);
                if (HasTrait(trait))
                {
                    AddMod((Modifier)trait.modifier, trait.bonus, ModifierOrigin.BattleTrait);
                }
            }
        }

        private void CalculateJobClassLevelMods()
        {
            // Calculate and set modifiers received due to the character being a certain class/job and level

            // Data (ARR 2.0) was retrieved from https://web.archive.org/web/20160501222505/http://valk.dancing-mad.com/tables/attribute-table/
            // TODO: Update values and modifiers to reflect 1.23b verified data

            ClearMods(ModifierOrigin.Job);

            // common mods. Values for GetJobLevelAdjustedMods are StartingValue, EndingValue, and GrowthRate
            AddMod(Modifier.CriticalHitRating, GetJobLevelAdjustedMod(0, 341, 1.06), ModifierOrigin.Job);
            AddMod(Modifier.MagicCriticalHitRating, GetJobLevelAdjustedMod(0, 341, 1.06), ModifierOrigin.Job);
            AddMod(Modifier.Accuracy, GetJobLevelAdjustedMod(0, 341, 1.06), ModifierOrigin.Job);
            AddMod(Modifier.MagicAccuracy, GetJobLevelAdjustedMod(0, 341, 1.06), ModifierOrigin.Job);
            AddMod(Modifier.Parry, GetJobLevelAdjustedMod(0, 341, 1.06), ModifierOrigin.Job);
            AddMod(Modifier.Evasion, GetJobLevelAdjustedMod(0, 341, 1.06), ModifierOrigin.Job);
            AddMod(Modifier.SlashingResistance, GetJobLevelAdjustedMod(0, 100, 1.06), ModifierOrigin.Job);
            AddMod(Modifier.PiercingResistance, GetJobLevelAdjustedMod(0, 100,1.06), ModifierOrigin.Job);
            AddMod(Modifier.BluntResistance, GetJobLevelAdjustedMod(0, 100, 1.06), ModifierOrigin.Job);
            AddMod(Modifier.FireResistance, GetJobLevelAdjustedMod(0, 269, 1.06), ModifierOrigin.Job);
            AddMod(Modifier.IceResistance, GetJobLevelAdjustedMod(0, 269, 1.06), ModifierOrigin.Job);
            AddMod(Modifier.WindResistance, GetJobLevelAdjustedMod(0, 269, 1.06), ModifierOrigin.Job);
            AddMod(Modifier.EarthResistance, GetJobLevelAdjustedMod(0, 269, 1.06), ModifierOrigin.Job);
            AddMod(Modifier.LightningResistance, GetJobLevelAdjustedMod(0, 269, 1.06), ModifierOrigin.Job);
            AddMod(Modifier.WaterResistance, GetJobLevelAdjustedMod(0, 269, 1.06), ModifierOrigin.Job);

            // class specific mods
            IList<ModifierData> classModifiers;
            if (JobClassLvl50Attributes.TryGetValue(CurrentClass, out classModifiers))
            {
                foreach (ModifierData classModifier in classModifiers)
                {
                    AddMod(classModifier.Modifier, GetJobLevelAdjustedMod(classModifier.StartValue, classModifier.EndValue, classModifier.GrowthRate), ModifierOrigin.Job);
                }
            }

            // job specific mods (soul stone)
            IList<ModifierData> jobModifiers;
            if (JobSoulStoneAttributes.TryGetValue(GetCurrentClassOrJob(), out jobModifiers))
            {
                foreach (ModifierData jobModifier in jobModifiers)
                {
                    AddMod(jobModifier.Modifier, GetJobLevelAdjustedMod(jobModifier.StartValue, jobModifier.EndValue, jobModifier.GrowthRate), ModifierOrigin.Job);
                }
            }
        }

        // Data (ARR 2.0) was retrieved from https://web.archive.org/web/20160501222505/http://valk.dancing-mad.com/tables/attribute-table/
        // TODO: Update values and modifiers to reflect 1.23b verified data
        // TODO: add gatherers and crafters. no stats in blitzball exist

        // GrowthRate determines how quickly the stat grows to reach max level value. 
        private static readonly IImmutableDictionary<Job, IList<ModifierData>> JobClassLvl50Attributes = ImmutableDictionary.Create<Job, IList<ModifierData>>()
            .Add(Job.Gladiator, new List<ModifierData>
            {
                new ModifierData { Modifier = Modifier.Hp,             StartValue = 120,    EndValue = 2044,     GrowthRate = 0.45 },
                new ModifierData { Modifier = Modifier.Mp,             StartValue = 65,     EndValue = 1196,     GrowthRate = 0.55 },
                new ModifierData { Modifier = Modifier.Strength,       StartValue = 0,      EndValue = 188,      GrowthRate = 1 },
                new ModifierData { Modifier = Modifier.Vitality,       StartValue = 0,      EndValue = 211,      GrowthRate = 1 },
                new ModifierData { Modifier = Modifier.Dexterity,      StartValue = 0,      EndValue = 177,      GrowthRate = 1 },
                new ModifierData { Modifier = Modifier.Intelligence,   StartValue = 0,      EndValue = 98,       GrowthRate = 1 },
                new ModifierData { Modifier = Modifier.Mind,           StartValue = 0,      EndValue = 188,      GrowthRate = 1 },
                new ModifierData { Modifier = Modifier.Piety,          StartValue = 0,      EndValue = 158,      GrowthRate = 1 },
            })

            .Add(Job.Marauder, new List<ModifierData>
            {
                new ModifierData { Modifier = Modifier.Hp,             StartValue = 130,    EndValue = 2129,     GrowthRate = 0.5 },
                new ModifierData { Modifier = Modifier.Mp,             StartValue = 50,     EndValue = 558,      GrowthRate = 0.6 },
                new ModifierData { Modifier = Modifier.Strength,       StartValue = 0,      EndValue = 199,      GrowthRate = 1 },
                new ModifierData { Modifier = Modifier.Vitality,       StartValue = 0,      EndValue = 211,      GrowthRate = 1 },
                new ModifierData { Modifier = Modifier.Dexterity,      StartValue = 0,      EndValue = 178,      GrowthRate = 1 },
                new ModifierData { Modifier = Modifier.Intelligence,   StartValue = 0,      EndValue = 57,       GrowthRate = 1 },
                new ModifierData { Modifier = Modifier.Mind,           StartValue = 0,      EndValue = 98,       GrowthRate = 1 },
                new ModifierData { Modifier = Modifier.Piety,          StartValue = 0,      EndValue = 77,       GrowthRate = 1 },
            })

            .Add(Job.Lancer, new List<ModifierData>
            {
                new ModifierData { Modifier = Modifier.Hp,             StartValue = 110,    EndValue = 1870,    GrowthRate = 0.5  },
                new ModifierData { Modifier = Modifier.Mp,             StartValue = 70,     EndValue = 904,     GrowthRate = 0.6  },
                new ModifierData { Modifier = Modifier.Strength,       StartValue = 0,      EndValue = 221,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Vitality,       StartValue = 0,      EndValue = 199,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Dexterity,      StartValue = 0,      EndValue = 188,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Intelligence,   StartValue = 0,      EndValue = 77,      GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mind,           StartValue = 0,      EndValue = 118,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Piety,          StartValue = 0,      EndValue = 138,     GrowthRate = 1  },
            })

            .Add(Job.Pugilist, new List<ModifierData>
            {
                new ModifierData { Modifier = Modifier.Hp,             StartValue = 110,    EndValue = 1625,    GrowthRate = 0.45  },
                new ModifierData { Modifier = Modifier.Mp,             StartValue = 75,     EndValue = 745,     GrowthRate = 0.55  },
                new ModifierData { Modifier = Modifier.Strength,       StartValue = 0,      EndValue = 211,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Vitality,       StartValue = 0,      EndValue = 188,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Dexterity,      StartValue = 0,      EndValue = 199,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Intelligence,   StartValue = 0,      EndValue = 87,      GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mind,           StartValue = 0,      EndValue = 168,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Piety,          StartValue = 0,      EndValue = 118,     GrowthRate = 1  },
            })

            .Add(Job.Archer, new List<ModifierData>
            {
                new ModifierData { Modifier = Modifier.Hp,             StartValue = 100,    EndValue = 1541,    GrowthRate = 0.45  },
                new ModifierData { Modifier = Modifier.Mp,             StartValue = 170,    EndValue = 1674,    GrowthRate = 0.55  },
                new ModifierData { Modifier = Modifier.Strength,       StartValue = 0,      EndValue = 168,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Vitality,       StartValue = 0,      EndValue = 188,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Dexterity,      StartValue = 0,      EndValue = 219,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Intelligence,   StartValue = 0,      EndValue = 158,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mind,           StartValue = 0,      EndValue = 148,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Piety,          StartValue = 0,      EndValue = 158,     GrowthRate = 1  },
            })

            .Add(Job.Conjurer, new List<ModifierData>
            {
                new ModifierData { Modifier = Modifier.Hp,             StartValue = 100,    EndValue = 1541,    GrowthRate = 0.45  },
                new ModifierData { Modifier = Modifier.Mp,             StartValue = 120,    EndValue = 3210,    GrowthRate = 0.55  },
                new ModifierData { Modifier = Modifier.Strength,       StartValue = 0,      EndValue = 98,      GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Vitality,       StartValue = 0,      EndValue = 188,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Dexterity,      StartValue = 0,      EndValue = 199,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Intelligence,   StartValue = 0,      EndValue = 199,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mind,           StartValue = 0,      EndValue = 221,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Piety,          StartValue = 0,      EndValue = 219,     GrowthRate = 1  },
            })

            .Add(Job.Thaumaturge, new List<ModifierData>
            {
                new ModifierData { Modifier = Modifier.Hp,             StartValue = 100,    EndValue = 1541,    GrowthRate = 0.45  },
                new ModifierData { Modifier = Modifier.Mp,             StartValue = 130,    EndValue = 3429,    GrowthRate = 0.55  },
                new ModifierData { Modifier = Modifier.Strength,       StartValue = 0,      EndValue = 77,      GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Vitality,       StartValue = 0,      EndValue = 188,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Dexterity,      StartValue = 0,      EndValue = 188,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Intelligence,   StartValue = 0,      EndValue = 221,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mind,           StartValue = 0,      EndValue = 138,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Piety,          StartValue = 0,      EndValue = 229,     GrowthRate = 1  },
            });

        // Data (ARR 2.0) was retrieved from https://web.archive.org/web/20160501222505/http://valk.dancing-mad.com/tables/attribute-table/
        // TODO: Update values and modifiers to reflect 1.23b verified data
        private static readonly IImmutableDictionary<Job, IList<ModifierData>> JobSoulStoneAttributes = ImmutableDictionary.Create<Job, IList<ModifierData>>()
            .Add(Job.Paladin, new List<ModifierData>
            {
                new ModifierData { Modifier = Modifier.Hp,             StartValue = 0,      EndValue = 460,    GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mp,             StartValue = 0,      EndValue = 278,    GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Strength,       StartValue = 0,      EndValue = 11,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Vitality,       StartValue = 0,      EndValue = 20,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Dexterity,      StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Intelligence,   StartValue = 0,      EndValue = 20,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mind,           StartValue = 0,      EndValue = 11,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Piety,          StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
            })

            .Add(Job.Warrior, new List<ModifierData>
            {
                new ModifierData { Modifier = Modifier.Hp,             StartValue = 0,      EndValue = 460,    GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mp,             StartValue = 0,      EndValue = 212,    GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Strength,       StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Vitality,       StartValue = 0,      EndValue = 20,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Dexterity,      StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Intelligence,   StartValue = 0,      EndValue = 20,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mind,           StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Piety,          StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
            })

            .Add(Job.Dragoon, new List<ModifierData>
            {
                new ModifierData { Modifier = Modifier.Hp,             StartValue = 0,      EndValue = 230,    GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mp,             StartValue = 0,      EndValue = 259,    GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Strength,       StartValue = 0,      EndValue = 20,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Vitality,       StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Dexterity,      StartValue = 0,      EndValue = 11,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Intelligence,   StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mind,           StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Piety,          StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
            })

            .Add(Job.Monk, new List<ModifierData>
            {
                new ModifierData { Modifier = Modifier.Hp,             StartValue = 0,      EndValue = 245,    GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mp,             StartValue = 0,      EndValue = 242,    GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Strength,       StartValue = 0,      EndValue = 20,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Vitality,       StartValue = 0,      EndValue = 11,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Dexterity,      StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Intelligence,   StartValue = 0,      EndValue = 11,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mind,           StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Piety,          StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
            })

            .Add(Job.Bard, new List<ModifierData>
            {
                new ModifierData { Modifier = Modifier.Hp,             StartValue = 0,      EndValue = 244,    GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mp,             StartValue = 0,      EndValue = 291,    GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Strength,       StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Vitality,       StartValue = 0,      EndValue = 11,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Dexterity,      StartValue = 0,      EndValue = 20,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Intelligence,   StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mind,           StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Piety,          StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
            })

            .Add(Job.WhiteMage, new List<ModifierData>
            {
                new ModifierData { Modifier = Modifier.Hp,             StartValue = 0,      EndValue = 244,    GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mp,             StartValue = 0,      EndValue = 298,    GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Strength,       StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Vitality,       StartValue = 0,      EndValue = 11,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Dexterity,      StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Intelligence,   StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mind,           StartValue = 0,      EndValue = 20,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Piety,          StartValue = 0,      EndValue = 20,     GrowthRate = 1  },
            })

            .Add(Job.BlackMage, new List<ModifierData>
            {
                new ModifierData { Modifier = Modifier.Hp,             StartValue = 0,      EndValue = 244,    GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mp,             StartValue = 0,      EndValue = 225,    GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Strength,       StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Vitality,       StartValue = 0,      EndValue = 11,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Dexterity,      StartValue = 0,      EndValue = 11,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Intelligence,   StartValue = 0,      EndValue = 20,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Mind,           StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
                new ModifierData { Modifier = Modifier.Piety,          StartValue = 0,      EndValue = 10,     GrowthRate = 1  },
            });


        private short GetJobLevelAdjustedMod(double startValue, double endValue, double growthRate)
        {
            const double maxLevel = 50;
            double level = GetLevel();

            double t = (level - 1.0) / (maxLevel - 1.0);
            if (t < 0) t = 0;
            if (t > 1) t = 1;

            double fraction = Math.Pow(t, 1.0 / growthRate);
            double result = startValue + (endValue - startValue) * fraction;
            return (short)Math.Round(result);
        }

        private IList<ModifierData> GetEquipmentModifiers(EquipmentSlot equipmentSlot)
        {
            // Get the modifiers provided by a specific equipped item 
            return GetEquipment()?.GetItemAtSlot(equipmentSlot)?.GetEquipmentModifiers(GetLevel(), CurrentJobOrClass) ?? new List<ModifierData>();
        }

        private void CalculateEquipmentMods()
        {
            // Calculate and set modifiers provided from equipped items

            // TODO: handle special gear like weapon vs. throwing weapon, MH vs. OH (crafting and gathering), etc.
            // we don't want to add the modifier to their regular attack damage (and other mods)
            // we also don't want regular attack damage to modify thrown weapon damage though, so maybe the damage should not be added here?
            // perhaps only add attack type, delay, hit count, can block, damage, when the gear is "used" rather than "equipped"?

            ClearMods(ModifierOrigin.Equipment);

            Dictionary<EquipmentSlot, IList<ModifierData>> modsByEquipmentSlot = new Dictionary<EquipmentSlot, IList<ModifierData>>
            {
                { EquipmentSlot.MAINHAND, GetEquipmentModifiers(EquipmentSlot.MAINHAND) },
                { EquipmentSlot.OFFHAND, GetEquipmentModifiers(EquipmentSlot.OFFHAND) },
                { EquipmentSlot.THROWINGWEAPON, GetEquipmentModifiers(EquipmentSlot.THROWINGWEAPON) },
                { EquipmentSlot.PACK, GetEquipmentModifiers(EquipmentSlot.PACK) },
                { EquipmentSlot.POUCH, GetEquipmentModifiers(EquipmentSlot.POUCH) },
                { EquipmentSlot.HEAD, GetEquipmentModifiers(EquipmentSlot.HEAD) },
                { EquipmentSlot.UNDERSHIRT, GetEquipmentModifiers(EquipmentSlot.UNDERSHIRT) },
                { EquipmentSlot.BODY, GetEquipmentModifiers(EquipmentSlot.BODY) },
                { EquipmentSlot.UNDERGARMENT, GetEquipmentModifiers(EquipmentSlot.UNDERGARMENT) },
                { EquipmentSlot.LEGS, GetEquipmentModifiers(EquipmentSlot.LEGS) },
                { EquipmentSlot.HANDS, GetEquipmentModifiers(EquipmentSlot.HANDS) },
                { EquipmentSlot.BOOTS, GetEquipmentModifiers(EquipmentSlot.BOOTS) },
                { EquipmentSlot.WAIST, GetEquipmentModifiers(EquipmentSlot.WAIST) },
                { EquipmentSlot.NECK, GetEquipmentModifiers(EquipmentSlot.NECK) },
                { EquipmentSlot.EARS, GetEquipmentModifiers(EquipmentSlot.EARS) },
                { EquipmentSlot.WRISTS, GetEquipmentModifiers(EquipmentSlot.WRISTS) },
                { EquipmentSlot.RIGHTFINGER, GetEquipmentModifiers(EquipmentSlot.RIGHTFINGER) },
                { EquipmentSlot.LEFTFINGER, GetEquipmentModifiers(EquipmentSlot.LEFTFINGER) }
            };

            foreach (KeyValuePair<EquipmentSlot, IList<ModifierData>> equipmentSlotMods in modsByEquipmentSlot)
            {
                foreach (ModifierData mod in equipmentSlotMods.Value)
                {
                    if (mod.Modifier == Modifier.AttackType || mod.Modifier == Modifier.Delay || mod.Modifier == Modifier.HitCount)
                    {
                        if (equipmentSlotMods.Key == EquipmentSlot.MAINHAND)
                        {
                            SetMod(mod.Modifier, mod.EndValue, ModifierOrigin.Equipment);
                        }
                    }
                    else if (mod.Modifier == Modifier.CanBlock)
                    {
                        if (equipmentSlotMods.Key == EquipmentSlot.OFFHAND)
                        {
                            SetMod(mod.Modifier, mod.EndValue, ModifierOrigin.Equipment);
                        }
                    }
                    else if (mod.Modifier == Modifier.Damage)
                    {
                        if (equipmentSlotMods.Key == EquipmentSlot.MAINHAND || equipmentSlotMods.Key == EquipmentSlot.PACK)
                        {
                            AddMod(mod.Modifier, mod.EndValue, ModifierOrigin.Equipment);
                        }
                    }
                    else if (mod.PrerequisiteModifier != null)
                    {
                        if (mod.PrerequisiteModifier.Modifier == Modifier.StormGearPiecesRequirement ||
                            mod.PrerequisiteModifier.Modifier == Modifier.SerpentGearPiecesRequirement ||
                            mod.PrerequisiteModifier.Modifier == Modifier.FlameGearPiecesRequirement)
                        {
                            int setPiecesEquippedCount = modsByEquipmentSlot.Values.Count(itemMods => itemMods.Any(m => m.Modifier == mod.PrerequisiteModifier.Modifier));
                            if (setPiecesEquippedCount >= mod.PrerequisiteModifier.EndValue)
                            {
                                AddMod(mod.Modifier, mod.EndValue, ModifierOrigin.Equipment);
                            }
                        }
                        else if (mod.PrerequisiteModifier.Modifier == Modifier.SanctionRequirement)
                        {
                            if (statusEffects.HasStatusEffect(StatusEffectId.Sanction))
                            {
                                AddMod(mod.Modifier, mod.EndValue, ModifierOrigin.Equipment);
                            }
                        }
                    }
                    else
                    {
                        AddMod(mod.Modifier, mod.EndValue, ModifierOrigin.Equipment);
                    }
                }
            }
        }

        private void CalculateModsDependentOnMods()
        {
            // Calculate and set modifiers that rely on other modifiers being fully calculated already.
            // e.g. Vitality increases HP modifiers, so Vitality needs to be fully calculated before calculating its effect on HP

            ClearMods(ModifierOrigin.ModifierDownstreamEffects);

            //These stats all correlate in a 3:2 fashion
            //It seems these stats don't actually increase their respective stats. The magic stats do, however
            AddMod(Modifier.Attack, (long)(GetMod(Modifier.Strength) * 0.667), ModifierOrigin.ModifierDownstreamEffects);
            AddMod(Modifier.Accuracy, (long)(GetMod(Modifier.Dexterity) * 0.667), ModifierOrigin.ModifierDownstreamEffects);
            AddMod(Modifier.Defense, (long)(GetMod(Modifier.Vitality) * 0.667), ModifierOrigin.ModifierDownstreamEffects);

            //These stats correlate in a 4:1 fashion. (Unsure if MND is accurate but it would make sense for it to be)
            AddMod(Modifier.AttackMagicPotency, (long)((float)GetMod(Modifier.Intelligence) * 0.25), ModifierOrigin.ModifierDownstreamEffects);

            AddMod(Modifier.MagicAccuracy, (long)((float)GetMod(Modifier.Mind) * 0.25), ModifierOrigin.ModifierDownstreamEffects);
            AddMod(Modifier.HealingMagicPotency, (long)((float)GetMod(Modifier.Mind) * 0.25), ModifierOrigin.ModifierDownstreamEffects);

            AddMod(Modifier.MagicEvasion, (long)((float)GetMod(Modifier.Piety) * 0.25), ModifierOrigin.ModifierDownstreamEffects);
            AddMod(Modifier.EnfeeblingMagicPotency, (long)((float)GetMod(Modifier.Piety) * 0.25), ModifierOrigin.ModifierDownstreamEffects);

            //VIT correlates to HP in a 1:1 fashion
            AddMod(Modifier.Hp, (long)(float)GetMod(Modifier.Vitality), ModifierOrigin.ModifierDownstreamEffects);
        }

        public void SetMaxHpFromMods()
        {
            // Calculate and set Max HP from HP modifiers
            short hp = (short)GetMod(Modifier.Hp);
            double hpMultiplier = GetMod(Modifier.HpPercent);

            if (hpMultiplier != 0)
            {
                    hp = (short)(hpMultiplier / 100.0 * hp);  
            }
            MaxHP = hp;
        }
    
        private void SetMaxMpFromMods()
        {
            // Calculate and set Max MP from MP modifiers
            short mp = (short)GetMod(Modifier.Mp);
            double mpMultiplier = GetMod(Modifier.MpPercent);

            if (mpMultiplier != 0)
            {
                mp = (short)(mpMultiplier / 100.0 * mp);
            }

            MaxMP = mp;
        }

        private void SetStatsFromMods()
        {
            // Calculate and set Stats from modifiers
            foreach (Modifier modifier in StatModifiers)
            {
                SetStat(modifier, (short)GetMod(modifier));
            }
        }

        #endregion

        #region ai stuff
        public void PathTo(float x, float y, float z, float stepSize = 0.70f, int maxPath = 40, float polyRadius = 0.0f)
        {
            if (aiContainer != null && aiContainer.pathFind != null)
                aiContainer.pathFind.PreparePath(x, y, z, stepSize, maxPath, polyRadius);
        }

        public void FollowTarget(Actor target, float stepSize = 1.2f, int maxPath = 25, float radius = 0.0f)
        {
            if (target != null)
                PathTo(target.positionX, target.positionY, target.positionZ, stepSize, maxPath, radius);
        }

        public virtual void OnPath(Vector3 point)
        {
            //lua.LuaEngine.CallLuaBattleFunction(this, "onPath", this, point);

            updateFlags |= ActorUpdateFlags.Position;
            this.isAtSpawn = false;
        }

        public override void Update(DateTime tick)
        {

        }

        public override void PostUpdate(DateTime tick, List<SubPacket> packets = null)
        {
            if (updateFlags != ActorUpdateFlags.None)
            {
                packets = packets ?? new List<SubPacket>();

                if ((updateFlags & ActorUpdateFlags.Appearance) != 0)
                {
                    packets.Add(new SetActorAppearancePacket(modelId, appearanceIds).BuildPacket(Id));
                }

                if ((updateFlags & ActorUpdateFlags.State) != 0)
                {
                    packets.Add(SetActorStatePacket.BuildPacket(Id, currentMainState, 0x0));
                    packets.Add(CommandResultX00Packet.BuildPacket(Id, 0x72000062, 0));
                    packets.Add(CommandResultX01Packet.BuildPacket(Id, 0x7C000062, 21001, new CommandResult(Id, 0, 1)));

                    updateFlags &= ~ActorUpdateFlags.State;
                    //DoBattleAction(21001, 0x7C000062, new BattleAction(this.actorId, 0, 1, 0, 0, 1)); //Attack Mode
                }

                if ((updateFlags & ActorUpdateFlags.SubState) != 0)
                {
                    packets.Add(SetActorSubStatePacket.BuildPacket(Id, currentSubState));
                    //packets.Add(CommandResultX00Packet.BuildPacket(actorId, 0x72000062, 0));
                    //packets.Add(CommandResultX01Packet.BuildPacket(actorId, 0x7C000062, 21001, new CommandResult(actorId, 0, 1)));

                    updateFlags &= ~ActorUpdateFlags.SubState;
                    //DoBattleAction(21001, 0x7C000062, new BattleAction(this.actorId, 0, 1, 0, 0, 1)); //Attack Mode
                }

                if ((updateFlags & ActorUpdateFlags.Status) != 0)
                {

                    List<SubPacket> statusPackets = statusEffects.GetStatusPackets();
                    packets.AddRange(statusPackets);
                    statusPackets.Clear();
                    updateFlags &= ~ActorUpdateFlags.Status;
                }

                if ((updateFlags & ActorUpdateFlags.StatusTime) != 0)
                {
                    packets.AddRange(statusEffects.GetStatusTimerPackets());
                    statusEffects.ResetPropPacketUtil();
                    updateFlags &= ~ActorUpdateFlags.StatusTime;
                }

                if ((updateFlags & ActorUpdateFlags.HpTpMp) != 0)
                {
                    var propPacketUtil = new ActorPropertyPacketUtil("charaWork/stateAtQuicklyForAll", this);
                    propPacketUtil.AddProperty("charaWork.parameterSave.hp[0]");
                    propPacketUtil.AddProperty("charaWork.parameterSave.hpMax[0]");
                    propPacketUtil.AddProperty("charaWork.parameterSave.mp");
                    propPacketUtil.AddProperty("charaWork.parameterSave.mpMax");
                    propPacketUtil.AddProperty("charaWork.parameterTemp.tp");
                    packets.AddRange(propPacketUtil.Done());
                }

                base.PostUpdate(tick, packets);
            }
        }

        public virtual bool IsValidTarget(Character target, ValidTarget validTarget)
        {
            return !target.isStatic;
        }

        public virtual bool CanAttack()
        {
            return true;
        }

        public virtual bool CanUse(Character target, BattleCommand skill, CommandResult error = null)
        {
            return false;
        }


        public virtual uint GetAttackDelayMs()
        {
            return (uint)GetMod((uint)Modifier.Delay);
        }

        public virtual uint GetAttackRange()
        {
            return (uint)(GetMod((uint)Modifier.AttackRange) == 0 ? 3 : GetMod((uint)Modifier.AttackRange));
        }

        public virtual bool Engage(uint targid = 0, ushort newMainState = 0xFFFF)
        {
            // todo: attack the things
            /*if (newMainState != 0xFFFF)
            {
                currentMainState = newMainState;// this.newMainState = newMainState;
                updateFlags |= ActorUpdateFlags.State;
            }
            else*/ if (aiContainer.CanChangeState())
            {
                if (targid == 0)
                {
                    if (currentTarget != Actor.INVALID_ACTORID)
                        targid = currentTarget;
                    else if (currentLockedTarget != Actor.INVALID_ACTORID)
                        targid = currentLockedTarget;
                }
                //if (targid != 0)
                {
                    aiContainer.Engage(CurrentArea.FindActorInArea<Character>(targid));
                }
            }

            return false;
        }

        public virtual bool Engage(Character target)
        {
            aiContainer.Engage(target);
            return false;
        }

        public virtual bool Disengage(ushort newMainState = 0xFFFF)
        {
            /*if (newMainState != 0xFFFF)
            {
                currentMainState = newMainState;// this.newMainState = newMainState;
                updateFlags |= ActorUpdateFlags.State;
            }
            else*/ if (IsEngaged())
            {
                aiContainer.Disengage();
                return true;
            }
            return false;
        }
        
        public virtual void Cast(uint spellId, uint targetId = 0)
        {
            if (aiContainer.CanChangeState())
                aiContainer.Cast(CurrentArea.FindActorInArea<Character>(targetId == 0 ? currentTarget : targetId), spellId);
        }

        public virtual void Ability(uint abilityId, uint targetId = 0)
        {
            if (aiContainer.CanChangeState())
                aiContainer.Ability(CurrentArea.FindActorInArea<Character>(targetId == 0 ? currentTarget : targetId), abilityId);
        }

        public virtual void WeaponSkill(uint skillId, uint targetId = 0)
        {
            if (aiContainer.CanChangeState())
                aiContainer.WeaponSkill(CurrentArea.FindActorInArea<Character>(targetId == 0 ? currentTarget : targetId), skillId);
        }

        public virtual void Spawn(DateTime tick)
        {
            aiContainer.Reset();
            ChangeState(SetActorStatePacket.MAIN_STATE_PASSIVE);
            CalculateStats(true, ModifierOrigin.Equipment, ModifierOrigin.StatusEffect);
        }

        //AdditionalActions is the list of actions that EXP/Chain messages are added to
        public virtual void Die(DateTime tick, CommandResultContainer actionContainer = null)
        {
            // todo: actual despawn timer
            aiContainer.InternalDie(tick, 10);
            ChangeSpeed(0.0f, 0.0f, 0.0f, 0.0f);
        }

        public virtual void Despawn(DateTime tick)
        {
            
        }

        public bool IsDead()
        {
            return !IsAlive();
        }

        public bool IsAlive()
        {
            return !aiContainer.IsDead();// && GetHP() > 0;
        }

        #endregion ai stuff

        public virtual void OnAttack(State state, CommandResult action, ref CommandResult error)
        {
            var target = state.GetTarget();
            // todo: change animation based on equipped weapon
            // todo: get hitrate and shit, handle protect effect and whatever
            if (BattleUtils.TryAttack(this, target, action, ref error))
            {
                //var packet = BattleActionX01Packet.BuildPacket(owner.actorId, owner.actorId, target.actorId, (uint)0x19001000, (uint)0x8000604, (ushort)0x765D, (ushort)BattleActionX01PacketCommand.Attack, (ushort)damage, (byte)0x1);
            }

            // todo: call onAttack/onDamageTaken
            //BattleUtils.DamageTarget(this, target, DamageTakenType.Attack, action);
            AddTP(200);
            target.AddTP(100);
        }

        public virtual void OnCast(State state, CommandResult[] actions, BattleCommand spell, ref CommandResult[] errors)
        {
            // damage is handled in script
            var spellCost = spell.CalculateMpCost(this);
            this.DelMP(spellCost); // mpCost can be set in script e.g. if caster has something for free spells

            foreach (CommandResult action in actions)
            {
                if (CurrentArea.FindActorInArea<Character>(action.targetId) is Character)
                {
                    //BattleUtils.HandleHitType(this, chara, action);
                    //BattleUtils.DoAction(this, chara, action, DamageTakenType.Magic);
                }
            }
            lua.LuaEngine.GetInstance().OnSignal("spellUsed");
        }

        public virtual void OnWeaponSkill(State state, CommandResult[] actions, BattleCommand skill, ref CommandResult[] errors)
        {
            // damage is handled in script

            foreach (CommandResult action in actions)
            {
                //Should we just store the character insteado f having to find it again?
                if (CurrentArea.FindActorInArea<Character>(action.targetId) is Character)
                {
                    //BattleUtils.DoAction(this, chara, action, DamageTakenType.Weaponskill);
                }
            }

            this.DelTP(skill.tpCost);
        }

        public virtual void OnAbility(State state, CommandResult[] actions, BattleCommand ability, ref CommandResult[] errors)
        {
            foreach (var action in actions)
            {
                if (CurrentArea.FindActorInArea<Character>(action.targetId) is Character)
                {
                    //BattleUtils.DoAction(this, chara, action, DamageTakenType.Ability);
                }
            }
        }

        public virtual void OnSpawn()
        {

        }

        public virtual void OnDeath()
        {

        }

        public virtual void OnDespawn()
        {

        }

        public virtual void OnDamageDealt(Character defender, BattleCommand skill, CommandResult action, CommandResultContainer actionContainer = null)
        {
            switch (action.hitType)
            {
                case (HitType.Miss):
                    OnMiss(defender, skill, action, actionContainer);
                    break;
                case (HitType.Crit):
                    OnCrit(defender, skill, action, actionContainer);
                    OnHit(defender, skill, action, actionContainer);
                    break;
                default:
                    OnHit(defender, skill, action, actionContainer);
                    break;
            }

            //TP is only gained from autoattacks and abilities
            if ((action.commandType == CommandType.AutoAttack || action.commandType == CommandType.Ability) && action.hitType != HitType.Miss)
            {
                //TP gained on an attack is usually 100 * delay.
                //Store TP seems to add .1% per point.
                double weaponDelay = GetMod(Modifier.Delay) / 1000.0;
                var storeTPPercent = 1 + (GetMod(Modifier.StoreTp) * 0.001);
                AddTP((int)(weaponDelay * 100 * storeTPPercent));
            }
        }

        public virtual void OnDamageTaken(Character attacker, BattleCommand skill, CommandResult action, CommandResultContainer actionContainer = null)
        {
            switch (action.hitType)
            {
                case (HitType.Miss):
                    OnEvade(attacker, skill, action, actionContainer);
                    break;
                case (HitType.Parry):
                    OnParry(attacker, skill, action, actionContainer);
                    break;
                case (HitType.Block):
                    OnBlock(attacker, skill, action, actionContainer);
                    break;
            }

            statusEffects.CallLuaFunctionByFlag((uint)StatusEffectFlags.ActivateOnDamageTaken, "onDamageTaken", attacker, this, skill, action, actionContainer);

            //TP gain formula seems to be something like 5 * e ^ ( -0.667 * [defender's level] ) * damage taken, rounded up
            //This should be completely accurate at level 50, but isn't totally accurate at lower levels.
            //Don't know if store tp impacts this
            double tpModifier = 5 * Math.Pow(Math.E, (-0.0667 * GetLevel()));
            AddTP((int)Math.Ceiling(tpModifier * action.amount));
        }

        public UInt64 GetTempVar(string name)
        {
            UInt64 retVal = 0;
            if (tempVars.TryGetValue(name, out retVal))
                return retVal;
            return 0;
        }

        // cause lua is a dick
        public void SetTempVar(string name, uint val)
        {
            if (tempVars.ContainsKey(name))
                tempVars[name] = val;
        }

        public void SetTempVar(string name, UInt64 val)
        {
            if (tempVars.ContainsKey(name))
                tempVars[name] = val;
        }

        public void ResetTempVars()
        {
            tempVars.Clear();
        }

        #region lua helpers
        public bool IsEngaged()
        {
            return aiContainer.IsEngaged();
        }

        public bool IsPlayer()
        {
            return this is Player;
        }

        public bool IsMonster()
        {
            return this is BattleNpc;
        }

        public bool IsPet()
        {
            return this is Pet;
        }

        public bool IsAlly()
        {
            return this is Ally;
        }

        public bool IsDiscipleOfWar()
        {
            return GetClass() < CLASSID_THM;
        }

        public bool IsDiscipleOfMagic()
        {
            return GetClass() >= CLASSID_THM && currentJob < CLASSID_CRP;
        }

        public bool IsDiscipleOfHand()
        {
            return GetClass() >= CLASSID_CRP && currentJob < CLASSID_MIN;
        }

        public bool IsDiscipleOfLand()
        {
            return GetClass() >= CLASSID_MIN;
        }
        #endregion lua helpers

        //Reset procs. Only send packet if any procs were actually reset. 
        //This assumes you can't use weaponskills between getting a proc and using the procced ability
        public void ResetProcs()
        {
            var propPacketUtil = new ActorPropertyPacketUtil("charaWork/timingCommand", this);
            bool shouldSend = false;
            for (int i = 0; i < 4; i++)
            {
                if (charaWork.battleTemp.timingCommandFlag[i])
                {
                    shouldSend = true;
                    charaWork.battleTemp.timingCommandFlag[i] = false;
                    propPacketUtil.AddProperty(String.Format("charaWork.battleTemp.timingCommandFlag[{0}]", i));
                }
            }

            if (shouldSend && this is Player)
                ((Player)this).QueuePackets(propPacketUtil.Done());
        }

        //Set given proc to true and send packet if this is a player
        // todo: hidden status effects for timing when the procs fall off
        public void SetProc(int procId, bool val = true)
        {
            charaWork.battleTemp.timingCommandFlag[procId] = val;
            uint effectId = (uint)StatusEffectId.EvadeProc + (uint)procId;

            //If a proc just occurred, add a hidden effect effect
            if (val)
            {
                StatusEffect procEffect = Server.GetWorldManager().GetStatusEffect(effectId);
                procEffect.SetDuration(5);
                statusEffects.AddStatusEffect(procEffect, this);
            }
            //Otherwise we're reseting a proc, remove the status
            else
            {
                statusEffects.RemoveStatusEffect(statusEffects.GetStatusEffectById((uint)effectId));
            }

            if (this is Player)
            {
                var propPacketUtil = new ActorPropertyPacketUtil("charaWork/timingCommand", this);
                propPacketUtil.AddProperty(String.Format("charaWork.battleTemp.timingCommandFlag[{0}]", procId));
                ((Player)this).QueuePackets(propPacketUtil.Done());
            }
        }

        public HitDirection GetHitDirection(Actor target)
        {
            //Get between taget's position and our position
            double angle = Vector3.GetAngle(target.GetPosAsVector3(), GetPosAsVector3());
            //Add to the target's rotation, mod by 2pi. This is the angle relative to where the target is looking
            //Actor's rotation is 0 degrees on their left side, rotate it by 45 degrees so that quadrants line up with sides
            angle = (angle + target.rotation - (.25 * Math.PI)) % (2 * Math.PI);
            //Make positive
            if (angle < 0)
                angle = angle + (2 * Math.PI);

            //Get the side we're on. 0 is front, 1 is right, 2 is rear, 3 is left
            var side = (int) (angle / (.5 * Math.PI)) % 4;

            return (HitDirection) (1 << side);
        }

        //Called when this character evades attacker's action
        public void OnEvade(Character attacker, BattleCommand skill, CommandResult action, CommandResultContainer actionContainer = null)
        {
            SetProc((ushort)HitType.Evade);
            statusEffects.CallLuaFunctionByFlag((uint)StatusEffectFlags.ActivateOnEvade, "onEvade", attacker, this, skill, action, actionContainer);
        }

        //Called when this character blocks attacker's action
        public void OnBlock(Character attacker, BattleCommand skill, CommandResult action, CommandResultContainer actionContainer = null)
        {
            SetProc((ushort)HitType.Block);
            statusEffects.CallLuaFunctionByFlag((uint)StatusEffectFlags.ActivateOnBlock, "onBlock", attacker, this, skill, action, actionContainer);
        }

        //Called when this character parries attacker's action
        public void OnParry(Character attacker, BattleCommand skill, CommandResult action, CommandResultContainer actionContainer = null)
        {
            SetProc((ushort)HitType.Parry);
            statusEffects.CallLuaFunctionByFlag((uint)StatusEffectFlags.ActivateOnParry, "onParry", attacker, this, skill, action, actionContainer);
        }

        //Called when this character misses
        public void OnMiss(Character defender, BattleCommand skill, CommandResult action, CommandResultContainer actionContainer = null)
        {
            SetProc((ushort)HitType.Miss);
            statusEffects.CallLuaFunctionByFlag((uint)StatusEffectFlags.ActivateOnMiss, "onMiss", this, defender, skill, action, actionContainer);
        }

        public void OnHit(Character defender, BattleCommand skill, CommandResult action, CommandResultContainer actionContainer = null)
        {
            statusEffects.CallLuaFunctionByFlag((uint)StatusEffectFlags.ActivateOnHit, "onHit", this, defender, skill, action, actionContainer);
        }

        public void OnCrit(Character defender, BattleCommand skill, CommandResult action, CommandResultContainer actionContainer = null)
        {
            statusEffects.CallLuaFunctionByFlag((uint)StatusEffectFlags.ActivateOnCrit, "onCrit", this, defender, skill, action, actionContainer);
        }

        //The order of messages that appears after using a command is:

        //1. Cast start messages. (ie "You begin casting... ")
        //2. Messages from buffs that activate before the command actually starts, like Power Surge or Presence of Mind. (This may be wrong and these could be the same as 4.)
        //3. If the command is a multi-hit command, this is where the "You use [command] on [target]" message goes

        //Then, for each hit:
        //4. Buffs that activate before a command hits, like Blindside
        //5. The hit itself. For single hit commands this message is "Your [command] hits [target] for x damage" for multi hits it's "[Target] takes x points of damage"
        //6. Stoneskin falling off
        //6. Buffs that activate after a command hits, like Aegis Boon and Divine Veil

        //After all hits
        //7. If it's a multi-hit command there's a "{numhits]fold attack..." message or if all hits miss an "All attacks missed" message
        //8. Buffs that fall off after the skill ends, like Excruciate

        //For every target defeated:
        //8. Defeat message
        //9. EXP message
        //10. EXP chain message


        //folder is probably temporary until move to cached scripts is complete
        public void DoBattleCommand(BattleCommand command, string folder)
        {
            //List<BattleAction> actions = new List<BattleAction>();
            CommandResultContainer actions = new CommandResultContainer();

            var targets = command.targetFind.GetTargets();
            bool hitTarget = false;

            if (targets.Count > 0)
            {
                statusEffects.CallLuaFunctionByFlag((uint)StatusEffectFlags.ActivateOnCommandStart, "onCommandStart", this, command, actions);

                foreach (var chara in targets)
                {
                    ushort hitCount = 0;
                    ushort totalDamage = 0;
                    for (int hitNum = 1; hitNum <= command.numHits; hitNum++)
                    {
                        var action = new CommandResult(chara.Id, command, (byte)GetHitDirection(chara), (byte) hitNum);
                        
                        //uncached script
                        lua.LuaEngine.CallLuaBattleCommandFunction(this, command, folder, "onSkillFinish", this, chara, command, action, actions);
                        //cached script
                        //skill.CallLuaFunction(owner, "onSkillFinish", this, chara, command, action, actions);
                        if (action.ActionLanded())
                        {
                            hitTarget = true;
                            hitCount++;
                            totalDamage += action.amount;
                        }
                    }

                    if (command.numHits > 1)
                    {
                        //30442: [hitCount]fold Attack! [chara] takes a total of totalDamage points of damage.
                        //30450: All attacks miss!
                        ushort textId = (ushort) (hitTarget ? 30442 : 30450);
                        actions.AddAction(new CommandResult(chara.Id, textId, 0, totalDamage, (byte)hitCount));
                    }
                }

                statusEffects.CallLuaFunctionByFlag((uint)StatusEffectFlags.ActivateOnCommandFinish, "onCommandFinish", this, command, actions);
            }
            else
            {
                actions.AddAction(new CommandResult(Id, 30202, 0));
            }

            DelMP(command.CalculateMpCost(this));
            DelTP(command.CalculateTpCost(this));

            //Now that we know if we hit the target we can check if the combo continues
            if (this is Player)
            {
                if (command.isCombo && hitTarget)
                    ((Player)this).SetCombos(command.comboNextCommandId);
                //Only reset combo if the command is a spell or weaponskill, since abilities can be used between combo skills
                else if (command.commandType == CommandType.Spell || command.commandType == CommandType.WeaponSkill)
                    ((Player)this).SetCombos();
            }


            actions.CombineLists();
            DoBattleAction(command.id, command.battleAnimation, actions.GetList());
        }

        public List<Character> GetPartyMembersInRange(uint range)
        {
            TargetFind targetFind = new TargetFind(this);
            targetFind.SetAOEType(ValidTarget.Party, TargetFindAOEType.Circle, TargetFindAOETarget.Self, range, 0, 10, 0, 0);
            targetFind.FindWithinArea(this, ValidTarget.Party, TargetFindAOETarget.Self);
            return targetFind.GetTargets();
        }

        public void DisableAutoAttack()
        {
            this.isAutoAttackEnabled = false;
        }

        public void EnableAutoAttack()
        {
            this.isAutoAttackEnabled = true;
        }

        #region Inventory
        public void SendItemPackage(Player player, uint id)
        {
            if (!itemPackages.ContainsKey((ushort)id))
                return;

            player.QueuePacket(InventoryBeginChangePacket.BuildPacket(Id, true));
            itemPackages[(ushort)id].SendFullPackage(player);
            player.QueuePacket(InventoryEndChangePacket.BuildPacket(Id));
        }

        public void AddItem(uint catalogID)
        {
            AddItem(catalogID, 1);
        }

        public void AddItem(uint catalogID, int quantity)
        {
            AddItem(catalogID, quantity, 1);
        }

        public void AddItem(uint catalogID, int quantity, byte quality)
        {
            ushort itemPackage = GetPackageForItem(catalogID);
            if (itemPackages.ContainsKey(itemPackage))
            {
                itemPackages[itemPackage].AddItem(catalogID, quantity, quality);
            }
        }

        public void AddItem(InventoryItem item)
        {
            ushort itemPackage = GetPackageForItem(item.GetItemData().catalogID);
            if (itemPackages.ContainsKey(itemPackage))
            {
                itemPackages[itemPackage].AddItem(item);
            }
        }

        public void MoveItem(InventoryItem item, ushort destinationPackage)
        {
            ushort sourcePackage = item.itemPackage;

            if (!itemPackages.ContainsKey(sourcePackage) && !itemPackages.ContainsKey(destinationPackage))
                return;
            
            itemPackages[sourcePackage].MoveItem(item, itemPackages[destinationPackage]);
        }

        public void RemoveItem(uint catalogID)
        {
            RemoveItem(catalogID, 1);
        }

        public void RemoveItem(uint catalogID, int quantity)
        {
            RemoveItem(catalogID, quantity, 1);
        }

        public void RemoveItem(uint catalogID, int quantity, byte quality)
        {
            ushort itemPackage = GetPackageForItem(catalogID);
            if (itemPackages.ContainsKey(itemPackage))
            {
                itemPackages[itemPackage].RemoveItem(catalogID, quantity, quality);
            }
        }

        public void RemoveItemAtSlot(ushort itemPackage, ushort slot)
        {
            if (itemPackages.ContainsKey(itemPackage))
            {
                itemPackages[itemPackage].RemoveItemAtSlot(slot);
            }
        }

        public void RemoveItem(InventoryItem item)
        {
            itemPackages[item.itemPackage].RemoveItem(item);
        }

        public bool HasItem(uint catalogID)
        {
            return HasItem(catalogID, 1);
        }

        public bool HasItem(uint catalogID, int minQuantity)
        {
            return HasItem(catalogID, minQuantity, 1);
        }

        public bool HasItem(uint catalogID, int minQuantity, byte quality)
        {
            ushort itemPackage = GetPackageForItem(catalogID);
            if (itemPackages.ContainsKey(itemPackage))
            {
                return itemPackages[itemPackage].HasItem(catalogID, minQuantity, quality);
            }
            return false;
        }

        public bool HasItem(InventoryItem item)
        {
            ushort itemPackage = GetPackageForItem(item.GetItemData().catalogID);
            if (itemPackages.ContainsKey(itemPackage))
            {
                //return itemPackages[itemPackage].HasItem(item);
                return false; //TODO FIX
            }
            else
                return false;
        }

        public InventoryItem GetItem(LuaUtils.ItemRefParam reference)
        {
            if (reference.actorId != Id)
                return null;
            if (itemPackages.ContainsKey(reference.itemPackage))
            {
                return itemPackages[reference.itemPackage].GetItemAtSlot(reference.slot);
            }
            return null;
        }

        public ItemPackage GetItemPackage(ushort package)
        {
            if (itemPackages.ContainsKey(package))
                return itemPackages[package];
            else
                return null;
        }

        public ushort GetPackageForItem(uint catalogID)
        {
            ItemData data = Server.GetItemGamedata(catalogID);

            if (data == null)
                return ItemPackage.NORMAL;
            else
            {
                if (data.IsMoney())
                    return ItemPackage.CURRENCY_CRYSTALS;
                else if (data.IsImportant())
                    return ItemPackage.KEYITEMS;
                else
                    return ItemPackage.NORMAL;
            }
        }

        //public void removeItem(byUniqueId)
        //public void removeItem(byUniqueId, quantity)
        //public void removeItem(slot)
        //public void removeItem(slot, quantity)

        #endregion

    }
}
