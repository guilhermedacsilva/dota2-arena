function OnTakeDamage( event )
  local caster = event.caster
  local attacker = event.attacker

  if attacker ~= nil and attacker:IsRealHero() then
    if attacker:HasModifier("modifier_boss4_dmg") then
      ApplyDamage({
        victim = attacker,
        attacker = caster,
        damage = 150,
        damage_type = DAMAGE_TYPE_MAGICAL,
      })
    elseif attacker:HasModifier("modifier_boss4_mana") then
      attacker:ReduceMana(100)
    elseif attacker:HasModifier("modifier_boss4_spawn") then
      attacker:RemoveModifierByName("modifier_boss4_spawn")
      CreateUnitByName("npc_boss_unit_4_abaddon", attacker:GetOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS)
    end
  end
end
