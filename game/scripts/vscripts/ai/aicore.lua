if AICore == nil then
    AICore = class({})
    AICore.spells = {}
end

-- COOLDOWN --------------------------------------------------

function AICore:ResetCooldownTable()
    AICore.spells = {}
end

function AICore:AddCooldown(ability, time)
  table.insert(AICore.spells, {
    caster = ability:GetCaster(),
    ability = ability,
    cooldown = time,
    gametime = GameRules:GetGameTime() + time
  })
end

function AICore:VerifyCooldowns()
  local removeIdx = -1
  for i, abi in pairs(AICore.spells) do
    if abi.caster == nil or not abi.caster:IsAlive() then
      removeIdx = i
    elseif GameRules:GetGameTime() >= abi.gametime then
      abi.ability:EndCooldown()
    end
  end
  if removeIdx ~= -1 then
    table.remove(AICore.spells, removeIdx)
  end
end

function AICore:StartCooldown(ability)
  for _, abi in pairs(AICore.spells) do
    if abi.ability == ability then
      abi.gametime = GameRules:GetGameTime() + abi.cooldown
      break
    end
  end
end

-- CAST --------------------------------------------------

function AICore:FindAbility(entity, abilityName)
  local ability = entity:FindAbilityByName( abilityName )
  if ability == nil then
    return entity:FindAbilityByName( abilityName .. "_easy" )
  end
  return ability
end

function AICore:CastAbilityNoTarget(entity, ability)
    ExecuteOrderFromTable({
      UnitIndex = entity:entindex(),
      OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
      AbilityIndex = ability:entindex(),
      Queue = false
    })
end

function AICore:CastAbilityTarget(entity, ability, target)
    ExecuteOrderFromTable({
      UnitIndex = entity:entindex(),
      TargetIndex = target:entindex(),
      OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
      AbilityIndex = ability:entindex(),
      Queue = false
    })
end

function AICore:CastAbilityTargetLessHP(entity, ability)
    target = AICore:BotFindEnemiesLessHP(entity:GetOrigin(), 9999)
    ExecuteOrderFromTable({
      UnitIndex = entity:entindex(),
      TargetIndex = target:entindex(),
      OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
      AbilityIndex = ability:entindex(),
      Queue = false
    })
end

function AICore:CastAbilityTargetMoreHP(entity, ability)
    target = AICore:BotFindEnemiesMoreHP(entity:GetOrigin(), 9999)
    ExecuteOrderFromTable({
      UnitIndex = entity:entindex(),
      TargetIndex = target:entindex(),
      OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
      AbilityIndex = ability:entindex(),
      Queue = false
    })
end

function AICore:CastAbilityPosition(entity, ability, position)
    ExecuteOrderFromTable({
      UnitIndex = entity:entindex(),
      OrderType = DOTA_UNIT_ORDER_CAST_POSITION,
      AbilityIndex = ability:entindex(),
      Position = position,
      Queue = false
    })
end

function AICore:Move(entity, position)
    ExecuteOrderFromTable({
      UnitIndex = entity:entindex(),
      OrderType = DOTA_UNIT_ORDER_MOVE_TO_POSITION,
      Position = position,
      Queue = false
    })
end

-- FIND ENEMIES --------------------------------------------------

function AICore:BotFindEnemies(origin, radius)
    return FindUnitsInRadius(DOTA_TEAM_BADGUYS,
                              origin,
                              nil,
                              radius,
                              DOTA_UNIT_TARGET_TEAM_ENEMY,
                              DOTA_UNIT_TARGET_ALL,
                              DOTA_UNIT_TARGET_FLAG_NONE,
                              FIND_ANY_ORDER,
                              false)
end

function AICore:BotFindRandomEnemy()
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS,
                              Vector(0,0,0),
                              nil,
                              9999,
                              DOTA_UNIT_TARGET_TEAM_ENEMY,
                              DOTA_UNIT_TARGET_ALL,
                              DOTA_UNIT_TARGET_FLAG_NONE,
                              FIND_ANY_ORDER,
                              false)
    return enemies[RandomInt(1,#enemies)]
end

function AICore:BotFindEnemiesLessHP(origin, radius)
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS,
                              origin,
                              nil,
                              radius,
                              DOTA_UNIT_TARGET_TEAM_ENEMY,
                              DOTA_UNIT_TARGET_ALL,
                              DOTA_UNIT_TARGET_FLAG_NONE,
                              FIND_ANY_ORDER,
                              false)
    local enemy = enemies[1]
    for _, unit in pairs (enemies) do
        if unit:GetHealth() < enemy:GetHealth() then
            enemy = unit
        end
    end
    return enemy
end

function AICore:BotFindEnemiesMoreHP(origin, radius)
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS,
                              origin,
                              nil,
                              radius,
                              DOTA_UNIT_TARGET_TEAM_ENEMY,
                              DOTA_UNIT_TARGET_ALL,
                              DOTA_UNIT_TARGET_FLAG_NONE,
                              FIND_ANY_ORDER,
                              false)
    local enemy = enemies[1]
    for _, unit in pairs (enemies) do
        if unit:GetHealth() > enemy:GetHealth() then
            enemy = unit
        end
    end
    return enemy
end
