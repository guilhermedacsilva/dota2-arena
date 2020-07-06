function Spawn( entityKeyValues )
    thisEntity._abilityStomp = thisEntity:FindAbilityByName( "ability_boss2_stomp" )
    thisEntity._abilityBH = thisEntity:FindAbilityByName( "ability_boss2_battle_hunger" )
    thisEntity:SetContextThink( "BossThink", BossThink, 5 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    units = AICore:BotFindEnemies(thisEntity:GetOrigin(), thisEntity._abilityStomp:GetSpecialValueFor('radius'))

    if thisEntity._abilityBH:IsFullyCastable() and thisEntity:GetHealthPercent() < 75 then
        AICore:CastAbilityNoTarget(thisEntity, thisEntity._abilityBH)
    elseif thisEntity._abilityStomp:IsFullyCastable() and #units > 0 then
        AICore:CastAbilityNoTarget(thisEntity, thisEntity._abilityStomp)
    end

    return 1
end
