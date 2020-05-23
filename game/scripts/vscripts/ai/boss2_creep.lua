function Spawn( entityKeyValues )
    abilityStomp = thisEntity:FindAbilityByName( "ability_boss2_stomp" )
    abilityBH = thisEntity:FindAbilityByName( "ability_boss2_battle_hunger" )
    thisEntity:SetContextThink( "BossThink", BossThink, 5 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    units = AICore:BotFindEnemies(thisEntity:GetOrigin(), abilityStomp:GetSpecialValueFor('radius'))

    if abilityBH:IsFullyCastable() and thisEntity:GetHealthPercent() < 50 then
        AICore:CastAbilityNoTarget(thisEntity, abilityBH)
    elseif abilityStomp:IsFullyCastable() and #units > 0 then
        AICore:CastAbilityNoTarget(thisEntity, abilityStomp)
    end

    return 1
end
