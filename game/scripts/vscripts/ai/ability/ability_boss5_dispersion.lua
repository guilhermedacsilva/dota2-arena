
LinkLuaModifier("modifier_boss5_dispersion", "ai/ability/modifier_boss5_dispersion", LUA_MODIFIER_MOTION_NONE )

function ApplyModifier (keys)

    local caster = keys.caster
    local ability = keys.ability
    local modifier = "modifier_boss5_dispersion"

    caster:AddNewModifier( caster, ability, modifier, {} )
end
