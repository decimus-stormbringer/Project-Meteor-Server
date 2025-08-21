--[[

PopulaceFlyingShip Script

Functions:

eventIn(player, hasTicket, nil?, travelPrice) - If hasTicket == nil, say no money text.
eventOut(isAborting) - Set isAborting to 30010 if player didn't "use" the airship. Shows no refund warning.
eventNG(player) - Message said when player is talking to the wrong npc.

--]]

require ("global")

function init(npc)
	return false, false, 0, 0;	
end


function onEventStarted(player, npc, eventType, eventName, triggerName)
	player.UpdatePosition();
	local classId = npc:GetActorClassId();
	local zoneId = player.CurrentArea.ZoneId;
	local currency = 1000001;

	-- Special case for A Slippery Stone and Cutthroat Prices
	if (player:HasQuest(110737) == true) then
		require ("quests/etc/etc3g3");
		local quest = player:GetQuest("Etc3g3");
		if (quest:GetSequence() == SEQ_000) then			
			local choice = callClientFunction(player, "delegateEvent", player, quest, "processEvent_005");
			if (choice == 1) then
				quest:StartSequence(SEQ_001);
				addPlayerToAirship(player, 2);
			end						
			player:EndEvent();
			return;
		end
	elseif (player:HasQuest(110728) == true) then
		require ("quests/etc/etc3u3");
		local quest = player:GetQuest("Etc3u3");
		if (quest:GetSequence() == SEQ_000) then			
			local choice = callClientFunction(player, "delegateEvent", player, quest, "processEvent_005");
			if (choice == 1) then
				quest:StartSequence(SEQ_001);
				addPlayerToAirship(player, 3);
			end						
			player:EndEvent();
			return;
		end
	end
	
	-- Otherwise normal operation
	local farePrice				= 5000;		--price to ride airship
	local flagDestinationLimsa		= false;	
	local flagDestinationGridania	= false;	--set flags to True depending on player selection.  
	local flagDestinationUldah		= false;	 

	-- Purchase ticket, warp player to other side of gate, and set destination flag. 
	if (classId == 1500003 or classId == 1500208 or classId == 1500055) then	-- Entry Gate NPCs	
	choice = callClientFunction(player, "eventIn", player, false, nil, farePrice);
		if (choice == 1) then
			-- Checks if player has enough gil and purchases fare. 
			if (player:GetItemPackage(INVENTORY_CURRENCY):HasItem(currency, farePrice)) then
				player:GetItemPackage(INVENTORY_CURRENCY):removeItem(currency, farePrice);
				if (zoneId == 133) then --If Limsa
					GetWorldManager():WarpToPosition(player, -472, 92, 194, -0.3);					
				elseif (zoneId == 155) then	--If Gridania
					GetWorldManager():WarpToPosition(player, 54.5, -7, -1199, 0); 
				elseif (zoneId == 209) then --If Ul'dah
					GetWorldManager():WarpToPosition(player, -126, 271.2, 156.3, -1.3); 
					flagDestinationLimsa = true
					player:SendMessage(0x20, "", "Limsa flag: " ..tostring(flagDestinationLimsa));
					player:SendMessage(0x20, "", "Gridania flag: " ..tostring(flagDestinationGridania));
					player:SendMessage(0x20, "", "Ul'dah flag: " ..tostring(flagDestinationUldah));
				end
			else
				player:SendGameMessage(player, worldMaster, 25065, MESSAGE_TYPE_SYSTEM);
			end
		elseif (choice == 2) then
			-- Checks if player has enough gil and purchases fare.
			if (player:GetItemPackage(INVENTORY_CURRENCY):HasItem(currency, farePrice)) then
				player:GetItemPackage(INVENTORY_CURRENCY):removeItem(currency, farePrice);
				if (zoneId == 133) then --If Limsa
					GetWorldManager():WarpToPosition(player, -472, 92, 194, -0.3);
				elseif (zoneId == 155) then	--If Gridania
					GetWorldManager():WarpToPosition(player, 54.5, -7, -1199, 0); 
				elseif (zoneId == 209) then --If Ul'dah
					GetWorldManager():WarpToPosition(player, -126, 271.2, 156.3, -1.3); 
					flagDestinationGridania = true
					player:SendMessage(0x20, "", "Limsa flag: " ..tostring(flagDestinationLimsa));
					player:SendMessage(0x20, "", "Gridania flag: " ..tostring(flagDestinationGridania));
					player:SendMessage(0x20, "", "Ul'dah flag: " ..tostring(flagDestinationUldah));
				end
			else
				player:SendGameMessage(player, worldMaster, 25065, MESSAGE_TYPE_SYSTEM);
			end
		end
	elseif (classId == 1500209) then -- Exit Gate NPCs
		if flagDestinationLimsa then
			callClientFunction(player, "eventOut", player);
		end
--		else
--			callClientFunction(player, "eventNG", player);
--		GetWorldManager():WarpToPosition(player, -459, 91.5, 183.8, 2.75); --currently does this even when selecting "no"
	end

	player:EndEvent();
end

--[[
function addPlayerToAirship(player, city)
	if (city == 1) then
		-- Limsa Airship
		GetWorldManager():WarpToPosition(player, -764.519, -3.146, 384.154, 1.575);
		--GetWorldManager():AddPlayerToShipList(player, 2);
	elseif (city == 2) then
		-- Gridania Airship
		GetWorldManager():WarpToPosition(player, 54.47, -7, -1198.54, -0.02);
		--GetWorldManager():AddPlayerToShipList(player, 3);
	elseif (city == 3) then
		-- Ul'dah Airship
		GetWorldManager():WarpToPosition(player, -126.580, 271.2, 156.435, -1.35);
		--GetWorldManager():AddPlayerToShipList(player, 4);
	end
end
]]--