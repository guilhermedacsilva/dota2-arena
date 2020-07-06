function Spawn( entityKeyValues )
    thisEntity._abilityFire = thisEntity:FindAbilityByName( "ability_boss5_fire" )
    thisEntity:SetContextThink( "BossThink", BossThink, 1 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    if thisEntity._abilityFire:IsFullyCastable() then
      AICore:CastAbilityNoTarget(thisEntity, thisEntity._abilityFire)
    end
    return 1
end
