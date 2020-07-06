if GameRound == nil then
    GameRound = class({})
end


function GameRound:Init()
    local qntPlayers = 0

    if DEBUG_HEROES then
        qntPlayers = DEBUG_QNT_HEROES
    else
        for nPlayerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
            if PlayerResource:GetTeam( nPlayerID ) == DOTA_TEAM_GOODGUYS and PlayerResource:HasSelectedHero( nPlayerID ) then
                qntPlayers = qntPlayers + 1
            end
        end
    end

    if qntPlayers == 5 then
        GAME_DIFFICULT = 2
    end

    for nPlayerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
        if PlayerResource:GetTeam( nPlayerID ) == DOTA_TEAM_GOODGUYS and PlayerResource:HasSelectedHero( nPlayerID ) then
            local hero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
            table.insert(HEROES, hero)
        end
    end

    self._round = INITIAL_ROUND
    self._roundEnded = false
    self._nextRoundStartTime = 0
    self._enemies = {}
    self._roundData = require("rounds")
    self.spawnerVector = Entities:FindByName(nil, "spawner_area"):GetCenter()
    self._shouldSpawnUnit = false
    self._spawnUnitGroup = 1
    self._spawnUnitCount = 0
    GameRules:GetGameModeEntity():SetThink( "OnThink", self, 0.25 )
    self:BeginRound()
end

function GameRound:BeginRound()
    self:RefreshAllUnits()
    AICore:ResetCooldownTable()

    Notifications:TopToAll({
        text = self._roundData[GAME_DIFFICULT][self._round][1].msg,
        duration = 7.0
    })

    self._enemies = {}
    self._shouldSpawnUnit = true
    self._vEventHandles = {
        ListenToGameEvent( "entity_killed", Dynamic_Wrap( GameRound, "OnEntityKilled" ), self )
    }
end


function GameRound:CreateUnit()
    local unitGroup = self._roundData[GAME_DIFFICULT][self._round][self._spawnUnitGroup]
    if self._spawnUnitCount == unitGroup.qnt then
        -- next unit group
        self._spawnUnitGroup = self._spawnUnitGroup + 1
        self._spawnUnitCount = 0
        local nextGroup = self._roundData[GAME_DIFFICULT][self._round][self._spawnUnitGroup]
        if nextGroup == nil then
            -- finished spawning
            self._spawnUnitGroup = 1
            self._spawnUnitCount = 0
            self._shouldSpawnUnit = false
            return 1
        end
        return unitGroup.delayAfter
    end

    local vectorRandom = Vector(RandomInt(-300,300),RandomInt(-300,300),0)
    local enemy = CreateUnitByName(unitGroup.unitName, self.spawnerVector + vectorRandom, true, nil, nil, DOTA_TEAM_BADGUYS)
    table.insert(self._enemies, enemy)
    self._spawnUnitCount = self._spawnUnitCount + 1
    return unitGroup.delayBetween
end

function GameRound:OnEntityKilled(event)
    local killedUnit = EntIndexToHScript( event.entindex_killed )
    if not killedUnit then
        return
    end

    local removeIdx = nil
    for i, enemy in pairs( self._enemies ) do
        if enemy == killedUnit then
            removeIdx = i
            break
        end
    end

    if removeIdx ~= nil then
        table.remove(self._enemies, removeIdx)
    end

    if #self._enemies == 0 then
        self._roundEnded = true
    end
end


function GameRound:End()
    for _, eID in pairs( self._vEventHandles ) do
        StopListeningToGameEvent( eID )
    end
    self._vEventHandles = {}
end


function GameRound:OnThink()
    if GameRules:IsGamePaused() then
        return 1
    end
    if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        self:GiveTickGoldToPlayers()
        self:CheckForDefeat()

        if self._nextRoundStartTime ~= 0 and GameRules:GetGameTime() >= self._nextRoundStartTime then
            self._nextRoundStartTime = 0
            self:BeginRound()

        elseif self._shouldSpawnUnit then
            repeat
                delayBetween = self:CreateUnit()
            until delayBetween ~= 0
            self._roundEnded = false
            return delayBetween

        elseif self._roundEnded then
            self._roundEnded = false
            self:End()
            self:RefreshPlayers()
            self:KillAllEnemies()

            self._round = self._round + 1
            if self._round > MAX_ROUNDS then
                GameRules:MakeTeamLose( DOTA_TEAM_BADGUYS )
            else
                self._nextRoundStartTime = GameRules:GetGameTime() + 0.5
            end
        end

    elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
        return nil
    end
    return 1
end

function GameRound:KillAllEnemies()
    local units = FindUnitsInRadius(DOTA_TEAM_GOODGUYS,
                  Vector(0,0,0),
                  nil,
                  9999,
                  DOTA_UNIT_TARGET_TEAM_ENEMY,
                  DOTA_UNIT_TARGET_ALL,
                  DOTA_UNIT_TARGET_FLAG_NONE,
                  FIND_UNITS_EVERYWHERE,
                  false)
    for _, unit in pairs(units) do
        unit:ForceKill(false)
    end
end

function GameRound:RefreshPlayers()
    for _, hero in pairs (HEROES) do
        if not hero:IsAlive() then
            hero:RespawnUnit()
        end
        hero:ModifyGold(1000 + self._round * 150, true, 0)
        hero:AddExperience(100, 0, false, false)
    end
    self:RefreshAllUnits()
end

function GameRound:RefreshAllUnits()
    local units = FindUnitsInRadius(DOTA_TEAM_GOODGUYS,
                  Vector(0,0,0),
                  nil,
                  9999,
                  DOTA_UNIT_TARGET_TEAM_FRIENDLY,
                  DOTA_UNIT_TARGET_ALL,
                  DOTA_UNIT_TARGET_FLAG_NONE,
                  FIND_UNITS_EVERYWHERE,
                  false)
    for _, unit in pairs(units) do
        unit:SetHealth( unit:GetMaxHealth() )
        unit:SetMana( unit:GetMaxMana() )
    end
end


function GameRound:CheckForDefeat()
    if GameRules:State_Get() ~= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS or DEBUG_HEROES then
        return
    end

    local bAllPlayersDead = true
    for _, hero in pairs (HEROES) do
        if hero and not hero:IsNull() and hero:IsAlive() then
            bAllPlayersDead = false
            break
        end
    end

    --[[
    for nPlayerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
        if PlayerResource:GetTeam( nPlayerID ) == DOTA_TEAM_GOODGUYS then
            if not PlayerResource:HasSelectedHero( nPlayerID ) then
                bAllPlayersDead = false
            else
                local hero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
                if hero and not hero:IsNull() and hero:IsAlive() then
                    bAllPlayersDead = false
                end
            end
        end
    end
    --]]

    if bAllPlayersDead then
        GameRules:MakeTeamLose( DOTA_TEAM_GOODGUYS )
        return
    end
end

function GameRound:GiveTickGoldToPlayers()
    for nPlayerID = 0, 4 do
        PlayerResource:ModifyGold(nPlayerID, 1, true, 0)
    end
end
