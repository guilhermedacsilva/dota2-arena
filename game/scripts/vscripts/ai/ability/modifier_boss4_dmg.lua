if modifier_boss4_dmg == nil then
    modifier_boss4_dmg = class({})
end

function modifier_boss4_dmg:IsDebuff()
    return true
end

function modifier_boss4_dmg:IsPurgable()
    return false
end

function modifier_boss4_dmg:GetEffectName()
    return "particles/econ/courier/courier_greevil_red/courier_greevil_red_ambient_3.vpcf"
end

function modifier_boss4_dmg:GetEffectAttachType()
    return PATTACH_OVERHEAD_FOLLOW
end
