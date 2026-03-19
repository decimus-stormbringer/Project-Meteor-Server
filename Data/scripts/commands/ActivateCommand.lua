require ("global")

--[[

ActivateCommand Script

Switches between active and passive mode states

--]]

function onEventStarted(player, command, eventType, eventName)

	if (player.currentMainState == 0x0000) then
		player:ChangeState(2);
    elseif (player.currentMainState == 0x0002) then
        player:ChangeState(0);
	end

	player:endEvent();
	sendSignal("playerActive");
end

--function onEventStarted(player, command, eventType, eventName)
--    
--	if (player.currentMainState == 0x0000) then
--		player.Engage(0, 0x0002);
--    elseif (player.currentMainState == 0x0002) then
--		player:ChangeState(0);
        --player.Disengage(0x0000);
--	end		
--	player:endEvent();
--	sendSignal("playerActive");
--end;