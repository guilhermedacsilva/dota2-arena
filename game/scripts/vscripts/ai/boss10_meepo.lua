function Spawn( entityKeyValues )
    abilityCask = AICore:FindAbility(thisEntity, "witch_doctor_paralyzing_cask" )
    abilityWard = AICore:FindAbility(thisEntity, "witch_doctor_death_ward" )
    if abilityWard then
        thisEntity:AddItemByName("item_ultimate_scepter")
        abilityWard:SetLevel(2)
        AICore:AddCooldown(abilityWard, 17)
    end
    thisEntity:SetContextThink( "BossThink", BossThink, 4 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    AICore:VerifyCooldowns()

    if not thisEntity:IsChanneling() then
        if abilityCask and abilityCask:IsFullyCastable() then
            local enemy = AICore:BotFindRandomEnemy()
            AICore:CastAbilityTarget(thisEntity, abilityCask, enemy)
        elseif abilityWard and abilityWard:IsFullyCastable() then
            local enemy = AICore:BotFindRandomEnemy()
            AICore:CastAbilityPosition(thisEntity, abilityWard, enemy:GetOrigin())
            AICore:StartCooldown(abilityWard)
        end
    end

    return 1
end
