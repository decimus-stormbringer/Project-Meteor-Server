require("global");

properties = {
    permissions = 0,
    parameters = "ssss",
    description =
[[
Change the weather visual to <id> and optional <transition> for player.
!weather <id> |
!weather <id> <transition> |
]],
}

function onTrigger(player, argc, weather, updateTime, zonewide)
	-- todo: change weather
    local messageID = MESSAGE_TYPE_SYSTEM_ERROR;
    local sender = "[weather] ";
    local message = "unable to change weather";
    
    if player then
		weather = tonumber(weather) or tostring(weather) or 0;
        updateTime = tonumber(updateTime) or 0;
        zonewide = tonumber(zonewide) or 0;
        

		if (string.lower(weather) == "help" or string.lower(weather) == "commands") then
			player:SendMessage(messageID, sender, string.format("<WEATHER COMMANDS>"));
			player:SendMessage(messageID, sender, string.format("Clear"));
			player:SendMessage(messageID, sender, string.format("Fine"));
			player:SendMessage(messageID, sender, string.format("Cloudy"));
			player:SendMessage(messageID, sender, string.format("Foggy"));
			player:SendMessage(messageID, sender, string.format("Windy"));
			player:SendMessage(messageID, sender, string.format("Blustery"));
			player:SendMessage(messageID, sender, string.format("Rain"));
			player:SendMessage(messageID, sender, string.format("Showers"));
			player:SendMessage(messageID, sender, string.format("Thunder"));
			player:SendMessage(messageID, sender, string.format("Storm"));
			player:SendMessage(messageID, sender, string.format("Dusty"));
			player:SendMessage(messageID, sender, string.format("Sandy"));
			player:SendMessage(messageID, sender, string.format("Hot"));
			player:SendMessage(messageID, sender, string.format("Blistering"));
			player:SendMessage(messageID, sender, string.format("Snow"));
			player:SendMessage(messageID, sender, string.format("Wintry"));
			player:SendMessage(messageID, sender, string.format("Gloomy"));
			player:SendMessage(messageID, sender, string.format("Seasonal"));
			player:SendMessage(messageID, sender, string.format("Primal"));
			player:SendMessage(messageID, sender, string.format("Fireworks"));
			player:SendMessage(messageID, sender, string.format("Dalamud1"));
			player:SendMessage(messageID, sender, string.format("Dalamud2"));
			player:SendMessage(messageID, sender, string.format("Aurora"));
			player:SendMessage(messageID, sender, string.format("Day"));
			player:SendMessage(messageID, sender, string.format("Twilight"));
			player:SendMessage(messageID, sender, string.format("Unknown1"));
			player:SendMessage(messageID, sender, string.format("Unknown2"));
			player:SendMessage(messageID, sender, string.format("Unknown3"));
			player:SendMessage(messageID, sender, string.format("Unknown4"));
		elseif (string.lower(weather) == "clear") then
			weather = 8001;
		elseif (string.lower(weather) == "fine") then
			weather = 8002;
		elseif (string.lower(weather) == "cloudy" or string.lower(weather) == "clouds") then
			weather = 8003;
		elseif (string.lower(weather) == "foggy" or string.lower(weather) == "fog") then
			weather = 8004;
		elseif (string.lower(weather) == "windy" or string.lower(weather) == "wind") then
			weather = 8005;
		elseif (string.lower(weather) == "blustery") then
			weather = 8006;
		elseif (string.lower(weather) == "rainy" or string.lower(weather) == "rain") then
			weather = 8007;
		elseif (string.lower(weather) == "showery" or string.lower(weather) == "shower" or string.lower(weather) == "showers") then
			weather = 8008;
		elseif (string.lower(weather) == "thundery" or string.lower(weather) == "thunder") then
			weather = 8009;
		elseif (string.lower(weather) == "stormy" or string.lower(weather) == "storm") then
			weather = 8010;
		elseif (string.lower(weather) == "dusty" or string.lower(weather) == "dust") then
			weather = 8011;
		elseif (string.lower(weather) == "sandy" or string.lower(weather) == "sand") then
			weather = 8012;
		elseif (string.lower(weather) == "hot") then
			weather = 8013;
		elseif (string.lower(weather) == "blistering") then
			weather = 8014;
		elseif (string.lower(weather) == "snowy" or string.lower(weather) == "snow") then
			weather = 8015;
		elseif (string.lower(weather) == "wintry" or string.lower(weather) == "winter") then
			weather = 8016;
		elseif (string.lower(weather) == "gloomy" or string.lower(weather) == "gloom") then
			weather = 8017;
		elseif (string.lower(weather) == "seasonal") then
			weather = 8027;
		elseif (string.lower(weather) == "primal") then
			weather = 8028;
		elseif (string.lower(weather) == "fireworks") then
			weather = 8029;
		elseif (string.lower(weather) == "dalamud" or string.lower(weather) == "dalamud1") then
			weather = 8030;
		elseif (string.lower(weather) == "aurora") then
			weather = 8031;
		elseif (string.lower(weather) == "dalamudthunder" or string.lower(weather) == "dalamud2") then
			weather = 8032;
		elseif (string.lower(weather) == "day") then
			weather = 8065;
		elseif (string.lower(weather) == "twilight") then
			weather = 8066;
		elseif (string.lower(weather) == "unknown1") then
			weather = 8067;
		elseif (string.lower(weather) == "unknown2") then
			weather = 8068;
		elseif (string.lower(weather) == "unknown3") then
			weather = 8069;
		elseif (string.lower(weather) == "unknown4") then
			weather = 8081;
        end

		if (weather > 0 and weather < 82) then
			weather = weather + 8000;
		end
        
        
        message = string.format("changed weather to %u ", weather);
        
        if zonewide ~= 0 then
            message = string.format(message.."for zone %u", player.CurrentArea.ZoneId);
        else
            message = message..player:GetName();
        end;
        
        -- weatherid, updateTime
			player.CurrentArea:ChangeWeather(weather, updateTime, player, zonewide ~= 0);
			player:SendMessage(messageID, sender, message);
    end;

    print(sender..message);
end;