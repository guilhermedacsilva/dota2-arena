function Spawn( entityKeyValues )
    abilityCurse = thisEntity:FindAbilityByName( "ability_boss4_curse" )
    thisEntity:SetContextThink( "BossThink", BossThink, 4 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    if abilityCurse:IsFullyCastable() then
      AICore:CastAbilityNoTarget(thisEntity, abilityCurse)
    end
    return 1
end
