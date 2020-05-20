local hPlayer = PlayerResource:GetPlayer(0)
local goldTotal = 750
for i = 1, INITIAL_ROUND-1 do
    goldTotal = goldTotal + 750 + (i - 1) * 200
end
local heroList = {}
local heroItems = {}
local heroAbilities = {}
local hero = CreateUnitByName("npc_dota_hero_drow_ranger", Vector(0,-1200,0), true, hPlayer, hPlayer, DOTA_TEAM_GOODGUYS)
heroList["0"] = hero
heroItems["0"] = {
    { ["name"] = "item_belt_of_strength", ["cost"] = 450},
    { ["name"] = "item_gloves", ["cost"] = 450},
    { ["name"] = "item_boots", ["cost"] = 500},

    { ["name"] = "item_javelin", ["cost"] = 1100},
    { ["name"] = "item_mithril_hammer", ["cost"] = 1600}
}
heroAbilities["0"] = {0,1,0,2,0,5,0,2}
--[[
0 = drow_ranger_frost_arrows
1 = drow_ranger_wave_of_silence
2 = drow_ranger_multishot
3 = generic_hidden
4 = generic_hidden
5 = drow_ranger_marksmanship
6 = special_bonus_unique_drow_ranger_5
7 = special_bonus_all_stats_5
8 = special_bonus_agility_10
9 = special_bonus_movement_speed_20
10 = special_bonus_unique_drow_ranger_1
11 = special_bonus_unique_drow_ranger_4
12 = special_bonus_unique_drow_ranger_3
13 = special_bonus_cooldown_reduction_30
14 = ability_capture
--]]

hero = CreateUnitByName("npc_dota_hero_axe", Vector(0,-1200,0), true, hPlayer, hPlayer, DOTA_TEAM_GOODGUYS)
heroList["1"] = hero
heroItems["1"] = {
    { ["name"] = "item_vitality_booster", ["cost"] = 1100},
    { ["name"] = "item_ring_of_health", ["cost"] = 825},

    { ["name"] = "item_cloak", ["cost"] = 550},
    { ["name"] = "item_ring_of_health", ["cost"] = 825},
    { ["name"] = "item_ring_of_regen", ["cost"] = 225},
    { ["name"] = "item_recipe_hood_of_defiance", ["cost"] = 200}
}
heroAbilities["1"] = {2,0,2,1,2,5,2,0}
--[[
0 = axe_berserkers_call
1 = axe_battle_hunger
2 = axe_counter_helix
3 = generic_hidden
4 = generic_hidden
5 = axe_culling_blade
6 = special_bonus_strength_8
7 = special_bonus_movement_speed_20
8 = special_bonus_mp_regen_2
9 = special_bonus_attack_speed_35
10 = special_bonus_hp_regen_20
11 = special_bonus_unique_axe_3
12 = special_bonus_unique_axe_2
13 = special_bonus_unique_axe
14 = ability_capture
--]]

hero = CreateUnitByName("npc_dota_hero_lina", Vector(0,-1200,0), true, hPlayer, hPlayer, DOTA_TEAM_GOODGUYS)
heroList["2"] = hero
heroItems["2"] = {
    { ["name"] = "item_belt_of_strength", ["cost"] = 450},
    { ["name"] = "item_gloves", ["cost"] = 450},
    { ["name"] = "item_boots", ["cost"] = 500},

    { ["name"] = "item_robe", ["cost"] = 450},
    { ["name"] = "item_staff_of_wizardry", ["cost"] = 1000},
    { ["name"] = "item_recipe_kaya", ["cost"] = 600}
}
heroAbilities["2"] = {1,0,1,0,1,5,1,0,0}

--[[
0 = lina_dragon_slave
1 = lina_light_strike_array
2 = lina_fiery_soul
3 = generic_hidden
4 = generic_hidden
5 = lina_laguna_blade
6 = special_bonus_attack_damage_30
7 = special_bonus_cast_range_75
8 = special_bonus_hp_300
9 = special_bonus_unique_lina_3
10 = special_bonus_spell_amplify_11
11 = special_bonus_unique_lina_2
12 = special_bonus_unique_lina_1
13 = special_bonus_attack_range_150
14 = ability_capture
--]]

hero = CreateUnitByName("npc_dota_hero_sven", Vector(0,-1200,0), true, hPlayer, hPlayer, DOTA_TEAM_GOODGUYS)
heroList["3"] = hero
heroItems["3"] = {
    { ["name"] = "item_belt_of_strength", ["cost"] = 450},
    { ["name"] = "item_gloves", ["cost"] = 450},
    { ["name"] = "item_boots", ["cost"] = 500},

    { ["name"] = "item_ogre_axe", ["cost"] = 1000},
    { ["name"] = "item_quarterstaff", ["cost"] = 875},
    { ["name"] = "item_robe", ["cost"] = 450},
    { ["name"] = "item_sobi_mask", ["cost"] = 225},
}
heroAbilities["3"] = {0,2,0,2,0,5,0,2}

--[[
0 = sven_storm_bolt
1 = sven_great_cleave
2 = sven_warcry
3 = generic_hidden
4 = generic_hidden
5 = sven_gods_strength
6 = special_bonus_strength_7
7 = special_bonus_mp_regen_250
8 = special_bonus_lifesteal_15
9 = special_bonus_unique_sven_3
10 = special_bonus_movement_speed_25
11 = special_bonus_unique_sven
12 = special_bonus_unique_sven_2
13 = special_bonus_unique_sven_4
14 = ability_capture
--]]

hero = CreateUnitByName("npc_dota_hero_silencer", Vector(0,-1200,0), true, hPlayer, hPlayer, DOTA_TEAM_GOODGUYS)
heroList["4"] = hero
heroItems["4"] = {
    { ["name"] = "item_belt_of_strength", ["cost"] = 450},
    { ["name"] = "item_gloves", ["cost"] = 450},
    { ["name"] = "item_boots", ["cost"] = 500},

    { ["name"] = "item_quarterstaff", ["cost"] = 875},
    { ["name"] = "item_robe", ["cost"] = 450},
    { ["name"] = "item_sobi_mask", ["cost"] = 225},
    { ["name"] = "item_quarterstaff", ["cost"] = 875},
    { ["name"] = "item_robe", ["cost"] = 450},
    { ["name"] = "item_sobi_mask", ["cost"] = 225},
    { ["name"] = "item_recipe_orchid", ["cost"] = 775}
}
heroAbilities["4"] = {0,2,0,2,0,5,0,2,2}

--[[
0 = silencer_curse_of_the_silent
1 = silencer_glaives_of_wisdom
2 = silencer_last_word
3 = generic_hidden
4 = generic_hidden
5 = silencer_global_silence
6 = special_bonus_armor_5
7 = special_bonus_attack_speed_20
8 = special_bonus_unique_silencer
9 = special_bonus_unique_silencer_2
10 = special_bonus_attack_range_100
11 = special_bonus_unique_silencer_6
12 = special_bonus_unique_silencer_3
13 = special_bonus_unique_silencer_4
14 = ability_capture
--]]

for heroKey, hero in pairs(heroList) do
    hero:SetControllableByPlayer(0, true)
    for i = 1, INITIAL_ROUND - 1 do
      hero:HeroLevelUp(false)
    end
    local gold = goldTotal
    for _, item in pairs(heroItems[heroKey]) do
        if (gold < item["cost"]) then
            break
        end
        gold = gold - item["cost"]
        hero:AddItemByName(item["name"])
    end
    for i = 1, INITIAL_ROUND do
        local abilityIdx = heroAbilities[heroKey][i]
        local abilityHandle = hero:GetAbilityByIndex(abilityIdx)
        hero:UpgradeAbility(abilityHandle)
    end

    --[[
    DebugPrint("ABILITIES == " .. hero:GetUnitName())
    for i = 0, 14 do
        DebugPrint(i .. " = " .. hero:GetAbilityByIndex(i):GetAbilityName())
    end
    --]]
end
