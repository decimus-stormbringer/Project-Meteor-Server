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
using Meteor.Map.actors;
using Meteor.Map.actors.area;
using Meteor.Map.actors.chara;
using Meteor.Map.actors.chara.ai;
using Meteor.Map.actors.chara.ai.controllers;
using Meteor.Map.actors.chara.ai.state;
using Meteor.Map.actors.chara.npc;
using Meteor.Map.actors.chara.player;
using Meteor.Map.actors.director;
using Meteor.Map.actors.director.Work;
using Meteor.Map.actors.group;
using Meteor.Map.actors.group.Work;
using Meteor.Map.Actors;
using Meteor.Map.Actors.Chara;
using Meteor.Map.Actors.Chara.Player;
using Meteor.Map.Actors.QuestNS;
using Meteor.Map.DataObjects;
using Meteor.Map.DataObjects.chara;
using Meteor.Map.packets.receive;
using Meteor.Map.packets.receive.events;
using Meteor.Map.packets.receive.recruitment;
using Meteor.Map.packets.receive.social;
using Meteor.Map.packets.send;
using Meteor.Map.packets.send.actor;
using Meteor.Map.packets.send.actor.battle;
using Meteor.Map.packets.send.actor.events;
using Meteor.Map.packets.send.actor.inventory;
using Meteor.Map.packets.send.events;
using Meteor.Map.packets.send.group;
using Meteor.Map.packets.send.groups;
using Meteor.Map.packets.send.login;
using Meteor.Map.packets.send.player;
using Meteor.Map.packets.send.recruitment;
using Meteor.Map.packets.send.search;
using Meteor.Map.packets.send.social;
using Meteor.Map.packets.WorldPackets.Receive;
using Meteor.Map.packets.WorldPackets.Send;
using Meteor.Map.packets.WorldPackets.Send.Group;
using Meteor.Map.Properties;
using Meteor.Map.utils;
using MoonSharp.Interpreter;
using MoonSharp.Interpreter.Interop;
using MoonSharp.Interpreter.Loaders;
using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.CompilerServices;
using System.Threading;
using static Meteor.Map.LuaUtils;

namespace Meteor.Map.lua
{
    class LuaEngine
    {
        public const string FILEPATH_PLAYER = "/player.lua";
        public const string FILEPATH_ZONE = "/unique/{0}/zone.lua";
        public const string FILEPATH_CONTENT = "/content/{0}.lua";
        public const string FILEPATH_COMMANDS = "/commands/{0}.lua";
        public const string FILEPATH_DIRECTORS = "/directors/{0}.lua";
        public const string FILEPATH_NPCS = "/unique/{0}/{1}/{2}.lua";
        public const string FILEPATH_QUEST = "/quests/{0}/{1}.lua";

        private static LuaEngine mThisEngine;
        private Dictionary<Coroutine, ulong> mSleepingOnTime = new Dictionary<Coroutine, ulong>();
        private Dictionary<string, List<Coroutine>> mSleepingOnSignal = new Dictionary<string, List<Coroutine>>();
        private Dictionary<uint, Coroutine> mSleepingOnPlayerEvent = new Dictionary<uint, Coroutine>();

        private Timer luaTimer;


        private LuaEngine()
        {
            luaTimer = new Timer(new TimerCallback(PulseSleepingOnTime),
                           null, TimeSpan.Zero, TimeSpan.FromMilliseconds(50));

            //Using this is not recommended but can be useful for LUA debugging. 
            //Allows LUA files universal access to call Methods/Types from .cs Classes
            //UserData.RegistrationPolicy = InteropRegistrationPolicy.Automatic;

            //Classes
            UserData.RegisterType<LuaEngine>();
            UserData.RegisterType<Player>();
            UserData.RegisterType<CharaWork>();
            UserData.RegisterType<ParameterSave>();
            UserData.RegisterType<PlayerWork>();
            UserData.RegisterType<Command>();
            UserData.RegisterType<Npc>();
            UserData.RegisterType<Quest>();
            UserData.RegisterType<QuestData>();
            UserData.RegisterType<ContentGroup>();
            UserData.RegisterType<Zone>();
            UserData.RegisterType<InventoryItem>();
            UserData.RegisterType<ItemRefParam>();
            UserData.RegisterType<Type9Param>();
            UserData.RegisterType<WeaponItem>();
            UserData.RegisterType<ArmorItem>();
            UserData.RegisterType<EquipmentItem>();
            UserData.RegisterType<ItemData>();
            UserData.RegisterType<ItemPackage>();
            UserData.RegisterType<ReferencedItemPackage>();
            UserData.RegisterType<PrivateArea>();
            UserData.RegisterType<PrivateAreaContent>();
            UserData.RegisterType<Director>();
            UserData.RegisterType<WorldManager>();
            UserData.RegisterType<WorldMaster>();
            UserData.RegisterType<Area>();
            UserData.RegisterType<PlayerWork>();
            UserData.RegisterType<BattleSave>();
            UserData.RegisterType<BattleTemp>();
            UserData.RegisterType<EventSave>();
            UserData.RegisterType<EventTemp>();
            UserData.RegisterType<ModifierList>();
            UserData.RegisterType<SubState>();
            UserData.RegisterType<Work>();
            UserData.RegisterType<Ally>();
            UserData.RegisterType<ActorClass>();
            UserData.RegisterType<BattleNpc>();
            UserData.RegisterType<NpcWork>();
            UserData.RegisterType<Pet>();
            UserData.RegisterType<BattleCommand>();
            UserData.RegisterType<BattleTrait>();
            UserData.RegisterType<HateContainer>();
            UserData.RegisterType<StatusEffect>();
            UserData.RegisterType<StatusEffectContainer>();
            UserData.RegisterType<ActionQueue>();
            UserData.RegisterType<PathFind>();
            UserData.RegisterType<TargetFind>();
            UserData.RegisterType<AbilityState>();
            UserData.RegisterType<AttackState>();
            UserData.RegisterType<DeathState>();
            UserData.RegisterType<DespawnState>();
            UserData.RegisterType<InactiveState>();
            UserData.RegisterType<ItemState>();
            UserData.RegisterType<MagicState>();
            UserData.RegisterType<State>();
            UserData.RegisterType<WeaponSkillState>();
            UserData.RegisterType<AllyController>();
            UserData.RegisterType<BattleNpcController>();
            UserData.RegisterType<Controller>();
            UserData.RegisterType<PetController>();
            UserData.RegisterType<PlayerController>();
            UserData.RegisterType<Character>();
            UserData.RegisterType<Retainer>();
            UserData.RegisterType<Session>();
            UserData.RegisterType<WeaponItem>();
            UserData.RegisterType<BattleTrait>();
            UserData.RegisterType<HateEntry>();
            UserData.RegisterType<EventList>();
            UserData.RegisterType<Judge>();
            UserData.RegisterType<Shops>();
            UserData.RegisterType<StaticActors>();
            UserData.RegisterType<SpawnLocation>();
            UserData.RegisterType<ModifierListEntry>();
            UserData.RegisterType<AetheryteWork>();
            UserData.RegisterType<GuildleveDirector>();
            UserData.RegisterType<GuildleveWork>();
            UserData.RegisterType<GLContentGroup>();
            UserData.RegisterType<Group>();
            UserData.RegisterType<MonsterParty>();
            UserData.RegisterType<RelationGroup>();
            UserData.RegisterType<RetainerMeetingRelationGroup>();
            UserData.RegisterType<TradeGroup>();
            UserData.RegisterType<ContentGroupWork>();
            UserData.RegisterType<GlobalTemp>();
            UserData.RegisterType<GroupGlobalSave>();
            UserData.RegisterType<GroupGlobalTemp>();
            UserData.RegisterType<GroupMemberSave>();
            UserData.RegisterType<PartyWork>();
            UserData.RegisterType<RelationWork>();
            UserData.RegisterType<GuildleveData>();
            UserData.RegisterType<QuestGameData>();
            UserData.RegisterType<Recipe>();
            UserData.RegisterType<RecipeResolver>();
            UserData.RegisterType<RecruitmentDetails>();
            UserData.RegisterType<AIContainer>();
            UserData.RegisterType<PlayerAttributePointAllotment>();
            UserData.RegisterType<CompatibilityData>();
            UserData.RegisterType<GuardianData>();
            UserData.RegisterType<MateriaItem>();
            UserData.RegisterType<TribeData>();
            UserData.RegisterType<ModifierData>();
            UserData.RegisterType<ModifierContainer>();
            UserData.RegisterType<QuestStateManager>();
            UserData.RegisterType<AccessoryItem>();
            UserData.RegisterType<SeamlessBoundry>();
            UserData.RegisterType<SearchEntry>();
            UserData.RegisterType<CommandProcessor>();
            UserData.RegisterType<ItemOfferParam>();
            UserData.RegisterType<ItemRefParam>();
            UserData.RegisterType<Actor>();
            UserData.RegisterType<ParameterTemp>();
            UserData.RegisterType<BattleCommand>();
            UserData.RegisterType<Director>();
            UserData.RegisterType<Party>();
            UserData.RegisterType<QuestState>();

            //Enumarators
            UserData.RegisterType<Modifier>();
            UserData.RegisterType<MobModifier>();
            UserData.RegisterType<ModifierOrigin>();
            UserData.RegisterType<IEnumerable<Modifier>>();
            UserData.RegisterType<IEnumerable<ModifierData>>();
            UserData.RegisterType<BattleCommandCastType>();
            UserData.RegisterType<BattleCommandPositionBonus>();
            UserData.RegisterType<BattleCommandProcRequirement>();
            UserData.RegisterType<BattleCommandRequirements>();
            UserData.RegisterType<BattleCommandValidUser>();
            UserData.RegisterType<CommandType>();
            UserData.RegisterType<ValidTarget>();
            UserData.RegisterType<ActorUpdateFlags>();
            UserData.RegisterType<CharacterTargetingAllegiance>();
            UserData.RegisterType<DamageTakenType>();
            UserData.RegisterType<DetectionType>();
            UserData.RegisterType<KindredType>();
            UserData.RegisterType<NpcSpawnType>();
            UserData.RegisterType<KnockbackType>();
            UserData.RegisterType<PathFindFlags>();
            UserData.RegisterType<StatusEffectFlags>();
            UserData.RegisterType<StatusEffectId>();
            UserData.RegisterType<StatusEffectOverwrite>();
            UserData.RegisterType<TargetFindAOETarget>();
            UserData.RegisterType<TargetFindAOEType>();
            UserData.RegisterType<TargetFindCharacterType>();
            UserData.RegisterType<Job>();
            UserData.RegisterType<GeneralParameterIndex>();
            UserData.RegisterType<Guardian>();
            UserData.RegisterType<MateriaType>();
            UserData.RegisterType<Tribe>();
            UserData.RegisterType<EquipmentSlot>();
            UserData.RegisterType<HitDirection>();
            UserData.RegisterType<HitEffect>();
            UserData.RegisterType<HitType>();
            UserData.RegisterType<ActionProperty>();
            UserData.RegisterType<ActionType>();
            UserData.RegisterType<IEnumerable<StatusEffect>>();

            //Dictionaries
            UserData.RegisterType<Dictionary<ushort, ItemPackage>>();
            UserData.RegisterType<Dictionary<ushort, UInt64>>();
            UserData.RegisterType<Dictionary<EquipmentSlot, IList<ModifierData>>>();
            UserData.RegisterType<Dictionary<uint, Session>>();
            UserData.RegisterType<Dictionary<uint, ItemData>>();
            UserData.RegisterType<Dictionary<uint, GuildleveData>>();
            UserData.RegisterType<Dictionary<uint, QuestGameData>>();
            UserData.RegisterType<Dictionary<uint, GuardianData>>();
            UserData.RegisterType<Dictionary<uint, TribeData>>();
            UserData.RegisterType<Dictionary<int, CompatibilityData>>();
            UserData.RegisterType<Dictionary<uint, Recipe>>();
            UserData.RegisterType<Dictionary<HitType, ushort>>();
            UserData.RegisterType<Dictionary<HitType, HitEffect>>();
            UserData.RegisterType<Dictionary<KnockbackType, HitEffect>>();
            UserData.RegisterType<Dictionary<byte, ushort>>();
            UserData.RegisterType<Dictionary<uint, BattleCommand>>();
            UserData.RegisterType<Dictionary<MobModifier, Int64>>();
            UserData.RegisterType<Dictionary<uint, Zone>>();
            UserData.RegisterType<Dictionary<uint, List<SeamlessBoundry>>>();
            UserData.RegisterType<Dictionary<uint, ActorClass>>();
            UserData.RegisterType<Dictionary<ulong, Party>>();
            UserData.RegisterType<Dictionary<uint, StatusEffect>>();
            UserData.RegisterType<Dictionary<Tuple<byte, short>, List<ushort>>>();
            UserData.RegisterType<Dictionary<ushort, BattleTrait>>();
            UserData.RegisterType<Dictionary<byte, List<ushort>>>();
            UserData.RegisterType<Dictionary<ulong, Group>>();
            UserData.RegisterType<Dictionary<ulong, RelationGroup>>();
            UserData.RegisterType<Dictionary<ulong, TradeGroup>>();
            UserData.RegisterType<IDictionary<Modifier, double>>();
            UserData.RegisterType<Dictionary<ModifierOrigin, IDictionary<Modifier, double>>>();
            UserData.RegisterType<Dictionary<uint, Director>>();
            UserData.RegisterType<Dictionary<uint, Actor>>();
            UserData.RegisterType<Dictionary<int, PrivateArea>>();
            UserData.RegisterType<Dictionary<string, Dictionary<int, PrivateArea>>>();
            UserData.RegisterType<Dictionary<string, List<PrivateAreaContent>>>();
            UserData.RegisterType<Dictionary<Character, HateEntry>>();
            UserData.RegisterType<Dictionary<uint, ModifierListEntry>>();
            UserData.RegisterType<Dictionary<uint, QuestState>>();
            UserData.RegisterType<Dictionary<string, List<Recipe>>>();

            //Lists
            //UserData.RegisterType<System.Collections.IList>();  //Broadly Registers IList Type. Fixes starting gear but breaks PopulaceStandard?
            //UserData.RegisterType<List<InventoryItem>>();
            //UserData.RegisterType<List<ushort>>();
            //UserData.RegisterType<List<SubPacket>>();
            //UserData.RegisterType<List<ItemPackage>>();
            //UserData.RegisterType<List<SeamlessBoundry>>();
            //UserData.RegisterType<List<Actor>>();
            //UserData.RegisterType<List<LuaParam>>();
            //UserData.RegisterType<List<Vector3>>();
            //UserData.RegisterType<List<float>>();
            //UserData.RegisterType<List<CommandResult>>();
            //UserData.RegisterType<List<Modifier>>();
            //UserData.RegisterType<IList<ModifierData>>();
            //UserData.RegisterType<List<ModifierData>>();
            //UserData.RegisterType<List<Character>>();
            //UserData.RegisterType<List<Director>>();
            //UserData.RegisterType<List<SpawnLocation>>();
            //UserData.RegisterType<List<Player>>();
            //UserData.RegisterType<List<BattleNpc>>();
            //UserData.RegisterType<List<Ally>>();
            //UserData.RegisterType<List<short>>();
            //UserData.RegisterType<List<Recipe>>();
            //UserData.RegisterType<List<Tuple<ushort, uint>>>();
            //UserData.RegisterType<List<string>>();
            //UserData.RegisterType<List<PrivateAreaContent>>();
            //UserData.RegisterType<List<Quest>>();

            //Classes from Packet Send/Receive Namespaces        
            UserData.RegisterType<CommandResult>();
            UserData.RegisterType<CommandResultContainer>();
            UserData.RegisterType<GroupMember>();
            UserData.RegisterType<ItemSearchResult>();
            UserData.RegisterType<PlayerSearchResult>();
            UserData.RegisterType<RetainerSearchHistoryResult>();
            UserData.RegisterType<RetainerSearchResult>();

            //Pretty sure there aren't any LUA scripts that use these but keeping
            //them here just incase so I don't have to ever re-type them. 
            //UserData.RegisterType<SetInitialEquipmentPacket>();
            //UserData.RegisterType<Database>();
            //UserData.RegisterType<LuaUtils>();
            //UserData.RegisterType<Program>();
            //UserData.RegisterType<Server>();
            //UserData.RegisterType<CharacterUtils>();
            //UserData.RegisterType<Resources>();
            //UserData.RegisterType<PacketProcessor>();
            //UserData.RegisterType<StartRecruitingResponse>();
            //UserData.RegisterType<CreateNamedGroupMultiple>();
            //UserData.RegisterType<CreateNamedGroup>();
            //UserData.RegisterType<SetEmoteEventCondition>();
            //UserData.RegisterType<SetNoticeEventCondition>();
            //UserData.RegisterType<SetPushEventConditionWithCircle>();
            //UserData.RegisterType<SetPushEventConditionWithFan>();
            //UserData.RegisterType<SetPushEventConditionWithTriggerBox>();
            //UserData.RegisterType<SetTalkEventCondition>();
            //UserData.RegisterType<PlayBGAnimation>();
            //UserData.RegisterType<ZoneConnection>();
            //UserData.RegisterType<_0x02ReceivePacket>();
            //UserData.RegisterType<AchievementProgressRequestPacket>();
            //UserData.RegisterType<ChatMessagePacket>();
            //UserData.RegisterType<CountdownRequestPacket>();
            //UserData.RegisterType<GroupCreatedPacket>();
            //UserData.RegisterType<HandshakePacket>();
            //UserData.RegisterType<LangaugeCodePacket>();
            //UserData.RegisterType<PingPacket>();
            //UserData.RegisterType<PongPacket>();
            //UserData.RegisterType<SetTargetPacket>();
            //UserData.RegisterType<UpdateItemPackagePacket>();
            //UserData.RegisterType<UpdatePlayerPositionPacket>();
            //UserData.RegisterType<WorkSyncRequestPacket>();
            //UserData.RegisterType<ZoneInCompletePacket>();
            //UserData.RegisterType<EventStartPacket>();
            //UserData.RegisterType<EventUpdatePacket>();
            //UserData.RegisterType<RecruitmentDetailsRequestPacket>();
            //UserData.RegisterType<RecruitmentSearchRequestPacket>();
            //UserData.RegisterType<StartRecruitingRequestPacket>();
            //UserData.RegisterType<AddRemoveSocialPacket>();
            //UserData.RegisterType<FriendlistRequestPacket>();
            //UserData.RegisterType<_0x02Packet>();
            //UserData.RegisterType<_0xE2Packet>();
            //UserData.RegisterType<GameMessagePacket>();
            //UserData.RegisterType<LogoutPacket>();
            //UserData.RegisterType<QuitPacket>();
            //UserData.RegisterType<SendMessagePacket>();
            //UserData.RegisterType<SetDalamudPacket>();
            //UserData.RegisterType<SetMapPacket>();
            //UserData.RegisterType<SetMusicPacket>();
            //UserData.RegisterType<SetWeatherPacket>();
            //UserData.RegisterType<_0x132Packet>();
            //UserData.RegisterType<_0xFPacket>();
            //UserData.RegisterType<ActorDoEmotePacket>();
            //UserData.RegisterType<ActorInstantiatePacket>();
            //UserData.RegisterType<AddActorPacket>();
            //UserData.RegisterType<DeleteAllActorsPacket>();
            //UserData.RegisterType<MoveActorToPositionPacket>();
            //UserData.RegisterType<PlayAnimationOnActorPacket>();
            //UserData.RegisterType<RemoveActorPacket>();
            //UserData.RegisterType<SetActorAppearancePacket>();
            //UserData.RegisterType<SetActorIconPacket>();
            //UserData.RegisterType<SetActorBGPropertiesPacket>();
            //UserData.RegisterType<SetActorIsZoningPacket>();
            //UserData.RegisterType<SetActorNamePacket>();
            //UserData.RegisterType<SetActorPositionPacket>();
            //UserData.RegisterType<SetActorPropetyPacket>();
            //UserData.RegisterType<SetActorQuestGraphicPacket>();
            //UserData.RegisterType<SetActorSpeedPacket>();
            //UserData.RegisterType<SetActorStatePacket>();
            //UserData.RegisterType<SetActorStatusAllPacket>();
            //UserData.RegisterType<SetActorStatusPacket>();
            //UserData.RegisterType<SetActorSubStatePacket>();
            //UserData.RegisterType<SetActorSubStatePacket>();
            //UserData.RegisterType<SetActorTargetAnimatedPacket>();
            //UserData.RegisterType<SetActorTargetPacket>();
            //UserData.RegisterType<SetGrandCompanyPacket>();
            //UserData.RegisterType<StartCountdownPacket>();
            //UserData.RegisterType<CommandResultX00Packet>();
            //UserData.RegisterType<CommandResultX01Packet>();
            //UserData.RegisterType<CommandResultX01PacketCommand>();
            //UserData.RegisterType<CommandResultX10Packet>();
            //UserData.RegisterType<CommandResultX18Packet>();
            //UserData.RegisterType<SetEventStatusPacket>();
            //UserData.RegisterType<InventoryBeginChangePacket>();
            //UserData.RegisterType<InventoryEndChangePacket>();
            //UserData.RegisterType<InventoryItemEndPacket>();
            //UserData.RegisterType<InventoryItemPacket>();
            //UserData.RegisterType<InventoryListX01Packet>();
            //UserData.RegisterType<InventoryListX08Packet>();
            //UserData.RegisterType<InventoryListX16Packet>();
            //UserData.RegisterType<InventoryListX32Packet>();
            //UserData.RegisterType<InventoryListX64Packet>();
            //UserData.RegisterType<InventoryRemoveX01Packet>();
            //UserData.RegisterType<InventoryRemoveX08Packet>();
            //UserData.RegisterType<InventoryRemoveX16Packet>();
            //UserData.RegisterType<InventoryRemoveX32Packet>();
            //UserData.RegisterType<InventoryRemoveX64Packet>();
            //UserData.RegisterType<InventorySetBeginPacket>();
            //UserData.RegisterType<InventorySetEndPacket>();
            //UserData.RegisterType<LinkedItemListX01Packet>();
            //UserData.RegisterType<LinkedItemListX08Packet>();
            //UserData.RegisterType<LinkedItemListX16Packet>();
            //UserData.RegisterType<LinkedItemListX32Packet>();
            //UserData.RegisterType<LinkedItemListX64Packet>();
            //UserData.RegisterType<EndEventPacket>();
            //UserData.RegisterType<KickEventPacket>();
            //UserData.RegisterType<RunEventFunctionPacket>();
            //UserData.RegisterType<ContentMembersX08Packet>();
            //UserData.RegisterType<ContentMembersX16Packet>();
            //UserData.RegisterType<ContentMembersX32Packet>();
            //UserData.RegisterType<ContentMembersX64Packet>();
            //UserData.RegisterType<GroupHeaderPacket>();
            //UserData.RegisterType<GroupMembersBeginPacket>();
            //UserData.RegisterType<GroupMembersEndPacket>();
            //UserData.RegisterType<GroupMembersX08Packet>();
            //UserData.RegisterType<GroupMembersX16Packet>();
            //UserData.RegisterType<GroupMembersX32Packet>();
            //UserData.RegisterType<GroupMembersX64Packet>();
            //UserData.RegisterType<DeleteGroupPacket>();
            //UserData.RegisterType<SynchGroupWorkValuesPacket>();
            //UserData.RegisterType<_0x2Packet>();
            //UserData.RegisterType<AchievementEarnedPacket>();
            //UserData.RegisterType<GenericDataPacket>();
            //UserData.RegisterType<SendAchievementRatePacket>();
            //UserData.RegisterType<SetAchievementPointsPacket>();
            //UserData.RegisterType<SetChocoboNamePacket>();
            //UserData.RegisterType<SetCompletedAchievementsPacket>();
            //UserData.RegisterType<SetCurrentJobPacket>();
            //UserData.RegisterType<SetCurrentMountChocoboPacket>();
            //UserData.RegisterType<SetCurrentMountGoobbuePacket>();
            //UserData.RegisterType<SetCutsceneBookPacket>();
            //UserData.RegisterType<SetHasChocoboPacket>();
            //UserData.RegisterType<SetHasGoobbuePacket>();
            //UserData.RegisterType<SetLatestAchievementsPacket>();
            //UserData.RegisterType<SetPlayerDreamPacket>();
            //UserData.RegisterType<SetPlayerItemStoragePacket>();
            //UserData.RegisterType<SetPlayerTitlePacket>();
            //UserData.RegisterType<SetSpecialEventWorkPacket>();
            //UserData.RegisterType<CurrentRecruitmentDetailsPacket>();
            //UserData.RegisterType<EndRecruitmentPacket>();
            //UserData.RegisterType<RecruiterStatePacket>();
            //UserData.RegisterType<ItemSearchClosePacket>();
            //UserData.RegisterType<ItemSearchResultsBeginPacket>();
            //UserData.RegisterType<ItemSearchResultsBodyPacket>();
            //UserData.RegisterType<ItemSearchResultsEndPacket>();
            //UserData.RegisterType<PlayerSearchCommentResultPacket>();
            //UserData.RegisterType<PlayerSearchInfoResultPacket>();
            //UserData.RegisterType<RetainerResultBodyPacket>();
            //UserData.RegisterType<RetainerResultEndPacket>();
            //UserData.RegisterType<RetainerResultUpdatePacket>();
            //UserData.RegisterType<RetainerSearchHistoryPacket>();
            //UserData.RegisterType<BlacklistAddedPacket>();
            //UserData.RegisterType<BlacklistRemovedPacket>();
            //UserData.RegisterType<FriendlistAddedPacket>();
            //UserData.RegisterType<FriendlistRemovedPacket>();
            //UserData.RegisterType<FriendStatusPacket>();
            //UserData.RegisterType<SendBlacklistPacket>();
            //UserData.RegisterType<SendFriendlistPacket>();
            //UserData.RegisterType<ErrorPacket>();
            //UserData.RegisterType<LinkshellResultPacket>();
            //UserData.RegisterType<PartySyncPacket>();
            //UserData.RegisterType<SessionBeginPacket>();
            //UserData.RegisterType<SessionEndPacket>();
            //UserData.RegisterType<SessionBeginConfirmPacket>();
            //UserData.RegisterType<SessionEndConfirmPacket>();
            //UserData.RegisterType<WorldRequestZoneChangePacket>();
            //UserData.RegisterType<CreateLinkshellPacket>();
            //UserData.RegisterType<DeleteLinkshellPacket>();
            //UserData.RegisterType<GroupInviteResultPacket>();
            //UserData.RegisterType<LinkshellChangePacket>();
            //UserData.RegisterType<LinkshellInviteCancelPacket>();
            //UserData.RegisterType<LinkshellLeavePacket>();
            //UserData.RegisterType<LinkshellRankChangePacket>();
            //UserData.RegisterType<ModifyLinkshellPacket>();
            //UserData.RegisterType<PartyInvitePacket>();
            //UserData.RegisterType<PartyLeavePacket>();
            //UserData.RegisterType<PartyModifyPacket>();
            //UserData.RegisterType<ActorPropertyPacketUtil>();
            //UserData.RegisterType<LockTargetPacket>();
        }

        public static LuaEngine GetInstance()
        {
            if (mThisEngine == null)
                mThisEngine = new LuaEngine();

            return mThisEngine;
        }

        public void AddWaitCoroutine(Coroutine coroutine, float seconds)
        {
            ulong time = Utils.MilisUnixTimeStampUTC() + (ulong)(seconds * 1000);
            mSleepingOnTime.Add(coroutine, time);
        }

        public void AddWaitSignalCoroutine(Coroutine coroutine, string signal)
        {
            if (!mSleepingOnSignal.ContainsKey(signal))
                mSleepingOnSignal.Add(signal, new List<Coroutine>());
            mSleepingOnSignal[signal].Add(coroutine);
        }

        public void AddWaitEventCoroutine(Player player, Coroutine coroutine)
        {
            if (!mSleepingOnPlayerEvent.ContainsKey(player.Id))
                mSleepingOnPlayerEvent.Add(player.Id, coroutine);
        }

        public void PulseSleepingOnTime(object state)
        {
            ulong currentTime = Utils.MilisUnixTimeStampUTC();
            List<Coroutine> mToAwake = new List<Coroutine>();

            foreach (KeyValuePair<Coroutine, ulong> entry in mSleepingOnTime)
            {
                if (entry.Value <= currentTime)
                    mToAwake.Add(entry.Key);
            }

            foreach (Coroutine key in mToAwake)
            {
                mSleepingOnTime.Remove(key);
                DynValue value = key.Resume();
                ResolveResume(null, key, value);
            }
        }

        public void OnSignal(string signal, params object[] args)
        {
            List<Coroutine> mToAwake = new List<Coroutine>();

            if (mSleepingOnSignal.ContainsKey(signal))
            {
                mToAwake.AddRange(mSleepingOnSignal[signal]);
                mSleepingOnSignal.Remove(signal);
            }

            foreach (Coroutine key in mToAwake)
            {
                DynValue value = key.Resume(args);
                ResolveResume(null, key, value);
            }
        }

        public void OnEventUpdate(Player player, List<LuaParam> args)
        {
            if (mSleepingOnPlayerEvent.ContainsKey(player.Id))
            {
                try
                {
                    Coroutine coroutine = mSleepingOnPlayerEvent[player.Id];
                    mSleepingOnPlayerEvent.Remove(player.Id);
                    DynValue value = coroutine.Resume(LuaUtils.CreateLuaParamObjectList(args));
                    ResolveResume(player, coroutine, value);
                }
                catch (ScriptRuntimeException e)
                {
                    LuaEngine.SendError(player, String.Format("OnEventUpdated: {0}", e.DecoratedMessage));
                    player.EndEvent();
                }
            }
            else
                player.EndEvent();
        }

        /// <summary> 
        /// // todo: this is dumb, should probably make a function for each action with different default return values
        /// or just make generic function and pass default value as first arg after functionName
        /// </summary>
        public static void CallLuaBattleFunction(Character actor, string functionName, params object[] args)
        {
            // todo: should use "scripts/zones/ZONE_NAME/battlenpcs/NAME.lua" instead of scripts/unique
            string path = "";

            // todo: should we call this for players too?
            if (actor is Player)
            {
                // todo: check this is correct
                path = FILEPATH_PLAYER;
            }
            else if (actor is Npc)
            {
                // todo: this is probably unnecessary as im not sure there were pets for players
                if (!(actor.aiContainer.GetController<PetController>()?.GetPetMaster() is Player))
                    path = String.Format($"{ConfigConstants.OPTIONS_SCRIPTPATH}/unique/{0}/{1}/{2}.lua", actor.CurrentArea.ZoneName, actor is BattleNpc ? "Monster" : "PopulaceStandard", ((Npc)actor).GetUniqueId());
            }
            // dont wanna throw an error if file doesnt exist
            if (File.Exists(path))
            {
                var script = LoadGlobals();
                try
                {
                    script.DoFile(path);
                }
                catch (Exception e)
                {
                    Program.Log.Error($"LuaEngine.CallLuaBattleFunction [{functionName}] {e.Message}");
                }
                DynValue res = new DynValue();

                if (!script.Globals.Get(functionName).IsNil())
                {
                    res = script.Call(script.Globals.Get(functionName), args);
                }
            }
        }

        public static int CallLuaStatusEffectFunction(Character actor, StatusEffect effect, string functionName, params object[] args)
        {
            // todo: this is stupid, load the actual effect name from db table
            string path = $"{ConfigConstants.OPTIONS_SCRIPTPATH}/effects/{effect.GetName()}.lua";

            if (File.Exists(path))
            {
                var script = LoadGlobals();

                try
                {
                    script.DoFile(path);
                }
                catch (Exception e)
                {
                    Program.Log.Error($"LuaEngine.CallLuaStatusEffectFunction [{functionName}] {e.Message}");
                }
                DynValue res = new DynValue();

                if (!script.Globals.Get(functionName).IsNil())
                {
                    res = script.Call(script.Globals.Get(functionName), args);
                    if (res != null)
                        return (int)res.Number;
                }
            }
            else
            {
                Program.Log.Error($"LuaEngine.CallLuaStatusEffectFunction [{effect.GetName()}] Unable to find script {path}");
            }
            return -1;
        }

        public static int CallLuaBattleCommandFunction(Character actor, BattleCommand command, string folder, string functionName, params object[] args)
        {
            string path = $"{ConfigConstants.OPTIONS_SCRIPTPATH}/commands/{folder}/{command.name}.lua";

            if (File.Exists(path))
            {
                var script = LoadGlobals();

                try
                {
                    script.DoFile(path);
                }
                catch (Exception e)
                {
                    Program.Log.Error($"LuaEngine.CallLuaBattleCommandFunction [{functionName}] {e.Message}");
                }
                DynValue res = new DynValue();
                
                if (!script.Globals.Get(functionName).IsNil())
                {
                    res = script.Call(script.Globals.Get(functionName), args);
                    if (res != null)
                        return (int)res.Number;
                }
            }
            else
            {
                path = $"{ConfigConstants.OPTIONS_SCRIPTPATH}/commands/{folder}/default.lua";
                //Program.Log.Error($"LuaEngine.CallLuaBattleCommandFunction [{command.name}] Unable to find script {path}");
                var script = LoadGlobals();

                try
                {
                    script.DoFile(path);
                }
                catch (Exception e)
                {
                    Program.Log.Error($"LuaEngine.CallLuaBattleCommandFunction [{functionName}] {e.Message}");
                }
                DynValue res = new DynValue();
               // DynValue r = script.Globals.Get(functionName);

                if (!script.Globals.Get(functionName).IsNil())
                {
                    res = script.Call(script.Globals.Get(functionName), args);
                    if (res != null)
                        return (int)res.Number;
                }
            }
            return -1;
        }


        public static void LoadBattleCommandScript(BattleCommand command, string folder)
        {
            string path = $"{ConfigConstants.OPTIONS_SCRIPTPATH}/commands/{folder}/{command.name}.lua";

            if (File.Exists(path))
            {
                var script = LoadGlobals();

                try
                {
                    script.DoFile(path);
                }
                catch (Exception e)
                {
                    Program.Log.Error($"LuaEngine.CallLuaBattleCommandFunction {e.Message}");
                }
                command.script = script;
            }
            else
            {
                path = $"{ConfigConstants.OPTIONS_SCRIPTPATH}/commands/{folder}/default.lua";
                //Program.Log.Error($"LuaEngine.CallLuaBattleCommandFunction [{command.name}] Unable to find script {path}");
                var script = LoadGlobals();

                try
                {
                    script.DoFile(path);
                }
                catch (Exception e)
                {
                    Program.Log.Error($"LuaEngine.CallLuaBattleCommandFunction {e.Message}");
                }

                command.script = script;
            }
        }

        public static void LoadStatusEffectScript(StatusEffect effect)
        {
            string path = $"{ConfigConstants.OPTIONS_SCRIPTPATH}/effects/{effect.GetName()}.lua";

            if (File.Exists(path))
            {
                var script = LoadGlobals();

                try
                {
                    script.DoFile(path);
                }
                catch (Exception e)
                {
                    Program.Log.Error($"LuaEngine.CallLuaBattleCommandFunction {e.Message}");
                }
                effect.script = script;
            }
            else
            {
                path = $"{ConfigConstants.OPTIONS_SCRIPTPATH}/effects/default.lua";
                //Program.Log.Error($"LuaEngine.CallLuaBattleCommandFunction [{command.name}] Unable to find script {path}");
                var script = LoadGlobals();

                try
                {
                    script.DoFile(path);
                }
                catch (Exception e)
                {
                    Program.Log.Error($"LuaEngine.CallLuaBattleCommandFunction {e.Message}");
                }

                effect.script = script;
            }
        }


        public static string GetScriptPath(Actor target)
        {
            string root = ConfigConstants.OPTIONS_SCRIPTPATH;
            if (target is Player)
            {
                return root + FILEPATH_PLAYER;
            }
            else if (target is Npc)
            {
                return null;
            }
            else if (target is Command)
            {                
                return root + String.Format(FILEPATH_COMMANDS, target.GetName());
            }
            else if (target is Director)
            {
                return root + String.Format(FILEPATH_DIRECTORS, ((Director)target).GetScriptPath());
            }
            else if (target is PrivateAreaContent)
            {
                return root + String.Format(FILEPATH_CONTENT, ((PrivateAreaContent)target).GetPrivateAreaName());
            }
            else if (target is Area)
            {
                return root + String.Format(FILEPATH_ZONE, ((Area)target).ZoneName);
            }
            else if (target is Quest)
            {
                string initial = ((Quest)target).Name.Substring(0, 3);
                string questName = ((Quest)target).Name;
                return root + String.Format(FILEPATH_QUEST, initial, questName);
            }
            else
                return "";
        }

        private List<LuaParam> CallLuaFunctionNpcForReturn(Player player, Npc target, string funcName, bool optional, params object[] args)
        {
            object[] args2 = new object[args.Length + (player == null ? 1 : 2)];
            Array.Copy(args, 0, args2, (player == null ? 1 : 2), args.Length);
            if (player != null)
            {
                args2[0] = player;
                args2[1] = target;
            }
            else
                args2[0] = target;

            LuaScript parent = null, child = null;
            string errorMsg = "";

            if (File.Exists($"{ConfigConstants.OPTIONS_SCRIPTPATH}/base/" + target.classPath + ".lua"))
                parent = LuaEngine.LoadScript($"{ConfigConstants.OPTIONS_SCRIPTPATH}/base/" + target.classPath + ".lua", ref errorMsg);

            if (!errorMsg.Equals(""))
                SendError(player, errorMsg);

            Area area = target.CurrentArea;
            if (area is PrivateArea)
            {
                string path = $"{ConfigConstants.OPTIONS_SCRIPTPATH}/unique/{area.ZoneName}/privatearea/{((PrivateArea)area).GetPrivateAreaName()}_{((PrivateArea)area).GetPrivateAreaType()}/{target.className}/{target.GetUniqueId()}.lua";
                if (File.Exists(path))
                    child = LuaEngine.LoadScript(path, ref errorMsg);
            }
            else
            {
                string path = $"{ConfigConstants.OPTIONS_SCRIPTPATH}/unique/{area.ZoneName}/{target.className}/{target.GetUniqueId()}.lua";
                if (File.Exists(path))
                    child = LuaEngine.LoadScript(path, ref errorMsg);
            }

            if (parent == null && child == null)
            {
                LuaEngine.SendError(player, $"ERROR: Could not find script for actor {target.GetName()}.");
            }

            //Run Script
            DynValue result;

            if (child != null && child.Globals[funcName] != null)
                result = child.Call(child.Globals[funcName], args2);
            else if (parent != null && parent.Globals[funcName] != null)
                result = parent.Call(parent.Globals[funcName], args2);
            else
                return null;

            List<LuaParam> lparams = LuaUtils.CreateLuaParamList(result);
            return lparams;
        }

        private void CallLuaFunctionNpc(Player player, Npc target, string funcName, bool optional, params object[] args)
        {
            object[] args2 = new object[args.Length + (player == null ? 1 : 2)];
            Array.Copy(args, 0, args2, (player == null ? 1 : 2), args.Length);
            if (player != null)
            {
                args2[0] = player;
                args2[1] = target;
            }
            else
                args2[0] = target;

            LuaScript parent = null, child = null;
            string errorMsg = "";

            if (File.Exists($"{ConfigConstants.OPTIONS_SCRIPTPATH}/base/" + target.classPath + ".lua"))
                parent = LuaEngine.LoadScript($"{ConfigConstants.OPTIONS_SCRIPTPATH}/base/" + target.classPath + ".lua", ref errorMsg);

            Area area = target.CurrentArea;
            if (area is PrivateArea)
            {
                if (File.Exists(String.Format($"{ConfigConstants.OPTIONS_SCRIPTPATH}/unique/{0}/privatearea/{1}_{2}/{3}/{4}.lua", area.ZoneName, ((PrivateArea)area).GetPrivateAreaName(), ((PrivateArea)area).GetPrivateAreaType(), target.className, target.GetUniqueId())))
                    child = LuaEngine.LoadScript(String.Format($"{ConfigConstants.OPTIONS_SCRIPTPATH}/unique/{0}/privatearea/{1}_{2}/{3}/{4}.lua", area.ZoneName, ((PrivateArea)area).GetPrivateAreaName(), ((PrivateArea)area).GetPrivateAreaType(), target.className, target.GetUniqueId()), ref errorMsg);
            }
            else
            {
                if (File.Exists(String.Format($"{ConfigConstants.OPTIONS_SCRIPTPATH}/unique/{0}/{1}/{2}.lua", area.ZoneName, target.className, target.GetUniqueId())))
                    child = LuaEngine.LoadScript(String.Format($"{ConfigConstants.OPTIONS_SCRIPTPATH}/unique/{0}/{1}/{2}.lua", area.ZoneName, target.className, target.GetUniqueId()), ref errorMsg);
            }

            if (parent == null && child == null)
            {
                LuaEngine.SendError(player, String.Format("Could not find script for actor {0}.", target.GetName()));
                return;
            }

            //Run Script
            Coroutine coroutine = null;

            if (child != null && !child.Globals.Get(funcName).IsNil())
                coroutine = child.CreateCoroutine(child.Globals[funcName]).Coroutine;
            else if (parent != null && parent.Globals.Get(funcName) != null && !parent.Globals.Get(funcName).IsNil())
                coroutine = parent.CreateCoroutine(parent.Globals[funcName]).Coroutine;

            if (coroutine != null)
            {
                try
                {
                    DynValue value = coroutine.Resume(args2);
                    ResolveResume(player, coroutine, value);
                }
                catch (ScriptRuntimeException e)
                {
                    SendError(player, e.DecoratedMessage);
                }
            }
            if (!errorMsg.Equals(""))
                SendError(player, errorMsg);
        }

        public List<LuaParam> CallLuaFunctionForReturn(Player player, Actor target, string funcName, bool optional, params object[] args)
        {
            //Need a seperate case for NPCs cause that child/parent thing.
            if (target is Npc)
                return CallLuaFunctionNpcForReturn(player, (Npc)target, funcName, optional, args);

            object[] args2 = new object[args.Length + (player == null ? 1 : 2)];
            Array.Copy(args, 0, args2, (player == null ? 1 : 2), args.Length);
            if (player != null)
            {
                args2[0] = player;
                args2[1] = target;
            }
            else
                args2[0] = target;

            string errorMsg = "";

            string luaPath = GetScriptPath(target);
            LuaScript script = LoadScript(luaPath, ref errorMsg);
            if (script != null)
            {
                if (!script.Globals.Get(funcName).IsNil())
                {
                    //Run Script
                    DynValue result = script.Call(script.Globals[funcName], args2);
                    List<LuaParam> lparams = LuaUtils.CreateLuaParamList(result);
                    return lparams;
                }
                else
                {
                    if (!optional)
                        SendError(player, String.Format("Could not find function '{0}' for actor {1}.", funcName, target.GetName()));
                }
            }
            else
            {
                if (!optional)
                    SendError(player, String.Format("Could not find script for actor {0}.", target.GetName()));
            }
            if (!errorMsg.Equals(""))
                SendError(player, errorMsg);
            return null;
        }

        public List<LuaParam> CallLuaFunctionForReturn(string path, string funcName, bool optional, params object[] args)
        {
            string luaPath = path;
            string errorMsg = "";
            LuaScript script = LoadScript(luaPath, ref errorMsg);
            if (script != null)
            {
                if (!script.Globals.Get(funcName).IsNil())
                {
                    //Run Script
                    DynValue result = script.Call(script.Globals[funcName], args);
                    List<LuaParam> lparams = LuaUtils.CreateLuaParamList(result);
                    return lparams;
                }
            }           
            return null;
        }

        public void CallLuaFunction(Player player, Actor target, string funcName, bool optional, params object[] args)
        {
            //Need a seperate case for NPCs cause that child/parent thing.
            if (target is Npc)
            {
                CallLuaFunctionNpc(player, (Npc)target, funcName, optional, args);
                return;
            }

            object[] args2 = new object[args.Length + 2];
            Array.Copy(args, 0, args2, 2, args.Length);
            args2[0] = player;
            args2[1] = target;

            string errorMsg = "";
            string luaPath = GetScriptPath(target);
            LuaScript script = LoadScript(luaPath, ref errorMsg);
            if (script != null)
            {
                if (!script.Globals.Get(funcName).IsNil())
                {
                    try
                    {
                        Coroutine coroutine = script.CreateCoroutine(script.Globals[funcName]).Coroutine;
                        DynValue value = coroutine.Resume(args2);
                        ResolveResume(player, coroutine, value);
                    }
                    catch(Exception e)
                    {
                        player.SendMessage(0x20, "", e.Message);
                        player.EndEvent();

                    }
                }
                else
                {
                    if (!optional)
                        SendError(player, String.Format("Could not find function '{0}' for actor {1}.", funcName, target.GetName()));
                }
            }
            else
            {
                if (!(target is Area) && !optional)
                    SendError(player, String.Format("Could not find script for actor {0}.", target.GetName()));
            }
            if (!errorMsg.Equals(""))
                SendError(player, errorMsg);
        }

        public void EventStarted(Player player, Actor target, EventStartPacket eventStart)
        {
            if (eventStart.luaParams == null)
                return;

            List<LuaParam> lparams = new List<LuaParam>();
            lparams.AddRange(eventStart.luaParams);
            lparams.Insert(0, new LuaParam(0, eventStart.eventType));
            lparams.Insert(1, new LuaParam(2, eventStart.eventName));
            if (mSleepingOnPlayerEvent.ContainsKey(player.Id))
            {
                Coroutine coroutine = mSleepingOnPlayerEvent[player.Id];
                mSleepingOnPlayerEvent.Remove(player.Id);

                try
                {
                    DynValue value = coroutine.Resume();
                    ResolveResume(null, coroutine, value);
                }
                catch (ScriptRuntimeException e)
                {
                    LuaEngine.SendError(player, String.Format("OnEventStarted: {0}", e.DecoratedMessage));
                    player.EndEvent();
                }
            }
            else
            {
                if (target is Director)
                    ((Director)target).OnEventStart(player, LuaUtils.CreateLuaParamObjectList(lparams));
                else
                    CallLuaFunction(player, target, "onEventStarted", false, LuaUtils.CreateLuaParamObjectList(lparams));
            }
        }

        public DynValue ResolveResume(Player player, Coroutine coroutine, DynValue value)
        {
            if (value == null || value.IsVoid())
                return value;

            if (player != null && value.String != null && value.String.Equals("_WAIT_EVENT"))
            {
                GetInstance().AddWaitEventCoroutine(player, coroutine);
            }
            else if (value.Tuple != null && value.Tuple.Length >= 1 && value.Tuple[0].String != null)
            {
                switch (value.Tuple[0].String)
                {
                    case "_WAIT_TIME":
                        GetInstance().AddWaitCoroutine(coroutine, (float)value.Tuple[1].Number);
                        break;
                    case "_WAIT_SIGNAL":
                        GetInstance().AddWaitSignalCoroutine(coroutine, (string)value.Tuple[1].String);
                        break;
                    case "_WAIT_EVENT":
                        GetInstance().AddWaitEventCoroutine((Player)value.Tuple[1].UserData.Object, coroutine);
                        break;
                    default:
                        return value;
                }
            }

            return value;
        }

        #region RunGMCommand
        public static void RunGMCommand(Player player, String cmd, string[] param, bool help = false)
        {
            bool playerNull = player == null;

            if (playerNull)
            {
                if (param.Length >= 2 && param[1].Contains("\""))
                    player = Server.GetWorldManager().GetPCInWorld(param[1]);
                else if (param.Length > 2)
                    player = Server.GetWorldManager().GetPCInWorld(param[1] + param[2]);
            }

            if (playerNull && param.Length >= 3)
                player = Server.GetWorldManager().GetPCInWorld(param[1] + " " + param[2]);

            // load from scripts/commands/gm/ directory
            var path = $"{ConfigConstants.OPTIONS_SCRIPTPATH}/commands/gm/{cmd.ToLower()}.lua";

            // check if the file exists
            if (File.Exists(path))
            {
                // load global functions
                LuaScript script = LoadGlobals();

                // see if this script has any syntax errors
                try
                {
                    script.DoFile(path);
                }
                catch (Exception e)
                {
                    Program.Log.Error("LuaEngine.RunGMCommand: {0}.", e.Message);
                    return;
                }

                // can we run this script
                if (!script.Globals.Get("onTrigger").IsNil())
                {
                    // can i run this command
                    var permissions = 0;

                    // parameter types (string, integer, double, float)
                    var parameters = "";
                    var description = "!" + cmd + ": ";

                    // get the properties table
                    var res = script.Globals.Get("properties");

                    // make sure properties table exists
                    if (!res.IsNil())
                    {
                        try
                        {
                            // returns table if one is found
                            var table = res.Table;

                            // find each key/value pair
                            foreach (var pair in table.Pairs)
                            {
                                if (pair.Key.String == "permissions")
                                {
                                    permissions = (int)pair.Value.Number;
                                }
                                else if (pair.Key.String == "parameters")
                                {
                                    parameters = pair.Value.String;
                                }
                                else if (pair.Key.String == "description")
                                {
                                    description = pair.Value.String;
                                }
                            }
                        }
                        catch (Exception e) { LuaScript.Log.Error("LuaEngine.RunGMCommand: " + e.Message); return; }
                    }

                    // if this isnt a console command, make sure player exists
                    if (player != null)
                    {
                        if (permissions > 0 && !player.isGM)
                        {
                            Program.Log.Info("LuaEngine.RunGMCommand: {0}'s GM level is too low to use command {1}.", player.Name, cmd);
                            return;
                        }
                        // i hate to do this, but cant think of a better way to keep !help
                        else if (help)
                        {
                            player.SendMessage(SendMessagePacket.MESSAGE_TYPE_SYSTEM_ERROR, String.Format("[Commands] [{0}]", cmd), description);
                            return;
                        }
                    }
                    else if (help)
                    {
                        LuaScript.Log.Info("[Commands] [{0}]: {1}", cmd, description);
                        return;
                    }

                    // we'll push our lua params here
                    List<object> LuaParam = new List<object>();

                    var i = playerNull ? 2 : 0;
                    for (; i < parameters.Length; ++i)
                    {
                        try
                        {
                            // convert chat parameters to command parameters
                            switch (parameters[i])
                            {
                                case 'i':
                                    LuaParam.Add(Convert.ChangeType(param[i + 1], typeof(int)));
                                    continue;
                                case 'd':
                                    LuaParam.Add(Convert.ChangeType(param[i + 1], typeof(double)));
                                    continue;
                                case 'f':
                                    LuaParam.Add(Convert.ChangeType(param[i + 1], typeof(float)));
                                    continue;
                                case 's':
                                    LuaParam.Add(param[i + 1]);
                                    continue;
                                default:
                                    LuaScript.Log.Info("LuaEngine.RunGMCommand: {0} unknown parameter {1}.", path, parameters[i]);
                                    LuaParam.Add(param[i + 1]);
                                    continue;
                            }
                        }
                        catch (Exception e)
                        {
                            if (e is IndexOutOfRangeException) break;
                            LuaParam.Add(param[i + 1]);
                        }
                    }

                    // the script can double check the player exists, we'll push them anyways
                    LuaParam.Insert(0, player);
                    // push the arg count too
                    LuaParam.Insert(1, i - (playerNull ? 2 : 0));

                    // run the script                    
                    //script.Call(script.Globals["onTrigger"], LuaParam.ToArray());

                    // gm commands dont need to be coroutines?
                    try
                    {
                        Coroutine coroutine = script.CreateCoroutine(script.Globals["onTrigger"]).Coroutine;
                        DynValue value = coroutine.Resume(LuaParam.ToArray());
                        GetInstance().ResolveResume(player, coroutine, value);
                    }
                    catch (Exception e)
                    {
                        Program.Log.Error("LuaEngine.RunGMCommand: {0} - {1}", path, e.Message);
                    }
                    return;
                }
            }
            LuaScript.Log.Error("LuaEngine.RunGMCommand: Unable to find script {0}", path);
            return;
        }
        #endregion
        
        public static LuaScript LoadScript(string path, ref string errorMsg)
        {
            if (!File.Exists(path))
                return null;

            LuaScript script = LoadGlobals();

            try
            {
                script.DoFile(path);
            }
            catch (SyntaxErrorException e)
            {
                Program.Log.Error("{0}.", e.DecoratedMessage);
                errorMsg = e.DecoratedMessage;
                return null;
            }
            return script;
        }

        public static LuaScript LoadGlobals(LuaScript script = null)
        {
            script = script ?? new LuaScript();

            // register and load all global functions here
            ((FileSystemScriptLoader)script.Options.ScriptLoader).ModulePaths = FileSystemScriptLoader.UnpackStringPaths($"{ConfigConstants.OPTIONS_SCRIPTPATH}/?;{ConfigConstants.OPTIONS_SCRIPTPATH}/?.lua");
            script.Globals["GetWorldManager"] = (Func<WorldManager>)Server.GetWorldManager;
            script.Globals["GetStaticActor"] = (Func<string, Actor>)Server.GetStaticActors;
            script.Globals["GetStaticActorById"] = (Func<uint, Actor>)Server.GetStaticActors;
            script.Globals["GetWorldMaster"] = (Func<Actor>)Server.GetWorldManager().GetActor;
            script.Globals["GetItemGamedata"] = (Func<uint, ItemData>)Server.GetItemGamedata;
            script.Globals["GetGuildleveGamedata"] = (Func<uint, GuildleveData>)Server.GetGuildleveGamedata;
            //script.Globals["GetRecipeResolver"] = (Func<RecipeResolver>)Server.ResolveRecipe;
            script.Globals["GetLuaInstance"] = (Func<LuaEngine>)LuaEngine.GetInstance;

            foreach (Modifier mod in Enum.GetValues(typeof(Modifier)))
            {
                script.Globals[mod.ToString()] = mod;
            }

            foreach (MobModifier mobMod in Enum.GetValues(typeof(MobModifier)))
            {
                script.Globals[mobMod.ToString()] = mobMod;
            }

            script.Options.DebugPrint = s => { Program.Log.Debug(s); };

            return script;
        }

        public static void SendError(Player player, string message)
        {
            message = "[LuaError] " + message;
            if (player == null)
                return;
            List<SubPacket> SendError = new List<SubPacket>();
            player.SendMessage(SendMessagePacket.MESSAGE_TYPE_SYSTEM_ERROR, "", message);
            player.QueuePacket(EndEventPacket.BuildPacket(player.Id, player.currentEventOwner, player.currentEventName, 0));
        }

    }
}
