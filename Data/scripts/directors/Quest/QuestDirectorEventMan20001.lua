require ("global")
require ("quests/man/man200")

function init()
	return "/Director/Quest/QuestDirectorEventMan20001";
end

SNPC_START		= 1070000;
SNPC_END		= 1070116;
TESTCOMPANION	= 1070013;

function onCreateContentArea(player, director, contentArea, contentGroup)
	local quest = player:GetQuest("Man200");
	local data = quest:GetData();

	pathcompanion = contentArea:SpawnActor(1070000 + player:GetSNpcSkin(), "pathcompanion", -203.470, 0, -159.578, 1.552);
	
 	contentGroup:AddMember(director);
	contentGroup:AddMember(pathcompanion);
end

--[[
function onStateChange(player, quest, sequence)
	local quest = player:GetQuest("Man200");
	local data = quest:GetData();
	require ("quests/man/man200")

	if (sequence == SEQ_027) then
		quest:SetENpc(SNPC_START + player:GetSNpcSkin());
	end
end
]]--
