if modifier_boss4_mana == nil then
    modifier_boss4_mana = class({})
end

function modifier_boss4_mana:IsDebuff()
    return true
end

function modifier_boss4_mana:IsPurgable()
    return false
end

function modifier_boss4_mana:GetEffectName()
    return "particles/econ/items/medusa/medusa_daughters/medusa_daughters_mana_shield_b.vpcf"
end

function modifier_boss4_mana:GetEffectAttachType()
    return PATTACH_ABSORIGIN_FOLLOW
end
