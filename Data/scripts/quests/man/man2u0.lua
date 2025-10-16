require ("global")
require ("quest")

--[[

Quest Script

Name:   Calamity Cometh
Code:   Man1u0
Id:     110011
Prereq: Golden Sacrifices (Man0u0 - 110011)
Level requirement: 13
Notes:

]]

--[[

Videos refs\details

CrossScript: ChocoboLender script for Rururaji


processEventMomodiStart			Quest Start from Momodi
processEvent000_2				Momodi: "Been hearin' naught but bad rumors of late. Dark talk of cursed magicks bringin' the dead back to life?proper nasty stuff."
processEvent005					Multiple Cutscenes and Warp into Battle Instance with Coblyns
processEvent005_2				???: "F'lhaminn's in danger? Where!? Gods, not again... What the bloody hells is goin' on?"
processEvent005_3				???: "Help us, [@SPLIT([@STRING($EB(1))], ,1)]. Take this gold powder. The beasts will be drawn to it. You must keep them away from here."
processEvent005_4				???: "The beasts will be drawn to the gold powder. Use it to keep them away from here."
processEvent005_5				???: "Use the gold dust I gave you to lure the beasts. You must not let them come near here."
processEvent005_6				???: "Lure the bloody things to me. I'll see them all dead!"
processEvent005_7				???: "Bring them to my blade."
processEvent030					Cutscene and Warp
processEvent030_2				???: "Have you come to visit a patient? F'lhaminn? Yes, she is being treated here. The door at the end of the corridor will lead you to the sickrooms. You are free to pass."
processEvent040					Cutscene and Warp
processEvent040_2				???: "I have been ordered to care for Damielliot. There are now some twenty of us tending to him."
processEvent040_3				???: "Ow! Quit it. Ow! Quit it. Ow! Quit it."
processEvent040_4				???: "Are you here to visit a patient?"
processEvent040_5				???: "I thought the rumors of F'lhaminn's accident were just that?rumors. But then I saw a gaggle of Ul'dah's most prestigious personages pass by as if they were visiting someone. Could it be true?"
processEvent050					Cutscene and Warp
processEvent050_2				???: "Please, you must help us. If you happen to see the bard Thancred, tell him to come with all haste to Amajina & Sons Mineral Concern."
processEvent060					Cutscene and Warp
processEvent065_2				???: "There's been sightin's of an exile wanderin' close to the city. Damn bold, whoever it is."
processEvent070					Cutscene
processEvent070_2				???: "So they'd already found the exile, eh? Shame, that. Still, say what you will of the city guard, them gladiators and pugilists do get things done."
processEvent080					Cutscene and Warp
processEvent085					Multiple Cutscenes and Warp
processEventSystemMessage		WorldMaster Message about Traveling to Ul'dah Market Ward



--]]

-- Sequence Numbers
SEQ_000 = 0; -- Travel to Chocobo Stables and talk to Rururaji.
SEQ_005 = 5; -- Everyone sets out after Corguevais. Set out by Chocobo Coach and give pursuit.
SEQ_010 = 10; -- Corguevais summons a swarm of Minemites. Defeat them and escape.
SEQ_015 = 15; -- Visit the Phrontistery.
SEQ_020 = 20; -- Seek out Flhammin in the sickrooms.
SEQ_025 = 25; -- Find and speak to Thancred.
SEQ_030 = 30; -- Contact Momodi via Linkpearl.
SEQ_035 = 35; -- Head to Black Brush.
SEQ_040 = 40; -- Go to U'ldah outside the Arrzaneth Ossuary (Thaumaturge's Guild).
SEQ_045 = 45; -- Niellefrense lying on ground with Ascillia by his side.
SEQ_050 = 50; -- Dark Clouds loom over Ul'dah, meteors rain down in all directions.
SEQ_055 = 55; -- Player found unconcious, brought back to Adventurer's Guild.

--SEQ_000
MOMODI                      = 1000841;
RURURAJI					= 1000840;

--SEQ_010
ASCILLIA					= 1000042;
FLHAMMIN					= 1000038;

--SEQ_015
PHRONTISTERY_TRIGGER		= 1090119;
NOGELOIX					= 1000597;

--SEQ_020
SICKROOM_TRIGGER			= 1090118;
PRIVATEAREA_EXIT_TRIGGER	= 1090144;
CHAPEAUED_CHAP				= 1001277;
WORRISOME_ASSISTANT			= 1001207;
WELLWASHED_LEECH			= 1001210;

--SEQ_025
SICKROOM_EXIT_TRIGGER		= 1090141;
PHRONTISTERY_EXIT_TRIGGER	= 1090168;

--SEQ_035
BLACKBRUSH_TRIGGER			= 1090169;

--SEQ_040
ARRZANETH_TRIGGER			= 1090253;

--SEQ_045
CRYPT_TRIGGER				= 1090131;

--ActorID Fixes
GOGOFU						= 1000046;
HAHAYO						= 1000047;
ROROJARU					= 1000374;

-- Msg packs for the Npc LS
NPCLS_MSGS = {
	{72, 73, 154}
};

--Counters

-- Quest Markers
MRKR_RURURAJI 				= 11001201;
MRKR_PHRONTISTERTY 			= 11001202;
MRKR_BATTLE					= 11001203;
MRKR_FLHAMMIN				= 11001204;
MRKR_BLACKBRUSH				= 11001205;
MRKR_ARRZANETH				= 11001206;
MRKR_CRYPT					= 11001207;
MRKR_MOMODI					= 11001001; --Set Temporarily until "sqrwa" is played after player is warped into Quicksand.

-- Quest Items

-- Quest Flags

function onStart(player, quest) 
    quest:StartSequence(SEQ_000);
end

function onFinish(player, quest)
end

function onStateChange(player, quest, sequence)
	local data = quest:GetData();
	
	if (sequence == SEQ_ACCEPT) then
		quest:SetENpc(MOMODI, QFLAG_TALK);
    elseif (sequence == SEQ_000) then
		quest:SetENpc(MOMODI);
		quest:SetENpc(RURURAJI, QFLAG_TALK);
	elseif (sequence == SEQ_010) then
		quest:SetENpc(ASCILLIA, QFLAG_TALK);
		quest:SetENpc(FLHAMMIN);
		quest:SetENpc(RURURAJI, QFLAG_TALK);
	elseif (sequence == SEQ_015) then
		quest:SetENpc(PHRONTISTERY_TRIGGER, QFLAG_PUSH, false, true);
		quest:SetENpc(NOGELOIX);
	elseif (sequence == SEQ_020) then
		quest:SetENpc(CHAPEAUED_CHAP);
		quest:SetENpc(WORRISOME_ASSISTANT);
		quest:SetENpc(WELLWASHED_LEECH);
		quest:SetENpc(SICKROOM_TRIGGER, QFLAG_PUSH, false, true);
		quest:SetENpc(PRIVATEAREA_EXIT_TRIGGER, QFLAG_NONE, false, true);
		quest:SetENpc(PHRONTISTERY_TRIGGER, QFLAG_PUSH, false, true);
		quest:SetENpc(HAHAYO);
	elseif (sequence == SEQ_025) then
		quest:SetENpc(CHAPEAUED_CHAP);
		quest:SetENpc(WORRISOME_ASSISTANT);
		quest:SetENpc(WELLWASHED_LEECH);
		quest:SetENpc(FLHAMMIN);
		quest:SetENpc(SICKROOM_EXIT_TRIGGER, QFLAG_PUSH, false, true);
		quest:SetENpc(PHRONTISTERY_EXIT_TRIGGER, QFLAG_PUSH, false, true);
		quest:SetENpc(PHRONTISTERY_TRIGGER, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_030) then
		quest:SetENpc(GOGOFU);
	elseif (sequence == SEQ_035) then
		quest:SetENpc(BLACKBRUSH_TRIGGER, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_040) then
		quest:SetENpc(ARRZANETH_TRIGGER, QFLAG_PUSH, false, true);
	elseif (sequence == SEQ_045) then
		quest:SetENpc(CRYPT_TRIGGER,  QFLAG_PUSH, false, true);
		quest:SetENpc(ARRZANETH_TRIGGER, QFLAG_PUSH, false, true);
		quest:SetENpc(ROROJARU);
	elseif (sequence == SEQ_055) then
		quest:SetENpc(MOMODI, QFLAG_REWARD);
		quest:SetENpc(ROROJARU);
    end
end

function onTalk(player, quest, npc)
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();
	
	if (sequence == SEQ_ACCEPT) then
		if(classId == MOMODI) then
		callClientFunction(player, "delegateEvent", player, quest, "processEventMomodiStart");
			player:EndEvent();
			player:AcceptQuest(quest, true);
			return;
		end
	elseif (sequence == SEQ_000) then
		if (classId == MOMODI) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2");
		end
	elseif (sequence == SEQ_010) then
		if (classId == ASCILLIA) then
			player:SendMessage(0x1D,"",">Combat Sequence Still Work in Progress");
			wait(3);
			player:SendMessage(0x1D,"",">Quest Will Automatically Progress in 5 seconds");
			wait(5);
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030");
			GetWorldManager():DoZoneChange(player, 175, nil, 0, 0, -36.571, 192, 19.598, -3.019)
			player:SendGameMessage(GetWorldMaster(), 50012, 0x20);
			quest:StartSequence(SEQ_015);
		end
	elseif (sequence == SEQ_015) then
		if (classId == NOGELOIX) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030_2");
		end
	elseif (sequence == SEQ_020) then
		if (classId == WORRISOME_ASSISTANT) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040_2");
	elseif (classId == WELLWASHED_LEECH) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040_4");
	elseif (classId == CHAPEAUED_CHAP) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040_5");
		end
	elseif (sequence == SEQ_025) then
		if (classId == FLHAMMIN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_2");
		elseif (classId == WORRISOME_ASSISTANT) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040_2");
		elseif (classId == WELLWASHED_LEECH) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040_4");
		elseif (classId == CHAPEAUED_CHAP) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040_5");
		end
	elseif (sequence == SEQ_055) then
		if (classId == MOMODI) then
--			local hasIssuance = player:GetItemPackage(INVENTORY_KEYITEMS):HasItem(gcIssuances[classId]);
			callClientFunction(player, "delegateEvent", player, quest, "processEventSystemMessage", 1);
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 300, 1, 1, 2);
			player:CompleteQuest(quest);
			player:AddItem(1000001, 30000);
--			player:AddItem(2001006, 1);
--			player:SendGameMessage(GetWorldMaster(), 25117, 0x20, 2001006);
			player:SendGameMessage(GetWorldMaster(), 25031, 0x20, 30000);
			player:AddExp(50000, player:GetCurrentClassOrJobId(), 0);	
		end
	end
	player:EndEvent();
	quest:UpdateENPCs();
end

function onPush(player, quest, npc)
	local data = quest:GetData();
    local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
	
	if (sequence == SEQ_015) then
		if (classId == PHRONTISTERY_TRIGGER) then	
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040");
			GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 8, 15, -204.9441, 0, -159.944, 1.591);
			quest:StartSequence(SEQ_020);
			player:EndEvent();
		end
	elseif (sequence == SEQ_020) then	
		if (classId == SICKROOM_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 9, -160.687, 0, -131.861, -0.578);
			quest:StartSequence(SEQ_025);
		elseif (classId == PRIVATEAREA_EXIT_TRIGGER) then
			GetWorldManager():DoZoneChange(player, 209, nil, 0, 15, -215.248, 229.5, 297.833, 2.895);
			quest:StartSequence(SEQ_015);
			player:EndEvent();
		elseif (classId == PHRONTISTERY_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040");
			GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 8, 15, -204.9441, 0, -159.944, 1.591);
			player:EndEvent();
		end
	elseif (sequence == SEQ_025) then
		if (classId == SICKROOM_EXIT_TRIGGER) then
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 10, -148.108, 2, -178.924, -1.620);
		
		elseif (classId == PHRONTISTERY_EXIT_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			GetWorldManager():DoZoneChange(player, 209, nil, 0, 15, -215.248, 229.5, 297.833, 2.895);
			player:EndEvent();
			quest:NewNpcLsMsg(1);
			quest:StartSequence(SEQ_030);
		elseif (classId == PHRONTISTERY_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040");
			GetWorldManager():DoZoneChange(player, 181, "PrivateAreaMasterPast", 8, 15, -204.9441, 0, -159.944, 1.591);
			quest:StartSequence(SEQ_020);
			player:EndEvent();
		end
	elseif (sequence == SEQ_035) then
		if (classId == BLACKBRUSH_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070");
			quest:StartSequence(SEQ_040);
		end
	elseif (sequence == SEQ_040) then
		if (classId == ARRZANETH_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080");
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 7, -250.265, 202, 209.839, -0.181);
			quest:StartSequence(SEQ_045);
		end
	elseif (sequence == SEQ_045) then
		if (classId == ARRZANETH_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080");
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 7, -250.265, 202, 209.839, -0.181);
		elseif (classId == CRYPT_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent085");
			GetWorldManager():DoZoneChange(player, 175, nil, 0, 15, -63.546, 195, 76.404, -2.847);
			quest:StartSequence(SEQ_055);
		end
	end
	player:EndEvent();
	quest:UpdateENPCs()
end


function onNotice(player, quest, target)
	local sequence = quest:getSequence();
end

function onNpcLS(player, quest, from, msgStep)
	local sequence = quest:getSequence();
	local msgPack;

	if (from == 1) then
		-- Get the right msg pack
		if (sequence == SEQ_030 or sequence == SEQ_035) then
			msgPack = 1;
		end
	end


	player:SendGameMessageLocalizedDisplayName(quest, NPCLS_MSGS[msgPack][msgStep], MESSAGE_TYPE_NPC_LINKSHELL, 1500014);
	if (msgStep >= #NPCLS_MSGS[msgPack]) then
		quest:EndOfNpcLsMsgs();
	else
		quest:ReadNpcLsMsg();
	end
		
		-- Handle anything else
	if (sequence == SEQ_030) then
		quest:StartSequenceForNpcLs(SEQ_035);
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
        table.insert(possibleMarkers, MRKR_RURURAJI);
	elseif (sequence == SEQ_010) then
		if (player.CurrentArea.IsPublic()) then
			table.insert(possibleMarkers, MRKR_RURURAJI);
		end
	elseif (sequence == SEQ_015) then
        table.insert(possibleMarkers, MRKR_PHRONTISTERTY);
	elseif (sequence == SEQ_020) then
		if (player.CurrentArea.IsPublic()) then
			table.insert(possibleMarkers, MRKR_PHRONTISTERTY);
		end
	elseif (sequence == SEQ_025) then
		if (player.CurrentArea.IsPublic()) then
			table.insert(possibleMarkers, MRKR_PHRONTISTERTY);
		end
	elseif (sequence == SEQ_035) then
        table.insert(possibleMarkers, MRKR_BLACKBRUSH);
	elseif (sequence == SEQ_040) then
        table.insert(possibleMarkers, MRKR_ARRZANETH);
	elseif (sequence == SEQ_045) then
		if (player.CurrentArea.IsPrivate()) then
			table.insert(possibleMarkers, MRKR_CRYPT);
		else
			table.insert(possibleMarkers, MRKR_ARRZANETH);
		end
	elseif (sequence == SEQ_055) then
        table.insert(possibleMarkers, MRKR_MOMODI);
    end
    return unpack(possibleMarkers)

end