function Spawn( entityKeyValues )
    abilityHeal = thisEntity:FindAbilityByName( "ability_boss3_heal" )
    thisEntity:SetContextThink( "BossThink", BossThink, 1 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    if abilityHeal:IsFullyCastable() then
      AICore:CastAbilityNoTarget(thisEntity, abilityHeal)
    end
    return 1
end
