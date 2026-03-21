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
using Meteor.Map.actors.area;
using Meteor.Map.actors.chara.ai.state;
using Meteor.Map.actors.chara.npc;
using Meteor.Map.actors.group;
using Meteor.Map.Actors;
using Meteor.Map.packets.send.actor;
using Meteor.Map.packets.send.actor.battle;
using Meteor.Map.utils;
using Org.BouncyCastle.Bcpg;
using System;
using System.Collections.Generic;
using System.Net.NetworkInformation;

namespace Meteor.Map.actors.chara.ai.controllers
{
    class BattleNpcController : Controller
    {
        protected DateTime lastActionTime;
        protected DateTime lastSpellCastTime;
        protected DateTime lastSkillTime;
        protected DateTime lastSpecialSkillTime; // todo: i dont think monsters have "2hr" cooldowns like ffxi
        protected DateTime deaggroTime;
        protected DateTime neutralTime;
        protected DateTime waitTime;

        private bool firstSpell = true;
        protected DateTime lastRoamUpdate;
        private static readonly Random roamRandom = new Random();
        protected DateTime battleStartTime;

        protected DateTime lastChaseRepathTime;
        protected Vector3 lastChaseTargetPos;
        protected bool hasLastChaseTargetPos = false;
        protected bool hasAggroSpeedBonus = false;
        protected Vector3 directChaseGoal;
        protected bool hasDirectChaseGoal = false;
        protected DateTime lastDirectChaseRefresh = DateTime.MinValue;
        protected bool wasDirectChasing = false;

        protected new BattleNpc owner;
        public BattleNpcController(BattleNpc owner) :
            base(owner)
        {
            this.owner = owner;
            this.lastUpdate = DateTime.Now;
            this.waitTime = lastUpdate.AddSeconds(5);
        }

        public override void Update(DateTime tick)
        {
            lastUpdate = tick;
            if (!owner.IsDead())
            {
                // todo: handle aggro/deaggro and other shit here
                if (!owner.aiContainer.IsEngaged())
                {
                    TryAggro(tick);
                }

                if (owner.aiContainer.IsEngaged())
                {
                    DoCombatTick(tick);
                }
                //Only move if owner isn't dead and is either too far away from their spawn point or is meant to roam and isn't in combat
                else if (!owner.IsDead() && (owner.isMovingToSpawn || owner.GetMobMod((uint)MobModifier.Roams) > 0))
                {
                    DoRoamTick(tick);
                }
            }
        }

        //protected virtual void DoCombatTick(DateTime tick, List<Character> contentGroupCharas = null)
        //{
        //    if (owner.aiContainer.GetAIPreset() != AIContainer.AIPreset.Healer)
        //    {
        //        HandleHate();

        //        if (owner is Ally && owner.aiContainer.GetAIPreset() == AIContainer.AIPreset.Tank)
        //        {
        //            if ((!(owner.target is Character currentTarget) || currentTarget.IsDead()) && TryAllyTankAggro())
        //            {
        //                if ((tick - lastCombatTickScript).TotalSeconds > 0.03f)
        //                {
        //                    Move();
        //                    lastCombatTickScript = tick;
        //                }

        //                return;
        //            }
        //        }

        //        if (TryDeaggro())
        //        {
        //            Disengage();
        //            return;
        //        }
        //    }

        //    if ((tick - lastCombatTickScript).TotalSeconds > 0.03f)
        //    {
        //        Move();
        //        lastCombatTickScript = tick;
        //    }
        //}

        protected virtual void DoCombatTick(DateTime tick, List<Character> contentGroupCharas = null)
        {
            if (owner.aiContainer.GetAIPreset() != AIContainer.AIPreset.Healer)
            {
                HandleHate();

                if (owner is Ally && owner.aiContainer.GetAIPreset() == AIContainer.AIPreset.Tank)
                {
                    if ((!(owner.target is Character currentTarget) || currentTarget.IsDead()) && TryAllyTankAggro())
                    {
                        if ((tick - lastCombatTickScript).TotalSeconds > 0.03f)
                        {
                            Move();
                            lastCombatTickScript = tick;
                        }

                        return;
                    }
                }
            }

            if (TryDeaggro())
            {
                Disengage();
                return;
            }

            if ((tick - lastCombatTickScript).TotalSeconds > 0.03f)
            {
                Move();
                lastCombatTickScript = tick;
            }
        }

        protected virtual List<Character> GetGroupMembers()
        {
            List<uint> memberIds = null;
            List<Character> result = new List<Character>();

            if (owner.currentParty is Party party)
            {
                memberIds = new List<uint>(party.members);
            }
            else if (owner.currentParty is MonsterParty)
            {
                var members = owner.currentParty.BuildMemberList(owner.Id);
                memberIds = new List<uint>(members.Count);

                foreach (var member in members)
                    memberIds.Add(member.actorId);
            }
            else if (owner.currentContentGroup != null)
            {
                memberIds = new List<uint>(owner.currentContentGroup.GetMembers());
            }

            if (memberIds == null || owner.CurrentArea == null)
                return result;

            foreach (var memberId in memberIds)
            {
                Character member = owner.CurrentArea.FindActorInArea<Character>(memberId);
                if (member != null && !member.IsDead())
                    result.Add(member);
            }

            return result;
        }

        #region Aggro & Detection     


        protected virtual void TryAggro(DateTime tick)
        {
            // Preset needs to assigned in order for mob aggro to function.
            if (owner.aiContainer.GetAIPreset() == AIContainer.AIPreset.None)
                return;

            // do not scan if mob is returning to spawn, or dead. 
            if (tick < neutralTime || owner.isMovingToSpawn || !owner.IsAlive())
                return;

            // do not scan if no other players nearby. 
            if (owner.CurrentArea.GetActorsAroundActor<Player>(owner, 100).Count == 0)
                return;

            Character hatedTarget = owner.hateContainer.GetMostHatedTarget();
            if (hatedTarget != null && owner.aiContainer.GetTargetFind().CanTarget(hatedTarget))
            {
                Engage(hatedTarget);
                return;
            }

            if (TryJoinGroupCombat())
                return;

            // do not scan if mob is non-hostile. 
            if (!owner.isHostile || owner.detectionType == DetectionType.None)
                return;

            if (owner.CurrentArea == null)
                return;

            var preset = (owner.aiContainer.GetAIPreset());

            switch (preset)
            {
                case AIContainer.AIPreset.DPS:
                default:
                    {
                        TryAllyDpsAggro();
                        break;
                    }
                case AIContainer.AIPreset.Tank:
                    {
                        TryAllyTankAggro();
                        break;
                    }

                case AIContainer.AIPreset.Healer:
                    {
                        TryAllyHealerAggro();
                        break;
                    }
            }
        }

        protected virtual bool TryAllyDpsAggro()
        {
            if (!owner.aiContainer.pathFind.AtPoint())
                return false;

            Character closestTarget = null;
            float closestDistance = float.MaxValue;

            foreach (var chara in owner.CurrentArea.GetActorsAroundActor<Character>(owner, 50))
            {
                if (chara == null || chara.IsDead())
                    continue;

                if (chara.allegiance == owner.allegiance)
                    continue;

                uint levelDifference = (uint)Math.Abs(owner.GetLevel() - chara.GetLevel());

                if ((levelDifference > 10) &&
                    (owner.detectionType & DetectionType.IgnoreLevelDifference) == 0)
                    continue;

                if (!CanAggroTarget(chara))
                    continue;

                float distance = Utils.XZDistance(owner.positionX, owner.positionZ, chara.positionX, chara.positionZ);
                if (distance < closestDistance)
                {
                    closestDistance = distance;
                    closestTarget = chara;
                }
            }

            if (closestTarget == null)
                return false;

            owner.hateContainer.AddBaseHate(closestTarget);
            Engage(closestTarget);
            return true;
        }

        protected virtual bool TryMonsterDpsAggro(Character combatStarter, Character combatStarterTarget)
        {
            if (combatStarter == null || combatStarter.IsDead())
                return false;

            Character targetToEngage = null;

            if (owner.currentParty is MonsterParty)
            {
                Character pulledTarget = combatStarterTarget;

                if (pulledTarget != null && !pulledTarget.IsDead())
                {
                    List<uint> opposingMemberIds = null;

                    if (pulledTarget.currentParty is Party party)
                    {
                        opposingMemberIds = new List<uint>(party.members);
                    }
                    else if (pulledTarget.currentContentGroup != null)
                    {
                        opposingMemberIds = new List<uint>(pulledTarget.currentContentGroup.GetMembers());
                    }

                    if (opposingMemberIds != null && owner.CurrentArea != null)
                    {
                        foreach (var opposingMemberId in opposingMemberIds)
                        {
                            Character opposingMember = owner.CurrentArea.FindActorInArea<Character>(opposingMemberId);
                            if (opposingMember == null || opposingMember.IsDead())
                                continue;

                            if (!(opposingMember is BattleNpc battleNpc))
                                continue;

                            if (battleNpc.aiContainer.GetAIPreset() != AIContainer.AIPreset.Tank)
                                continue;

                            if (!battleNpc.aiContainer.IsEngaged())
                                continue;

                            targetToEngage = opposingMember;
                            break;
                        }
                    }

                    if (targetToEngage == null)
                        targetToEngage = pulledTarget;
                }
            }

            if (targetToEngage == null)
                targetToEngage = combatStarterTarget;

            if (targetToEngage == null || targetToEngage.IsDead())
                return false;

            if (!owner.aiContainer.GetTargetFind().CanTarget(targetToEngage))
                return false;

            owner.hateContainer.AddBaseHate(targetToEngage);
            Engage(targetToEngage);
            return true;
        }

        protected virtual bool TryAllyTankAggro()
        {
            List<Character> members = GetGroupMembers();
            if (members.Count == 0)
                return false;

            Character fallbackTarget = null;

            // First pass: prefer the player's active combat target.
            foreach (var member in members)
            {
                if (!(member is Player) || member.IsDead())
                    continue;

                Character memberTarget = member.target as Character;
                if (memberTarget == null || memberTarget.IsDead())
                    continue;

                bool memberHasCombat =
                    (member is BattleNpc battleNpcMember && battleNpcMember.hateContainer.GetHateList().Count > 0) ||
                    (memberTarget is BattleNpc targetNpc && targetNpc.hateContainer.HasHateForTarget(member));

                if (!memberHasCombat)
                    continue;

                if (!owner.aiContainer.GetTargetFind().CanTarget(memberTarget))
                    continue;

                owner.hateContainer.AddBaseHate(memberTarget);
                Engage(memberTarget);
                return true;
            }

            // Second pass: fall back to other group members already in combat.
            foreach (var member in members)
            {
                if (member == owner || member.IsDead() || member is Player)
                    continue;

                Character memberTarget = member.target as Character;
                if (memberTarget == null || memberTarget.IsDead())
                    continue;

                bool memberHasCombat =
                    (member is BattleNpc battleNpcMember && battleNpcMember.hateContainer.GetHateList().Count > 0) ||
                    (memberTarget is BattleNpc targetNpc && targetNpc.hateContainer.HasHateForTarget(member));

                if (!memberHasCombat)
                    continue;

                if (!owner.aiContainer.GetTargetFind().CanTarget(memberTarget))
                    continue;

                fallbackTarget = memberTarget;
                break;
            }

            if (fallbackTarget == null)
                return false;

            owner.hateContainer.AddBaseHate(fallbackTarget);
            Engage(fallbackTarget);
            return true;
        }

        protected virtual bool TryAllyHealerAggro()
        {
            List<Character> members = GetGroupMembers();
            if (members.Count == 0)
                return false;

            Character player = null;

            foreach (var member in members)
            {
                if (member is Player && !member.IsDead())
                {
                    player = member;
                    break;
                }
            }

            if (player == null)
                return false;

            return EngageSupport(player);
        }


        //public bool TryDeaggro()
        //{
        //    Character hatedTarget = owner.hateContainer.GetMostHatedTarget();
        //    Character currentTarget = owner.target as Character;

        //    if (owner is Ally)
        //    {
        //        Character target = hatedTarget ?? currentTarget;

        //        if (target == null)
        //            return true;

        //        if (target.IsDead())
        //            return true;

        //        if (target.CurrentArea != owner.CurrentArea)
        //            return true;

        //        return false;
        //    }

        //    // Allow scripted ACTIVE state without forcing a disengage.
        //    if (owner.preserveScriptedActiveState &&
        //        hatedTarget == null &&
        //        !owner.aiContainer.GetTargetFind().CanTarget(currentTarget))
        //    {
        //        return false;
        //    }

        //    if (hatedTarget == null || !owner.aiContainer.GetTargetFind().CanTarget(currentTarget))
        //    {
        //        return true;
        //    }
        //    else if (!owner.IsCloseToSpawn())
        //    {
        //        return true;
        //    }

        //    return false;
        //}

        public bool TryDeaggro()
        {
            Character hatedTarget = owner.hateContainer.GetMostHatedTarget();
            Character currentTarget = owner.target as Character;

            if (owner is Ally)
            {
                if (owner.aiContainer.GetAIPreset() == AIContainer.AIPreset.Healer)
                {
                    List<Character> members = GetGroupMembers();

                    foreach (var member in members)
                    {
                        if (member == owner || member.IsDead())
                            continue;

                        Character memberTarget = member.target as Character;

                        bool memberHasCombat =
                            (member is BattleNpc battleNpcMember && battleNpcMember.hateContainer.GetHateList().Count > 0) ||
                            (memberTarget is BattleNpc targetNpc && targetNpc.hateContainer.HasHateForTarget(member));

                        if (memberHasCombat)
                            return false;
                    }

                    return true;
                }

                Character target = hatedTarget ?? currentTarget;

                if (target == null)
                    return true;

                if (target.IsDead())
                    return true;

                if (target.CurrentArea != owner.CurrentArea)
                    return true;

                return false;
            }

            if (owner.preserveScriptedActiveState &&
                hatedTarget == null &&
                !owner.aiContainer.GetTargetFind().CanTarget(currentTarget))
            {
                return false;
            }

            if (hatedTarget == null || !owner.aiContainer.GetTargetFind().CanTarget(currentTarget))
            {
                return true;
            }
            else if (!owner.IsCloseToSpawn())
            {
                return true;
            }

            return false;
        }

        // For mobs joining combat when another mob in group is aggro'd.
        protected virtual bool TryJoinGroupCombat()
        {
            List<Character> members = GetGroupMembers();
            if (members.Count == 0)
                return false;

            foreach (var member in members)
            {
                if (member == owner || member.IsDead())
                    continue;

                Character memberTarget = member.target as Character;
                if (memberTarget == null || memberTarget.IsDead())
                    continue;

                bool memberHasCombat =
                    (member is BattleNpc battleNpcMember && battleNpcMember.hateContainer.GetHateList().Count > 0) ||
                    (memberTarget is BattleNpc targetNpc && targetNpc.hateContainer.HasHateForTarget(member));

                if (!memberHasCombat)
                    continue;

                switch (owner.aiContainer.GetAIPreset())
                {
                    case AIContainer.AIPreset.DPS:
                    default:
                        if (owner is Ally)
                            return TryAllyDpsAggro();
                        else
                            return TryMonsterDpsAggro(member, memberTarget);
                    case AIContainer.AIPreset.Tank:
                        if (!owner.aiContainer.GetTargetFind().CanTarget(memberTarget))
                            continue;

                        owner.hateContainer.AddBaseHate(memberTarget);
                        Engage(memberTarget);
                        return true;

                    case AIContainer.AIPreset.Healer:
                        {
                            Character closestMember = null;
                            float closestDistance = float.MaxValue;

                            foreach (var groupMember in members)
                            {
                                if (groupMember == owner || groupMember.IsDead())
                                    continue;

                                float distance = Utils.XZDistance(owner.positionX, owner.positionZ, groupMember.positionX, groupMember.positionZ);
                                if (distance < closestDistance)
                                {
                                    closestDistance = distance;
                                    closestMember = groupMember;
                                }
                            }

                            if (closestMember == null)
                                return false;

                            EngageSupport(closestMember);
                            return true;
                        }
                }
            }
            return false;
        }

        public override bool Engage(Character target)
        {
            var canEngage = this.owner.aiContainer.InternalEngage(target);
            if (canEngage)
            {
                // reset casting
                firstSpell = true;
                // todo: find a better place to put this?
                if (owner.GetState() != SetActorStatePacket.MAIN_STATE_ACTIVE)
                    owner.ChangeState(SetActorStatePacket.MAIN_STATE_ACTIVE);

                lastActionTime = DateTime.Now;
                battleStartTime = lastActionTime;
                // todo: adjust cooldowns with modifiers
            }
            return canEngage;
        }

        protected bool EngageSupport(Character target)
        {
            if (target == null)
                return false;

            return owner.aiContainer.InternalSupportEngage(target);
        }

        protected bool TryEngage(Character target)
        {
            // todo:
            return true;
        }

        //public override void Disengage()
        //{
        //    var target = owner.target;
        //    base.Disengage();
        //    // todo:
        //    lastActionTime = lastUpdate.AddSeconds(5);
        //    owner.isMovingToSpawn = true;
        //    owner.aiContainer.pathFind.SetPathFlags(PathFindFlags.None);
        //    owner.aiContainer.pathFind.PreparePath(owner.spawnX, owner.spawnY, owner.spawnZ, 1.5f, 10);
        //    neutralTime = lastActionTime;
        //    owner.hateContainer.ClearHate();
        //    lua.LuaEngine.CallLuaBattleFunction(owner, "onDisengage", owner, target, Utils.UnixTimeStampUTC(lastUpdate));
        //}

        public override void Disengage()
        {
            var target = owner.target;
            base.Disengage();

            lastActionTime = lastUpdate.AddSeconds(5);
            neutralTime = lastActionTime;
            owner.hateContainer.ClearHate();

            if (owner is Ally)
            {
                owner.isMovingToSpawn = false;
                owner.moveState = 0;
                owner.aiContainer.pathFind.Clear();
            }
            else
            {
                owner.isMovingToSpawn = true;
                owner.aiContainer.pathFind.SetPathFlags(PathFindFlags.None);
                owner.aiContainer.pathFind.PreparePath(owner.spawnX, owner.spawnY, owner.spawnZ, 1.5f, 10);
            }

            lua.LuaEngine.CallLuaBattleFunction(owner, "onDisengage", owner, target, Utils.UnixTimeStampUTC(lastUpdate));
        }

        public virtual bool CanAggroTarget(Character target)
        {
            if (owner.isHostile || owner.detectionType != DetectionType.None || owner.IsAlive())
            {
                return true;
            }

            // todo: can mobs aggro mounted targets?
            if (target.IsDead() || target.currentMainState == SetActorStatePacket.MAIN_STATE_MOUNTED)
            {
                return false;
            }

            if (owner.aiContainer.IsSpawned() && !owner.aiContainer.IsEngaged() && CanDetectTarget(target))
            {
                return true;
            }
            return false;
        }

        public virtual bool CanDetectTarget(Character target, bool forceSight = false)
        {
            if (owner.IsDead())
                return false;

            // todo: this should probably be changed to only allow detection at end of path?
            if (owner.aiContainer.pathFind.IsFollowingScriptedPath() || owner.aiContainer.pathFind.IsFollowingPath() && !owner.aiContainer.pathFind.AtPoint())
            {
                return false;
            }

            // todo: handle sight/scent/hp etc
            if (target.IsDead() || target.currentMainState == SetActorStatePacket.MAIN_STATE_MOUNTED)
                return false;

            float verticalDistance = Math.Abs(target.positionY - owner.positionY);
            if (verticalDistance > 8)
                return false;

            var distance = Utils.Distance(owner.positionX, owner.positionY, owner.positionZ, target.positionX, target.positionY, target.positionZ);

            bool detectSight = forceSight || (owner.detectionType & DetectionType.Sight) != 0;
            bool hasSneak = false;
            bool hasInvisible = false;
            bool isFacing = owner.IsFacing(target);

            float? aggroRange = owner.GetMobMod((uint)MobModifier.DetectionRange);

            // Prevents detection if AggroRange is 0 or null. 
            if (!aggroRange.HasValue || aggroRange.Value <= 0)
                return false;

            if (distance < aggroRange.Value)
            {
                // Detect by Sight
                if (detectSight && !hasInvisible && isFacing)
                {
                    if (CanSeePoint(target))
                        return true;
                }

                // Detect by Sound
                if ((owner.detectionType & DetectionType.Sound) != 0 && !hasSneak)
                {
                    if (CanSeePoint(target))
                        return true;
                }

                // Detect by Magic usage
                if ((owner.detectionType & DetectionType.Magic) != 0 && target.aiContainer.IsCurrentState<MagicState>())
                {
                    if (CanSeePoint(target))
                        return true;
                }

                // Detect by Low HP
                if ((owner.detectionType & DetectionType.LowHp) != 0 && target.HPP < 75)
                {
                    if (CanSeePoint(target))
                        return true;
                }
            }

            return false;
        }

        public virtual bool CanSeePoint(Character target)
        {
            if (target == null || owner.CurrentArea == null)
                return false;

            Zone zone = null;

            if (owner.CurrentArea is PrivateArea privateArea)
                zone = privateArea.GetParentZone() as Zone;
            else
                zone = owner.CurrentArea as Zone;

            if (zone == null)
                return false;

            return NavmeshUtils.CanSee(zone, owner.positionX, owner.positionY, owner.positionZ, target.positionX, target.positionY, target.positionZ);
        }

        protected virtual void HandleHate()
        {
            if (owner.aiContainer.GetAIPreset() == AIContainer.AIPreset.Healer)
                return;

            ChangeTarget(owner.hateContainer.GetMostHatedTarget());
        }

        public override void ChangeTarget(Character target)
        {
            if (target != owner.target)
            {
                owner.target = target;
                owner.currentLockedTarget = target?.Id ?? Actor.INVALID_ACTORID;
                owner.currentTarget = target?.Id ?? Actor.INVALID_ACTORID;

                foreach (var player in owner.CurrentArea.GetActorsAroundActor<Player>(owner, 50))
                    player.QueuePacket(owner.GetHateTypePacket(player));

                base.ChangeTarget(target);
            }
        }
        #endregion

        #region Abilities & Actions
        public override void Cast(Character target, uint spellId)
        {
            // todo:
            if(owner.aiContainer.CanChangeState())
                owner.aiContainer.InternalCast(target, spellId);
        }

        public override void Ability(Character target, uint abilityId)
        {
            // todo:
            if (owner.aiContainer.CanChangeState())
                owner.aiContainer.InternalAbility(target, abilityId);
        }

        public override void RangedAttack(Character target)
        {
            // todo:
        }

        public override void MonsterSkill(Character target, uint mobSkillId)
        {
            // todo:
        }

        #endregion

        #region Movement (Chasing & Roaming)

        protected virtual void Move()
        {
            if (owner.aiContainer.GetAIPreset() == AIContainer.AIPreset.None)
                return;

            if (!owner.aiContainer.CanFollowPath() ||
                owner.statusEffects.HasStatusEffectsByFlag(StatusEffectFlags.PreventMovement))
            {
                return;
            }

            if (owner.aiContainer.pathFind.IsFollowingScriptedPath())
            {
                owner.aiContainer.pathFind.FollowPath();
                return;
            }

            switch (owner.aiContainer.GetAIPreset())
            {
                case AIContainer.AIPreset.DPS:
                default:
                    MoveDps();
                    break;
                case AIContainer.AIPreset.Tank:
                    MoveTank();
                    break;

                case AIContainer.AIPreset.Healer:
                    MoveHealer();
                    break;
            }

            lastRoamUpdate = DateTime.Now;
        }


        protected virtual void MoveDps()
        {
            Character target = owner.target as Character;
            if (target == null)
                return;

            Job job = owner.GetCurrentClassOrJob();
            bool isRangedDps = job == Job.Archer || job == Job.Bard || job == Job.Thaumaturge || job == Job.BlackMage;

            if (isRangedDps)
            {
                MoveToRangedPosition(target);
                return;
            }

            float stopDistance = Math.Max(0.2f, owner.GetAutoAttackRange() - 1.0f);
            float distance = Utils.XZDistance(owner.positionX, owner.positionZ, target.positionX, target.positionZ);

            // First pursue normally.
            if (distance > stopDistance + 0.25f)
            {
                if (CanSeePoint(target))
                {
                    owner.aiContainer.pathFind.Clear();
                    ChaseDirectly(target, stopDistance);
                }
                else
                {
                    ChaseWithPath(target, stopDistance);
                }

                return;
            }

            bool isPrimaryTarget = target is BattleNpc battleNpcTarget && battleNpcTarget.hateContainer.GetMostHatedTarget() == owner;

            // To-do: this needs work
            if (owner is Ally && !isPrimaryTarget)
            {
                MoveToRearOfTarget(target);
                return;
            }

            FaceTarget();
        }

        protected virtual void MoveTank()
        {
            Character target = owner.target as Character;
            if (target == null)
                return;

            Vector3 ownerPos = owner.GetPosAsVector3();
            Vector3 targetPos = target.GetPosAsVector3();
            float distance = Utils.XZDistance(owner.positionX, owner.positionZ, target.positionX, target.positionZ);

            float stopDistance = Math.Max(0.2f, owner.GetAutoAttackRange() - 1.0f);

            if (distance <= stopDistance)
            {
                owner.aiContainer.pathFind.Clear();
                owner.moveState = 0;
                hasDirectChaseGoal = false;
                wasDirectChasing = false;
                TurnToward(targetPos, 0.025f);
                return;
            }

            if (!CanMoveForward(distance))
                return;

            if (CanSeePoint(target))
            {
                owner.aiContainer.pathFind.Clear();
                ChaseDirectly(target, stopDistance);
            }
            else
            {
                ChaseWithPath(target, stopDistance);
            }
        }

        //to-do
        protected virtual void MoveHealer()
        {
            List<Character> members = GetGroupMembers();
            if (members.Count == 0)
                return;

            Character player = null;
            Character injuredMember = null;
            float lowestHpPercent = 101.0f;

            foreach (var member in members)
            {
                if (member == null || member.IsDead())
                    continue;

                if (player == null && member is Player)
                    player = member;

                float hpPercent = member.MaxHP > 0 ? (member.HP * 100.0f / member.MaxHP) : 0.0f;
                if (hpPercent < 75.0f && hpPercent < lowestHpPercent)
                {
                    lowestHpPercent = hpPercent;
                    injuredMember = member;
                }
            }

            // Active state:
            // If any party member is below 75%, move within 10 range of them, if needed.
            if (injuredMember != null)
            {
                owner.aiContainer.ChangeTarget(injuredMember);

                float distanceToInjured = Utils.XZDistance(owner.positionX, owner.positionZ, injuredMember.positionX, injuredMember.positionZ);
                if (distanceToInjured <= 10.0f)
                {
                    owner.aiContainer.pathFind.Clear();
                    owner.moveState = 0;
                    FaceTarget();
                    return;
                }

                if (CanSeePoint(injuredMember))
                {
                    owner.aiContainer.pathFind.Clear();
                    ChaseDirectly(injuredMember, 10.0f);
                }
                else
                {
                    ChaseWithPath(injuredMember, 10.0f);
                }

                return;
            }

            // Default state:
            // If nobody is below 75%, stay within 5 range of the player.
            if (player == null || player.IsDead())
                return;

            owner.aiContainer.ChangeTarget(player);

            float distanceToPlayer = Utils.XZDistance(owner.positionX, owner.positionZ, player.positionX, player.positionZ);
            if (distanceToPlayer <= 5.0f)
            {
                owner.aiContainer.pathFind.Clear();
                owner.moveState = 0;
                FaceTarget();
                return;
            }

            if (CanSeePoint(player))
            {
                owner.aiContainer.pathFind.Clear();
                ChaseDirectly(player, 5.0f);
            }
            else
            {
                ChaseWithPath(player, 5.0f);
            }
        }

        protected virtual void MoveToRearOfTarget(Character target)
        {
            if (target == null)
                return;

            if (owner.GetHitDirection(target) == HitDirection.Rear)
            {
                owner.aiContainer.pathFind.Clear();
                owner.moveState = 0;
                FaceTarget();
                return;
            }

            float rearOffset = Math.Max(0.6f, owner.GetAutoAttackRange() - 1.0f);

            float sin = (float)Math.Sin(target.rotation);
            float cos = (float)Math.Cos(target.rotation);

            Vector3 targetPos = target.GetPosAsVector3();
            Vector3 rearPos = new Vector3(
                targetPos.X - sin * rearOffset,
                targetPos.Y,
                targetPos.Z - cos * rearOffset
            );

            owner.moveState = 3;
            owner.aiContainer.pathFind.Clear();
            owner.aiContainer.pathFind.SetPathFlags(PathFindFlags.None);
            owner.aiContainer.pathFind.PreparePath(rearPos, 1.5f, 4);

            if (owner.aiContainer.pathFind.IsFollowingPath())
                owner.aiContainer.pathFind.FollowPath();
            else
            {
                owner.moveState = 0;
                FaceTarget();
            }
        }

        protected virtual void MoveToRangedPosition(Character target)
        {
            if (target == null)
                return;

            float distance = Utils.XZDistance(owner.positionX, owner.positionZ, target.positionX, target.positionZ);

            // Stay put if already in a reasonable ranged band.
            if (distance >= 10.0f && distance <= 15.0f)
            {
                owner.aiContainer.pathFind.Clear();
                owner.moveState = 0;
                FaceTarget();
                return;
            }

            float angle = (float)(new Random().NextDouble() * Math.PI * 2.0);
            float radius = 10.0f + (float)(new Random().NextDouble() * 5.0);

            Vector3 targetPos = target.GetPosAsVector3();
            Vector3 rangedPos = new Vector3(
                targetPos.X + (float)Math.Cos(angle) * radius,
                targetPos.Y,
                targetPos.Z + (float)Math.Sin(angle) * radius
            );

            owner.aiContainer.pathFind.Clear();
            owner.aiContainer.pathFind.SetPathFlags(PathFindFlags.None);
            owner.aiContainer.pathFind.PreparePath(rangedPos, 1.5f, 4);

            if (owner.aiContainer.pathFind.IsFollowingPath())
                owner.aiContainer.pathFind.FollowPath();
            else
                FaceTarget();
        }

        protected virtual void ChaseDirectly(Character target, float stopDistance)
        {
            Vector3 ownerPos = owner.GetPosAsVector3();
            Vector3 targetPos = target.GetPosAsVector3();

            float distance = Utils.XZDistance(owner.positionX, owner.positionZ, target.positionX, target.positionZ);

            float innerStopDistance = Math.Max(0.1f, stopDistance - 0.8f);

            if (distance <= innerStopDistance)
            {
                owner.moveState = 0;
                hasDirectChaseGoal = false;
                wasDirectChasing = false;
                TurnToward(targetPos, 0.10f);
                return;
            }

            // Prediction-based chasing.
            Vector3 predictedTargetPos = targetPos;
            if (!(target is BattleNpc))
            {
                Vector3 targetVelocity = new Vector3(target.positionX - target.oldPositionX, 0.0f, target.positionZ - target.oldPositionZ);

                float targetSpeed = targetVelocity.Length();
                if (targetSpeed > 0.001f)
                {
                    targetVelocity /= targetSpeed;
                    float leadDistance = Math.Min(distance * 0.35f, 2.5f);
                    predictedTargetPos = new Vector3(
                        targetPos.X + targetVelocity.X * leadDistance,
                        targetPos.Y,
                        targetPos.Z + targetVelocity.Z * leadDistance);
                }
            }

            Vector3 dirToTarget = predictedTargetPos - ownerPos;
            float length = dirToTarget.Length();
            if (length <= 0.001f)
                return;

            dirToTarget /= length;

            float chaseStep = Math.Min(Math.Max(0.6f, owner.GetSpeed() * 0.30f), Math.Max(0.0f, distance - innerStopDistance));

            directChaseGoal = new Vector3(ownerPos.X + dirToTarget.X * chaseStep, ownerPos.Y, ownerPos.Z + dirToTarget.Z * chaseStep);

            hasDirectChaseGoal = true;
            lastDirectChaseRefresh = DateTime.Now;

            float turnSpeed = distance > 8.0f ? 0.07f : distance > 4.0f ? 0.11f : 0.18f;

            TurnToward(directChaseGoal, turnSpeed);

            owner.moveState = 3;
            owner.SetPositionUpdate(directChaseGoal.X, owner.positionY, directChaseGoal.Z);
            wasDirectChasing = true;
        }

        // Chase fall-back for when mob doesn't have direct Line of Sight with target.
        // Attempts to build path to target before other scripts can switch mob back to ChaseDirectly.
        protected virtual void ChaseWithPath(Character target, float stopDistance)
        {
            Vector3 ownerPos = owner.GetPosAsVector3();
            Vector3 targetPos = target.GetPosAsVector3();
            float distance = Utils.XZDistance(owner.positionX, owner.positionZ, target.positionX, target.positionZ);

            hasDirectChaseGoal = false;
            wasDirectChasing = false;

            Vector3 vecToTarget = targetPos - ownerPos;
            float len = vecToTarget.Length();
            if (len <= 0.001f)
                return;

            vecToTarget /= len;
            vecToTarget = (distance - stopDistance + 0.2f) * vecToTarget;

            Vector3 desiredPos = ownerPos + vecToTarget;

            owner.moveState = 3;
            owner.aiContainer.pathFind.Clear();
            owner.aiContainer.pathFind.SetPathFlags(PathFindFlags.None);
            owner.aiContainer.pathFind.PreparePath(desiredPos, 1.5f, 4);

            if (owner.aiContainer.pathFind.IsFollowingPath())
                owner.aiContainer.pathFind.FollowPath();
            else
            {
                owner.moveState = 0;
                FaceTarget();
            }

            lastRoamUpdate = DateTime.Now;
        }

        protected virtual void TurnToward(Vector3 targetPos, float maxTurnPerTick = 0.14f)
        {
            if (owner.statusEffects.HasStatusEffectsByFlag(StatusEffectFlags.PreventTurn))
                return;

            if (owner.positionX == targetPos.X && owner.positionZ == targetPos.Z)
                return;

            double dX = owner.positionX - targetPos.X;
            double dZ = owner.positionZ - targetPos.Z;
            double rot2 = Math.Atan2(dZ, dX);
            float desiredRotation = (float)(Math.PI - rot2 + Math.PI / 2);

            float current = owner.rotation;
            float delta = desiredRotation - current;

            while (delta > Math.PI)
                delta -= (float)(Math.PI * 2);

            while (delta < -Math.PI)
                delta += (float)(Math.PI * 2);

            if (delta > maxTurnPerTick)
                delta = maxTurnPerTick;
            else if (delta < -maxTurnPerTick)
                delta = -maxTurnPerTick;

            if (Math.Abs(delta) <= 0.0001f)
                return;

            owner.oldRotation = owner.rotation;
            owner.rotation = owner.NormalizeRotation(current + delta);
            owner.updateFlags |= ActorUpdateFlags.Position;
        }

        protected void FaceTarget(float turnSpeed = 0.03f)
        {
            if (owner.statusEffects.HasStatusEffectsByFlag(StatusEffectFlags.PreventTurn))
                return;

            owner.SmoothLookAt(owner.target, turnSpeed);
        }

        protected bool CanMoveForward(float distance)
        {
            // todo: check spawn leash and stuff
            if (!(owner is Ally) && !owner.IsCloseToSpawn())
            {
                return false;
            }
            if (owner.GetSpeed() == 0)
            {
                return false;
            }
            return true;
        }

        protected virtual int GetRoamDelaySeconds()
        {
            int baseDelay = (int)owner.GetMobMod((uint)MobModifier.RoamDelay);
            return GetRandomizedRoamDelaySeconds(baseDelay);
        }

        protected int GetRandomizedRoamDelaySeconds(int baseDelay)
        {
            int min = Math.Max(1, baseDelay - 3);
            int max = baseDelay + 3;
            return roamRandom.Next(min, max + 1);
        }

        protected virtual void DoRoamTick(DateTime tick, List<Character> contentGroupCharas = null)
        {
            bool wasFollowingPath = owner.aiContainer.pathFind.IsFollowingPath();

            if (wasFollowingPath && owner.aiContainer.CanFollowPath())
            {
                owner.aiContainer.pathFind.FollowPath();

                // Path just finished. Start idle delay.
                if (!owner.aiContainer.pathFind.IsFollowingPath())
                    waitTime = tick.AddSeconds(GetRoamDelaySeconds());

                return;
            }

            if (tick < waitTime)
                return;

            neutralTime = tick.AddSeconds(5);

            if (tick >= lastActionTime)
            {
                // Reserved for future roam logic.
            }

            owner.OnRoam(tick);

            if (CanMoveForward(0.0f) && !owner.aiContainer.pathFind.IsFollowingPath())
            {
                owner.aiContainer.pathFind.SetPathFlags(PathFindFlags.None);
                owner.aiContainer.pathFind.PathInRange(owner.spawnX, owner.spawnY, owner.spawnZ, 1.5f, 50.00f);

                // If no path actually created, start the wait immediately so we don't spam retries.
                if (!owner.aiContainer.pathFind.IsFollowingPath())
                    waitTime = tick.AddSeconds(GetRoamDelaySeconds());
            }
            else
            {
                // Could not start moving this tick, so wait before trying again.
                waitTime = tick.AddSeconds(GetRoamDelaySeconds());
            }
            //lua.LuaEngine.CallLuaBattleFunction(owner, "onRoam", owner, contentGroupCharas);
        }

        #endregion
    }
}
