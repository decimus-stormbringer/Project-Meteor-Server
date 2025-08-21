--[[

ChocoboRideCommand Script

Handles mounting and dismounting the Chocobo and Goobbue

--]]

require ("global")

cities = 
	{133, 230, 175, 209, 155, 206};

dungeons =
	{131, 132, 137, 157, 158, 159, 176, 178, 231, 235, 245, 246, 252, 253, 254, 255};

function checkZones(list, value)
	for _, v in ipairs(list) do
		if v == value then
			return true
		end
	end
	return false
end

function onEventStarted(player, actor, eventType, eventName, isGoobbue)
    zoneId = player.CurrentArea.ZoneId;
	worldMaster = GetWorldMaster();  
	
	if (player:GetState() == 0) then         
		if (checkZones(cities, zoneId) or checkZones(dungeons, zoneId)) then
			player:SendGameMessage(player, worldMaster, 26020, 0x20);
			player:EndEvent();
		else
			if (isGoobbue ~= true) then
				player:ChangeMusic(83, MUSIC_FADEIN);
				player:SendGameMessage(player, worldMaster, 26001, 0x20);
				player:SetMountState(1);
			else
				player:ChangeMusic(98, MUSIC_FADEIN);
				player:SendGameMessage(player, worldMaster, 26019, 0x20);
				player:SetMountState(2);
			end
        
			player:ChangeSpeed(0.0, 3.6, 9.0, 9.0);
			player:ChangeState(15);
		end

	else
        player:ChangeMusic(player.currentArea.bgmDay, MUSIC_FADEIN);
        
        if (player.rentalExpireTime != 0) then
            player:SendGameMessage(player, worldMaster, 26004, 0x20); --You dismount.
        else
            if (player:GetMountState() == 1) then
                player:SendGameMessage(player, worldMaster, 26003, 0x20); --You dismount X.
            else
                player:SendGameMessage(player, worldMaster, 26021, 0x20); --You dismount your Gobbue.
            end
        end
        
        player:SetMountState(0);
        player:ChangeSpeed(0.0, 2.0, 5.0, 5.0)
        player:ChangeState(0); 
    end    
    player:EndEvent();
end