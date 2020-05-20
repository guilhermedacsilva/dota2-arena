if AICore == nil then
    AICore = class({})
end

function AICore:CastAbilityNoTarget(entity, ability)
    ExecuteOrderFromTable({
      UnitIndex = entity:entindex(),
      OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
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
