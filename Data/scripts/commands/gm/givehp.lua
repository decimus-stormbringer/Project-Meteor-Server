require("global");

properties = {
    permissions = 0,
    parameters = "sss",
    description =
[[
Gives player X amount of HP.
!givemp <mp> |
]],
}

function onTrigger(player, argc, hp)
    local sender = "[givehp] ";
    
    hp = tonumber(hp) or 0;
	player:AddHP(hp);
    
end;