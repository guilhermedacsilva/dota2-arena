if ability_boss4_curse == nil then
    ability_boss4_curse = class({})
end

function ability_boss4_curse:OnAbilityPhaseStart()
    EmitGlobalSound("Hero_Bane.Enfeeble")

    self.projId = ProjectileManager:CreateLinearProjectile( {
        Ability             = self,
        EffectName          = "particles/units/heroes/hero_ancient_apparition/ancient_apparition_ice_blast_initial.vpcf",
        vSpawnOrigin        = self:GetCaster():GetAbsOrigin() + Vector(0,0,500),
        fDistance           = 10000,
        fStartRadius        = 100,
        fEndRadius          = 100,
        Source              = self:GetCaster(),
        bHasFrontalCone     = false,
        bReplaceExisting    = false,
        iUnitTargetTeam     = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetFlags    = DOTA_UNIT_TARGET_FLAG_NONE,
        iUnitTargetType     = DOTA_UNIT_TARGET_BASIC,
        fExpireTime         = GameRules:GetGameTime() + self:GetDuration(),
        bDeleteOnHit        = false,
        vVelocity           = Vector(0,0,0),
        bProvidesVision     = true,
        iVisionRadius       = 0,
        iVisionTeamNumber   = DOTA_UNIT_TARGET_TEAM_ENEMY,
    } )
    return true
end

function ability_boss4_curse:OnAbilityPhaseInterrupted()
    ProjectileManager:DestroyLinearProjectile(self.projId)
end


function ability_boss4_curse:OnSpellStart()
    EmitGlobalSound("Hero_Bane.Enfeeble.Cast")

    local enemies = AICore:BotFindEnemies(self:GetCaster():GetOrigin(), 9999)
    local mods = {
        "modifier_boss4_bees",
        "modifier_boss4_mana",
        "modifier_boss4_spawn",
        "modifier_boss4_spawn",
    }

    for _, unit in pairs(enemies) do
        if (RandomInt(1,10) <= 6) then
            unit:AddNewModifier(self:GetCaster(), self, mods[RandomInt(1,4)], {duration = self:GetDuration()} )
        end
    end
end
