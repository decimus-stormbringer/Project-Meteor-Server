require("global");

properties = {
    permissions = 0,
    parameters = "sssssss",
    description =
[[
Warp player or <targetname> to a location from a list, or enter a zoneID with coordinates.
!warp <spawn list> |
!warp <zone> <x> <y> <z> |
!warp <zone> <x> <y> <z> <privateArea> <targetname> |
]],
}

function onTrigger(player, argc, p1, p2, p3, p4, privateArea, privateAreaType, name, lastName)

    if name then
        if lastName then
            player = GetWorldManager():GetPCInWorld(name.." "..lastName) or nil;
        else
            player = GetWorldManager():GetPCInWorld(name) or nil;
        end;
    end;
    
    if not player then
        printf("[Command] [warp] error! No target or player specified!");
        return;
    end;
    
    local messageID = MESSAGE_TYPE_SYSTEM_ERROR;
    local sender = "[warp] ";
    
    -- we're getting a list/array from c# so 0 index
    local pos = player:GetPos();
    local player_x = pos[1];
    local player_y = pos[2];
    local player_z = pos[3];
    local player_rot = pos[4];
    local player_zone = pos[5];
    
    local worldManager = GetWorldManager();
    privateAreaType = privateAreaType or 0;
	
    if argc >= 3 then
        
        if argc == 3 then
            local x = tonumber(applyPositionOffset(p1, player_x)) or player_x;
            local y = tonumber(applyPositionOffset(p2, player_y)) or player_y;
            local z = tonumber(applyPositionOffset(p3, player_z)) or player_z;
            
            player:SendMessage(messageID, sender, string.format("setting coordinates X:%d Y:%d Z:%d within current zone (%d)", x, y, z, player_zone));

            worldManager:DoPlayerMoveInZone(player, x, y, z, player_rot, 0x00);
        else
            local zone = tonumber(applyPositionOffset(p1, player_zone)) or player_zone;
            local x = tonumber(applyPositionOffset(p2, player_x)) or player_x;
            local y = tonumber(applyPositionOffset(p3, player_y)) or player_y;
            local z = tonumber(applyPositionOffset(p4, player_z)) or player_z;
            if privateArea == nil then privateArea = nil end;
            if privateAreaType == nila then privateAreaType = 0 end;
            player:SendMessage(messageID, sender, string.format("setting coordinates X:%d Y:%d Z:%d to new zone (%d) private area:%s", x, y, z, zone, privateArea or "unspecified"));
            worldManager:DoZoneChange(player, zone, privateArea, tonumber(privateAreaType), 0x02, x, y, z, 0.00);
        end
  
    elseif (argc == 1) then -- Switch city zone
            
        local commands = { ["SWITCH"] = 1, ["S"] = 1, ["FLIP"] = 1, ["F"] = 1, ["TOWN"] = 1};
		
--		if (p1 == "Baderon") then
--			worldManager:DoZoneChange(player, 133, nil, 0, 0, -459.153, 40, 196.548, 1.905);
--		elseif (p1 == "Miounne") then
--			worldManager:DoZoneChange(player, 155, nil, 0, 0, 70.318, 4, -1204, -1.578);
--		elseif (p1 == "Momodi") then
--			worldManager:DoZoneChange(player, 155, nil, 0, 0, 66, 4, -1205, -2.152);
--		end

        if (commands[string.upper(p1)]) then
            local zones = {
                        [133] = {133, 230},
                        [155] = {155, 206},
                        [175] = {175, 209},
                        [206] = {206, 155},
                        [209] = {209, 175},
                        [230] = {230, 133}
                        }
                 
            if (player_zone == zones[player_zone][1]) then 
                worldManager:DoZoneChange(player, zones[player_zone][2], "", 0, 0x16, player_x, player_y, player_z, player_rot);
                player:SendMessage(messageID, sender, string.format("setting coordinates X:%d Y:%d Z:%d to new zone (%d) private area:%s", player_x, player_y, player_z, zones[player_zone][2], privateArea or "unspecified"));
            end
		-- Warp to Adventurer Guild Instances
        elseif (p1 == "Baderon" or p1 == "baderon" or p1 == "BADERON") then
			worldManager:DoZoneChange(player, 133, nil, 0, 0, -459.153, 40, 196.548, 1.905);
		elseif (p1 == "Miounne" or p1 =="miounne" or p1 == "MIOUNNE") then
			worldManager:DoZoneChange(player, 155, nil, 0, 0, 70.318, 4, -1204, -1.578);
		elseif (p1 == "Momodi" or p1 == "momodi" or p1 == "MOMODI") then
			worldManager:DoZoneChange(player, 175, nil, 0, 0, -75.351, 195, 62.343, 0.033);
		else
            player:SendMessage(messageID, sender, "Unknown parameters! Usage: "..properties.description);
        end
    else
        player:SendMessage(messageID, sender, "Unknown parameters! Usage: "..properties.description);
    end;
end;

function applyPositionOffset(str, offset)
    local s = str;
    if s:find("@") then
        s = tonumber(s:sub(s:find("@") + 1, s:len()));
        if s then s = s + offset end;
    end
    print(s);
    return s;
end;