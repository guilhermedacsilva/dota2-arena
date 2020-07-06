function Spawn( entityKeyValues )
    thisEntity._abilityCurse = thisEntity:FindAbilityByName( "ability_boss4_curse" )
    thisEntity:SetContextThink( "BossThink", BossThink, 4 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    if thisEntity._abilityCurse:IsFullyCastable() then
        if GAME_DIFFICULT == 2 or RandomInt(1,10) <= 4 then -- 40% easy mode
            AICore:CastAbilityNoTarget(thisEntity, thisEntity._abilityCurse)
        end
    end
    return 1
end
