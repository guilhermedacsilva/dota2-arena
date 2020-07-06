function Spawn( entityKeyValues )
    thisEntity._abilitySplinterBlast = AICore:FindAbility(thisEntity, "winter_wyvern_splinter_blast" )
    thisEntity._abilityIceVortex = AICore:FindAbility(thisEntity, "ancient_apparition_ice_vortex" )
    thisEntity._abilityWintersCurse = AICore:FindAbility(thisEntity, "winter_wyvern_winters_curse" )
    AICore:AddCooldown(thisEntity._abilityWintersCurse, 10)
    thisEntity._abilitySplinterBlast:SetLevel(3)
    thisEntity:SetContextThink( "BossThink", BossThink, 1 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    AICore:VerifyCooldowns()

    if thisEntity._abilityWintersCurse:IsFullyCastable() then
        AICore:CastAbilityTargetLessHP(thisEntity, thisEntity._abilityWintersCurse, enemy)
        AICore:StartCooldown(thisEntity._abilityWintersCurse)
    elseif thisEntity._abilitySplinterBlast:IsFullyCastable() then
        AICore:CastAbilityTargetMoreHP(thisEntity, thisEntity._abilitySplinterBlast)
    elseif thisEntity._abilityIceVortex:IsFullyCastable() then
        local enemy = AICore:BotFindRandomEnemy()
        AICore:CastAbilityPosition(thisEntity, thisEntity._abilityIceVortex, enemy:GetOrigin())
    end
    return 1
end
