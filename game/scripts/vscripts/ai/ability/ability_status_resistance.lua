LinkLuaModifier("modifier_status_resistance", "ai/ability/modifier_status_resistance", LUA_MODIFIER_MOTION_NONE )

function ApplyModifier (keys)

    local caster = keys.caster
    local ability = keys.ability
    local modifier = "modifier_status_resistance"

    caster:AddNewModifier( caster, ability, modifier, {} )
end
