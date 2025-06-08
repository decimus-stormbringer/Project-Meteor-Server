require ("global")


function init(npc)
	return false, false, 0, 0;	
end

function onEventStarted(player, npc, quest, eventType, eventName)
	defaultFst = GetStaticActor("DftFst");
	choice = callClientFunction(player, "delegateEvent", player, defaultFst, "defaultTalkWithInn_ExitDoor", nil, nil, nil);
	
	if (choice == 1) then
		posx = player:GetPos()[1];
		if (posx >= -180 and posx <= -140) then
--			GetWorldManager():DoZoneChange(player, 1);
			GetWorldManager():DoZoneChange(player, 133, nil, 0, 15, -434.35, 40, 203.3, -2.67);
		elseif (posx >= 140 and posx <= 180) then
--			GetWorldManager():DoZoneChange(player, 1);
			GetWorldManager():DoZoneChange(player, 155, nil, 0, 15, 58.5, 4, -1220, 0.852);
		elseif (posx >= -20 and posx <= 20) then
--			GetWorldManager():DoZoneChange(player, 1);
			GetWorldManager():DoZoneChange(player, 175, nil, 0, 15, -61.2, 195, 77.7, -2.6);
		end
	end
	
	player:EndEvent();	
end