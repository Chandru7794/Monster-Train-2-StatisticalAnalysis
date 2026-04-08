with source as (
    select * from "mt2"."main"."base_runs"
),

unioned as (
    select
        run_id,
        'Equipment'  as card_type,
        'Bloodthirsty Blade'          as card_name,
        cast(floor(cast(equipment_bloodthirsty_blade as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_bloodthirsty_blade is not null
      and cast(equipment_bloodthirsty_blade as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Combustion Suit'          as card_name,
        cast(floor(cast(equipment_combustion_suit as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_combustion_suit is not null
      and cast(equipment_combustion_suit as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Cursed Dragonstaff'          as card_name,
        cast(floor(cast(equipment_cursed_dragonstaff as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_cursed_dragonstaff is not null
      and cast(equipment_cursed_dragonstaff as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Cursed Twinblade'          as card_name,
        cast(floor(cast(equipment_cursed_twinblade as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_cursed_twinblade is not null
      and cast(equipment_cursed_twinblade as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Dusk Mantle'          as card_name,
        cast(floor(cast(equipment_dusk_mantle as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_dusk_mantle is not null
      and cast(equipment_dusk_mantle as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Equalizing Rings'          as card_name,
        cast(floor(cast(equipment_equalizing_rings as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_equalizing_rings is not null
      and cast(equipment_equalizing_rings as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Everlasting Light'          as card_name,
        cast(floor(cast(equipment_everlasting_light as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_everlasting_light is not null
      and cast(equipment_everlasting_light as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Exiles Diadem'          as card_name,
        cast(floor(cast(equipment_exiles_diadem as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_exiles_diadem is not null
      and cast(equipment_exiles_diadem as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Fortified Pauldrons'          as card_name,
        cast(floor(cast(equipment_fortified_pauldrons as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_fortified_pauldrons is not null
      and cast(equipment_fortified_pauldrons as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Frostpiercer'          as card_name,
        cast(floor(cast(equipment_frostpiercer as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_frostpiercer is not null
      and cast(equipment_frostpiercer as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Glass Cannon'          as card_name,
        cast(floor(cast(equipment_glass_cannon as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_glass_cannon is not null
      and cast(equipment_glass_cannon as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Hephs Hammer'          as card_name,
        cast(floor(cast(equipment_hephs_hammer as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_hephs_hammer is not null
      and cast(equipment_hephs_hammer as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Iron Tongue'          as card_name,
        cast(floor(cast(equipment_iron_tongue as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_iron_tongue is not null
      and cast(equipment_iron_tongue as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Lava Armor'          as card_name,
        cast(floor(cast(equipment_lava_armor as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_lava_armor is not null
      and cast(equipment_lava_armor as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Loamcoat'          as card_name,
        cast(floor(cast(equipment_loamcoat as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_loamcoat is not null
      and cast(equipment_loamcoat as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Luna Cyclestaff'          as card_name,
        cast(floor(cast(equipment_luna_cyclestaff as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_luna_cyclestaff is not null
      and cast(equipment_luna_cyclestaff as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Mageblade'          as card_name,
        cast(floor(cast(equipment_mageblade as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_mageblade is not null
      and cast(equipment_mageblade as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Meat Shield'          as card_name,
        cast(floor(cast(equipment_meat_shield as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_meat_shield is not null
      and cast(equipment_meat_shield as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Mind Cage'          as card_name,
        cast(floor(cast(equipment_mind_cage as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_mind_cage is not null
      and cast(equipment_mind_cage as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Moonlit Glaive'          as card_name,
        cast(floor(cast(equipment_moonlit_glaive as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_moonlit_glaive is not null
      and cast(equipment_moonlit_glaive as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Oldgrowth'          as card_name,
        cast(floor(cast(equipment_oldgrowth as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_oldgrowth is not null
      and cast(equipment_oldgrowth as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Organ Harvester'          as card_name,
        cast(floor(cast(equipment_organ_harvester as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_organ_harvester is not null
      and cast(equipment_organ_harvester as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Overgrowth Carapace'          as card_name,
        cast(floor(cast(equipment_overgrowth_carapace as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_overgrowth_carapace is not null
      and cast(equipment_overgrowth_carapace as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Penitents Bloodsuit'          as card_name,
        cast(floor(cast(equipment_penitents_bloodsuit as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_penitents_bloodsuit is not null
      and cast(equipment_penitents_bloodsuit as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Penitents Deathsuit'          as card_name,
        cast(floor(cast(equipment_penitents_deathsuit as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_penitents_deathsuit is not null
      and cast(equipment_penitents_deathsuit as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Potion Kit'          as card_name,
        cast(floor(cast(equipment_potion_kit as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_potion_kit is not null
      and cast(equipment_potion_kit as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Shield Of Wyngh'          as card_name,
        cast(floor(cast(equipment_shield_of_wyngh as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_shield_of_wyngh is not null
      and cast(equipment_shield_of_wyngh as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Stasis Crystal'          as card_name,
        cast(floor(cast(equipment_stasis_crystal as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_stasis_crystal is not null
      and cast(equipment_stasis_crystal as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Soulsmelter'          as card_name,
        cast(floor(cast(equipment_soulsmelter as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_soulsmelter is not null
      and cast(equipment_soulsmelter as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Stoic Platemail'          as card_name,
        cast(floor(cast(equipment_stoic_platemail as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_stoic_platemail is not null
      and cast(equipment_stoic_platemail as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Swiftsteel Dagger'          as card_name,
        cast(floor(cast(equipment_swiftsteel_dagger as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_swiftsteel_dagger is not null
      and cast(equipment_swiftsteel_dagger as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Void Armament'          as card_name,
        cast(floor(cast(equipment_void_armament as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_void_armament is not null
      and cast(equipment_void_armament as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Weaponized Prosthetic'          as card_name,
        cast(floor(cast(equipment_weaponized_prosthetic as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_weaponized_prosthetic is not null
      and cast(equipment_weaponized_prosthetic as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Windblade'          as card_name,
        cast(floor(cast(equipment_windblade as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_windblade is not null
      and cast(equipment_windblade as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Awakening Thicket'          as card_name,
        cast(floor(cast(room_awakening_thicket as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_awakening_thicket is not null
      and cast(room_awakening_thicket as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Bloodsoaked Arena'          as card_name,
        cast(floor(cast(room_bloodsoaked_arena as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_bloodsoaked_arena is not null
      and cast(room_bloodsoaked_arena as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Boiler Room'          as card_name,
        cast(floor(cast(room_boiler_room as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_boiler_room is not null
      and cast(room_boiler_room as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Crucible Extension'          as card_name,
        cast(floor(cast(room_crucible_extension as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_crucible_extension is not null
      and cast(room_crucible_extension as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Echo Vault'          as card_name,
        cast(floor(cast(room_echo_vault as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_echo_vault is not null
      and cast(room_echo_vault as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Eclipse Chamber'          as card_name,
        cast(floor(cast(room_eclipse_chamber as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_eclipse_chamber is not null
      and cast(room_eclipse_chamber as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Electricity Chamber'          as card_name,
        cast(floor(cast(room_electricity_chamber as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_electricity_chamber is not null
      and cast(room_electricity_chamber as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Enchanted Chamber'          as card_name,
        cast(floor(cast(room_enchanted_chamber as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_enchanted_chamber is not null
      and cast(room_enchanted_chamber as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Fight Club'          as card_name,
        cast(floor(cast(room_fight_club as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_fight_club is not null
      and cast(room_fight_club as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Grow Room'          as card_name,
        cast(floor(cast(room_grow_room as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_grow_room is not null
      and cast(room_grow_room as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Hellfurnace'          as card_name,
        cast(floor(cast(room_hellfurnace as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_hellfurnace is not null
      and cast(room_hellfurnace as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Imprisoned Zephyr'          as card_name,
        cast(floor(cast(room_imprisoned_zephyr as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_imprisoned_zephyr is not null
      and cast(room_imprisoned_zephyr as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Infectory'          as card_name,
        cast(floor(cast(room_infectory as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_infectory is not null
      and cast(room_infectory as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Inferno Room'          as card_name,
        cast(floor(cast(room_inferno_room as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_inferno_room is not null
      and cast(room_inferno_room as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Memorial For The Melted'          as card_name,
        cast(floor(cast(room_memorial_for_the_melted as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_memorial_for_the_melted is not null
      and cast(room_memorial_for_the_melted as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Mushy Room'          as card_name,
        cast(floor(cast(room_mushy_room as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_mushy_room is not null
      and cast(room_mushy_room as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Planetarium'          as card_name,
        cast(floor(cast(room_planetarium as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_planetarium is not null
      and cast(room_planetarium as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Rage Room'          as card_name,
        cast(floor(cast(room_rage_room as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_rage_room is not null
      and cast(room_rage_room as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Reanimation Lab'          as card_name,
        cast(floor(cast(room_reanimation_lab as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_reanimation_lab is not null
      and cast(room_reanimation_lab as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Sacrificial Chamber'          as card_name,
        cast(floor(cast(room_sacrificial_chamber as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_sacrificial_chamber is not null
      and cast(room_sacrificial_chamber as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Spell Sanctum'          as card_name,
        cast(floor(cast(room_spell_sanctum as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_spell_sanctum is not null
      and cast(room_spell_sanctum as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Stewards Quarters'          as card_name,
        cast(floor(cast(room_stewards_quarters as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_stewards_quarters is not null
      and cast(room_stewards_quarters as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Weapons Cache'          as card_name,
        cast(floor(cast(room_weapons_cache as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_weapons_cache is not null
      and cast(room_weapons_cache as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Zone Of Silence'          as card_name,
        cast(floor(cast(room_zone_of_silence as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_zone_of_silence is not null
      and cast(room_zone_of_silence as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Alpha Fiend'          as card_name,
        cast(floor(cast(unit_alpha_fiend as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_alpha_fiend as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_alpha_fiend is not null
      and cast(unit_alpha_fiend as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Amorous Enoki'          as card_name,
        cast(floor(cast(unit_amorous_enoki as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_amorous_enoki as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_amorous_enoki is not null
      and cast(unit_amorous_enoki as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Animus Of Speed'          as card_name,
        cast(floor(cast(unit_animus_of_speed as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_animus_of_speed as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_animus_of_speed is not null
      and cast(unit_animus_of_speed as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Animus Of Will'          as card_name,
        cast(floor(cast(unit_animus_of_will as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_animus_of_will as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_animus_of_will is not null
      and cast(unit_animus_of_will as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Astrologer'          as card_name,
        cast(floor(cast(unit_astrologer as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_astrologer as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_astrologer is not null
      and cast(unit_astrologer as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Aurora Weaver'          as card_name,
        cast(floor(cast(unit_aurora_weaver as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_aurora_weaver as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_aurora_weaver is not null
      and cast(unit_aurora_weaver as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Avenger'          as card_name,
        cast(floor(cast(unit_avenger as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_avenger as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_avenger is not null
      and cast(unit_avenger as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Awoken Hollow'          as card_name,
        cast(floor(cast(unit_awoken_hollow as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_awoken_hollow as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_awoken_hollow is not null
      and cast(unit_awoken_hollow as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Balmabello'          as card_name,
        cast(floor(cast(unit_balmabello as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_balmabello as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_balmabello is not null
      and cast(unit_balmabello as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Battle Dancer'          as card_name,
        cast(floor(cast(unit_battle_dancer as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_battle_dancer as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_battle_dancer is not null
      and cast(unit_battle_dancer as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Bloated Whelp'          as card_name,
        cast(floor(cast(unit_bloated_whelp as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_bloated_whelp as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_bloated_whelp is not null
      and cast(unit_bloated_whelp as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Branded Warrior'          as card_name,
        cast(floor(cast(unit_branded_warrior as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_branded_warrior as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_branded_warrior is not null
      and cast(unit_branded_warrior as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Cheery Deathcap'          as card_name,
        cast(floor(cast(unit_cheery_deathcap as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_cheery_deathcap as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_cheery_deathcap is not null
      and cast(unit_cheery_deathcap as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Cluster Colonel'          as card_name,
        cast(floor(cast(unit_cluster_colonel as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_cluster_colonel as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_cluster_colonel is not null
      and cast(unit_cluster_colonel as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Crucible Warden'          as card_name,
        cast(floor(cast(unit_crucible_warden as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_crucible_warden as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_crucible_warden is not null
      and cast(unit_crucible_warden as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Dante The Dependable'          as card_name,
        cast(floor(cast(unit_dante_the_dependable as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_dante_the_dependable as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_dante_the_dependable is not null
      and cast(unit_dante_the_dependable as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Deathcapped Prophet'          as card_name,
        cast(floor(cast(unit_deathcapped_prophet as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_deathcapped_prophet as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_deathcapped_prophet is not null
      and cast(unit_deathcapped_prophet as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Deathmetal Hymnist'          as card_name,
        cast(floor(cast(unit_deathmetal_hymnist as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_deathmetal_hymnist as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_deathmetal_hymnist is not null
      and cast(unit_deathmetal_hymnist as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Deaths Dancer'          as card_name,
        cast(floor(cast(unit_deaths_dancer as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_deaths_dancer as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_deaths_dancer is not null
      and cast(unit_deaths_dancer as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Demon Fiend'          as card_name,
        cast(floor(cast(unit_demon_fiend as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_demon_fiend as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_demon_fiend is not null
      and cast(unit_demon_fiend as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Demonic Fledgling'          as card_name,
        cast(floor(cast(unit_demonic_fledgling as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_demonic_fledgling as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_demonic_fledgling is not null
      and cast(unit_demonic_fledgling as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Divine Dancer'          as card_name,
        cast(floor(cast(unit_divine_dancer as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_divine_dancer as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_divine_dancer is not null
      and cast(unit_divine_dancer as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Double Edged Bearer'          as card_name,
        cast(floor(cast(unit_double_edged_bearer as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_double_edged_bearer as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_double_edged_bearer is not null
      and cast(unit_double_edged_bearer as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Draff'          as card_name,
        cast(floor(cast(unit_draff as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_draff as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_draff is not null
      and cast(unit_draff as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Dreg'          as card_name,
        cast(floor(cast(unit_dreg as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_dreg as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_dreg is not null
      and cast(unit_dreg as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Erratic Assistant'          as card_name,
        cast(floor(cast(unit_erratic_assistant as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_erratic_assistant as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_erratic_assistant is not null
      and cast(unit_erratic_assistant as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Ethereal Seelie'          as card_name,
        cast(floor(cast(unit_ethereal_seelie as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_ethereal_seelie as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_ethereal_seelie is not null
      and cast(unit_ethereal_seelie as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Firebrand'          as card_name,
        cast(floor(cast(unit_firebrand as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_firebrand as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_firebrand is not null
      and cast(unit_firebrand as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Follower'          as card_name,
        cast(floor(cast(unit_follower as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_follower as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_follower is not null
      and cast(unit_follower as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Fledgling Imp'          as card_name,
        cast(floor(cast(unit_fledgling_imp as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_fledgling_imp as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_fledgling_imp is not null
      and cast(unit_fledgling_imp as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Gildmonger'          as card_name,
        cast(floor(cast(unit_gildmonger as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_gildmonger as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_gildmonger is not null
      and cast(unit_gildmonger as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Goldtooth'          as card_name,
        cast(floor(cast(unit_goldtooth as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_goldtooth as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_goldtooth is not null
      and cast(unit_goldtooth as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Greed Dragon'          as card_name,
        cast(floor(cast(unit_greed_dragon as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_greed_dragon as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_greed_dragon is not null
      and cast(unit_greed_dragon as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Green Recruit'          as card_name,
        cast(floor(cast(unit_green_recruit as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_green_recruit as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_green_recruit is not null
      and cast(unit_green_recruit as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Guard Of The Unnamed'          as card_name,
        cast(floor(cast(unit_guard_of_the_unnamed as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_guard_of_the_unnamed as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_guard_of_the_unnamed is not null
      and cast(unit_guard_of_the_unnamed as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Horned Warrior'          as card_name,
        cast(floor(cast(unit_horned_warrior as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_horned_warrior as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_horned_warrior is not null
      and cast(unit_horned_warrior as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Hostguard'          as card_name,
        cast(floor(cast(unit_hostguard as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_hostguard as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_hostguard is not null
      and cast(unit_hostguard as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Hot Head'          as card_name,
        cast(floor(cast(unit_hot_head as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_hot_head as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_hot_head is not null
      and cast(unit_hot_head as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Hulking Mass'          as card_name,
        cast(floor(cast(unit_hulking_mass as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_hulking_mass as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_hulking_mass is not null
      and cast(unit_hulking_mass as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Husk Hermit'          as card_name,
        cast(floor(cast(unit_husk_hermit as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_husk_hermit as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_husk_hermit is not null
      and cast(unit_husk_hermit as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Hydra Armed Horror'          as card_name,
        cast(floor(cast(unit_hydra_armed_horror as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_hydra_armed_horror as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_hydra_armed_horror is not null
      and cast(unit_hydra_armed_horror as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Impish Scholar'          as card_name,
        cast(floor(cast(unit_impish_scholar as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_impish_scholar as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_impish_scholar is not null
      and cast(unit_impish_scholar as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Jack In The Box'          as card_name,
        cast(floor(cast(unit_jack_in_the_box as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_jack_in_the_box as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_jack_in_the_box is not null
      and cast(unit_jack_in_the_box as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Lady Of The Reformed'          as card_name,
        cast(floor(cast(unit_lady_of_the_reformed as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_lady_of_the_reformed as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_lady_of_the_reformed is not null
      and cast(unit_lady_of_the_reformed as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Lead Songbird'          as card_name,
        cast(floor(cast(unit_lead_songbird as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_lead_songbird as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_lead_songbird is not null
      and cast(unit_lead_songbird as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Lunar Priestess'          as card_name,
        cast(floor(cast(unit_lunar_priestess as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_lunar_priestess as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_lunar_priestess is not null
      and cast(unit_lunar_priestess as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Magma Cultist'          as card_name,
        cast(floor(cast(unit_magma_cultist as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_magma_cultist as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_magma_cultist is not null
      and cast(unit_magma_cultist as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Magma Mauler'          as card_name,
        cast(floor(cast(unit_magma_mauler as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_magma_mauler as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_magma_mauler is not null
      and cast(unit_magma_mauler as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Makeshift Golem'          as card_name,
        cast(floor(cast(unit_makeshift_golem as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_makeshift_golem as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_makeshift_golem is not null
      and cast(unit_makeshift_golem as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Meathook'          as card_name,
        cast(floor(cast(unit_meathook as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_meathook as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_meathook is not null
      and cast(unit_meathook as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Meddler'          as card_name,
        cast(floor(cast(unit_meddler as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_meddler as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_meddler is not null
      and cast(unit_meddler as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Miser'          as card_name,
        cast(floor(cast(unit_miser as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_miser as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_miser is not null
      and cast(unit_miser as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Molting Imp'          as card_name,
        cast(floor(cast(unit_molting_imp as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_molting_imp as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_molting_imp is not null
      and cast(unit_molting_imp as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Moon Pixie'          as card_name,
        cast(floor(cast(unit_moon_pixie as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_moon_pixie as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_moon_pixie is not null
      and cast(unit_moon_pixie as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Mooncaller'          as card_name,
        cast(floor(cast(unit_mooncaller as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_mooncaller as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_mooncaller is not null
      and cast(unit_mooncaller as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Moonguard'          as card_name,
        cast(floor(cast(unit_moonguard as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_moonguard as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_moonguard is not null
      and cast(unit_moonguard as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Morel Mistress'          as card_name,
        cast(floor(cast(unit_morel_mistress as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_morel_mistress as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_morel_mistress is not null
      and cast(unit_morel_mistress as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Morselmaker'          as card_name,
        cast(floor(cast(unit_morselmaker as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_morselmaker as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_morselmaker is not null
      and cast(unit_morselmaker as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Nightingale'          as card_name,
        cast(floor(cast(unit_nightingale as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_nightingale as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_nightingale is not null
      and cast(unit_nightingale as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Overworked Assistant'          as card_name,
        cast(floor(cast(unit_overworked_assistant as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_overworked_assistant as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_overworked_assistant is not null
      and cast(unit_overworked_assistant as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Pincushion'          as card_name,
        cast(floor(cast(unit_pincushion as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_pincushion as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_pincushion is not null
      and cast(unit_pincushion as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Plague Doctor'          as card_name,
        cast(floor(cast(unit_plague_doctor as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_plague_doctor as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_plague_doctor is not null
      and cast(unit_plague_doctor as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Prickly Puffball'          as card_name,
        cast(floor(cast(unit_prickly_puffball as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_prickly_puffball as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_prickly_puffball is not null
      and cast(unit_prickly_puffball as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Punk Shredder'          as card_name,
        cast(floor(cast(unit_punk_shredder as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_punk_shredder as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_punk_shredder is not null
      and cast(unit_punk_shredder as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Putterflesh'          as card_name,
        cast(floor(cast(unit_putterflesh as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_putterflesh as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_putterflesh is not null
      and cast(unit_putterflesh as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Pyre Chomper'          as card_name,
        cast(floor(cast(unit_pyre_chomper as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_pyre_chomper as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_pyre_chomper is not null
      and cast(unit_pyre_chomper as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Pyreblooded'          as card_name,
        cast(floor(cast(unit_pyreblooded as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_pyreblooded as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_pyreblooded is not null
      and cast(unit_pyreblooded as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Queens Impling'          as card_name,
        cast(floor(cast(unit_queens_impling as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_queens_impling as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_queens_impling is not null
      and cast(unit_queens_impling as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Railbeater'          as card_name,
        cast(floor(cast(unit_railbeater as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_railbeater as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_railbeater is not null
      and cast(unit_railbeater as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Reforming Ooze'          as card_name,
        cast(floor(cast(unit_reforming_ooze as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_reforming_ooze as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_reforming_ooze is not null
      and cast(unit_reforming_ooze as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Sanguine Assistant'          as card_name,
        cast(floor(cast(unit_sanguine_assistant as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_sanguine_assistant as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_sanguine_assistant is not null
      and cast(unit_sanguine_assistant as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Selene Acolyte'          as card_name,
        cast(floor(cast(unit_selene_acolyte as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_selene_acolyte as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_selene_acolyte is not null
      and cast(unit_selene_acolyte as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Shadeguard'          as card_name,
        cast(floor(cast(unit_shadeguard as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_shadeguard as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_shadeguard is not null
      and cast(unit_shadeguard as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Shard Channeler'          as card_name,
        cast(floor(cast(unit_shard_channeler as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_shard_channeler as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_shard_channeler is not null
      and cast(unit_shard_channeler as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Shield Steward'          as card_name,
        cast(floor(cast(unit_shield_steward as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_shield_steward as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_shield_steward is not null
      and cast(unit_shield_steward as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Silent Sentinel'          as card_name,
        cast(floor(cast(unit_silent_sentinel as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_silent_sentinel as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_silent_sentinel is not null
      and cast(unit_silent_sentinel as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Siren Of The Sea'          as card_name,
        cast(floor(cast(unit_siren_of_the_sea as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_siren_of_the_sea as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_siren_of_the_sea is not null
      and cast(unit_siren_of_the_sea as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Snotty Welp'          as card_name,
        cast(floor(cast(unit_snotty_welp as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_snotty_welp as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_snotty_welp is not null
      and cast(unit_snotty_welp as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Squad Leader'          as card_name,
        cast(floor(cast(unit_squad_leader as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_squad_leader as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_squad_leader is not null
      and cast(unit_squad_leader as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Spear Steward'          as card_name,
        cast(floor(cast(unit_spear_steward as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_spear_steward as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_spear_steward is not null
      and cast(unit_spear_steward as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Spore Launcher'          as card_name,
        cast(floor(cast(unit_spore_launcher as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_spore_launcher as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_spore_launcher is not null
      and cast(unit_spore_launcher as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Steadfast Crusader'          as card_name,
        cast(floor(cast(unit_steadfast_crusader as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_steadfast_crusader as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_steadfast_crusader is not null
      and cast(unit_steadfast_crusader as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Steelsinger'          as card_name,
        cast(floor(cast(unit_steelsinger as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_steelsinger as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_steelsinger is not null
      and cast(unit_steelsinger as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Steelworker'          as card_name,
        cast(floor(cast(unit_steelworker as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_steelworker as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_steelworker is not null
      and cast(unit_steelworker as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Stuck Up Welp'          as card_name,
        cast(floor(cast(unit_stuck_up_welp as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_stuck_up_welp as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_stuck_up_welp is not null
      and cast(unit_stuck_up_welp as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Swordmaiden'          as card_name,
        cast(floor(cast(unit_swordmaiden as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_swordmaiden as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_swordmaiden is not null
      and cast(unit_swordmaiden as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Test Subject Alpha'          as card_name,
        cast(floor(cast(unit_test_subject_alpha as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_test_subject_alpha as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_test_subject_alpha is not null
      and cast(unit_test_subject_alpha as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Thorned Hollow'          as card_name,
        cast(floor(cast(unit_thorned_hollow as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_thorned_hollow as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_thorned_hollow is not null
      and cast(unit_thorned_hollow as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Truffles'          as card_name,
        cast(floor(cast(unit_truffles as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_truffles as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_truffles is not null
      and cast(unit_truffles as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Twisted Assistant'          as card_name,
        cast(floor(cast(unit_twisted_assistant as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_twisted_assistant as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_twisted_assistant is not null
      and cast(unit_twisted_assistant as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Upbeat Warbler'          as card_name,
        cast(floor(cast(unit_upbeat_warbler as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_upbeat_warbler as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_upbeat_warbler is not null
      and cast(unit_upbeat_warbler as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Waxcap'          as card_name,
        cast(floor(cast(unit_waxcap as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_waxcap as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_waxcap is not null
      and cast(unit_waxcap as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Wealthy Whelp'          as card_name,
        cast(floor(cast(unit_wealthy_whelp as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_wealthy_whelp as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_wealthy_whelp is not null
      and cast(unit_wealthy_whelp as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Welder Helper'          as card_name,
        cast(floor(cast(unit_welder_helper as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_welder_helper as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_welder_helper is not null
      and cast(unit_welder_helper as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Wilting Sapwood'          as card_name,
        cast(floor(cast(unit_wilting_sapwood as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_wilting_sapwood as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_wilting_sapwood is not null
      and cast(unit_wilting_sapwood as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Zealot'          as card_name,
        cast(floor(cast(unit_zealot as decimal)) as integer) as copies,
        cast(round(mod(cast(unit_zealot as decimal), 1) * 10) as integer) as upgrades
    from source
    where unit_zealot is not null
      and cast(unit_zealot as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Acid Shower'          as card_name,
        cast(floor(cast(spell_acid_shower as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_acid_shower as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_acid_shower is not null
      and cast(spell_acid_shower as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Alchemy'          as card_name,
        cast(floor(cast(spell_alchemy as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_alchemy as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_alchemy is not null
      and cast(spell_alchemy as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Alloy Of The Ancients'          as card_name,
        cast(floor(cast(spell_alloy_of_the_ancients as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_alloy_of_the_ancients as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_alloy_of_the_ancients is not null
      and cast(spell_alloy_of_the_ancients as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Antumbra Assault'          as card_name,
        cast(floor(cast(spell_antumbra_assault as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_antumbra_assault as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_antumbra_assault is not null
      and cast(spell_antumbra_assault as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Battering Ram'          as card_name,
        cast(floor(cast(spell_battering_ram as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_battering_ram as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_battering_ram is not null
      and cast(spell_battering_ram as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Beacons Light'          as card_name,
        cast(floor(cast(spell_beacons_light as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_beacons_light as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_beacons_light is not null
      and cast(spell_beacons_light as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Begone'          as card_name,
        cast(floor(cast(spell_begone as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_begone as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_begone is not null
      and cast(spell_begone as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Benediction'          as card_name,
        cast(floor(cast(spell_benediction as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_benediction as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_benediction is not null
      and cast(spell_benediction as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Blazing Bolts'          as card_name,
        cast(floor(cast(spell_blazing_bolts as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_blazing_bolts as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_blazing_bolts is not null
      and cast(spell_blazing_bolts as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Bloody Moon'          as card_name,
        cast(floor(cast(spell_bloody_moon as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_bloody_moon as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_bloody_moon is not null
      and cast(spell_bloody_moon as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Branding Rite'          as card_name,
        cast(floor(cast(spell_branding_rite as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_branding_rite as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_branding_rite is not null
      and cast(spell_branding_rite as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Celestial Storm'          as card_name,
        cast(floor(cast(spell_celestial_storm as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_celestial_storm as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_celestial_storm is not null
      and cast(spell_celestial_storm as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Challenge'          as card_name,
        cast(floor(cast(spell_challenge as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_challenge as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_challenge is not null
      and cast(spell_challenge as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Channelsong'          as card_name,
        cast(floor(cast(spell_channelsong as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_channelsong as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_channelsong is not null
      and cast(spell_channelsong as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Cleave'          as card_name,
        cast(floor(cast(spell_cleave as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_cleave as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_cleave is not null
      and cast(spell_cleave as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Contagious'          as card_name,
        cast(floor(cast(spell_contagious as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_contagious as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_contagious is not null
      and cast(spell_contagious as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Cosmic Bolt'          as card_name,
        cast(floor(cast(spell_cosmic_bolt as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_cosmic_bolt as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_cosmic_bolt is not null
      and cast(spell_cosmic_bolt as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Covens Spike'          as card_name,
        cast(floor(cast(spell_covens_spike as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_covens_spike as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_covens_spike is not null
      and cast(spell_covens_spike as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Cover Of Night'          as card_name,
        cast(floor(cast(spell_cover_of_night as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_cover_of_night as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_cover_of_night is not null
      and cast(spell_cover_of_night as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Crystalline Seeds'          as card_name,
        cast(floor(cast(spell_crystalline_seeds as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_crystalline_seeds as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_crystalline_seeds is not null
      and cast(spell_crystalline_seeds as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Cycle Of Life'          as card_name,
        cast(floor(cast(spell_cycle_of_life as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_cycle_of_life as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_cycle_of_life is not null
      and cast(spell_cycle_of_life as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Dantes Inferno'          as card_name,
        cast(floor(cast(spell_dantes_inferno as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_dantes_inferno as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_dantes_inferno is not null
      and cast(spell_dantes_inferno as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Dragons Breath'          as card_name,
        cast(floor(cast(spell_dragons_breath as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_dragons_breath as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_dragons_breath is not null
      and cast(spell_dragons_breath as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Drain'          as card_name,
        cast(floor(cast(spell_drain as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_drain as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_drain is not null
      and cast(spell_drain as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Dripfall'          as card_name,
        cast(floor(cast(spell_dripfall as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_dripfall as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_dripfall is not null
      and cast(spell_dripfall as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Deadly Plunge'          as card_name,
        cast(floor(cast(spell_deadly_plunge as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_deadly_plunge as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_deadly_plunge is not null
      and cast(spell_deadly_plunge as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Deathroar'          as card_name,
        cast(floor(cast(spell_deathroar as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_deathroar as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_deathroar is not null
      and cast(spell_deathroar as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Demonize'          as card_name,
        cast(floor(cast(spell_demonize as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_demonize as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_demonize is not null
      and cast(spell_demonize as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Dig Deep'          as card_name,
        cast(floor(cast(spell_dig_deep as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_dig_deep as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_dig_deep is not null
      and cast(spell_dig_deep as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Divinity'          as card_name,
        cast(floor(cast(spell_divinity as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_divinity as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_divinity is not null
      and cast(spell_divinity as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Duality'          as card_name,
        cast(floor(cast(spell_duality as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_duality as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_duality is not null
      and cast(spell_duality as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Eager Conscript'          as card_name,
        cast(floor(cast(spell_eager_conscript as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_eager_conscript as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_eager_conscript is not null
      and cast(spell_eager_conscript as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Eagleheart'          as card_name,
        cast(floor(cast(spell_eagleheart as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_eagleheart as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_eagleheart is not null
      and cast(spell_eagleheart as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Energy Siphon'          as card_name,
        cast(floor(cast(spell_energy_siphon as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_energy_siphon as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_energy_siphon is not null
      and cast(spell_energy_siphon as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Enflame'          as card_name,
        cast(floor(cast(spell_enflame as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_enflame as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_enflame is not null
      and cast(spell_enflame as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Engraft'          as card_name,
        cast(floor(cast(spell_engraft as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_engraft as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_engraft is not null
      and cast(spell_engraft as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Ensnare'          as card_name,
        cast(floor(cast(spell_ensnare as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_ensnare as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_ensnare is not null
      and cast(spell_ensnare as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Excavated Ember'          as card_name,
        cast(floor(cast(spell_excavated_ember as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_excavated_ember as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_excavated_ember is not null
      and cast(spell_excavated_ember as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Excavation Eruption'          as card_name,
        cast(floor(cast(spell_excavation_eruption as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_excavation_eruption as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_excavation_eruption is not null
      and cast(spell_excavation_eruption as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Explosive Reaction'          as card_name,
        cast(floor(cast(spell_explosive_reaction as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_explosive_reaction as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_explosive_reaction is not null
      and cast(spell_explosive_reaction as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Faes Blessing'          as card_name,
        cast(floor(cast(spell_faes_blessing as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_faes_blessing as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_faes_blessing is not null
      and cast(spell_faes_blessing as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Fanning The Flame'          as card_name,
        cast(floor(cast(spell_fanning_the_flame as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_fanning_the_flame as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_fanning_the_flame is not null
      and cast(spell_fanning_the_flame as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Fertile Ground'          as card_name,
        cast(floor(cast(spell_fertile_ground as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_fertile_ground as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_fertile_ground is not null
      and cast(spell_fertile_ground as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Firestarter'          as card_name,
        cast(floor(cast(spell_firestarter as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_firestarter as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_firestarter is not null
      and cast(spell_firestarter as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Flicker'          as card_name,
        cast(floor(cast(spell_flicker as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_flicker as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_flicker is not null
      and cast(spell_flicker as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Focused Growth'          as card_name,
        cast(floor(cast(spell_focused_growth as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_focused_growth as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_focused_growth is not null
      and cast(spell_focused_growth as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Forever Consumed'          as card_name,
        cast(floor(cast(spell_forever_consumed as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_forever_consumed as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_forever_consumed is not null
      and cast(spell_forever_consumed as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Forevermore Serum'          as card_name,
        cast(floor(cast(spell_forevermore_serum as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_forevermore_serum as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_forevermore_serum is not null
      and cast(spell_forevermore_serum as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Frozen Lance'          as card_name,
        cast(floor(cast(spell_frozen_lance as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_frozen_lance as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_frozen_lance is not null
      and cast(spell_frozen_lance as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Funguy In A Suit'          as card_name,
        cast(floor(cast(spell_funguy_in_a_suit as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_funguy_in_a_suit as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_funguy_in_a_suit is not null
      and cast(spell_funguy_in_a_suit as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Glittering Draught'          as card_name,
        cast(floor(cast(spell_glittering_draught as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_glittering_draught as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_glittering_draught is not null
      and cast(spell_glittering_draught as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Glimmer'          as card_name,
        cast(floor(cast(spell_glimmer as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_glimmer as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_glimmer is not null
      and cast(spell_glimmer as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Glow Up'          as card_name,
        cast(floor(cast(spell_glow_up as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_glow_up as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_glow_up is not null
      and cast(spell_glow_up as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Golden Touch'          as card_name,
        cast(floor(cast(spell_golden_touch as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_golden_touch as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_golden_touch is not null
      and cast(spell_golden_touch as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Gooey Flask'          as card_name,
        cast(floor(cast(spell_gooey_flask as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_gooey_flask as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_gooey_flask is not null
      and cast(spell_gooey_flask as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Gravity'          as card_name,
        cast(floor(cast(spell_gravity as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_gravity as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_gravity is not null
      and cast(spell_gravity as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Greed'          as card_name,
        cast(floor(cast(spell_greed as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_greed as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_greed is not null
      and cast(spell_greed as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Grovel'          as card_name,
        cast(floor(cast(spell_grovel as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_grovel as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_grovel is not null
      and cast(spell_grovel as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Hallowed Drippings'          as card_name,
        cast(floor(cast(spell_hallowed_drippings as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_hallowed_drippings as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_hallowed_drippings is not null
      and cast(spell_hallowed_drippings as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Heavenfall'          as card_name,
        cast(floor(cast(spell_heavenfall as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_heavenfall as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_heavenfall is not null
      and cast(spell_heavenfall as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Heroic Dive'          as card_name,
        cast(floor(cast(spell_heroic_dive as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_heroic_dive as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_heroic_dive is not null
      and cast(spell_heroic_dive as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Helical Crystalis'          as card_name,
        cast(floor(cast(spell_helical_crystalis as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_helical_crystalis as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_helical_crystalis is not null
      and cast(spell_helical_crystalis as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Hexcalation'          as card_name,
        cast(floor(cast(spell_hexcalation as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_hexcalation as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_hexcalation is not null
      and cast(spell_hexcalation as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Hidden Passage'          as card_name,
        cast(floor(cast(spell_hidden_passage as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_hidden_passage as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_hidden_passage is not null
      and cast(spell_hidden_passage as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Horn Break'          as card_name,
        cast(floor(cast(spell_horn_break as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_horn_break as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_horn_break is not null
      and cast(spell_horn_break as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Horrify'          as card_name,
        cast(floor(cast(spell_horrify as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_horrify as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_horrify is not null
      and cast(spell_horrify as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Imp In A Box'          as card_name,
        cast(floor(cast(spell_imp_in_a_box as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_imp_in_a_box as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_imp_in_a_box is not null
      and cast(spell_imp_in_a_box as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Imp Olate'          as card_name,
        cast(floor(cast(spell_imp_olate as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_imp_olate as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_imp_olate is not null
      and cast(spell_imp_olate as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Inequivalent Exchange'          as card_name,
        cast(floor(cast(spell_inequivalent_exchange as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_inequivalent_exchange as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_inequivalent_exchange is not null
      and cast(spell_inequivalent_exchange as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Inhale'          as card_name,
        cast(floor(cast(spell_inhale as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_inhale as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_inhale is not null
      and cast(spell_inhale as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Insatiable Hunger'          as card_name,
        cast(floor(cast(spell_insatiable_hunger as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_insatiable_hunger as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_insatiable_hunger is not null
      and cast(spell_insatiable_hunger as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Inspire'          as card_name,
        cast(floor(cast(spell_inspire as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_inspire as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_inspire is not null
      and cast(spell_inspire as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Invigorating Solution'          as card_name,
        cast(floor(cast(spell_invigorating_solution as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_invigorating_solution as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_invigorating_solution is not null
      and cast(spell_invigorating_solution as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Its Alive'          as card_name,
        cast(floor(cast(spell_its_alive as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_its_alive as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_its_alive is not null
      and cast(spell_its_alive as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Just Cause'          as card_name,
        cast(floor(cast(spell_just_cause as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_just_cause as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_just_cause is not null
      and cast(spell_just_cause as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Lava Flow'          as card_name,
        cast(floor(cast(spell_lava_flow as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_lava_flow as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_lava_flow is not null
      and cast(spell_lava_flow as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Liquid Courage'          as card_name,
        cast(floor(cast(spell_liquid_courage as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_liquid_courage as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_liquid_courage is not null
      and cast(spell_liquid_courage as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Lunacy'          as card_name,
        cast(floor(cast(spell_lunacy as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_lunacy as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_lunacy is not null
      and cast(spell_lunacy as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Make It Rain'          as card_name,
        cast(floor(cast(spell_make_it_rain as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_make_it_rain as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_make_it_rain is not null
      and cast(spell_make_it_rain as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Minds Of Their Own'          as card_name,
        cast(floor(cast(spell_minds_of_their_own as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_minds_of_their_own as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_minds_of_their_own is not null
      and cast(spell_minds_of_their_own as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Mine Collapse'          as card_name,
        cast(floor(cast(spell_mine_collapse as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_mine_collapse as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_mine_collapse is not null
      and cast(spell_mine_collapse as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Mix A Lot'          as card_name,
        cast(floor(cast(spell_mix_a_lot as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_mix_a_lot as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_mix_a_lot is not null
      and cast(spell_mix_a_lot as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Mixology'          as card_name,
        cast(floor(cast(spell_mixology as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_mixology as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_mixology is not null
      and cast(spell_mixology as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Moonbeam'          as card_name,
        cast(floor(cast(spell_moonbeam as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_moonbeam as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_moonbeam is not null
      and cast(spell_moonbeam as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Moon Ritual'          as card_name,
        cast(floor(cast(spell_moon_ritual as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_moon_ritual as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_moon_ritual is not null
      and cast(spell_moon_ritual as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Mulch'          as card_name,
        cast(floor(cast(spell_mulch as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_mulch as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_mulch is not null
      and cast(spell_mulch as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Mushroom Cloud'          as card_name,
        cast(floor(cast(spell_mushroom_cloud as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_mushroom_cloud as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_mushroom_cloud is not null
      and cast(spell_mushroom_cloud as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Packed Morsels'          as card_name,
        cast(floor(cast(spell_packed_morsels as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_packed_morsels as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_packed_morsels is not null
      and cast(spell_packed_morsels as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Pandemic'          as card_name,
        cast(floor(cast(spell_pandemic as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_pandemic as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_pandemic is not null
      and cast(spell_pandemic as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Pay Off'          as card_name,
        cast(floor(cast(spell_pay_off as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_pay_off as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_pay_off is not null
      and cast(spell_pay_off as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Perils Of Production'          as card_name,
        cast(floor(cast(spell_perils_of_production as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_perils_of_production as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_perils_of_production is not null
      and cast(spell_perils_of_production as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Pox'          as card_name,
        cast(floor(cast(spell_pox as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_pox as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_pox is not null
      and cast(spell_pox as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Preserved Thorns'          as card_name,
        cast(floor(cast(spell_preserved_thorns as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_preserved_thorns as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_preserved_thorns is not null
      and cast(spell_preserved_thorns as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Prismal Dust'          as card_name,
        cast(floor(cast(spell_prismal_dust as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_prismal_dust as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_prismal_dust is not null
      and cast(spell_prismal_dust as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Proliferate'          as card_name,
        cast(floor(cast(spell_proliferate as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_proliferate as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_proliferate is not null
      and cast(spell_proliferate as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Pseudoscience'          as card_name,
        cast(floor(cast(spell_pseudoscience as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_pseudoscience as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_pseudoscience is not null
      and cast(spell_pseudoscience as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Pyreball'          as card_name,
        cast(floor(cast(spell_pyreball as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_pyreball as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_pyreball is not null
      and cast(spell_pyreball as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Pyreborne Brainspike'          as card_name,
        cast(floor(cast(spell_pyreborne_brainspike as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_pyreborne_brainspike as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_pyreborne_brainspike is not null
      and cast(spell_pyreborne_brainspike as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Pyrecask'          as card_name,
        cast(floor(cast(spell_pyrecask as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_pyrecask as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_pyrecask is not null
      and cast(spell_pyrecask as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Pyreclasm'          as card_name,
        cast(floor(cast(spell_pyreclasm as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_pyreclasm as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_pyreclasm is not null
      and cast(spell_pyreclasm as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Pyre Shards'          as card_name,
        cast(floor(cast(spell_pyre_shards as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_pyre_shards as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_pyre_shards is not null
      and cast(spell_pyre_shards as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Rage Serum'          as card_name,
        cast(floor(cast(spell_rage_serum as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_rage_serum as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_rage_serum is not null
      and cast(spell_rage_serum as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Razorsharp Edge'          as card_name,
        cast(floor(cast(spell_razorsharp_edge as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_razorsharp_edge as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_razorsharp_edge is not null
      and cast(spell_razorsharp_edge as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Reinforce'          as card_name,
        cast(floor(cast(spell_reinforce as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_reinforce as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_reinforce is not null
      and cast(spell_reinforce as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Remnant Pact'          as card_name,
        cast(floor(cast(spell_remnant_pact as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_remnant_pact as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_remnant_pact is not null
      and cast(spell_remnant_pact as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Replicator Ray'          as card_name,
        cast(floor(cast(spell_replicator_ray as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_replicator_ray as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_replicator_ray is not null
      and cast(spell_replicator_ray as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Restoration Detonation'          as card_name,
        cast(floor(cast(spell_restoration_detonation as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_restoration_detonation as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_restoration_detonation is not null
      and cast(spell_restoration_detonation as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Restoring Retreat'          as card_name,
        cast(floor(cast(spell_restoring_retreat as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_restoring_retreat as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_restoring_retreat is not null
      and cast(spell_restoring_retreat as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Restore'          as card_name,
        cast(floor(cast(spell_restore as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_restore as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_restore is not null
      and cast(spell_restore as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Rising Rage'          as card_name,
        cast(floor(cast(spell_rising_rage as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_rising_rage as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_rising_rage is not null
      and cast(spell_rising_rage as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Risky Operation'          as card_name,
        cast(floor(cast(spell_risky_operation as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_risky_operation as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_risky_operation is not null
      and cast(spell_risky_operation as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Ritual Of Battle'          as card_name,
        cast(floor(cast(spell_ritual_of_battle as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_ritual_of_battle as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_ritual_of_battle is not null
      and cast(spell_ritual_of_battle as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Ritual Tome'          as card_name,
        cast(floor(cast(spell_ritual_tome as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_ritual_tome as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_ritual_tome is not null
      and cast(spell_ritual_tome as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Rot'          as card_name,
        cast(floor(cast(spell_rot as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_rot as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_rot is not null
      and cast(spell_rot as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Sanctuary'          as card_name,
        cast(floor(cast(spell_sanctuary as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_sanctuary as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_sanctuary is not null
      and cast(spell_sanctuary as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Secret Ingredient'          as card_name,
        cast(floor(cast(spell_secret_ingredient as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_secret_ingredient as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_secret_ingredient is not null
      and cast(spell_secret_ingredient as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Selfless Sacrifice'          as card_name,
        cast(floor(cast(spell_selfless_sacrifice as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_selfless_sacrifice as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_selfless_sacrifice is not null
      and cast(spell_selfless_sacrifice as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Shadesplitter'          as card_name,
        cast(floor(cast(spell_shadesplitter as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_shadesplitter as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_shadesplitter is not null
      and cast(spell_shadesplitter as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Sharpen'          as card_name,
        cast(floor(cast(spell_sharpen as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_sharpen as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_sharpen is not null
      and cast(spell_sharpen as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Silver Ink'          as card_name,
        cast(floor(cast(spell_silver_ink as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_silver_ink as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_silver_ink is not null
      and cast(spell_silver_ink as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Silver Strike'          as card_name,
        cast(floor(cast(spell_silver_strike as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_silver_strike as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_silver_strike is not null
      and cast(spell_silver_strike as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Small Gift Box'          as card_name,
        cast(floor(cast(spell_small_gift_box as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_small_gift_box as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_small_gift_box is not null
      and cast(spell_small_gift_box as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Smelted Treasure'          as card_name,
        cast(floor(cast(spell_smelted_treasure as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_smelted_treasure as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_smelted_treasure is not null
      and cast(spell_smelted_treasure as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Soldier Of Fortune'          as card_name,
        cast(floor(cast(spell_soldier_of_fortune as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_soldier_of_fortune as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_soldier_of_fortune is not null
      and cast(spell_soldier_of_fortune as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Spawning Pods'          as card_name,
        cast(floor(cast(spell_spawning_pods as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_spawning_pods as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_spawning_pods is not null
      and cast(spell_spawning_pods as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Spike Of The Banished'          as card_name,
        cast(floor(cast(spell_spike_of_the_banished as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_spike_of_the_banished as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_spike_of_the_banished is not null
      and cast(spell_spike_of_the_banished as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Spike Of The Hellhorned'          as card_name,
        cast(floor(cast(spell_spike_of_the_hellhorned as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_spike_of_the_hellhorned as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_spike_of_the_hellhorned is not null
      and cast(spell_spike_of_the_hellhorned as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Spike Of The Legion'          as card_name,
        cast(floor(cast(spell_spike_of_the_legion as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_spike_of_the_legion as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_spike_of_the_legion is not null
      and cast(spell_spike_of_the_legion as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Spike Of The Stygian'          as card_name,
        cast(floor(cast(spell_spike_of_the_stygian as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_spike_of_the_stygian as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_spike_of_the_stygian is not null
      and cast(spell_spike_of_the_stygian as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Spreading Spores'          as card_name,
        cast(floor(cast(spell_spreading_spores as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_spreading_spores as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_spreading_spores is not null
      and cast(spell_spreading_spores as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Sporetouch'          as card_name,
        cast(floor(cast(spell_sporetouch as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_sporetouch as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_sporetouch is not null
      and cast(spell_sporetouch as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Starstruck'          as card_name,
        cast(floor(cast(spell_starstruck as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_starstruck as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_starstruck is not null
      and cast(spell_starstruck as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Steel Enhancer'          as card_name,
        cast(floor(cast(spell_steel_enhancer as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_steel_enhancer as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_steel_enhancer is not null
      and cast(spell_steel_enhancer as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Sting'          as card_name,
        cast(floor(cast(spell_sting as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_sting as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_sting is not null
      and cast(spell_sting as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Surgical Strike'          as card_name,
        cast(floor(cast(spell_surgical_strike as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_surgical_strike as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_surgical_strike is not null
      and cast(spell_surgical_strike as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Superheated'          as card_name,
        cast(floor(cast(spell_superheated as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_superheated as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_superheated is not null
      and cast(spell_superheated as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Tidal Turning'          as card_name,
        cast(floor(cast(spell_tidal_turning as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_tidal_turning as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_tidal_turning is not null
      and cast(spell_tidal_turning as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Tiresome Climb'          as card_name,
        cast(floor(cast(spell_tiresome_climb as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_tiresome_climb as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_tiresome_climb is not null
      and cast(spell_tiresome_climb as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Tome Of Contracts'          as card_name,
        cast(floor(cast(spell_tome_of_contracts as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_tome_of_contracts as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_tome_of_contracts is not null
      and cast(spell_tome_of_contracts as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Tome Of Horrors'          as card_name,
        cast(floor(cast(spell_tome_of_horrors as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_tome_of_horrors as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_tome_of_horrors is not null
      and cast(spell_tome_of_horrors as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Tome Of The Lost Path'          as card_name,
        cast(floor(cast(spell_tome_of_the_lost_path as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_tome_of_the_lost_path as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_tome_of_the_lost_path is not null
      and cast(spell_tome_of_the_lost_path as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Torch'          as card_name,
        cast(floor(cast(spell_torch as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_torch as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_torch is not null
      and cast(spell_torch as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Unearth Treasure'          as card_name,
        cast(floor(cast(spell_unearth_treasure as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_unearth_treasure as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_unearth_treasure is not null
      and cast(spell_unearth_treasure as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Unleash The Wildwood'          as card_name,
        cast(floor(cast(spell_unleash_the_wildwood as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_unleash_the_wildwood as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_unleash_the_wildwood is not null
      and cast(spell_unleash_the_wildwood as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Unnamed Tome'          as card_name,
        cast(floor(cast(spell_unnamed_tome as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_unnamed_tome as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_unnamed_tome is not null
      and cast(spell_unnamed_tome as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Urchin Spines'          as card_name,
        cast(floor(cast(spell_urchin_spines as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_urchin_spines as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_urchin_spines is not null
      and cast(spell_urchin_spines as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Vent'          as card_name,
        cast(floor(cast(spell_vent as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_vent as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_vent is not null
      and cast(spell_vent as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Vine Grasp'          as card_name,
        cast(floor(cast(spell_vine_grasp as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_vine_grasp as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_vine_grasp is not null
      and cast(spell_vine_grasp as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Wildwood Sap'          as card_name,
        cast(floor(cast(spell_wildwood_sap as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_wildwood_sap as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_wildwood_sap is not null
      and cast(spell_wildwood_sap as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Wildwood Tome'          as card_name,
        cast(floor(cast(spell_wildwood_tome as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_wildwood_tome as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_wildwood_tome is not null
      and cast(spell_wildwood_tome as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Witchweave'          as card_name,
        cast(floor(cast(spell_witchweave as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_witchweave as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_witchweave is not null
      and cast(spell_witchweave as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Wracking Pain'          as card_name,
        cast(floor(cast(spell_wracking_pain as decimal)) as integer) as copies,
        cast(round(mod(cast(spell_wracking_pain as decimal), 1) * 10) as integer) as upgrades
    from source
    where spell_wracking_pain is not null
      and cast(spell_wracking_pain as decimal) > 0

    union all

    select
        run_id,
        'Blight'  as card_type,
        'Dominions Eye'          as card_name,
        cast(floor(cast(blight_dominions_eye as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where blight_dominions_eye is not null
      and cast(blight_dominions_eye as decimal) > 0

    union all

    select
        run_id,
        'Blight'  as card_type,
        'Entropic Crystals'          as card_name,
        cast(floor(cast(blight_entropic_crystals as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where blight_entropic_crystals is not null
      and cast(blight_entropic_crystals as decimal) > 0

    union all

    select
        run_id,
        'Blight'  as card_type,
        'Savage Shackles'          as card_name,
        cast(floor(cast(blight_savage_shackles as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where blight_savage_shackles is not null
      and cast(blight_savage_shackles as decimal) > 0

    union all

    select
        run_id,
        'Blight'  as card_type,
        'Dantes Candle'          as card_name,
        cast(floor(cast(blight_dantes_candle as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where blight_dantes_candle is not null
      and cast(blight_dantes_candle as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Dark Deal'          as card_name,
        cast(floor(cast(spell_dark_deal as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_dark_deal is not null
      and cast(spell_dark_deal as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'March Of Shields'          as card_name,
        cast(floor(cast(spell_march_of_shields as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_march_of_shields is not null
      and cast(spell_march_of_shields as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Deadly Variant'          as card_name,
        cast(floor(cast(spell_deadly_variant as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_deadly_variant is not null
      and cast(spell_deadly_variant as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Flash Freeze'          as card_name,
        cast(floor(cast(spell_flash_freeze as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_flash_freeze is not null
      and cast(spell_flash_freeze as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Scrap For Parts'          as card_name,
        cast(floor(cast(spell_scrap_for_parts as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_scrap_for_parts is not null
      and cast(spell_scrap_for_parts as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Spike Of The League'          as card_name,
        cast(floor(cast(spell_spike_of_the_league as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_spike_of_the_league is not null
      and cast(spell_spike_of_the_league as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Tome Of Evergrowth'          as card_name,
        cast(floor(cast(spell_tome_of_evergrowth as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_tome_of_evergrowth is not null
      and cast(spell_tome_of_evergrowth as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Icy Cilophyte'          as card_name,
        cast(floor(cast(unit_icy_cilophyte as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_icy_cilophyte is not null
      and cast(unit_icy_cilophyte as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Molluscmage'          as card_name,
        cast(floor(cast(unit_molluscmage as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_molluscmage is not null
      and cast(unit_molluscmage as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Nameless Siren'          as card_name,
        cast(floor(cast(unit_nameless_siren as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_nameless_siren is not null
      and cast(unit_nameless_siren as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Resin Blades'          as card_name,
        cast(floor(cast(equipment_resin_blades as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_resin_blades is not null
      and cast(equipment_resin_blades as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Faulty Body'          as card_name,
        cast(floor(cast(spell_faulty_body as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_faulty_body is not null
      and cast(spell_faulty_body as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Heavensward'          as card_name,
        cast(floor(cast(spell_heavensward as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_heavensward is not null
      and cast(spell_heavensward as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Machinists Tome'          as card_name,
        cast(floor(cast(spell_machinists_tome as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_machinists_tome is not null
      and cast(spell_machinists_tome as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Pyre Go'          as card_name,
        cast(floor(cast(spell_pyre_go as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_pyre_go is not null
      and cast(spell_pyre_go as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Rootseeds'          as card_name,
        cast(floor(cast(spell_rootseeds as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_rootseeds is not null
      and cast(spell_rootseeds as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Sacred Wicks'          as card_name,
        cast(floor(cast(spell_sacred_wicks as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_sacred_wicks is not null
      and cast(spell_sacred_wicks as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Waxen Spike'          as card_name,
        cast(floor(cast(spell_waxen_spike as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_waxen_spike is not null
      and cast(spell_waxen_spike as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Bone Dog'          as card_name,
        cast(floor(cast(unit_bone_dog as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_bone_dog is not null
      and cast(unit_bone_dog as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Entombed Explosive'          as card_name,
        cast(floor(cast(unit_entombed_explosive as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_entombed_explosive is not null
      and cast(unit_entombed_explosive as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Paraffin Thug'          as card_name,
        cast(floor(cast(unit_paraffin_thug as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_paraffin_thug is not null
      and cast(unit_paraffin_thug as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Shattered Shell'          as card_name,
        cast(floor(cast(unit_shattered_shell as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_shattered_shell is not null
      and cast(unit_shattered_shell as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Ambient Charge'          as card_name,
        cast(floor(cast(equipment_ambient_charge as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_ambient_charge is not null
      and cast(equipment_ambient_charge as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Ancient Resonance'          as card_name,
        cast(floor(cast(spell_ancient_resonance as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_ancient_resonance is not null
      and cast(spell_ancient_resonance as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Bounding Echoes'          as card_name,
        cast(floor(cast(spell_bounding_echoes as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_bounding_echoes is not null
      and cast(spell_bounding_echoes as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Echo Snare'          as card_name,
        cast(floor(cast(spell_echo_snare as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_echo_snare is not null
      and cast(spell_echo_snare as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Echo Transfer'          as card_name,
        cast(floor(cast(spell_echo_transfer as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_echo_transfer is not null
      and cast(spell_echo_transfer as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Echoes Of The Past'          as card_name,
        cast(floor(cast(spell_echoes_of_the_past as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_echoes_of_the_past is not null
      and cast(spell_echoes_of_the_past as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Fracture'          as card_name,
        cast(floor(cast(spell_fracture as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_fracture is not null
      and cast(spell_fracture as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Imp Portant Work'          as card_name,
        cast(floor(cast(spell_imp_portant_work as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_imp_portant_work is not null
      and cast(spell_imp_portant_work as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Last Stand'          as card_name,
        cast(floor(cast(spell_last_stand as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_last_stand is not null
      and cast(spell_last_stand as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Proclamation'          as card_name,
        cast(floor(cast(spell_proclamation as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_proclamation is not null
      and cast(spell_proclamation as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Bog Fly'          as card_name,
        cast(floor(cast(unit_bog_fly as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_bog_fly is not null
      and cast(unit_bog_fly as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Glugsider'          as card_name,
        cast(floor(cast(unit_glugsider as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_glugsider is not null
      and cast(unit_glugsider as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Kinhost Carapace'          as card_name,
        cast(floor(cast(unit_kinhost_carapace as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_kinhost_carapace is not null
      and cast(unit_kinhost_carapace as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Wildwood Custodian'          as card_name,
        cast(floor(cast(unit_wildwood_custodian as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_wildwood_custodian is not null
      and cast(unit_wildwood_custodian as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Molded'          as card_name,
        cast(floor(cast(spell_molded as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_molded is not null
      and cast(spell_molded as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Wicklash'          as card_name,
        cast(floor(cast(spell_wicklash as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_wicklash is not null
      and cast(spell_wicklash as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Lady Of The House'          as card_name,
        cast(floor(cast(unit_lady_of_the_house as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_lady_of_the_house is not null
      and cast(unit_lady_of_the_house as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Molten Encasement'          as card_name,
        cast(floor(cast(unit_molten_encasement as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_molten_encasement is not null
      and cast(unit_molten_encasement as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Crypt Builder'          as card_name,
        cast(floor(cast(spell_crypt_builder as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_crypt_builder is not null
      and cast(spell_crypt_builder as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Ice And Pyre'          as card_name,
        cast(floor(cast(spell_ice_and_pyre as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_ice_and_pyre is not null
      and cast(spell_ice_and_pyre as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Titans Gratitude'          as card_name,
        cast(floor(cast(spell_titans_gratitude as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_titans_gratitude is not null
      and cast(spell_titans_gratitude as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Coldcaelia'          as card_name,
        cast(floor(cast(unit_coldcaelia as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_coldcaelia is not null
      and cast(unit_coldcaelia as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Mitosis Cap'          as card_name,
        cast(floor(cast(equipment_mitosis_cap as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_mitosis_cap is not null
      and cast(equipment_mitosis_cap as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Cannibalize'          as card_name,
        cast(floor(cast(spell_cannibalize as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_cannibalize is not null
      and cast(spell_cannibalize as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Cave In'          as card_name,
        cast(floor(cast(spell_cave_in as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_cave_in is not null
      and cast(spell_cave_in as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Echo Infusion'          as card_name,
        cast(floor(cast(spell_echo_infusion as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_echo_infusion is not null
      and cast(spell_echo_infusion as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Gem Trove'          as card_name,
        cast(floor(cast(spell_gem_trove as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_gem_trove is not null
      and cast(spell_gem_trove as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Hosting Kin'          as card_name,
        cast(floor(cast(spell_hosting_kin as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_hosting_kin is not null
      and cast(spell_hosting_kin as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Immortal Trade'          as card_name,
        cast(floor(cast(spell_immortal_trade as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_immortal_trade is not null
      and cast(spell_immortal_trade as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Retch'          as card_name,
        cast(floor(cast(spell_retch as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_retch is not null
      and cast(spell_retch as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Soulcrushing Guilt'          as card_name,
        cast(floor(cast(spell_soulcrushing_guilt as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_soulcrushing_guilt is not null
      and cast(spell_soulcrushing_guilt as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'The Great Decay'          as card_name,
        cast(floor(cast(spell_the_great_decay as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_the_great_decay is not null
      and cast(spell_the_great_decay as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Wurmkin Etchings'          as card_name,
        cast(floor(cast(spell_wurmkin_etchings as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_wurmkin_etchings is not null
      and cast(spell_wurmkin_etchings as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Crucible Collector'          as card_name,
        cast(floor(cast(unit_crucible_collector as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_crucible_collector is not null
      and cast(unit_crucible_collector as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'First Of Kin'          as card_name,
        cast(floor(cast(unit_first_of_kin as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_first_of_kin is not null
      and cast(unit_first_of_kin as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Morselmaster'          as card_name,
        cast(floor(cast(unit_morselmaster as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_morselmaster is not null
      and cast(unit_morselmaster as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Boilerplate'          as card_name,
        cast(floor(cast(equipment_boilerplate as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_boilerplate is not null
      and cast(equipment_boilerplate as decimal) > 0

    union all

    select
        run_id,
        'Equipment'  as card_type,
        'Gluttons Maw'          as card_name,
        cast(floor(cast(equipment_gluttons_maw as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where equipment_gluttons_maw is not null
      and cast(equipment_gluttons_maw as decimal) > 0

    union all

    select
        run_id,
        'Room'  as card_type,
        'Engine Upgrade'          as card_name,
        cast(floor(cast(room_engine_upgrade as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where room_engine_upgrade is not null
      and cast(room_engine_upgrade as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'A Fatal Melting'          as card_name,
        cast(floor(cast(spell_a_fatal_melting as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_a_fatal_melting is not null
      and cast(spell_a_fatal_melting as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Accelerated Incubation'          as card_name,
        cast(floor(cast(spell_accelerated_incubation as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_accelerated_incubation is not null
      and cast(spell_accelerated_incubation as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Broken Memories'          as card_name,
        cast(floor(cast(spell_broken_memories as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_broken_memories is not null
      and cast(spell_broken_memories as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Crypt Builder'          as card_name,
        cast(floor(cast(spell_crypt_builder as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_crypt_builder is not null
      and cast(spell_crypt_builder as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Frenzied Swarm'          as card_name,
        cast(floor(cast(spell_frenzied_swarm as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_frenzied_swarm is not null
      and cast(spell_frenzied_swarm as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Making Of A Morsel'          as card_name,
        cast(floor(cast(spell_making_of_a_morsel as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_making_of_a_morsel is not null
      and cast(spell_making_of_a_morsel as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Memento Mori'          as card_name,
        cast(floor(cast(spell_memento_mori as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_memento_mori is not null
      and cast(spell_memento_mori as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Plink'          as card_name,
        cast(floor(cast(spell_plink as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_plink is not null
      and cast(spell_plink as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Space Prism'          as card_name,
        cast(floor(cast(spell_space_prism as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_space_prism is not null
      and cast(spell_space_prism as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Umbra Stone'          as card_name,
        cast(floor(cast(spell_umbra_stone as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_umbra_stone is not null
      and cast(spell_umbra_stone as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Wurmkin Spike'          as card_name,
        cast(floor(cast(spell_wurmkin_spike as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_wurmkin_spike is not null
      and cast(spell_wurmkin_spike as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Bog Chrysalis'          as card_name,
        cast(floor(cast(unit_bog_chrysalis as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_bog_chrysalis is not null
      and cast(unit_bog_chrysalis as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Magma Morsel'          as card_name,
        cast(floor(cast(unit_magma_morsel as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_magma_morsel is not null
      and cast(unit_magma_morsel as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Morsel Made'          as card_name,
        cast(floor(cast(unit_morsel_made as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_morsel_made is not null
      and cast(unit_morsel_made as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Morsel Miner'          as card_name,
        cast(floor(cast(unit_morsel_miner as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_morsel_miner is not null
      and cast(unit_morsel_miner as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Nine Lived Nightmare'          as card_name,
        cast(floor(cast(unit_nine_lived_nightmare as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_nine_lived_nightmare is not null
      and cast(unit_nine_lived_nightmare as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Shardsoul Carver'          as card_name,
        cast(floor(cast(unit_shardsoul_carver as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_shardsoul_carver is not null
      and cast(unit_shardsoul_carver as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Wickless Baron'          as card_name,
        cast(floor(cast(unit_wickless_baron as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_wickless_baron is not null
      and cast(unit_wickless_baron as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Bonk'          as card_name,
        cast(floor(cast(spell_bonk as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_bonk is not null
      and cast(spell_bonk as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Smith'          as card_name,
        cast(floor(cast(spell_smith as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_smith is not null
      and cast(spell_smith as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Salvage Machine'          as card_name,
        cast(floor(cast(unit_salvage_machine as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_salvage_machine is not null
      and cast(unit_salvage_machine as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Steel Steward'          as card_name,
        cast(floor(cast(unit_steel_steward as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_steel_steward is not null
      and cast(unit_steel_steward as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Weldling'          as card_name,
        cast(floor(cast(unit_weldling as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_weldling is not null
      and cast(unit_weldling as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Ember Cache'          as card_name,
        cast(floor(cast(spell_ember_cache as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_ember_cache is not null
      and cast(spell_ember_cache as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Moonrise'          as card_name,
        cast(floor(cast(spell_moonrise as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_moonrise is not null
      and cast(spell_moonrise as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Shroud Spike'          as card_name,
        cast(floor(cast(spell_shroud_spike as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_shroud_spike is not null
      and cast(spell_shroud_spike as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Alloyed Construct'          as card_name,
        cast(floor(cast(unit_alloyed_construct as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_alloyed_construct is not null
      and cast(unit_alloyed_construct as decimal) > 0

    union all

    select
        run_id,
        'Unit'  as card_type,
        'Overgorger'          as card_name,
        cast(floor(cast(unit_overgorger as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where unit_overgorger is not null
      and cast(unit_overgorger as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Devlish Details'          as card_name,
        cast(floor(cast(spell_devlish_details as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_devlish_details is not null
      and cast(spell_devlish_details as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Foregone Power'          as card_name,
        cast(floor(cast(spell_foregone_power as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_foregone_power is not null
      and cast(spell_foregone_power as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Offering Token'          as card_name,
        cast(floor(cast(spell_offering_token as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_offering_token is not null
      and cast(spell_offering_token as decimal) > 0

    union all

    select
        run_id,
        'Spell'  as card_type,
        'Titanstooth'          as card_name,
        cast(floor(cast(spell_titanstooth as decimal)) as integer) as copies,
        0                                                              as upgrades
    from source
    where spell_titanstooth is not null
      and cast(spell_titanstooth as decimal) > 0

)

select
    run_id,
    card_type,
    card_name,
    copies,
    upgrades
from unioned