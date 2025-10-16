require("global");
require("ability");

function onAbilityPrepare(caster, target, ability)
    return 0;
end;

function onAbilityStart(caster, target, ability)
    return 0;
end;

function onSkillFinish(caster, target, skill, action, actionContainer)
    newMP = math.min(caster.HP, caster.MaxMP)
    newHP = math.min(caster.MP, caster.MaxHP)
    caster.HP = newHP
    caster.MP = newMP

    --Set effect id
    action.DoAction(caster, target, skill, actionContainer);
end;