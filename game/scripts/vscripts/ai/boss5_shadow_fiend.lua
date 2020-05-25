function Spawn( entityKeyValues )
    castTime = GameRules:GetGameTime() + 8
    abilitySummon = AICore:FindAbility(thisEntity, "ability_boss5_summom_spirits" )
    abilityFire = thisEntity:FindAbilityByName( "ability_boss5_fire" )
    thisEntity:SetContextThink( "BossThink", BossThink, 1 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    if abilityFire:IsFullyCastable() then
      AICore:CastAbilityNoTarget(thisEntity, abilityFire)
    elseif GameRules:GetGameTime() > castTime and abilitySummon:IsFullyCastable() then
      AICore:CastAbilityNoTarget(thisEntity, abilitySummon)
    end
    return 1
end
