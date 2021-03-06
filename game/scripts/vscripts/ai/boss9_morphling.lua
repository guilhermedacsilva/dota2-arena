function Spawn( entityKeyValues )
    thisEntity._abilityWave = AICore:FindAbility(thisEntity, "morphling_waveform" )
    thisEntity._abilityWave:SetLevel(3)
    AICore:AddCooldown(thisEntity._abilityWave, 4)
    thisEntity._abilityTorrent = AICore:FindAbility(thisEntity, "kunkka_torrent" )
    thisEntity._abilityTorrent:SetLevel(3)
    AICore:AddCooldown(thisEntity._abilityTorrent, 4)
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
    elseif thisEntity._abilityTorrent:IsFullyCastable() then
        local enemy = AICore:BotFindRandomEnemy()
        AICore:CastAbilityPosition(thisEntity, thisEntity._abilityTorrent, enemy:GetOrigin())
        AICore:StartCooldown(thisEntity._abilityTorrent)
    end
    return 1
end
