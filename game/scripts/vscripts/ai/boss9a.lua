function Spawn( entityKeyValues )
    thisEntity._abilityWave = AICore:FindAbility(thisEntity, "morphling_waveform" )
    thisEntity._abilityWave:SetLevel(3)
    AICore:AddCooldown(thisEntity._abilityWave, 9)
    thisEntity:SetContextThink( "BossThink", BossThink, 1 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    AICore:VerifyCooldowns()

    if thisEntity._abilityWave:IsFullyCastable() then
        local enemy = AICore:BotFindRandomEnemy()
        AICore:CastAbilityPosition(thisEntity, thisEntity._abilityWave, enemy:GetOrigin())
        AICore:StartCooldown(thisEntity._abilityWave)
    end
    return 1
end
