function Spawn( entityKeyValues )
    goal = math.random(1,4)
    goalEntity = ENTITIES[goal]
    thisEntity:SetContextThink( "BossThink", BossThink, 1 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    if (CalcDistanceBetweenEntityOBB(thisEntity, goalEntity) < 100) then
      goal = goal + 1
      if (goal >= 5) then
        goal = 1
      end
      goalEntity = ENTITIES[goal]
    end

    AICore:Move(thisEntity, goalEntity:GetOrigin())

    return 1
end
