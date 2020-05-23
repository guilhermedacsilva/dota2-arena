if GameRound == nil then
    GameRound = class({})
end


function GameRound:Init()
    self._round = INITIAL_ROUND
    self._roundEnded = false
    self._nextRoundStartTime = 0
    self._enemies = {}
    self._roundData = require("rounds")
    GameRules:GetGameModeEntity():SetThink( "OnThink", self, 0.25 )
    self:BeginRound()
end

function GameRound:BeginRound()
    self:RefreshAllUnits()

    Notifications:TopToAll({
        text = self._roundData[self._round][1].msg,
        duration = 7.0
    })

    self._enemies = {}
    local enemy = nil
    for _, unit in pairs( self._roundData[self._round] ) do
        for i=1, unit.qnt do
            enemy = CreateUnitByName(unit.unitName, Vector(0,0,128), true, nil, nil, DOTA_TEAM_BADGUYS)
            table.insert(self._enemies, enemy)
        end
    end

    self._vEventHandles = {
        ListenToGameEvent( "entity_killed", Dynamic_Wrap( GameRound, "OnEntityKilled" ), self )
    }
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
    if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        self:CheckForDefeat()

        if self._nextRoundStartTime ~= 0 and GameRules:GetGameTime() >= self._nextRoundStartTime then
            self._nextRoundStartTime = 0
            self:BeginRound()

        elseif self._roundEnded then
            self._roundEnded = false
            self:End()
            self:RefreshPlayers()

            self._round = self._round + 1
            if self._round > MAX_ROUNDS then
                GameRules:MakeTeamLose( DOTA_TEAM_BADGUYS )
            else
                self._nextRoundStartTime = GameRules:GetGameTime() + 10
            end
        end

    elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
        return nil
    end
    return 1
end

function GameRound:RefreshPlayers()
    for nPlayerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
        if PlayerResource:GetTeam( nPlayerID ) == DOTA_TEAM_GOODGUYS and PlayerResource:HasSelectedHero( nPlayerID ) then

            local hero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
            if not hero:IsAlive() then
                hero:RespawnUnit()
            end
            hero:SetHealth( hero:GetMaxHealth() )
            hero:SetMana( hero:GetMaxMana() )
            hero:HeroLevelUp(true)
            hero:ModifyGold(750 + (self._round - 1) * 200, true, 0)
        end
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
    if GameRules:State_Get() ~= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS or TEST_5_HEROES then
        return
    end

    local bAllPlayersDead = true
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

    if bAllPlayersDead then
        GameRules:MakeTeamLose( DOTA_TEAM_GOODGUYS )
        return
    end
end
