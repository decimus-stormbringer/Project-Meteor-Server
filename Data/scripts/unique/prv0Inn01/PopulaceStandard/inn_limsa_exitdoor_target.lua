require ("global")

function onEventStarted(player, npc)
	defaultSea = GetStaticActor("DftSea");
	choice = callClientFunction(player, "delegateEvent", player, defaultSea, "defaultTalkWithInn_ExitDoor", nil, nil, nil);
		
	if (choice == 1) then		
		GetWorldManager():DoZoneChange(player, 133, nil, 0, 15, -434.35, 40, 203.3, -2.67);
	end
	
	player:endEvent();
end