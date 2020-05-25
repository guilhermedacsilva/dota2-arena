function Spawn( entityKeyValues )
    GameRules:SetTimeOfDay(0.73)
    abilityFear = AICore:FindAbility(thisEntity, "night_stalker_crippling_fear" )
    AICore:AddCooldown(abilityFear, 8)
    abilityBorrowedTime = AICore:FindAbility(thisEntity, "abaddon_borrowed_time" )
    AICore:AddCooldown(abilityBorrowedTime, 11)
    thisEntity:SetContextThink( "BossThink", BossThink, 4 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    AICore:VerifyCooldowns()

    if abilityFear:IsFullyCastable() then
        AICore:CastAbilityNoTarget(thisEntity, abilityFear)
        AICore:StartCooldown(abilityFear)
    elseif abilityBorrowedTime:IsFullyCastable() then
        AICore:CastAbilityNoTarget(thisEntity, abilityBorrowedTime)
        AICore:StartCooldown(abilityBorrowedTime)
    end
    return 1
end
