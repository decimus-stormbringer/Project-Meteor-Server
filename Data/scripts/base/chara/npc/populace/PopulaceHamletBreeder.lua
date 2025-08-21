require ("global")

function init(npc)
	return false, false, 0, 0;
end

function onEventStarted(player, npc, triggerName)
	player.UpdatePosition();
	callClientFunction(player, "defTalk", player);
	player:EndEvent();
end