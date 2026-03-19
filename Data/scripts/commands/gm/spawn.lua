require("global");

properties = {
    permissions = 0,
    parameters = "d",
    description = "Spawns a actor",
}

function onTrigger(player, argc, actorClassId, width, height, blockCount)

	if (actorClassId == nil) then
		player:SendMessage(0x20, "", "No actor class id provided.");
		return;
	end	

    local pos = player:GetPos();
    local x = pos[1];
    local y = pos[2];
    local z = pos[3];
    local rot = pos[4];
    local zone = pos[5];

	local w = tonumber(width) or 0;
	local h = tonumber(height) or 0;
	local blocks = tonumber(blockCount) or 0;

         
	local actorClassId = tonumber(actorClassId);

	-- if battlenpc
	if (actorClassId >= 2000000 and actorClassId <= 3000000) then
		for b = 0, blocks do
			for i = 0, w do
				for j = 0, h do
					actor = player.CurrentArea:SpawnEnemy(actorClassId, "", x + (i - (w / 2) * 3), y, z + (j - (h / 2) * 3), rot);
					actor.Level = 1;
					actor:SetMod(Hp, 500);
					actor:SetMod(Attack, 0);
					actor:SetMod(Damage, 0);
					actor:SetMod(MovementSpeed, 4);
					actor:SetMobMod(Roams, 1);
					actor:SetMobMod(RoamDelay, 10);
					actor.isHostile = true;
                    actor:SetDetectionType(0);
					actor:CalculateStats();
				end
			end
			x = x + 500
		end
	--if anything else.
	else	
		for i = 0, w do
			for j = 0, h do
				actor = player.CurrentArea:SpawnActor(actorClassId, "test", x + (i - (w / 2) * 3), y, z + (j - (h / 2) * 3), rot, 0, 0);
				--actor.SetAppearance(1001149)
			end
		end
	end

	
	if (actor == nil) then
		player:SendMessage(0x20, "", "This actor class id cannot be spawned.");
	end
	
end;