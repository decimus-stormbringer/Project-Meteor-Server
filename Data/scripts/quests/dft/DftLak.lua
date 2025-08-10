require ("global")
--[[

Quest Script

Name: 	Small Talk
Code: 	DftLak
Id: 	110545

Contains all default lines for talkable npcs in the Lak Region (aka Mor Dhona).
* NOTE: This quest is active for all players at all times.
]]

-- [ActorClassId] = "client_function_name"
local defaultTalkLak = {
    [1001913] = "defaultTalkWithMemenugu_001",		--Memenugu		Camp Brittlebark
	[1001900] = "defaultTalkWithLangliva_001",		--Langliva		Camp Brittlebark
	[1001922] = "defaultTalkWithEidinsath_001",		--Eidinsath		Camp Revenant's Toll'
	
}

--[[ Unentered -- Can't find names in xtx_DisplayNames. Unimplemented NPCs?

defaultTalkWithRashaht_001
defaultTalkWithMyrganmoen_001
defaultTalkWithHidden_001
defaultTalkWithQuinquerol_001       --Possibly Serpent Commander Flutaint
defaultTalkTall_001					--Possibly Serpent Captain Tall Oak
defaultTalkWithVevina_001
defaultTalkWithJakys_001
defaultTalkWithMhenall_001
defaultTalkWithClovissoix_001
]]

function onTalk(player, quest, npc, eventName)

    local npcId = npc:GetActorClassId();
    local clientFunc = defaultTalkLak[npcId];
    				
	if (npcId == 1001913) then				
		callClientFunction(player, "delegateEvent", player, quest, clientFunc);    
	else
		callClientFunction(player, "delegateEvent", player, quest, clientFunc); 
	end
    player:EndEvent();
end

function IsQuestENPC(player, quest, npc)
	return defaultTalkLak[npc.GetActorClassId()] ~= nil;
end