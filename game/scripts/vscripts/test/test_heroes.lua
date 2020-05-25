local hPlayer = PlayerResource:GetPlayer(0)
local goldTotal = 1000
for i = 1, INITIAL_ROUND-1 do
    goldTotal = goldTotal + 1000 + i * 150
end
local heroList = {}
local heroItems = {}
local heroAbilities = {}
local hero = CreateHeroForPlayer("npc_dota_hero_drow_ranger", hPlayer)
heroList["0"] = hero
heroItems["0"] = {
    { ["name"] = "item_belt_of_strength", ["cost"] = 450},
    { ["name"] = "item_gloves", ["cost"] = 450},
    { ["name"] = "item_boots", ["cost"] = 500},

    { ["name"] = "item_javelin", ["cost"] = 1100},
    { ["name"] = "item_mithril_hammer", ["cost"] = 1600}, -- maelstrom
    { ["name"] = "item_hyperstone", ["cost"] = 2000},
    { ["name"] = "item_recipe_mjollnir", ["cost"] = 900},

    { ["name"] = "item_lifesteal", ["cost"] = 900}, -- mask

    { ["name"] = "item_blades_of_attack", ["cost"] = 450},
    { ["name"] = "item_broadsword", ["cost"] = 1000},
    { ["name"] = "item_recipe_lesser_crit", ["cost"] = 700}, -- cristalis
    { ["name"] = "item_demon_edge", ["cost"] = 2200},
    { ["name"] = "item_recipe_greater_crit", ["cost"] = 1000}, -- dedalo

    { ["name"] = "item_claymore", ["cost"] = 1400},
    { ["name"] = "item_reaver", ["cost"] = 3000} -- big axe

}
heroAbilities["0"] = {0,1,0,2,0,5,0,2,2,2,1,5,1,1}
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

hero = CreateHeroForPlayer("npc_dota_hero_axe", hPlayer)
heroList["1"] = hero
heroItems["1"] = {
    { ["name"] = "item_vitality_booster", ["cost"] = 1100},
    { ["name"] = "item_ring_of_health", ["cost"] = 825},

    { ["name"] = "item_sobi_mask", ["cost"] = 225},
    { ["name"] = "item_recipe_ring_of_basilius", ["cost"] = 200},
    { ["name"] = "item_ring_of_protection", ["cost"] = 150},
    { ["name"] = "item_recipe_buckler", ["cost"] = 225},

    { ["name"] = "item_cloak", ["cost"] = 550},
    { ["name"] = "item_ring_of_health", ["cost"] = 825},
    { ["name"] = "item_ring_of_regen", ["cost"] = 225},
    { ["name"] = "item_recipe_hood_of_defiance", ["cost"] = 200},

    { ["name"] = "item_ring_of_tarrasque", ["cost"] = 650},
    { ["name"] = "item_vitality_booster", ["cost"] = 1100},
    { ["name"] = "item_reaver", ["cost"] = 3000},
    { ["name"] = "item_recipe_heart", ["cost"] = 400},

    { ["name"] = "item_ring_of_regen", ["cost"] = 225},
    { ["name"] = "item_recipe_headdress", ["cost"] = 200},
    { ["name"] = "item_recipe_pipe", ["cost"] = 1200},

    { ["name"] = "item_helm_of_iron_will", ["cost"] = 925},
    { ["name"] = "item_recipe_crimson_guard", ["cost"] = 950},

    { ["name"] = "item_lifesteal", ["cost"] = 900}, -- mask
    { ["name"] = "item_recipe_vladmir", ["cost"] = 600}
}
heroAbilities["1"] = {2,0,2,0,2,5,2,0,0,1,1,5,1,1}
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

hero = CreateHeroForPlayer("npc_dota_hero_lina", hPlayer)
heroList["2"] = hero
heroItems["2"] = {
    { ["name"] = "item_belt_of_strength", ["cost"] = 450},
    { ["name"] = "item_gloves", ["cost"] = 450},
    { ["name"] = "item_boots", ["cost"] = 500},

    { ["name"] = "item_robe", ["cost"] = 450},
    { ["name"] = "item_staff_of_wizardry", ["cost"] = 1000},
    { ["name"] = "item_recipe_kaya", ["cost"] = 600},

    { ["name"] = "item_boots_of_elves", ["cost"] = 450},
    { ["name"] = "item_blade_of_alacrity", ["cost"] = 1000},
    { ["name"] = "item_recipe_yasha", ["cost"] = 1000},

    { ["name"] = "item_quarterstaff", ["cost"] = 875},
    { ["name"] = "item_robe", ["cost"] = 450},
    { ["name"] = "item_sobi_mask", ["cost"] = 225},
    { ["name"] = "item_quarterstaff", ["cost"] = 875},
    { ["name"] = "item_robe", ["cost"] = 450},
    { ["name"] = "item_sobi_mask", ["cost"] = 225},
    { ["name"] = "item_recipe_orchid", ["cost"] = 775},

    { ["name"] = "item_energy_booster", ["cost"] = 900},
    { ["name"] = "item_point_booster", ["cost"] = 1200},
    { ["name"] = "item_vitality_booster", ["cost"] = 1100},
    { ["name"] = "item_mystic_staff", ["cost"] = 2700}
}
heroAbilities["2"] = {1,0,1,0,1,5,1,0,0,2,2,5,2,2}

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

if DEBUG_QNT_HEROES > 3 then
    hero = CreateHeroForPlayer("npc_dota_hero_sven", hPlayer)
    heroList["3"] = hero
    heroItems["3"] = {
        { ["name"] = "item_belt_of_strength", ["cost"] = 450},
        { ["name"] = "item_gloves", ["cost"] = 450},
        { ["name"] = "item_boots", ["cost"] = 500},

        { ["name"] = "item_ogre_axe", ["cost"] = 1000},
        { ["name"] = "item_quarterstaff", ["cost"] = 875},
        { ["name"] = "item_robe", ["cost"] = 450},
        { ["name"] = "item_sobi_mask", ["cost"] = 225},

        { ["name"] = "item_claymore", ["cost"] = 1400},
        { ["name"] = "item_lifesteal", ["cost"] = 900}, -- mask
        { ["name"] = "item_reaver", ["cost"] = 3000}, -- big axe

        { ["name"] = "item_ring_of_tarrasque", ["cost"] = 650},
        { ["name"] = "item_vitality_booster", ["cost"] = 1100},
        { ["name"] = "item_reaver", ["cost"] = 3000},
        { ["name"] = "item_recipe_heart", ["cost"] = 400},

        { ["name"] = "item_blades_of_attack", ["cost"] = 450},
        { ["name"] = "item_broadsword", ["cost"] = 1000},
        { ["name"] = "item_recipe_lesser_crit", ["cost"] = 700}, -- cristalis
        { ["name"] = "item_demon_edge", ["cost"] = 2200},
        { ["name"] = "item_recipe_greater_crit", ["cost"] = 1000}, -- dedalo
    }
    heroAbilities["3"] = {0,2,0,2,0,5,0,2,2,1,1,5,1,1}
end

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

if DEBUG_QNT_HEROES > 4 then
    hero = CreateHeroForPlayer("npc_dota_hero_silencer", hPlayer)
    --hero = CreateHeroForPlayer("npc_dota_hero_necrolyte", Vector(0,-1200,0), true, hPlayer, hPlayer, DOTA_TEAM_GOODGUYS)
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
        { ["name"] = "item_recipe_orchid", ["cost"] = 775},

        { ["name"] = "item_mystic_staff", ["cost"] = 2700},
        { ["name"] = "item_ultimate_orb", ["cost"] = 2150},
        { ["name"] = "item_void_stone", ["cost"] = 825},

        { ["name"] = "item_hyperstone", ["cost"] = 2000},
        { ["name"] = "item_recipe_bloodthorn", ["cost"] = 1000},

        { ["name"] = "item_ultimate_orb", ["cost"] = 2150},
        { ["name"] = "item_ultimate_orb", ["cost"] = 2150},
        { ["name"] = "item_point_booster", ["cost"] = 1200}
    }
    heroAbilities["4"] = {0,2,0,2,0,5,0,2,2,1,1,5,1,1}
end
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

local i = 0
for heroKey, hero in pairs(heroList) do
    hero:SetControllableByPlayer(0, true)
    hero:SetOrigin(Vector(-600 + i*300,-1200,150))
    i = i + 1

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
        if abilityIdx == nil then
            break
        end
        local abilityHandle = hero:GetAbilityByIndex(abilityIdx)
        hero:UpgradeAbility(abilityHandle)
    end
end


hero = PlayerResource:GetSelectedHeroEntity( 0 )
hero:SetOrigin(ENTITY_BOT_LEFT:GetOrigin())
hero:AddItemByName("item_heart")
