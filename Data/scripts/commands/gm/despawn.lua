require("global");

properties = {
    permissions = 0,
    parameters = "d",
    description = "despawns an actor",
}

function onTrigger(player, npc, targetId, targetActor)

	local messageID = MESSAGE_TYPE_SYSTEM_ERROR;
    local sender = "[Info] ";

	local targetActor = player.CurrentArea.FindActorInArea(player.currentTarget) or nil;

	if (targetActor != nil) then
		targetId = (targetActor.Id);
		npc.Despawn(targetActor);  -- Doesn't work, results in nil value?'
	else
        player:SendMessage(messageID, sender, "No target selected");
        return
    end
end