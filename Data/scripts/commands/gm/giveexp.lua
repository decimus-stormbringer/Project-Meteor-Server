require("global");

properties = {
    permissions = 0,
    parameters = "sss",
    description =
[[
Adds experience <qty> to player or <targetname>.
!giveexp <qty> |
!giveexp <qty> <targetname> |
]],
}

function onTrigger(player, argc, qty, name, lastName)
    local sender = "[giveexp] ";
    
    if name then
        if lastName then
            player = GetWorldManager():GetPCInWorld(name.." "..lastName) or nil;
        else
            player = GetWorldManager():GetPCInWorld(name) or nil;
        end;
    end;
    
    if player then
        currency = 1000001;
        qty = tonumber(qty) or 1;
		if (qty <= 75000) then
			location = INVENTORY_CURRENCY;
			print("ASDASDASDASDASD");
			actionList = player:AddExp(qty, player.GetCurrentClassOrJob(), 0);
			player:DoBattleAction(0, 0, actionList);
		else
			player:SendMessage(0x1D,"",">Value too high. Please use a value of 75,000 or lower");
		end
    else
        print(sender.."unable to add experience, ensure player name is valid.");
    end;
end;