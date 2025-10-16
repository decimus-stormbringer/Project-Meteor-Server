require("modifiers")

--Battle Voice grants HP_Boost and it sets max hp to 125% normal amount and heals for the difference between current
function onGain(owner, effect, actionContainer)
    local healAmount = owner.MaxHP * 0.25;

    owner.MultiplyMod(modifiersGlobal.Hp, 1.25);
    owner.SetMaxHpFromMods();
    owner.AddHP(healAmount);
end;

function onLose(owner, effect, actionContainer)
    owner.DivideMod(modifiersGlobal.Hp, 1.25);
end;