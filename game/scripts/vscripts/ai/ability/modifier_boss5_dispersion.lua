modifier_boss5_dispersion = class({})

function modifier_boss5_dispersion:DeclareFunctions()
    local funcs = {
        MODIFIER_EVENT_ON_TAKEDAMAGE
    }
    return funcs
end

function modifier_boss5_dispersion:OnTakeDamage (event)

    if event.unit == self:GetParent() then

        local caster = self:GetParent()
        local post_damage = event.damage
        local original_damage = event.original_damage
        local ability = self:GetAbility()
        local damage_reflect_pct = 0.10

        -- NOT Ignore damage
        --if caster:IsAlive() then
        --    caster:SetHealth(caster:GetHealth() + (post_damage * damage_reflect_pct) )
        --end

        units = FindUnitsInRadius(
                        caster:GetTeamNumber(),
                        caster:GetAbsOrigin(),
                        nil,
                        9999,
                        DOTA_UNIT_TARGET_TEAM_ENEMY,
                        DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
                        DOTA_UNIT_TARGET_FLAG_NONE,
                        FIND_ANY_ORDER,
                        false
        )

        for _,unit in pairs(units) do

            if unit:GetTeam() ~= caster:GetTeam() then

                local vCaster = caster:GetAbsOrigin()
                local vUnit = unit:GetAbsOrigin()

                local reflect_damage = 0.0
                local particle_name = ""

                local distance = (vUnit - vCaster):Length2D()

                DebugPrint("Distance: " .. distance)
                if distance <= 400 then
                    reflect_damage = original_damage * damage_reflect_pct
                elseif distance <= 800 then -- reduces 20% per 100 distance
                    reflect_damage = original_damage * damage_reflect_pct * (1.0 - (distance - 400) * 0.002)
                else
                    reflect_damage = 0
                end

                if reflect_damage > 0 then
                    local particle = ParticleManager:CreateParticle(
                        "particles/units/heroes/hero_spectre/spectre_dispersion.vpcf",
                        PATTACH_POINT_FOLLOW,
                        caster
                    )
                    ParticleManager:SetParticleControl(particle, 0, vCaster)
                    ParticleManager:SetParticleControl(particle, 1, vUnit)
                    ParticleManager:SetParticleControl(particle, 2, vCaster)

                    local old_hp = unit:GetHealth()
                    local new_hp = old_hp - reflect_damage

                    if unit:IsAlive() then
                        if new_hp < 1.000000 then
                            unit:Kill(ability, caster)
                        else
                            unit:SetHealth(new_hp)
                        end
                    end
                end


            end

        end

    end

end

function modifier_boss5_dispersion:IsHidden()
    return true
end

function modifier_boss5_dispersion:RemoveOnDeath()
    return false
end

function modifier_boss5_dispersion:IsPurgable()
    return false
end
