modifier_status_resistance = class({})

function modifier_status_resistance:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING
    }
    return funcs
end

function modifier_status_resistance:GetModifierStatusResistanceStacking (event)
    return self:GetAbility():GetSpecialValueFor('status_resistance')
end

function modifier_status_resistance:IsHidden()
    return true
end

function modifier_status_resistance:RemoveOnDeath()
    return false
end

function modifier_status_resistance:IsPurgable()
    return false
end
