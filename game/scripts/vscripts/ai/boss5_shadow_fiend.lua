function Spawn( entityKeyValues )
    abilityFire = thisEntity:FindAbilityByName( "ability_boss5_fire" )
    thisEntity:SetContextThink( "BossThink", BossThink, 1 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    if abilityFire:IsFullyCastable() then
      AICore:CastAbilityNoTarget(thisEntity, abilityFire)
    end
    return 1
end
