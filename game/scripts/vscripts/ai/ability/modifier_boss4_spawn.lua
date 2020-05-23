if modifier_boss4_spawn == nil then
    modifier_boss4_spawn = class({})
end

function modifier_boss4_spawn:IsDebuff()
    return true
end

function modifier_boss4_spawn:IsPurgable()
    return false
end

function modifier_boss4_spawn:GetEffectName()
    return "particles/econ/courier/courier_faceless_rex/cour_rex_flying.vpcf" -- dark cloud
end

function modifier_boss4_spawn:GetEffectAttachType()
    return PATTACH_ROOTBONE_FOLLOW
end
