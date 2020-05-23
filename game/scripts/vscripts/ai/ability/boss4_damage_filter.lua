function Boss4DamageFilter( attacker, filterTable )
  if GameRound._round ~= 4 then
    return
  end

  local victim = EntIndexToHScript( filterTable["entindex_victim_const"] )

  if attacker ~= nil and attacker:IsRealHero() and victim:GetUnitName() == "npc_boss_unit_4_bane" then
    if attacker:HasModifier("modifier_boss4_bees") then
      ApplyDamage({
        victim = attacker,
        attacker = victim,
        damage = 150,
        damage_type = DAMAGE_TYPE_MAGICAL,
      })
    elseif attacker:HasModifier("modifier_boss4_mana") then
      attacker:ReduceMana(100)
    elseif attacker:HasModifier("modifier_boss4_spawn") then
      CreateUnitByName("npc_boss_unit_4_abaddon", attacker:GetOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS)
    end
  end
end
