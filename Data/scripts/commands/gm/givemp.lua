require("global");

properties = {
    permissions = 0,
    parameters = "sss",
    description =
[[
Gives player X amount of MP.
!givemp <mp> |
]],
}

function onTrigger(player, argc, mp)
    local sender = "[givemp] ";
    
    mp = tonumber(mp) or 0;
	player:AddMP(mp);
    
end;