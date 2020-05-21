if MyScore == nil then
  MyScore = class({})
end

--[[
npc_dota_hero_axe:
        1: 108
        2: 0
        4: 0
npc_dota_hero_drow_ranger:
        1: 112
        2: 0
        4: 0
npc_dota_hero_lina:
        1: 111
        2: 0
        4: 0
npc_dota_hero_silencer:
        1: 94
        2: 0
        4: 0
npc_dota_hero_sven:
        1: 71
        2: 0
        4: 0
--]]
function MyScore:update(table)
    CustomGameEventManager:Send_ServerToAllClients(
        "my_update_score",
        table
    )
end
