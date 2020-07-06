function Spawn( entityKeyValues )
    thisEntity._abilitySilence = thisEntity:FindAbilityByName( "ability_boss3_silence" )
    thisEntity._abilitySummon = AICore:FindAbility(thisEntity, "ability_boss3_summom_healer" )
    thisEntity._abilityBattleHunger = AICore:FindAbility(thisEntity, "ability_boss2_battle_hunger" )
    thisEntity._abilityBattleHunger:StartCooldown(20)
    thisEntity._abilitySummonAuraguy = AICore:FindAbility(thisEntity, "ability_boss3_summom_auraguy" )
    thisEntity._abilitySummonAuraguy:StartCooldown(25)
    thisEntity:SetContextThink( "BossThink", BossThink, 5 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    if thisEntity._abilitySummon:IsFullyCastable() then
      AICore:CastAbilityNoTarget(thisEntity, thisEntity._abilitySummon)
    elseif thisEntity._abilitySummonAuraguy:IsFullyCastable() then
      AICore:CastAbilityNoTarget(thisEntity, thisEntity._abilitySummonAuraguy)
    elseif thisEntity._abilityBattleHunger:IsFullyCastable() then
      AICore:CastAbilityNoTarget(thisEntity, thisEntity._abilityBattleHunger)
    elseif thisEntity._abilitySilence:IsFullyCastable() then
      local units = AICore:BotFindEnemies(thisEntity:GetOrigin(), 900)
      if #units > 0 then
        AICore:CastAbilityPosition(thisEntity, thisEntity._abilitySilence, units[1]:GetOrigin())
      end
    end
    return 1
end
