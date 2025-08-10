--[[

PopulaceCaravanAdviser Script

Functions:

adviserDeffault()       - Not a typo.  NPC dialog talking about a chocobo.  Resets their sight on you, perhaps used on closing dialog?
adviserAsk()            - Brings up a menu for caravan info, or purchasing gysahl greens
adviserAdvise()         - NPC dialog discussing feeding chocobos
adviserSales(price)     - Gysahl purchase dialog and prompt
adviserBuy()            - Dialog to play after purchasing gysahl greens
adviserBuyNG()          - NPC plays /shrug animation.  

--]]

require ("global")

function init(npc)
	return false, false, 0, 0;	
end

function onEventStarted(player, location, npc, triggerName, quantity, quality)
	local worldMaster = GetWorldMaster(); 
	local invCheck = -1;
	local gysahlPrice = 20;
	local choice = callClientFunction(player, "adviserAsk");
	local currency = 1000001;
	
    if choice == 1 then
        callClientFunction(player, "adviserAdvise");
    elseif choice == 2 then
        local purchaseChoice = callClientFunction(player, "adviserSales", gysahlPrice);
        
        if purchaseChoice == 1 then
            callClientFunction(player, "adviserBuy");
			if (player:GetItemPackage(INVENTORY_CURRENCY):HasItem(currency, gysahlPrice)) then
				invCheck = player:GetItemPackage(INVENTORY_NORMAL):AddItem(3011317); 
    
				if (invCheck == INV_ERROR_FULL) then
				-- Your inventory is full.
					player:SendGameMessage(player, worldMaster, 60022, MESSAGE_TYPE_SYSTEM);
				elseif (invCheck == INV_ERROR_SYSTEM_ERROR) then
					player:SendMessage(0x20, "", "[DEBUG] Server Error on adding item.");
				elseif (invCheck == INV_ERROR_SUCCESS) then
					player:GetItemPackage(INVENTORY_CURRENCY):removeItem(currency, gysahlPrice);
					player:SendGameMessage(player, worldMaster, 25061, MESSAGE_TYPE_SYSTEM, 3011317, 1, 1, gysahlPrice); 
				end
			end
		elseif purchaseChoice == 2 then
			callClientFunction(player, "adviserBuyNG");
        end
    elseif choice == 3 then
        callClientFunction(player, "adviserDeffault")
    end

	player:EndEvent();
end