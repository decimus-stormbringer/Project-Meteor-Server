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
	--local displayName = npc:GetLocalizedDisplayName();    -- Figure out how to get this to work. 

	-- if battlenpc
	if (actorClassId >= 2000000 and actorClassId <= 3000000) then
		for b = 0, blocks do
			for i = 0, w do
				for j = 0, h do
					actor = player.CurrentArea:SpawnActor(actorClassId, "", "Wharf Rat", x + (i - (w / 2) * 3), y, z + (j - (h / 2) * 3), rot, 0, 0);
					--actor.SetAppearance(1001149)
					actor.SetMaxHP(500);
					actor.SetHP(500);
					--actor.SetMod(modifiersGlobal.CanBlock, 1);
					--actor.SetMod(modifiersGlobal.AttackRange, 3);
					--actor.SetMod(modifiersGlobal.MovementSpeed, 5);
					--actor.SetMobMod(mobModifiersGlobal.Roams, 1);
					--actor.SetMobMod(mobModifiersGlobal.RoamDelay, 10);
					actor.charaWork.parameterSave.state_mainSkill[0] = 0;
					actor.charaWork.parameterSave.state_mainSkillLevel = 20;
				end
			end
			x = x + 500
		end
	--if anything else.
	else
	
		printf("%f %f %f", x, y, z);
		--local x, y, z = player.GetPos();
		for i = 0, w do
			for j = 0, h do
				actor = player.CurrentArea:SpawnActor(actorClassId, "test", x + (i - (w / 2) * 3), y, z + (j - (h / 2) * 3), rot, 0, 1014);
				actor.SetAppearance(1001149)
			end
		end
	end

	
	if (actor == nil) then
		player:SendMessage(0x20, "", "This actor class id cannot be spawned.");
	end
	
end;