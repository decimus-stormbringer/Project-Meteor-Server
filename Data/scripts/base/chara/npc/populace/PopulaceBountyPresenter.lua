--[[

PopulaceBountyPresenter Script

Functions:

eventLowerLevel(player) -
eventAlreadyPresent(player) - 
eventBeforePresent(player) -
eventAfterPresent(player) -
eventJail(player, bool) -

--]]

require ("global")

function init(npc)
	return false, false, 0, 0;	
end

function onEventStarted(player, npc, triggerName)
	local playerLevel = player.GetLevel();
	local hasGoobbue = player.hasGoobbue;
	local zone = player.CurrentArea.ZoneId;

	if (zone == 130) then
		if (hasGoobbue == false) then
			if(playerLevel >= 30) then
				--Give Goobbue Mount to Player.
				callClientFunction(player, "eventBeforePresent", player);
				player:GetItemPackage(INVENTORY_KEYITEMS):AddItem(2001013);
				player:SendGameMessage(GetWorldMaster(), 25248, 0x20, 2001013);
				player:SendDataPacket("attention", GetWorldMaster(), "", 25248, 2001013);
				player:IssueGoobbue();
				callClientFunction(player, "eventAfterPresent", player);
			else
				--Player not high enough level.
				callClientFunction(player, "eventLowerLevel", player);
			end
		else
			--Player already has mount
			callClientFunction(player, "eventAlreadyPresent", player);
		end
	elseif (zone == 177) then
		--Jail sequence for quest 'Private Eyes'. Move NPC to PrivateArea during quest scripting.
		callClientFunction(player, "eventJail", player, true);
		GetWorldManager():DoZoneChange(player, 133, nil, 0, 2, -497.45, 40, 212, 1.95);
	end
	player:EndEvent();
end