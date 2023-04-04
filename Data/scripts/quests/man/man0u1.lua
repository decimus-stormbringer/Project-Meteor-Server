require ("global")
require ("quest")

--[[

Quest Script

Name:   Court in the Sands 
Code:   Man0u1
Id:     110010
Prereq: Flowers for All (Man0u0 - 110009)
Notes:


Vid refs - 
https://www.youtube.com/watch?v=WNRLrwZ3BJY&t=284s
https://www.youtube.com/watch?v=eZgcq-FMpfw&t=504s

Coliseum fight - https://www.youtube.com/watch?v=Jcv9I2Bk46w

A LOT - https://www.youtube.com/watch?v=gySHO1Be9OM

Slerp Lederp's refs:

WotgAshiee's playthrough:
https://www.youtube.com/watch?v=sXI6FpJKOm4&list=PLB94C3DE039B18BE3&index=4
https://ffxiv.gamerescape.com/wiki/Loremonger:Court_in_the_Sands

]]


--[[ 

Phase:
        
45  (Miner's Guild)
        Linette   processEvent050 (initial CS)
        Change phase to 50 after interaction
        
50  (Miner's Guild Instance #1)
        Name                    DisplayName             ActorClass                          Event
        Linette                 1100016                 1000861                             processEvent050_2
        Corguevais              1200025                 1000043/1001054                     processEvent050_11
        Nittma Guttma           1400127                 1001286                             processEvent050_10
        Nortmoen                1600127                 1600042
        F'lhaminn               1900054                 1000038/1000842/1001514/2290008     processEvent051_1
        Tyago Moui              1900130                 1001203                             processEvent050_12
        Shilgen                 2200216                 1000637
        Muscular Miner          4000202                 1000690/1700013                     processEvent050_7
        Close-fisted Woman      4000366                 1000981                             processEvent050_8
        Astonished Adventurer   4000377                 1000895                             processEvent050_9
        Manic Miner             4000444                 1001283                             processEvent050_13
        Maddened Miner          4000445                 1001284                             processEvent050_14
        Maudlin Miner           4000446                 1001287                             processEvent050_3
        Mocking Miner           4000447                 1001288                             processEvent050_4
        Monitoring Miner        4000448                 1001289                             processEvent050_5
        Displeased Dancer       4000449                 1001290                             processEvent050_6
        
        Emotes 103, 108, 121, 125, 140, 135  in that order @ F'lhaminn, then change phase to 51
51
        Emotes 108 @ Maddened Miner
        Emotes 135, 103, 121 @ Manic Miner   
        Check both for clear state after each interaction and change phase to 55
        
55  (Miner's Guild Instance #2)

--]]

--[[

Needs Implementing:

SEQ_000  PrivateArea 4, Quicksand needs doors shut.
SEQ_005  Aetheryte Widget "You've arrived at Camp Black Brush."
SEQ_005  Aetheryte gives player first Guildleve: Moles for the Mauling.
SEQ_015, Coliseum Fight
SEQ_065, Flhammin Escort Mission
SEQ_070  Blockers for PrivateArea 4, where player leaves radius teleports player back to privatezone.

processEvent1000_1 - Ococo? Cutting Ococo from script labels him as ENPC with no DFTTalk or Quest Set.
processEvent1000_3 - NPC: "Have you come to see F'lhaminn? I hate to be the bearer of bad news, but she rarely sings anymore."
processEvent1000_5 - Worldmaster: "Enter this instance?" Used for Coliseum?
processEventTu_001 - Linkshell tutorial, possibly cut or added in later patches?

--]]

-- Sequence Numbers
SEQ_000 = 0; -- Ul'dah Adventurer's Guild
SEQ_005 = 5; -- Run to Camp Black Brush & Attune
SEQ_010 = 10; -- Return to the Guild.
SEQ_012 = 12; -- Speak to Momodi
SEQ_015 = 15; -- Visiting guilds (GSM, GLD)
SEQ_045 = 45; -- Visit Amajina & Sons (Miners Guild)
SEQ_050 = 50; -- Emotes from Flhaminn
SEQ_057 = 57; -- Put an end to enraged Miners with Emotes
SEQ_058 = 58; -- Calm Thaumaturge down. Accused of stealing. Talk to Flhammin again.
SEQ_060 = 60; -- Head to the Gates of Nald
SEQ_065 = 65; -- Protect Flhaminn from beastmen\Escort Mission
SEQ_070 = 70; -- Arrived at Black Brush with Flhaminn and find out the camp was under attack.
SEQ_075 = 75; -- Thancred arrives at Black Brush, Ascillia is entrusted to him.
SEQ_080 = 80; -- Return to Miners Guild with Flhaminn after task is complete.
SEQ_085 = 85; -- Contact Momodi via Linkpearl.
SEQ_090 = 90; -- Talk to Nogeloix in the Alchemist Guild.
SEQ_095 = 95; -- Pass through doors in Alchemist Guild.
SEQ_100 = 100; -- Make rounds to the sickrooms.
SEQ_105 = 105; -- Contact Momodi via Linkpearl
SEQ_110 = 110; -- Meet Momodi back at the Quicksand.

--SEQ_000
MOMODI                      = 1000841;
UNDAUNTED_ADVENTURER		= 1000936;
GREEDY_MERCHANT				= 1000937;
LIONHEARTED_ADVENTURER		= 1000938;
SPRY_SALESMAN				= 1000939;
UPBEAT_ADVENTURER			= 1000940;
SEEMINGLY_CALM_ADVENTURER   = 1000941;
THANCRED					= 1000948; -- 1000010
OTOPA_POTTOPA               = 1000864;
OVERCOMPETITIVE_ADVENTURER	= 1000807;
PRIVATEAREA_PAST_EXIT		= 1290002;

--SEQ_005
OCOCO						= 1000666;
-- ProcessEvent1000_1? Needs further investigation to confirm.

--SEQ_015
ELECOTTE					= 1000950;

--Gladiator's Guild
FRUHYBOLG					= 1000964;
ABYLGO_HAMYLGO				= 1000965;
QMHALAWI					= 1000969;
PAPAWA						= 1000962;
LULUTSU						= 1000863;
SWERDAHRM					= 1000967;
UNDEFEATED_GLADIATOR		= 1001020;
POORLY_OUTFITTED_GLADIATOR	= 1000995;
AGGRIEVED_GLADIATOR			= 1000997;
DISHEARTENED_GLADIATOR		= 1000999;
GLD_TRIG					= 1090283;
COL_TRIG					= 1090141;
GLD2_TRIG					= 1090077;

ESCORT_TRIG					= 1090004; --Placing this in Ul'dah rather than Thanalan fixes a bug SE never fixed.
SEQ70_TRIG					= 1090077; --Added temporarily to end "escort seq."
MIN_TRIGG					= 1090044;
ALCH_TRIGG					= 1090119;
SEQ100_TRIGG				= 1090121;
SEQ105_TRIGG				= 1090120;

--SEQ_045
LINETTE						= 1000861;

--SEQ_50/57 Private Area
FLHAMINN					= 1000038;
FLHAMINN_EMOTE			    = 1000842;
LINETTE						= 1000861;
SHILGEN						= 1000637;
NORTMOEN					= 1600042;
TYAGO_MOUI					= 1001203;
NITTMA_GUTTMA				= 1001286;
CORGUEVAIS					= 1001054;
ASTONISHED_ADVENTURER		= 1000895;
MONITORING_MINER			= 1001289;
MOCKING_MINER				= 1001288;
MUSCULAR_MINER				= 1000690;
MAUDLIN_MINER				= 1001287;
MADDENED_MINER				= 1001284;
MANIC_MINER					= 1001283;
DISPLEASED_DANCER			= 1001290;
CLOSE_FISTED_WOMAN			= 1000981;

--SEQ_070 Private Area
ASCILLIA					= 1000042;
REGARDING_ROEGADYN			= 1000811;
UNSAVORY_CUR				= 1000814;
UNTIDY_OUTLANDER			= 1000808;
HELPLESS_HYUR				= 1000817;
TROUBLED_TRADER				= 1000812;
FRIGHTENED_LALAFELL			= 1000810;
MALNOURISHED_MIDLANDER		= 1000809;
BRIGHT_EYED_BRINEMONGER		= 1000816;
MALODOROUS_MISTER			= 1000815;

--SEQ_090/Private Area
NOGELOIX 					= 1000597;
SLOW_WITTED_MINER			= 1000689;
QUALMISH_MINER				= 1000699;
WORRISOME_ASSISTANT			= 1001207;
WELLWASHED_LEECH			= 1001210;

-- Msg packs for the Npc LS
NPCLS_MSGS = {
	{320},
	{324, 325},
	{92, 93, 94, 95, 96, 97},
	{184, 185, 186},
	{306, 307, 308}
};

--Counters
CNTR_SEQ15_GSM		= 0;
CNTR_SEQ15_GLD		= 1;
CNTR_SEQ50_EMOTE	= 2; -- Also used for Manic and Maddened Miner.

-- Quest Markers
MRKR_MOMODI             	= 11001001; --SEQ 0
MRKR_BLACKBRUSH  			= 11001002; --SEQ 5
MRKR_SEQ10_MOMODI			= 11001003; --SEQ 10
MRKR_SEQ12_MOMODI			= 11001004;	--SEQ 12
MRKR_GOLDSMITH				= 11001005; --SEQ 15
MRKR_GLADIATOR				= 11001006; --SEQ 15
MRKR_GLADIATOR2				= 11001007; --SEQ 15
MRKR_GLADIATOR3				= 11001008; --SEQ 15
MRKR_LINETTE				= 11001009;	--SEQ 45
MRKR_FLHAMMIN				= 11001010; --SEQ 50
MRKR_MANIC_MINER			= 11001011; --SEQ 57
MRKR_MADDENED_MINER			= 11001012; --SEQ 57
MRKR_FLHAMMIN2				= 11001013; --SEQ 58
MRKR_NALD_GATE				= 11001014; --SEQ 60
MRKR_ASCILLIA				= 11001015; --SEQ 65
MRKR_ASCILLIA2				= 11001016; --SEQ 70
MRKR_MINERS					= 11001017; --SEQ 75
MRKR_NOGELOIX				= 11001018; --SEQ 90
MRKR_DOOR2					= 11001019; --SEQ 95
MRKR_DOOR3					= 11001020; --SEQ 100
MRKR_MOMODI_END				= 11001021; --SEQ 105, 110

-- Quest Items
ITEM_VELODYNA_COSMOS = 0; -- Seq_000 : 2nd journal arg.    >=5 doesn't have.
ITEM_COLISEUM_PASS   = 0; -- Seq_015 : 3rd journal arg.    >=5 doesn't have

-- Quest Flags
FLAG_SEQ000     = 0;
FLAG_MANIC		= 1;

function onStart(player, quest) 
    quest:StartSequence(SEQ_000);
    
    -- Immediately move to the Adventurer's Guild private area
	callClientFunction(player, "delegateEvent", player, quest, "processEventMomodiStart");
    GetWorldManager():DoZoneChange(player, 175, "PrivateAreaMasterPast", 4, 15, -75.242, 195.009, 74.572, -0.046);	
    player:SendGameMessage(quest, 329, 0x20);
	player:SendGameMessage(quest, 330, 0x20);
	player:endEvent();
end

function onFinish(player, quest)
end

function onStateChange(player, quest, sequence)
	local data = quest:GetData();

    if (sequence == SEQ_000) then
        quest:SetENpc(MOMODI, QFLAG_TALK);
        quest:SetENpc(OTOPA_POTTOPA);
		quest:SetENpc(UPBEAT_ADVENTURER);
		quest:SetENpc(UNDAUNTED_ADVENTURER);
		quest:SetENpc(SEEMINGLY_CALM_ADVENTURER);
		quest:SetENpc(LIONHEARTED_ADVENTURER);
		quest:SetENpc(OVERCOMPETITIVE_ADVENTURER);
		quest:SetENpc(GREEDY_MERCHANT);
		quest:SetENpc(SPRY_SALESMAN);
		quest:SetENpc(THANCRED);
    elseif (sequence == SEQ_005) then
        quest:SetENpc(MOMODI);
		quest:SetENpc(OCOCO, QFLAG_TALK);
	elseif (sequence == SEQ_010) then
		quest:SetENpc(MOMODI, QFLAG_TALK);
	elseif (sequence == SEQ_012) then
		quest:SetENpc(MOMODI, QFLAG_TALK);
	elseif (sequence == SEQ_015) then
		local subseqGSM = data:GetCounter(CNTR_SEQ15_GSM);
		local subseqGLD = data:GetCounter(CNTR_SEQ15_GLD);
		quest:SetENpc(MOMODI);
		quest:SetENpc(LULUTSU);
		quest:SetENpc(PAPAWA);
		quest:SetENpc(ABYLGO_HAMYLGO);
		quest:SetENpc(FRUHYBOLG);
		quest:SetENpc(QMHALAWI);
		quest:SetENpc(UNDEFEATED_GLADIATOR);
		quest:SetENpc(POORLY_OUTFITTED_GLADIATOR);
		quest:SetENpc(AGGRIEVED_GLADIATOR);
		quest:SetENpc(DISHEARTENED_GLADIATOR);
		quest:SetENpc(SWERDAHRM);
		quest:SetENpc(ELECOTTE, (subseqGSM <= 1) and QFLAG_TALK or QFLAG_OFF);
		quest:SetENpc(GLD_TRIG, (subseqGLD == 0) and QFLAG_PUSH or QFLAG_OFF, false, (subseqGLD == 0));
		quest:SetENpc(COL_TRIG, QFLAG_PUSH, false, true);
		quest:SetENpc(GLD2_TRIG, QFLAG_PUSH, false, true);
		quest:SetENpc(PRIVATEAREA_PAST_EXIT);
	elseif (sequence == SEQ_045) then 
        quest:SetENpc(LINETTE, QFLAG_TALK);
	elseif (sequence == SEQ_050) then
		quest:SetENpc(MANIC_MINER);
		quest:SetENpc(MADDENED_MINER);
		quest:SetENpc(LINETTE);
		quest:SetENpc(TYAGO_MOUI);
		quest:SetENpc(NITTMA_GUTTMA);
		quest:SetENpc(CORGUEVAIS);
		quest:SetENpc(ASTONISHED_ADVENTURER);
		quest:SetENpc(MONITORING_MINER);
		quest:SetENpc(MOCKING_MINER);
		quest:SetENpc(MUSCULAR_MINER);
		quest:SetENpc(MAUDLIN_MINER);
		quest:SetENpc(DISPLEASED_DANCER);
		quest:SetENpc(CLOSE_FISTED_WOMAN);
		quest:SetENpc(FLHAMINN_EMOTE, QFLAG_TALK, true, false, true);
		quest:SetENpc(PRIVATEAREA_PAST_EXIT);
	elseif (sequence == SEQ_057) then
		quest:SetENpc(FLHAMINN_EMOTE)
		quest:SetENpc(MANIC_MINER, not data:GetFlag(FLAG_MANIC) and QFLAG_TALK or QFLAG_OFF, true, false, not data:GetFlag(FLAG_MANIC));
		quest:SetENpc(MADDENED_MINER, QFLAG_TALK, true, false, true);
		quest:SetENpc(LINETTE);
		quest:SetENpc(TYAGO_MOUI);
		quest:SetENpc(NITTMA_GUTTMA);
		quest:SetENpc(CORGUEVAIS);
		quest:SetENpc(ASTONISHED_ADVENTURER);
		quest:SetENpc(MONITORING_MINER);
		quest:SetENpc(MOCKING_MINER);
		quest:SetENpc(MUSCULAR_MINER);
		quest:SetENpc(MAUDLIN_MINER);
		quest:SetENpc(DISPLEASED_DANCER);
		quest:SetENpc(CLOSE_FISTED_WOMAN);
		quest:SetENpc(PRIVATEAREA_PAST_EXIT);
	elseif (sequence == SEQ_058) then
		quest:SetENpc(FLHAMINN, QFLAG_TALK);
		quest:SetENpc(LINETTE);
		quest:SetENpc(TYAGO_MOUI);
		quest:SetENpc(NITTMA_GUTTMA);
		quest:SetENpc(CORGUEVAIS);
		quest:SetENpc(MONITORING_MINER);
		quest:SetENpc(MUSCULAR_MINER);
		quest:SetENpc(MAUDLIN_MINER);
		quest:SetENpc(DISPLEASED_DANCER);
		quest:SetENpc(PRIVATEAREA_PAST_EXIT);
	elseif (sequence == SEQ_060) then
		quest:SetENpc(ESCORT_TRIG, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_065) then
		quest:SetENpc(SEQ70_TRIG, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_070) then
		quest:SetENpc(ASCILLIA, QFLAG_TALK);
		quest:SetENpc(FLHAMINN);
		quest:SetENpc(CORGUEVAIS);
		quest:SetENpc(HELPLESS_HYUR);
		quest:SetENpc(UNTIDY_OUTLANDER);
		quest:SetENpc(REGARDING_ROEGADYN);
		quest:SetENpc(UNSAVORY_CUR);
		quest:SetENpc(MALODOROUS_MISTER);
		quest:SetENpc(BRIGHT_EYED_BRINEMONGER);
		quest:SetENpc(MALNOURISHED_MIDLANDER);
		quest:SetENpc(FRIGHTENED_LALAFELL);
		quest:SetENpc(TROUBLED_TRADER);
		quest:SetENpc(PRIVATEAREA_PAST_EXIT, QFLAG_NONE, false, true);
	elseif (sequence == SEQ_075) then
		quest:SetENpc(MIN_TRIGG, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_090) then
		quest:SetENpc(NOGELOIX, QFLAG_TALK);
	elseif (sequence == SEQ_095) then
		quest:SetENpc(ALCH_TRIGG, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_100) then
		quest:SetENpc(SEQ100_TRIGG, QFLAG_PUSH, false, true);
		quest:SetENpc(SLOW_WITTED_MINER);
		quest:SetENpc(QUALMISH_MINER);
		quest:SetENpc(MUSCULAR_MINER);
		quest:SetENpc(WORRISOME_ASSISTANT);
		quest:SetENpc(WELLWASHED_LEECH);
	elseif (sequence == SEQ_105) then
		quest:SetENpc(SEQ100_TRIGG, QFLAG_OFF);
		quest:SetENpc(SEQ105_TRIGG, QFLAG_PUSH, false, true);
		quest:SetENpc(SLOW_WITTED_MINER);
		quest:SetENpc(QUALMISH_MINER);
		quest:SetENpc(MUSCULAR_MINER);
		quest:SetENpc(WORRISOME_ASSISTANT);
		quest:SetENpc(WELLWASHED_LEECH);
	elseif (sequence == SEQ_110) then
		quest:SetENpc(MOMODI, QFLAG_REWARD);
    end	
end

function onTalk(player, quest, npc)
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();
    
	if (sequence == SEQ_000) then
        seq000_onTalk(player, quest, npc, classId);	
    elseif (sequence == SEQ_005) then
	seq005_onTalk(player, quest, npc, classId);
	elseif (sequence == SEQ_010) then
	-- SEQ_010 has a Widget that displays "You have arrived at Camp BlackBrush."
	-- Followed by another LsMsg, msg 323.
		if (classId == MOMODI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent015");
			player:EndEvent();
			quest:StartSequence(SEQ_012);
		end
		
	elseif (sequence == SEQ_012) then
		if (classId == MOMODI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent017");
			quest:NewNpcLsMsg(1);
			player:SendGameMessage(GetWorldMaster(), 25117, 0x20, 11000126); --Player recieves Coliseum Pass			
			player:EndEvent();
			quest:StartSequence(SEQ_015);
			player:SendMessage(0x1D,"",">SEQ_15");
		end
		
	elseif (sequence == SEQ_015) then
		if (seq015_onTalk(player, quest, npc, classId) == true) then
			quest:UpdateENPCs();
			return;
		end
		
	elseif (sequence == SEQ_045) then
		if (classId == LINETTE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 2);
			quest:StartSequence(SEQ_050);
		end
		
	elseif (sequence == SEQ_050) then
		if (classId == LINETTE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_2");
		elseif (classId == MAUDLIN_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_3");
		elseif (classId == MOCKING_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_4");
		elseif (classId == MONITORING_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_5");
		elseif (classId == DISPLEASED_DANCER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_6");
		elseif (classId == MUSCULAR_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_7");
		elseif (classId == CLOSE_FISTED_WOMAN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_8");
		elseif (classId == ASTONISHED_ADVENTURER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_9");
		elseif (classId == NITTMA_GUTTMA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_10");
		elseif (classId == CORGUEVAIS) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_11");
		elseif (classId == TYAGO_MOUI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_12")
		elseif (classId == MANIC_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_13");
		elseif (classId == MADDENED_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_14");
		elseif (classId == FLHAMINN_EMOTE) then
			local emoteTestStep = quest:GetData():GetCounter(CNTR_SEQ50_EMOTE);
			if (emoteTestStep == 0 or emoteTestStep == 1) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent051_1"); --Furious
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				if (emoteTestStep == 0) then
					quest:GetData():IncCounter(CNTR_SEQ50_EMOTE);
				end
		elseif (emoteTestStep == 2) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent051_2"); -- Beckon
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
		elseif (emoteTestStep == 3) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent051_3"); -- Laugh
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
		elseif (emoteTestStep == 4) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent051_4"); -- Deny
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
		elseif (emoteTestStep == 5) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent051_5"); -- Upset
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
		elseif (emoteTestStep == 6) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent051_6"); -- Soothe
				player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
			end
		end
	player:EndEvent();
	
	elseif (sequence == SEQ_057) then
		if(classId == FLHAMINN_EMOTE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent051_8"); -- For Reminder
		elseif (classId == MANIC_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_13");
			player:EndEvent();
		elseif (emoteTestStep == 7) then
			local emoteTestStep = quest:GetData():GetCounter(CNTR_SEQ50_EMOTE);
		elseif (classId == MADDENED_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_14");
			player:EndEvent();
		elseif (emoteTestStep == 8) then
			local emoteTestStep = quest:GetData():GetCounter(CNTR_SEQ50_EMOTE);
		elseif (classId == LINETTE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_2");
		elseif (classId == MAUDLIN_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_3");
		elseif (classId == MOCKING_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_4");
		elseif (classId == MONITORING_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_5");
		elseif (classId == DISPLEASED_DANCER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_6");
		elseif (classId == MUSCULAR_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_7");
		elseif (classId == CLOSE_FISTED_WOMAN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_8");
		elseif (classId == ASTONISHED_ADVENTURER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_9");
		elseif (classId == NITTMA_GUTTMA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_10");
		elseif (classId == CORGUEVAIS) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_11");
		elseif (classId == TYAGO_MOUI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_12");
		end
	player:EndEvent()
	
	elseif (sequence == SEQ_058) then
		if(classId == FLHAMINN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070");
			GetWorldManager():WarpToPublicArea(player);
			player:EndEvent();
			quest:StartSequence(SEQ_060);
	elseif (classId == MAUDLIN_MINER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent060_4");
	elseif (classId == MONITORING_MINER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent060_6");
	elseif (classId == DISPLEASED_DANCER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent060_5");
	elseif (classId == MUSCULAR_MINER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent060_2");
	elseif (classId == NITTMA_GUTTMA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_10");
	elseif (classId == CORGUEVAIS) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_11");
	elseif (classId == TYAGO_MOUI) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent060_3");
	elseif (classId == LINETTE) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent060_7");
		end
	player:EndEvent()
	
	elseif (sequence == SEQ_070) then
		if (classId == ASCILLIA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent090");
			GetWorldManager():WarpToPublicArea(player);
			quest:StartSequence(SEQ_075);
		elseif (classId == REGARDING_ROEGADYN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_2");
		elseif (classId == FRIGHTENED_LALAFELL) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_3");
		elseif (classId == UNSAVORY_CUR) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_4");
		elseif (classId == MALNOURISHED_MIDLANDER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_5");
		elseif (classId == BRIGHT_EYED_BRINEMONGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_6");
		elseif (classId == TROUBLED_TRADER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_7");
		elseif (classId == HELPLESS_HYUR) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_8");
		elseif (classId == UNTIDY_OUTLANDER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_9");
		elseif (classId == MALODOROUS_MISTER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_10");
		elseif (classId == CORGUEVAIS) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_11");
		elseif (classId == FLHAMINN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_12");
		end
	player:EndEvent();
	
	elseif (sequence == SEQ_090) then
		if(classId == NOGELOIX) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210");
			player:EndEvent();
			quest:StartSequence(SEQ_095);
		end
		
	elseif (sequence == SEQ_100) then
		if (classId == WORRISOME_ASSISTANT) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_3");
	elseif (classId == WELLWASHED_LEECH) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_5");
	elseif (classId == QUALMISH_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_6");
	elseif (classId == MUSCULAR_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_7");
	elseif (classId == SLOW_WITTED_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_8");
		end
	player:EndEvent();
	
	elseif (sequence == SEQ_105) then
		if (classId == WORRISOME_ASSISTANT) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_3");
	elseif (classId == WELLWASHED_LEECH) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_5");
	elseif (classId == QUALMISH_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_6");
	elseif (classId == MUSCULAR_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_7");
	elseif (classId == SLOW_WITTED_MINER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent210_8");
			end
	player:EndEvent()
	
	elseif (sequence == SEQ_110) then
		if(classId == MOMODI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEventComplete");
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 300, 1, 1, 2);
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 6000)
			player:EndEvent();
			player:CompleteQuest(quest);
		--Give player 6,000gil and 300exp.
			return;	
		end
	end
	quest:UpdateENPCs();
end

function onPush(player, quest, npc)
	local data = quest:GetData();
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();
	local subseqGLD = data:GetCounter(CNTR_SEQ15_GLD);
	local subseqGSM = data:GetCounter(CNTR_SEQ15_GSM);
	
	if (sequence == SEQ_015) then
		if(classId == GLD_TRIG) then
		
			player:SendMessage(0x1D,"",">Pushed GLD!");
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030");
			data:IncCounter(CNTR_SEQ15_GLD); --GLD +1
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, -192.241, 194.5, 195.317, -0.008);
			player:EndEvent();
	elseif(classId == COL_TRIG) then
		
		player:SendMessage(0x1D,"",">Pushed COL!");
		-- Where coliseum fight needs to be implemented. Skipping to next cutscene.
			callClientFunction(player, "delegateEvent", player, quest, "processEvent035");
			data:IncCounter(CNTR_SEQ15_GLD); --GLD +1
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 1, -177.893, 189.953, 218.754, 3.135); --Needs verification if player is warped in a new private instance or back in previous instance.
			player:EndEvent();
			return;
			
	elseif(classId == GLD2_TRIG) then
		
		player:SendMessage(0x1D,"",">Pushed GLD2!");
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040");
			data:IncCounter(CNTR_SEQ15_GLD); --GLD +1
			GetWorldManager():WarpToPublicArea(player, -192.959, 194.5, 204.339, -3.140);
			player:EndEvent();
		if (subseqGSM >= 1) then
			seq015_endSequence(player, quest);
			return;
		end
	end
	
	elseif (sequence == SEQ_060) then
		if(classId == ESCORT_TRIG) then
		
			callClientFunction(player, "delegateEvent", player, quest, "processEvent075");
			GetWorldManager():DoZoneChange(player, 170, nil, 0, 15, 126.125, 184.657, -362.836, -2.987);
			player:ChangeMusic(37);
			player:SendMessage(0x1D,"",">Head to Black Brush!");
			player:EndEvent();
			quest:StartSequence(SEQ_065);
		end
		
	elseif (sequence == SEQ_065) then
		if(classId == SEQ70_TRIG) then
		
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080");
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, 51.855, 200.027, -482.399, -2.953);
			player:EndEvent();
			quest:StartSequence(SEQ_070);
		end
		
	elseif (sequence == SEQ_075) then
		if(classId == MIN_TRIGG) then
		
			callClientFunction(player, "delegateEvent", player, quest, "processEvent205");
			GetWorldManager():WarpToPublicArea(player);
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 3000)
			quest:NewNpcLsMsg(1);
			player:EndEvent();
			quest:StartSequence(SEQ_090);
		end
		
	elseif (sequence == SEQ_095) then
		if(classId == ALCH_TRIGG) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent220");
			GetWorldManager():DoZoneChange(player, 180, nil, 0, 15, -204.9441, 0, -159.944, 1.591); --Not a PrivateArea.
			player:EndEvent();
			quest:StartSequence(SEQ_100);
		end
	
	elseif (sequence == SEQ_100) then
		if(classId == SEQ100_TRIGG) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent230");
			quest:NewNpcLsMsg(1);
			player:EndEvent();
			quest:StartSequence(SEQ_105);
		end
		
	elseif (sequence == SEQ_105) then
		if(classId == SEQ105_TRIGG) then
			GetWorldManager():DoZoneChange(player, 209, nil, 0, 15, -215.248, 229.5, 297.833, 2.895);
			player:EndEvent();
			quest:StartSequence(SEQ_110);

		
		end
    end
	quest:UpdateENPCs();
end

function onEmote(player, quest, npc, eventName)
	local data = quest:GetData();
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();	

	-- Play the emote
	if (eventName == "emoteDefault1") then 		-- Furious
		player:DoEmote(npc.Id, 3, 21021);
	elseif (eventName == "emoteDefault2") then	-- Beckon
		player:DoEmote(npc.Id, 8, 21071);
	elseif (eventName == "emoteDefault3") then	-- Laugh
		player:DoEmote(npc.Id, 21, 21201);
	elseif (eventName == "emoteDefault4") then	-- Deny
		player:DoEmote(npc.Id, 25, 21241);
	elseif (eventName == "emoteDefault5") then	-- Upset
		player:DoEmote(npc.Id, 40, 21391);
	elseif (eventName == "emoteDefault6") then	-- Soothe
		player:DoEmote(npc.Id, 35, 21341);
	elseif (eventName == "emoteDefault7") then 	-- Madden Miner, Furious
		player:DoEmote(npc.Id, 3, 21021);
	elseif (eventName == "emoteDefault8") then	-- Madden Miner, Laugh
		player:DoEmote(npc.Id, 21, 21201);
	elseif (eventName == "emoteDefault9") then	-- Madden Miner, Soothe
		player:DoEmote(npc.Id, 35, 21341);
	elseif (eventName == "emoteDefault10") then	-- Manic Miner, Beckon
		player:DoEmote(npc.Id, 8, 21071);
	end
	wait(2.5);
	
	-- Handle the result
	if (sequence == SEQ_050 or sequence == SEQ_057) then
		if (classId == FLHAMINN_EMOTE or classId == MADDENED_MINER or classId == MANIC_MINER) then
			local emoteTestStep = data:GetCounter(CNTR_SEQ50_EMOTE);
		-- Flhaminn Emote Sequence
			-- Furious
			if (emoteTestStep == 1) then
				if (eventName == "emoteDefault1") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_2");
					data:IncCounter(CNTR_SEQ50_EMOTE);
			elseif (eventName == "emoteDefault2" or "emoteDefault3" or "emoteDefault4" or "emoteDefault5" or "emoteDefault6") then --Failed to do correct Emote.
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_7")
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_1")
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				end
			-- Beckon
			elseif (emoteTestStep == 2) then
				if (eventName == "emoteDefault2") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_3");
					data:IncCounter(CNTR_SEQ50_EMOTE);
			elseif (eventName == "emoteDefault1" or "emoteDefault3" or "emoteDefault4" or "emoteDefault5" or "emoteDefault6") then --Failed to do correct Emote.
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_7");				
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_2");
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				end
			-- Laugh
			elseif (emoteTestStep == 3) then
				if (eventName == "emoteDefault3") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_4");
					data:IncCounter(CNTR_SEQ50_EMOTE);
			elseif (eventName == "emoteDefault1" or "emoteDefault2" or "emoteDefault4" or "emoteDefault5" or "emoteDefault6") then	--Failed to do correct Emote.	
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_7");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_3");
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				end
			-- Deny
			elseif (emoteTestStep == 4) then
				if (eventName == "emoteDefault4") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_5");
					data:IncCounter(CNTR_SEQ50_EMOTE);
			elseif (eventName == "emoteDefault1" or "emoteDefault2" or "emoteDefault3" or "emoteDefault5" or "emoteDefault6") then --Failed to do correct Emote.
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_7");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_4")
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				end
			-- Upset
			elseif (emoteTestStep == 5) then
				if (eventName == "emoteDefault5") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_6");
					data:IncCounter(CNTR_SEQ50_EMOTE);
			elseif (eventName == "emoteDefault1" or "emoteDefault2" or "emoteDefault3" or "emoteDefault4" or "emoteDefault6") then	--Failed to do correct Emote.	
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_7");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_5");
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
				end
			-- Soothe
			elseif (emoteTestStep == 6) then
				if (eventName == "emoteDefault6") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_8");
					quest:StartSequence(SEQ_057);
					data:IncCounter(CNTR_SEQ50_EMOTE);
			elseif (eventName == "emoteDefault1" or "emoteDefault2" or "emoteDefault3" or "emoteDefault4" or "emoteDefault5") then 	--Failed to do correct Emote.
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_7");
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_6");
					player:SendGameMessage(GetWorldMaster(), 25083, MESSAGE_TYPE_SYSTEM, 3);
			elseif (classId == FLHAMINN_EMOTE) then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent051_8");
				end	
		--Manic Miner and Maddened Miner Sequence
			elseif (emoteTestStep == 7) then
				if (eventName == "emoteDefault10") then
				if (not data:GetFlag(FLAG_MANIC)) then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent055_3"); --Manic Miner Beckon
					data:SetFlag(FLAG_MANIC);
					data:IncCounter(CNTR_SEQ50_EMOTE);
				end
			end
			elseif (emoteTestStep == 8) then
				if (eventName == "emoteDefault7") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent055_1"); -- Maddened Miner, Furious
					callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
					GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
					player:EndEvent();
				elseif (eventName == "emoteDefault8") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent055_2"); -- Maddened Miner, Laugh
					callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
					GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
					player:EndEvent();
				elseif (eventName == "emoteDefault9") then
					callClientFunction(player, "delegateEvent", player, quest, "processEvent056_2"); -- Maddened Miner, Soothe
					callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
					GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3, -106.690, 194.2, 322.540, -0.275);
					player:EndEvent();
				end
					quest:StartSequence(SEQ_058);
			end
		end
	end
		
	player:EndEvent();
	quest:UpdateENPCs();
end

function onNotice(player, quest, target)
	local sequence = quest:getSequence();
	
    callClientFunction(player, "delegateEvent", player, quest, "processEvent000_1"); -- Describes what an Instance is
    player:EndEvent();
	quest:UpdateENPCs();
end

function onNpcLS(player, quest, from, msgStep)
	local sequence = quest:getSequence();
	local msgPack;

	if (from == 1) then
		-- Get the right msg pack
		if (sequence == SEQ_005) then
			msgPack = 1;	
		elseif (sequence == SEQ_015) then
			msgPack = 2;
		elseif (sequence == SEQ_045) then
			msgPack = 3;
		elseif (sequence == SEQ_090) then
			msgPack = 4;
		elseif (sequence == SEQ_105) then
			msgPack = 5;
		end
		
		player:SendGameMessageLocalizedDisplayName(quest, NPCLS_MSGS[msgPack][msgStep], MESSAGE_TYPE_NPC_LINKSHELL, 1500014);
		if (msgStep >= #NPCLS_MSGS[msgPack]) then
			quest:EndOfNpcLsMsgs();
		else
			quest:ReadNpcLsMsg();
		end
		
		-- Handle anything else
		if (sequence == SEQ_015 and quest:GetData():GetCounter(CNTR_SEQ15_GSM) >= 1 and quest:GetData():GetCounter(CNTR_SEQ15_GLD) >= 3) then
			quest:StartSequenceForNpcLs(SEQ_045);
		end
	end
	
	player:EndEvent();
end

function seq000_onTalk(player, quest, npc, classId)
	
    if (classId == MOMODI) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
		quest:NewNpcLsMsg(1);
		player:EndEvent();
		quest:StartSequence(SEQ_005);
		quest:UpdateENPCs();
        GetWorldManager():DoZoneChange(player, 175, nil, 0, 15, player.positionX, player.positionY, player.positionZ, player.rotation);
        return;
    elseif (classId == UNDAUNTED_ADVENTURER) then
        callClientFunction (player, "delegateEvent", player, quest, "processEvent000_2");
    elseif (classId == GREEDY_MERCHANT) then
        callClientFunction (player, "delegateEvent", player, quest, "processEvent000_3");
    elseif (classId == SPRY_SALESMAN) then
        callClientFunction (player, "delegateEvent", player, quest, "processEvent000_4");
    elseif (classId == LIONHEARTED_ADVENTURER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_5");
    elseif (classId == UPBEAT_ADVENTURER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_6");
    elseif (classId == SEEMINGLY_CALM_ADVENTURER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_7");
    elseif (classId == OVERCOMPETITIVE_ADVENTURER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_8");        
    elseif (classId == OTOPA_POTTOPA) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_9");
    elseif (classId == THANCRED) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_10");        
    end
	
    player:EndEvent();
end

function seq005_onTalk(player, quest, npc, classId) 
	if (classId == MOMODI) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
	elseif (classId == OCOCO) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent1000_1");
    end
	
	player:EndEvent();
end

function seq015_onTalk(player, quest, npc, classId)
	local data = quest:GetData();
	local subseqGSM = data:GetCounter(CNTR_SEQ15_GSM);
	local subseqGLD = data:GetCounter(CNTR_SEQ15_GLD);
	
	if (classId == MOMODI) then
		if (subseqGLD == 3) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent017_4");
	elseif (subseqGSM >= 2) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent017_3");
			player:EndEvent();
	elseif (subseqGLD == 0) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent017_2");
	elseif (subseqGSM == 0) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent017_2");
		player:EndEvent();
	end
		--GSM Guild Event
	elseif (classId == ELECOTTE) then
		if (subseqGSM == 0) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020");
			data:IncCounter(CNTR_SEQ15_GSM); --GSM +1
			player:EndEvent();					
		elseif (subseqGSM == 1) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
			callClientFunction(player, "delegateEvent", player, quest, "processEvent025");
			data:IncCounter(CNTR_SEQ15_GSM); --GSM +1
			player:EndEvent();
			if (subseqGLD >= 3) then
				seq015_endSequence(player, quest);
			end
		else 
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
			player:EndEvent();
			return;
		end
	elseif (classId == LULUTSU) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_2");
	elseif (classId == ABYLGO_HAMYLGO) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_3");
	elseif (classId == PAPAWA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_4");
	elseif (classId == FRUHYBOLG) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_5");
	elseif (classId == SWERDAHRM) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_6");
	elseif (classId == QMHALAWI) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_7");
	elseif (classId == AGGRIEVED_GLADIATOR) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_8");
    elseif (classId == UNDEFEATED_GLADIATOR) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_9");
	elseif (classId == POORLY_OUTFITTED_GLADIATOR) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_10");
	elseif (classId == DISHEARTENED_GLADIATOR) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent030_11"); --confirm motion packs, looks like cycling more than one
	end
		
	player:EndEvent();
end

function seq015_endSequence(player, quest)
	quest:NewNpcLsMsg(1);
	player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 2000)
	quest:StartSequence(SEQ_045);
end

function getJournalInformation(player, quest)
	return 0, ITEM_VELODYNA_COSMOS, ITEM_COLISEUM_PASS;
end

function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();
	local data = quest:GetData();
	local possibleMarkers = {};

    if (sequence == SEQ_000) then
        table.insert(possibleMarkers, MRKR_MOMODI);
	elseif (sequence == SEQ_005) then
		table.insert(possibleMarkers, MRKR_BLACKBRUSH);
    elseif (sequence == SEQ_010) then
        table.insert(possibleMarkers, MRKR_SEQ10_MOMODI);
	elseif (sequence == SEQ_012) then
		table.insert(possibleMarkers, MRKR_SEQ12_MOMODI);
	elseif (sequence == SEQ_015) then
		table.insert(possibleMarkers, MRKR_GOLDSMITH);
		table.insert(possibleMarkers, MRKR_GLADIATOR);
	elseif (sequence == SEQ_045) then
		table.insert(possibleMarkers, MRKR_LINETTE);
	elseif (sequence == SEQ_050) then
		table.insert(possibleMarkers, MRKR_FLHAMMIN);
	elseif (sequence == SEQ_057) then
		table.insert(possibleMarkers, MRKR_MANIC_MINER);
		table.insert(possibleMarkers, MRKR_MADDENED_MINER);
	elseif (sequence == SEQ_058) then
		table.insert(possibleMarkers, MRKR_FLHAMMIN2);
	elseif (sequence == SEQ_060) then
		table.insert(possibleMarkers, MRKR_NALD_GATE);
	elseif (sequence == SEQ_065) then
		table.insert(possibleMarkers, MRKR_ASCILLIA);
	elseif (sequence == SEQ_070) then
		table.insert(possibleMarkers, MRKR_ASCILLIA2);
	elseif (sequence == SEQ_075) then
		table.insert(possibleMarkers, MRKR_MINERS)
	elseif (sequence == SEQ_090) then
		table.insert(possibleMarkers, MRKR_NOGELOIX)
	elseif (sequence == SEQ_095) then
		table.insert(possibleMarkers, MRKR_DOOR2)
	elseif (sequence == SEQ_100) then
		table.insert(possibleMarkers, MRKR_DOOR3)
	elseif (sequence == SEQ_105) then
		table.insert(possibleMarkers, MRKR_DOOR3)
	elseif (sequence == SEQ_110) then
		table.insert(possibleMarkers, MRKR_MOMODI_END)
    end
    return unpack(possibleMarkers)

end