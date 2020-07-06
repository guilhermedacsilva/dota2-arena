function Spawn( entityKeyValues )
    GameRules:SetTimeOfDay(0.73)
    thisEntity._abilityFear = AICore:FindAbility(thisEntity, "night_stalker_crippling_fear" )
    AICore:AddCooldown(thisEntity._abilityFear, 8)
    thisEntity._abilityBorrowedTime = AICore:FindAbility(thisEntity, "abaddon_borrowed_time" )
    AICore:AddCooldown(thisEntity._abilityBorrowedTime, 11)
    thisEntity:SetContextThink( "BossThink", BossThink, 4 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    AICore:VerifyCooldowns()

    if thisEntity._abilityFear:IsFullyCastable() then
        AICore:CastAbilityNoTarget(thisEntity, thisEntity._abilityFear)
        AICore:StartCooldown(thisEntity._abilityFear)
    elseif thisEntity._abilityBorrowedTime:IsFullyCastable() then
        AICore:CastAbilityNoTarget(thisEntity, thisEntity._abilityBorrowedTime)
        AICore:StartCooldown(thisEntity._abilityBorrowedTime)
    end
    return 1
end
