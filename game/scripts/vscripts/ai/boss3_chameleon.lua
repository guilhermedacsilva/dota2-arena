function Spawn( entityKeyValues )
    abilitySilence = thisEntity:FindAbilityByName( "ability_boss3_silence" )
    abilitySummon = AICore:FindAbility(thisEntity, "ability_boss3_summom_healer" )
    abilityBattleHunger = AICore:FindAbility(thisEntity, "ability_boss2_battle_hunger" )
    abilityBattleHunger:StartCooldown(20)
    abilitySummonAuraguy = AICore:FindAbility(thisEntity, "ability_boss3_summom_auraguy" )
    abilitySummonAuraguy:StartCooldown(25)
    thisEntity:SetContextThink( "BossThink", BossThink, 5 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    if abilitySummon:IsFullyCastable() then
      AICore:CastAbilityNoTarget(thisEntity, abilitySummon)
    elseif abilitySummonAuraguy:IsFullyCastable() then
      AICore:CastAbilityNoTarget(thisEntity, abilitySummonAuraguy)
    elseif abilityBattleHunger:IsFullyCastable() then
      AICore:CastAbilityNoTarget(thisEntity, abilityBattleHunger)
    elseif abilitySilence:IsFullyCastable() then
      local units = AICore:BotFindEnemies(thisEntity:GetOrigin(), 900)
      if #units > 0 then
        AICore:CastAbilityPosition(thisEntity, abilitySilence, units[1]:GetOrigin())
      end
    end
    return 1
end
