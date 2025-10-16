require ("global")
require ("quest")

--[[

Quest Script

Name:   Golden Sacrifices
Code:   Man1u0
Id:     110011
Prereq: Court in the Sands (Man0u0 - 110010)
Level requirement: 8
Notes:

]]

--[[

Videos refs:

Teranu
https://www.youtube.com/watch?v=kDhJIw3oZak




--]]

-- Sequence Numbers
SEQ_000 = 0; 	-- Speak to Momodi and other Adventurers in the PrivateArea
SEQ_005 = 5; 	-- Speak with Attendant at the Platinum Mirage (Gagaruna).
SEQ_010 = 10; 	-- Enter the Gambling Halls beyond the lobby in Platinum Mirage.
SEQ_015 = 15;   -- Niellefresne and Greinfarr gambling and Thancred accused of cheating.
SEQ_020 = 20;	-- Contact Momodi via Linkpearl.
SEQ_025 = 25;	-- Talk to Deaustie at the Weaver's Guild.
SEQ_028 = 28;	-- Find Flhammin in Northern Thanalan
SEQ_030 = 30;	-- Same as SEQ_028.
SEQ_035 = 35;	-- Ascillia Appears in PrivateArea Northern Thanlan, talk to her.
SEQ_040 = 40;	-- Contact Momodi via Linkpearl.
SEQ_045 = 45;	-- Go to the Thaumaturges Guild -- rework section
SEQ_050 = 50;	-- Mumuepo tells player Flhammin spoke about the dark arts. Find someone among the Thaumaturges who knows more.
SEQ_055 = 55;	-- Speak to Niellefresne.
SEQ_060 = 60;	-- Seek out Mumepo of the thaumaturges guild.
SEQ_065 = 65;	-- Contact Momodi.
SEQ_070 = 70;	-- Meet Momodi back at the quicksand.

--SEQ_000
MOMODI                      = 1000841;
RUMINATING_ELEZEN			= 1000942;
WELL_DRESSED_MIDLANDER		= 1000943;
QUEERLY_CORDINATED_LALAFELL = 1000944;
SILVER_HAIR_SUDUCTRESS		= 1000945;
WAXEN_FACE_WIDOWER			= 1000946;
LUMBERING_LALAFELL			= 1000947;

--SEQ_005
GAGARUNA					= 1000862;
QATA_NELHAH					= 1001462;
MAMMET						= 1001455;
POPORI						= 1000651; --Npc show has no defaultTalk or quest Set. This Npc from what I can find no affilation with this quest?

--SEQ_010
GAMBHALL_TRIGG				= 1090114;
KOCKACHA					= 1001504;
PATIENT_CROW				= 1001505;
GWENOLIE					= 1001506;
RAGINHART					= 1001507;
ROOM_TRIGG					= 1090283;

--SEQ_015
THANCRED				 	= 1000948;
NIELLEFRENSE				= 1001867;
FLHAMINN					= 1000038;
CORGUEVAIS					= 1001054;
GREINFARR					= 1000039;
POPOKKULI					= 1000040;
SESERUKKA					= 1000041;
QOQOBA						= 1000855;

--SEQ_020
DEAUSTIE					= 1000293;

--SEQ_28
NORTH_THANTRIGG				= 1090077;
FLHAMINN_TRIGG				= 1090075;

--SEQ_30
ASCILLIA					= 1000042;
--Flhammin

--SEQ_40
YAYAKE						= 1000846;
GEGEISSA					= 1001424;

THAUMA_TRIGG				= 1090045;
THAUMA2_TRIGG				= 1090047;

--SEQ_55
DOWNCAST_DERELICT			= 1001214;
SWOLLEN_EYED_STRUMPET		= 1001215;
ZSSAPA						= 1000887;
SINETTE						= 1001145;
AILING_ROEGADYN				= 1001216;

--SEQ_70
GOGOFU						= 1000046;

--ActorID Fixes
KUKUMUKO					= 1000070;

-- Msg packs for the Npc LS
NPCLS_MSGS = {
	{73, 74, 200},
	{114, 155, 116, 117},
	{160}
};

--Counters

-- Quest Markers
MRKR_MOMODI             	= 11001101; --SEQ 0/70
MRKR_GAGARUNA				= 11001102; --SEQ 5
MRKR_GAMBLINGHALL			= 11001103; --SEQ 10
MRKR_THANCRED				= 11001104; --SEQ 15
MRKR_DEAUSTIE				= 11001105; --SEQ 25
MRKR_NORTHERNTHANALAN		= 11001106; --SEQ 28\30
MRKR_ASCILLIA				= 11001108; --SEQ 35
MRKR_YAYAKE					= 11001109; --SEQ 40
MRKR_HALL					= 11001110; --SEQ 50
MRKR_NIELLEFRESNE			= 11001111; --SEQ 55

-- Quest Items

-- Quest Flags

function onStart(player, quest) 
    quest:StartSequence(SEQ_000);
	GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, -73.811, 195, 78.759, -0.448);
end

function onFinish(player, quest)
end

function onStateChange(player, quest, sequence)
	local data = quest:GetData();
	
	if (sequence == SEQ_ACCEPT) then
		quest:SetENpc(MOMODI, QFLAG_TALK);
    elseif (sequence == SEQ_000) then
        quest:SetENpc(MOMODI, QFLAG_TALK);
		quest:SetENpc(RUMINATING_ELEZEN);
		quest:SetENpc(QUEERLY_CORDINATED_LALAFELL);
		quest:SetENpc(SILVER_HAIR_SUDUCTRESS);
		quest:SetENpc(WELL_DRESSED_MIDLANDER);
		quest:SetENpc(LUMBERING_LALAFELL);
		quest:SetENpc(WAXEN_FACE_WIDOWER);
	elseif (sequence == SEQ_005) then
		quest:SetENpc(GAGARUNA, QFLAG_TALK);
		quest:SetENpc(POPORI, QFLAG_NONE);
		quest:SetENpc(MOMODI);
		quest:SetENpc(QATA_NELHAH);
		quest:SetENpc(MAMMET);
	elseif (sequence == SEQ_010) then
		quest:SetENpc(GAMBHALL_TRIGG, QFLAG_PUSH, false, true);
		quest:SetENpc(ROOM_TRIGG, QFLAG_PUSH, false, true);
		quest:SetENpc(KOCKACHA);
		quest:SetENpc(GWENOLIE);
		quest:SetENpc(RAGINHART);
		quest:SetENpc(PATIENT_CROW);
		quest:SetENpc(GAGARUNA);
		quest:SetENpc(QATA_NELHAH);
		quest:SetENpc(MAMMET);
	elseif (sequence == SEQ_015) then
		quest:SetENpc(GAMBHALL_TRIGG, QFLAG_PUSH, false, true);
		quest:SetENpc(THANCRED, QFLAG_TALK);
		quest:SetENpc(QOQOBA);
		quest:SetENpc(GREINFARR);
		quest:SetENpc(FLHAMINN);
		quest:SetENpc(NIELLEFRENSE);
		quest:SetENpc(SESERUKKA);
		quest:SetENpc(POPOKKULI);
		quest:SetENpc(CORGUEVAIS);
	elseif (sequence == SEQ_020) then
		quest:SetENpc(KUKUMUKO);
	elseif (sequence == SEQ_025) then
		quest:SetENpc(DEAUSTIE, QFLAG_TALK);
		quest:SetENpc(GAGARUNA);
		quest:SetENpc(MOMODI);
	elseif (sequence == SEQ_028) then
		quest:SetENpc(FLHAMINN_TRIGG, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_030) then
		quest:SetENpc(FLHAMINN_TRIGG, QFLAG_NONE);
		quest:SetENpc(NORTH_THANTRIGG, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_035) then
		quest:SetENpc(FLHAMINN_TRIGG, QFLAG_PUSH, false, true);
		quest:SetENpc(NORTH_THANTRIGG, QFLAG_PUSH, false, true);
		quest:SetENpc(ASCILLIA, QFLAG_TALK);
		quest:SetENpc(FLHAMINN);
	elseif (sequence == SEQ_040) then
		quest:SetENpc(GEGEISSA);
	elseif (sequence == SEQ_045) then
		quest:SetENpc(YAYAKE, QFLAG_TALK);
	elseif (sequence == SEQ_050) then
		quest:SetENpc(THAUMA_TRIGG, QFLAG_NONE, false, true);
		quest:SetENpc(THAUMA2_TRIGG, QFLAG_NONE, false, true);
	elseif (sequence == SEQ_055) then
		quest:SetENpc(YAYAKE, QFLAG_TALK);
		quest:SetENpc(THAUMA_TRIGG);
		quest:SetENpc(THAUMA2_TRIGG);
		quest:SetENpc(NIELLEFRENSE, QFLAG_TALK);
		quest:SetENpc(SWOLLEN_EYED_STRUMPET);
		quest:SetENpc(DOWNCAST_DERELICT);
		quest:SetENpc(ZSSAPA);
		quest:SetENpc(THANCRED);
		quest:SetENpc(SINETTE);
		quest:SetENpc(AILING_ROEGADYN);
	elseif (sequence == SEQ_060) then
		quest:SetENpc(YAYAKE, QFLAG_TALK);
		quest:SetENpc(THAUMA_TRIGG, QFLAG_NONE, false, true);
		quest:SetENpc(THAUMA2_TRIGG, QFLAG_PUSH, false, true);
		quest:SetENpc(NIELLEFRENSE);
		quest:SetENpc(SWOLLEN_EYED_STRUMPET);
		quest:SetENpc(DOWNCAST_DERELICT);
		quest:SetENpc(ZSSAPA);
		quest:SetENpc(THANCRED);
		quest:SetENpc(SINETTE);
		quest:SetENpc(AILING_ROEGADYN);
	elseif (sequence == SEQ_070) then
		quest:SetENpc(MOMODI, QFLAG_REWARD);
		quest:SetENpc(GOGOFU);
		quest:SetENpc(YAYAKE);

    end	
end

function onTalk(player, quest, npc)
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();
    
	if (sequence == SEQ_ACCEPT) then
		if (classId == MOMODI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEventMomodiStart");
			player:EndEvent();
			player:AcceptQuest(quest, true);
			return;
		end
	elseif (sequence == SEQ_000) then
		if (classId == RUMINATING_ELEZEN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2");
		elseif (classId == WELL_DRESSED_MIDLANDER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_3");
		elseif (classId == QUEERLY_CORDINATED_LALAFELL) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_4");
		elseif (classId == SILVER_HAIR_SUDUCTRESS) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_5");
		elseif (classId == WAXEN_FACE_WIDOWER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_6");
		elseif (classId == LUMBERING_LALAFELL) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_7");
		elseif (classId == MOMODI) then
			if (npc.CurrentArea.IsPrivate()) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
				GetWorldManager():WarpToPublicArea(player);
				quest:StartSequence(SEQ_005);
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEventMomodiStart");
				GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, -73.811, 195, 78.759, -0.448);
			end
		end
		player:EndEvent();
	elseif (sequence == SEQ_005) then
		if (classId == MOMODI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
		elseif (classId == QATA_NELHAH) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_3");
		elseif (classId == MAMMET) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_4");
		elseif (classId == GAGARUNA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent015");
			player:EndEvent();
			quest:StartSequence(SEQ_010);
		end
		player:EndEvent();
	elseif (sequence == SEQ_010) then
		if (classId == GAGARUNA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent015_2");
		elseif (classId == QATA_NELHAH) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent015_3");
		elseif (classId == MAMMET) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent015_4");
		elseif (classId == KOCKACHA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent015_5");
		elseif (classId == PATIENT_CROW) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent015_6");
		elseif (classId == GWENOLIE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent015_7");
		elseif (classId == RAGINHART) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent015_8");
		end
		player:EndEvent();
	elseif (sequence == SEQ_015) then
		if (classId == GREINFARR) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
		elseif (classId == FLHAMINN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_3");
		elseif (classId == QOQOBA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_4");
		elseif (classId == CORGUEVAIS) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_5");
		elseif (classId == POPOKKULI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_6");
		elseif (classId == SESERUKKA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_7");
		elseif (classId == NIELLEFRENSE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_8");
		elseif (classId == THANCRED) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent021");
			GetWorldManager():DoZoneChange(player, 175, nil, 0, 15, -149.812, 185.454, 123.459, 2.411);
			quest:NewNpcLsMsg(1);
			quest:StartSequence(SEQ_025);
			player:EndEvent();
		end
	elseif (sequence == SEQ_025) then
		if (classId == GAGARUNA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent021_2"); --Needs investigating for retail accuracy.
		elseif (classId == MOMODI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent025_2"); --Needs investigating for retail accuracy.
		elseif (classId == DEAUSTIE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent028");
			quest:StartSequence(SEQ_028);
		end
	elseif (sequence == SEQ_035) then
		if (classId == FLHAMINN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040_2");
		elseif (classId == ASCILLIA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
			GetWorldManager():DoZoneChange(player, 170, nil, 0, 15, 314.750, 247.899, -894, 2.363);
			quest:NewNpcLsMsg(1);
			quest:StartSequence(SEQ_040);
		end
	elseif (sequence == SEQ_040) then
		if (classId == GEGEISSA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent055_2");
		elseif (classId == YAYAKE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, -344.473, 206, 243.186, 1.704);
			quest:StartSequence(SEQ_050);
		end
	elseif (sequence == SEQ_045) then
		if (classId == YAYAKE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, -344.473, 206, 243.186, 1.704);
			quest:StartSequence(SEQ_050);
		end
	elseif (sequence == SEQ_055) then
		if (classId == THANCRED) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070_2");
		elseif (classId == SWOLLEN_EYED_STRUMPET) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070_3");
		elseif (classId == SINETTE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070_4");
		elseif (classId == ZSSAPA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070_5");
		elseif (classId == DOWNCAST_DERELICT) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070_6");
		elseif (classId == AILING_ROEGADYN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070_7");
		elseif (classId == NIELLEFRENSE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080");
			player:EndEvent();
			quest:StartSequence(SEQ_060);
		elseif (classId == YAYAKE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, -344.473, 206, 243.186, 1.704);
			quest:StartSequence(SEQ_050);
		end
	elseif (sequence == SEQ_060) then
		if (classId == THANCRED) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070_2");
		elseif (classId == SWOLLEN_EYED_STRUMPET) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070_3");
		elseif (classId == SINETTE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070_4");
		elseif (classId == ZSSAPA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070_5");
		elseif (classId == DOWNCAST_DERELICT) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070_6");
		elseif (classId == AILING_ROEGADYN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070_7");
		elseif (classId == NIELLEFRENSE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_2");
			player:EndEvent();
		elseif (classId == YAYAKE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, -344.473, 206, 243.186, 1.704);
			quest:StartSequence(SEQ_050);
		end
	elseif (sequence == SEQ_070) then
		if (classId == YAYAKE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent090_2");
		elseif (classId == GOGOFU) then --Needs Investigating for retail accuracy.
			callClientFunction(player, "delegateEvent", player, quest, "processEvent1000_4");
		elseif (classId == MOMODI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent100");
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 300, 1, 1, 2);
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 15000)
			player:EndEvent();
			player:CompleteQuest(quest);
			player:AddItem(1000001, 15000);
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 15000);
			currency = 1000001;
			location = INVENTORY_CURRENCY;
			player:AddExp(30000, player:GetCurrentClassOrJobId(), 0);
			return;	
		end
	end
	player:EndEvent();
	quest:UpdateENPCs();
end

function onPush(player, quest, npc)
	local data = quest:GetData();
    local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
	
	if (sequence == SEQ_010) then
		if (classId == GAMBHALL_TRIGG) then
			GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 6, 15, -204.9441, 0, -159.944, 1.591);
		elseif (classId == ROOM_TRIGG) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020");
			GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 7, 15, -134.301, 1, -159.996, 1.581);
			--This PrivateArea has a set of chairs in front of the desk, Thancred is sitting in one of them.
			--Needs to be added. Mapobj's?
			quest:StartSequence(SEQ_015);
			player:EndEvent();
		end	
	elseif (sequence == SEQ_015) then
		if (classId == GAMBHALL_TRIGG) then
			GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 6, 15, -204.9441, 0, -159.944, 1.591);
			quest:StartSequence(SEQ_010);
		end
	elseif (sequence == SEQ_028) then
		if (classId == FLHAMINN_TRIGG) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030");
			quest:StartSequence(SEQ_030);
		end
	elseif (sequence == SEQ_030) then
		if (classId == NORTH_THANTRIGG) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040");
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, 290.640, 245.201, -875.147, 2.315);
			quest:StartSequence(SEQ_035);
		end
	elseif (sequence == SEQ_035) then
		if (classId == FLHAMINN_TRIGG) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030");
			quest:StartSequence(SEQ_030);
		elseif (classId == NORTH_THANTRIGG) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040");
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 0, 290.640, 245.201, -875.147, 2.315);
		end
	elseif (sequence == SEQ_050) then
		if (classId == THAUMA_TRIGG) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070");
			GetWorldManager():WarpToPosition(player, -294.941, 206, 231.882, -1.567);
		elseif (classId == THAUMA2_TRIGG) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070");
			GetWorldManager():WarpToPosition(player, -294.941, 206, 231.882, -1.567);
		end
		quest:StartSequence(SEQ_055);
	elseif (sequence == SEQ_060) then
		if (classId == THAUMA_TRIGG) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent090");
			GetWorldManager():DoZoneChange(player, 209, nil, 0, 15, -294.941, 206, 231.882, -1.567);
			quest:NewNpcLsMsg(1);
		elseif  (classId == THAUMA2_TRIGG) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent090");
			GetWorldManager():DoZoneChange(player, 209, nil, 0, 15, -294.941, 206, 231.882, -1.567);
			quest:NewNpcLsMsg(1);
		end
	quest:StartSequence(SEQ_070);
	end
	player:EndEvent();
	quest:UpdateENPCs();
end

function onNotice(player, quest, target)
	local sequence = quest:getSequence();
end

function onNpcLS(player, quest, from, msgStep)
	local sequence = quest:getSequence();
	local msgPack;

	if (from == 1) then
		-- Get the right msg pack
		if (sequence == SEQ_025) then
			msgPack = 1;
	elseif (sequence == SEQ_040 or sequence == SEQ_045) then
			msgPack = 2;
	elseif (sequence == SEQ_070) then
			msgPack = 3;
		end
		
		player:SendGameMessageLocalizedDisplayName(quest, NPCLS_MSGS[msgPack][msgStep], MESSAGE_TYPE_NPC_LINKSHELL, 1500014);
		if (msgStep >= #NPCLS_MSGS[msgPack]) then
			quest:EndOfNpcLsMsgs();
		else
			quest:ReadNpcLsMsg();
		end
		
		-- Handle anything else
		if (sequence == SEQ_040) then
			quest:StartSequenceForNpcLs(SEQ_045);
		end
	end
	
	player:EndEvent();
end

function getJournalInformation(player, quest)
end

function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();
	local data = quest:GetData();
	local possibleMarkers = {};

    if (sequence == SEQ_000) then
        table.insert(possibleMarkers, MRKR_MOMODI);
	elseif (sequence == SEQ_005) then
		table.insert(possibleMarkers, MRKR_GAGARUNA);
	elseif (sequence == SEQ_010) then
		table.insert(possibleMarkers, MRKR_GAMBLINGHALL);
	elseif (sequence == SEQ_015) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_THANCRED);
		else
			table.insert(possibleMarkers, MRKR_GAMBLINGHALL);
		end
	elseif (sequence == SEQ_025) then
		table.insert(possibleMarkers, MRKR_DEAUSTIE);
	elseif (sequence == SEQ_028) then
		table.insert(possibleMarkers, MRKR_NORTHERNTHANALAN);
	elseif (sequence == SEQ_030) then
		table.insert(possibleMarkers, MRKR_NORTHERNTHANALAN);
	elseif (sequence == SEQ_035) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_ASCILLIA);
		else
			table.insert(possibleMarkers, MRKR_NORTHERNTHANALAN);
		end
	elseif (sequence == SEQ_045) then
		table.insert(possibleMarkers, MRKR_YAYAKE);
	elseif (sequence == SEQ_050) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_HALL);
		else
			table.insert(possibleMarkers, MRKR_YAYAKE);
		end
	elseif (sequence == SEQ_055) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_NIELLEFRESNE);
		else
			table.insert(possibleMarkers, MRKR_YAYAKE);
		end
	elseif (sequence == SEQ_060) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_HALL);
		else
			table.insert(possibleMarkers, MRKR_YAYAKE);
		end
	elseif (sequence == SEQ_070) then
		table.insert(possibleMarkers, MRKR_MOMODI);
    end
    return unpack(possibleMarkers)

end