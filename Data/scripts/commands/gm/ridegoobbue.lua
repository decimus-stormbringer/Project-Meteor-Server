-- Command still WIP. Does not work.

require ("global")

function onEventStarted(player, actor, eventType, eventName, isGoobbue)

	if (player:GetState() == 0) then
		
		worldMaster = GetWorldMaster();
		player:ChangeMusic(98, MUSIC_FADEIN);
        player:SendGameMessage(player, worldMaster, 26019, 0x20);
        player:SetMountState(2);
		player:ChangeSpeed(0.0, 3.6, 9.0, 9.0);
		player:ChangeState(15);

	end
end