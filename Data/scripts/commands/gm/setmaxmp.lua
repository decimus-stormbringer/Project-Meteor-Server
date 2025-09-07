require("global");

properties = {
    permissions = 0,
    parameters = "sss",
    description =
[[
Sets player or <targetname>'s maximum mp to <mp> and restores to full. 
!setmaxmp <mp> |
!setmaxmp <mp> <targetname>
]],
}

function onTrigger(player, argc, mp, name, lastName)
    local sender = "[setmaxmp] ";
    
    if name then
        if lastName then
            player = GetWorldManager():GetPCInWorld(name.." "..lastName) or nil;
        else
            player = GetWorldManager():GetPCInWorld(name) or nil;
        end;
    end;
    
    if player then
        mp = tonumber(mp) or 1;
        location = INVENTORY_CURRENCY;
        
        player:SetMaxMP(mp);
		player:AddMP(mp);
    else
        print(sender.."unable to add mp, ensure player name is valid.");
    end;
end;