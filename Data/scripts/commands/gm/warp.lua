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
		-- Quick Warp Location Index
		elseif (p1 == "locations") then
				player:SendMessage(messageID, sender, string.format("List of Quick Warp Commands:"));
				player:SendMessage(messageID, sender, string.format(""));
				player:SendMessage(messageID, sender, string.format("<INNS & ADVENTURER GUILDS>"));
				player:SendMessage(messageID, sender, string.format("LimsaInn"));
				player:SendMessage(messageID, sender, string.format("GridaniaInn"));
				player:SendMessage(messageID, sender, string.format("UldahInn"));
				player:SendMessage(messageID, sender, string.format("Baderon / LimsaAG"));
				player:SendMessage(messageID, sender, string.format("Miounne / GridaniaAG"));
				player:SendMessage(messageID, sender, string.format("Momodi / UldahAG"));
				player:SendMessage(messageID, sender, string.format(""));
				player:SendMessage(messageID, sender, string.format("<TRIALS>"));
				player:SendMessage(messageID, sender, string.format("Ifrit / BowlOfEmbers"));
				player:SendMessage(messageID, sender, string.format("Garuda / HowlingEye"));
				player:SendMessage(messageID, sender, string.format("KingMog / Thornmarch"));
				player:SendMessage(messageID, sender, string.format("Darnus / Rivenroad"));
				player:SendMessage(messageID, sender, string.format("Titan  (Unfinished)"));
				player:SendMessage(messageID, sender, string.format(""));
				player:SendMessage(messageID, sender, string.format("<DUNGEONS>"));
				player:SendMessage(messageID, sender, string.format("Shposhae"));
				player:SendMessage(messageID, sender, string.format("Mistbeard"));
				player:SendMessage(messageID, sender, string.format("Cassiopeia"));
				player:SendMessage(messageID, sender, string.format("Ughamaro"));
				player:SendMessage(messageID, sender, string.format("Totorak"));
				player:SendMessage(messageID, sender, string.format("Tamtara"));
				player:SendMessage(messageID, sender, string.format("Muntuy"));
				player:SendMessage(messageID, sender, string.format("Copperbell"));
				player:SendMessage(messageID, sender, string.format("Nanawa"));
				player:SendMessage(messageID, sender, string.format("Cutters"));
				player:SendMessage(messageID, sender, string.format("Darkhold"));
				player:SendMessage(messageID, sender, string.format("Aurum"));
				player:SendMessage(messageID, sender, string.format(""));
				player:SendMessage(messageID, sender, string.format("<OTHER>"));
				player:SendMessage(messageID, sender, string.format("Island1"));
				player:SendMessage(messageID, sender, string.format("Island2"));
				player:SendMessage(messageID, sender, string.format("Island3"));
				player:SendMessage(messageID, sender, string.format("Jail"));




        else 
			updateTime = tonumber(updateTime) or 0;
			-- Warps: Inns & Adventurer Guilds
			if (string.lower(p1) == "limsainn") then
				worldManager:DoZoneChange(player, 244, nil, 0, 0, -160, 0, -160, 0);
			elseif (string.lower(p1) == "gridaniainn") then
				worldManager:DoZoneChange(player, 244, nil, 0, 0, 160, 0, 160, 0);
			elseif (string.lower(p1) == "uldahinn") then
				worldManager:DoZoneChange(player, 244, nil, 0, 0, 0, 0, 0, 0);
			elseif (string.lower(p1) == "baderon" or string.lower(p1) == "limsaag") then
				worldManager:DoZoneChange(player, 133, nil, 0, 0, -459.153, 40, 196.548, 1.905);
			elseif (string.lower(p1) == "miounne" or string.lower(p1) == "gridaniaag") then
				worldManager:DoZoneChange(player, 155, nil, 0, 0, 70.318, 4, -1204, -1.578);
			elseif (string.lower(p1) == "momodi" or string.lower(p1) == "uldahag") then
				worldManager:DoZoneChange(player, 175, nil, 0, 0, -75.351, 195, 62.343, 0.033);
			-- Warps: Trials
			elseif (string.lower(p1) == "garuda" or string.lower(p1) == "howlingeye") then
				worldManager:DoZoneChange(player, 239, nil, 0, 0, 1492, 302, -245, 2.370);
				wait(2);
				player:ChangeMusic(104);
				player.CurrentArea:ChangeWeather(8028, updateTime, player, zonewide ~= 0);
			elseif (string.lower(p1) == "ifrit" or string.lower(p1) == "bowlofembers") then
				worldManager:DoZoneChange(player, 240, nil, 0, 0, 2510, 250, 2200, 1.2);
				wait(2);
				player:ChangeMusic(23);
				player.CurrentArea:ChangeWeather(8028, updateTime, player, zonewide ~= 0);
			elseif (string.lower(p1) == "kingmog" or string.lower(p1) == "mog" or string.lower(p1) == "thornmarch") then
				worldManager:DoZoneChange(player, 238, nil, 0, 0, -2350, -22.85, -890, -1.95);
				wait(2);
				player:ChangeMusic(97);
				player.CurrentArea:ChangeWeather(8028, updateTime, player, zonewide ~= 0);
			elseif (string.lower(p1) == "darnus" or string.lower(p1) == "rivenroad") then
				worldManager:DoZoneChange(player, 257, nil, 0, 0, -7.6, -0, -7.5, 0.7);
				wait(2);
				player:ChangeMusic(108);
				player.CurrentArea:ChangeWeather(8028, updateTime, player, zonewide ~= 0);
			elseif (string.lower(p1) == "titan") then
				worldManager:DoZoneChange(player, 128, nil, 0, 0, 384, -22, -3150, 3.12);
				wait(2);
				player:ChangeMusic(90);
			-- Warps: Dungeons
			elseif (string.lower(p1) == "shposhae") then
				worldManager:DoZoneChange(player, 235, nil, 0, 0, 286, 27, 350, -3.1);
			elseif (string.lower(p1) == "mistbeard") then
				worldManager:DoZoneChange(player, 131, nil, 0, 0, -1760, 28, -1480, 0);
			elseif (string.lower(p1) == "cassiopeia") then
				worldManager:DoZoneChange(player, 132, nil, 0, 0, -1120, 29.5, -790, 0);
			elseif (string.lower(p1) == "ughamaro" or string.lower(p1) == "u'ghamaro") then
				worldManager:DoZoneChange(player, 137, nil, 0, 0, 96, 64, -2705, -3.15);
			elseif (string.lower(p1) == "totorak" or string.lower(p1) == "toto-rak") then
				worldManager:DoZoneChange(player, 159, nil, 0, 0, 880, -23, 652, 0.775);
				wait(2);
				player:ChangeMusic(5);
			elseif (string.lower(p1) == "tamtara" or string.lower(p1) == "tam-tara") then
				worldManager:DoZoneChange(player, 158, nil, 0, 0, 271, -8, -269, -2.1);
			elseif (string.lower(p1) == "muntuy" or string.lower(p1) == "mun-tuy") then
				worldManager:DoZoneChange(player, 157, nil, 0, 0, -690, 8, -1969, 2.4);
			elseif (string.lower(p1) == "copperbell") then
				worldManager:DoZoneChange(player, 172, nil, 0, 0, -775, 120, -105, 1.45);
			elseif (string.lower(p1) == "nanawa") then
				worldManager:DoZoneChange(player, 176, nil, 0, 0, 87, 184, -1020, 3);
			elseif (string.lower(p1) == "cutters") then
				worldManager:DoZoneChange(player, 246, nil, 0, 0, -910, 255, -1522, -3.1);
				wait(2);
				player:ChangeMusic(5);
			elseif (string.lower(p1) == "darkhold" or string.lower(p1) == "dzemael") then
				worldManager:DoZoneChange(player, 231, nil, 0, 0, -96, 228, 253, -3);
				wait(2);
				player:ChangeMusic(5);
			elseif (string.lower(p1) == "aurum" or string.lower(p1) == "aurumvale") then
				worldManager:DoZoneChange(player, 245, nil, 0, 0, -683, 180, 1425, 1.5);
				wait(2);
				player:ChangeMusic(5);
			-- Quick Warps: Other
			elseif (string.lower(p1) == "hope" or string.lower(p1) == "island1") then
				worldManager:DoZoneChange(player, 128, nil, 0, 0, 2048, 60.7, 1431, 0);
			elseif (string.lower(p1) == "turtleback" or string.lower(p1) == "island2") then
				worldManager:DoZoneChange(player, 237, nil, 0, 0, 3175, 0.5, 619.5, 3.14);
			elseif (string.lower(p1) == "locke" or string.lower(p1) == "island3") then
				worldManager:DoZoneChange(player, 236, nil, 0, 0, 2787, 1.105, 2340, -1.4);
			elseif (string.lower(p1) == "jail" or string.lower(p1) == "prison") then
				worldManager:DoZoneChange(player, 177, nil, 0, 0, 0, 0, 0, 0);				
			else
				player:SendMessage(messageID, sender, "Unknown parameters! Usage: "..properties.description);
			end
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