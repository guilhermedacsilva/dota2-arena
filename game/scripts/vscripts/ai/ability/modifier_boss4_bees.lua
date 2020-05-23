if modifier_boss4_bees == nil then
    modifier_boss4_bees = class({})
end

function modifier_boss4_bees:IsDebuff()
    return true
end

function modifier_boss4_bees:IsPurgable()
    return false
end

function modifier_boss4_bees:GetEffectName()
    return "particles/econ/courier/courier_babyroshan_ti9/courier_babyroshan_ti9_ambient.vpcf" -- bees
end

function modifier_boss4_bees:GetEffectAttachType()
    return PATTACH_ROOTBONE_FOLLOW
end
