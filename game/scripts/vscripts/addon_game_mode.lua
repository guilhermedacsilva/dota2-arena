-- This is the entry-point to your game mode and should be used primarily to precache models/particles/sounds/etc

require('internal/util')
require('gamemode')

function Precache( context )
--[[
  This function is used to precache resources/units/items/abilities that will be needed
  for sure in your game and that will not be precached by hero selection.  When a hero
  is selected from the hero selection screen, the game will precache that hero's assets,
  any equipped cosmetics, and perform the data-driven precaching defined in that hero's
  precache{} block, as well as the precache{} block for any equipped abilities.

  See GameMode:PostLoadPrecache() in gamemode.lua for more information
  ]]

  DebugPrint("[BAREBONES] Performing pre-load precache")

  -- Particles can be precached individually or by folder
  -- It it likely that precaching a single particle system will precache all of its children, but this may not be guaranteed

  --PrecacheResource("particle_folder", "particles/test_particle", context)

  -- Models can also be precached by folder or individually
  -- PrecacheModel should generally used over PrecacheResource for individual models
  PrecacheResource("model_folder", "particles/econ/items/shadow_fiend/sf_fire_arcana", context)
  PrecacheResource("model", "particles/econ/items/invoker/ti8_invoker_prism_crystal_spellcaster/ti8_invoker_prism_forge_spirit_ambient.vpcf", context)
  PrecacheResource("model", "particles/units/heroes/hero_abaddon/abaddon_weapon_blur.vpcf", context)
  PrecacheResource("model", "particles/econ/items/centaur/centaur_ti9/centaur_double_edge_ti9_bloodspray_src.vpcf", context)
  PrecacheResource("model", "particles/units/heroes/hero_spectre/spectre_dispersion.vpcf", context)
  PrecacheResource("model", "particles/units/heroes/hero_nevermore/nvm_atk_blur.vpcf", context)
  PrecacheResource("model", "particles/units/heroes/hero_nevermore/nvm_atk_blur_b.vpcf", context)
  PrecacheResource("model", "particles/units/heroes/hero_huskar/huskar_base_attack.vpcf", context)
  PrecacheResource("model", "particles/units/heroes/hero_winter_wyvern/winter_wyvern_arctic_attack.vpcf", context)
  PrecacheResource("model", "particles/base_attacks/test_projectile.vpcf", context)
  PrecacheResource("model", "particles/base_attacks/fountain_attack.vpcf", context)
  PrecacheResource("model", "particles/units/heroes/hero_troll_warlord/troll_warlord_base_attack.vpcf", context)
  --PrecacheModel("models/heroes/viper/viper.vmdl", context)
  --PrecacheModel("models/props_gameplay/treasure_chest001.vmdl", context)
  --PrecacheModel("models/props_debris/merchant_debris_chest001.vmdl", context)
  --PrecacheModel("models/props_debris/merchant_debris_chest002.vmdl", context)

  -- Sounds can precached here like anything else
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_antimage.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_centaur.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_axe.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_death_prophet.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_omniknight.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_bane.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_huskar.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_winter_wyvern.vsndevts", context)

  -- Entire items can be precached by name
  -- Abilities can also be precached in this way despite the name
  --PrecacheItemByNameSync("example_ability", context)
  --PrecacheItemByNameSync("item_example_item", context)

  -- Entire heroes (sound effects/voice/models/particles) can be precached with PrecacheUnitByNameSync
  -- Custom units from npc_units_custom.txt can also have all of their abilities and precache{} blocks precached in this way
  --PrecacheUnitByNameSync("npc_dota_hero_ancient_apparition", context)
  --PrecacheUnitByNameSync("npc_dota_hero_enigma", context)
end

-- Create the game mode when we activate
function Activate()
  GameRules.GameMode = GameMode()
  GameRules.GameMode:_InitGameMode()
end
