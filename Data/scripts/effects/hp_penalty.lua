require("modifiers")

function onGain(owner, effect, actionContainer)
    owner.MultiplyMod(modifiersGlobal.Hp, 0.75);
end;

function onLose(owner, effect, actionContainer)
    owner.DivideMod(modifiersGlobal.Hp, 0.75);
end;