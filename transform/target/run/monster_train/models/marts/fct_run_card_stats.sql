
  
  create view "mt2"."main"."fct_run_card_stats__dbt_tmp" as (
    with run_cards as (
    select
        s.run_id,
        s.card_type,
        s.card_name,
        s.copies,
        s.upgrades,
        d.clan,
        d.cost,
        d.consume,
        d.banner
    from "mt2"."main"."stg_cards" s
    left join "mt2"."main"."dim_cards" d
        on s.card_name = d.card_name
)

select
    run_id,
    SUM(copies)                                                                     as num_cards,
    SUM(upgrades)                                                                   as num_upgrades,
    SUM(CASE WHEN card_type = 'Unit'      THEN copies  ELSE 0 END)                 as num_units,
    SUM(CASE WHEN card_type = 'Spell'     THEN copies  ELSE 0 END)                 as num_spells,
    SUM(CASE WHEN card_type = 'Equipment' THEN copies  ELSE 0 END)                 as num_equipment,
    SUM(CASE WHEN card_type = 'Room'      THEN copies  ELSE 0 END)                 as num_rooms,
    SUM(CASE WHEN card_type = 'Blight'    THEN copies  ELSE 0 END)                 as num_blights,
    SUM(CASE WHEN card_type = 'Unit'      THEN upgrades ELSE 0 END)                as unit_upgrades,
    SUM(CASE WHEN card_type = 'Spell'     THEN upgrades ELSE 0 END)                as spell_upgrades,
    SUM(CASE WHEN cost = 0                THEN copies  ELSE 0 END)                 as zero_cost_cards,
    SUM(CASE WHEN cost = 1                THEN copies  ELSE 0 END)                 as one_cost_cards,
    SUM(CASE WHEN cost = 2                THEN copies  ELSE 0 END)                 as two_cost_cards,
    SUM(CASE WHEN cost = 3                THEN copies  ELSE 0 END)                 as three_cost_cards,
    SUM(CASE WHEN cost = 99               THEN copies  ELSE 0 END)                 as variable_cost_cards,
    SUM(CASE WHEN cost > 3 AND cost != 99 THEN copies  ELSE 0 END)                 as high_cost_cards,
    SUM(CASE WHEN consume = 'Yes'         THEN copies  ELSE 0 END)                 as num_consumes,
    SUM(CASE WHEN banner = 'Yes'          THEN copies  ELSE 0 END)                 as num_banners,

    -- MT1 clans
    SUM(CASE WHEN clan = 'Hellhorned'     THEN copies  ELSE 0 END)                 as hellhorned_cards,
    SUM(CASE WHEN clan = 'Awoken'         THEN copies  ELSE 0 END)                 as awoken_cards,
    SUM(CASE WHEN clan = 'Stygian Guard'  THEN copies  ELSE 0 END)                 as stygian_guard_cards,
    SUM(CASE WHEN clan = 'Umbra'          THEN copies  ELSE 0 END)                 as umbra_cards,
    SUM(CASE WHEN clan = 'Melting Remnant' THEN copies ELSE 0 END)                 as melting_remnant_cards,
    SUM(CASE WHEN clan = 'Wurmkin'        THEN copies  ELSE 0 END)                 as wurmkin_cards,

    -- MT2 clans
    SUM(CASE WHEN clan = 'Banished'       THEN copies  ELSE 0 END)                 as banished_cards,
    SUM(CASE WHEN clan = 'Pyreborne'      THEN copies  ELSE 0 END)                 as pyreborne_cards,
    SUM(CASE WHEN clan = 'Luna Coven'     THEN copies  ELSE 0 END)                 as luna_coven_cards,
    SUM(CASE WHEN clan = 'Underlegion'    THEN copies  ELSE 0 END)                 as underlegion_cards,
    SUM(CASE WHEN clan = 'Lazarus League' THEN copies  ELSE 0 END)                 as lazarus_league_cards,
    SUM(CASE WHEN clan = 'Railforged'     THEN copies  ELSE 0 END)                 as railforged_cards

from run_cards
group by run_id
  );
