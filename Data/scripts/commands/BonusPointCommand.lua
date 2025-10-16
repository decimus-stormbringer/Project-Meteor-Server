--[[

BonusPointCommand Script

Functions:

operateUI(pointsAvailable, pointsLimit, str, vit, dex, int, min, pie)

--]]

require ("global")

function onEventStarted(player, actor, eventType, eventName)
	local points = player:GetAttributePointAllotment();

	--player:RunEventFunction("delegateCommand", actor, "operateUI", points.available, points.limit, points.inSTR, points.inVIT, points.inDEX, points.inINT, points.inMIN, points.inPIT);
	success, str, vit, dex, int, min, pie = callClientFunction(player, "delegateCommand", actor, "operateUI", points.TotalPoints, points.AttributeMax, 
	points.Strength, points.Vitality, points.Dexterity, points.Intelligence, points.Mind, points.Piety);

	--Do Save
	if (success == true) then
		player:SaveAttributePointAllotment(str, vit, dex, int, min, pie);
	end
	
	player:endEvent();
end