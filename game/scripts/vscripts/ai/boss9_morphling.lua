function Spawn( entityKeyValues )
    abilityWave = AICore:FindAbility(thisEntity, "morphling_waveform" )
    abilityWave:SetLevel(3)
    AICore:AddCooldown(abilityWave, 4)
    abilityTorrent = AICore:FindAbility(thisEntity, "kunkka_torrent" )
    abilityTorrent:SetLevel(3)
    AICore:AddCooldown(abilityTorrent, 3)
    DebugPrint("resistance " .. thisEntity:GetStatusResistance())
    thisEntity:SetContextThink( "BossThink", BossThink, 1 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    AICore:VerifyCooldowns()

    if abilityWave:IsFullyCastable() then
        local enemy = AICore:BotFindRandomEnemy()
        AICore:CastAbilityPosition(thisEntity, abilityWave, enemy:GetOrigin())
        AICore:StartCooldown(abilityWave)
    elseif abilityTorrent:IsFullyCastable() then
        local enemy = AICore:BotFindRandomEnemy()
        AICore:CastAbilityPosition(thisEntity, abilityTorrent, enemy:GetOrigin())
        AICore:StartCooldown(abilityTorrent)
    end
    return 1
end
