require("global");

properties = {
    permissions = 0,
    parameters = "sss",
    description =
[[
Adds TP <amount> to player. 
!givetp <tp> |
]],
}

function onTrigger(player, argc, tp)
    local sender = "[givetp] ";
    
    tp = tonumber(tp) or 0;
	player:AddTP(tp);
    
end;