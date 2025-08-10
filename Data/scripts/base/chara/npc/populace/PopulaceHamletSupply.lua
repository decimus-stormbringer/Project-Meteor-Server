require ("global")

function init(npc)
	return false, false, 0, 0;
end

function onEventStarted(player, npc)
	player:EndEvent();
end

--NPC Script WIP