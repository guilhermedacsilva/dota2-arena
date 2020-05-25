function Spawn( entityKeyValues )
    abilitySplinterBlast = AICore:FindAbility(thisEntity, "winter_wyvern_splinter_blast" )
    abilityIceVortex = AICore:FindAbility(thisEntity, "ancient_apparition_ice_vortex" )
    abilityWintersCurse = AICore:FindAbility(thisEntity, "winter_wyvern_winters_curse" )
    AICore:AddCooldown(abilityWintersCurse, 10)
    abilitySplinterBlast:SetLevel(3)
    thisEntity:SetContextThink( "BossThink", BossThink, 1 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    AICore:VerifyCooldowns()

    if abilityWintersCurse:IsFullyCastable() then
        AICore:CastAbilityTargetLessHP(thisEntity, abilityWintersCurse, enemy)
        AICore:StartCooldown(abilityWintersCurse)
    elseif abilitySplinterBlast:IsFullyCastable() then
        AICore:CastAbilityTargetMoreHP(thisEntity, abilitySplinterBlast)
    elseif abilityIceVortex:IsFullyCastable() then
        local enemy = AICore:BotFindRandomEnemy()
        AICore:CastAbilityPosition(thisEntity, abilityIceVortex, enemy:GetOrigin())
    end
    return 1
end
