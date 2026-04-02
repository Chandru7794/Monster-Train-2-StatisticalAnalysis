
  
  create view "mt2"."main"."dim_cards__dbt_tmp" as (
    with cards as (
    select distinct card_name, card_type
    from "mt2"."main"."stg_cards"
),

attributes as (
    select * from "mt2"."main"."card_attributes"
),

final as (
    select
        c.card_name,
        c.card_type,
        a.clan,
        a.rarity,
        a.cost,
        a.consume,
        a.banner,
        a.ability,
        a.attack,
        a.health,
        a.size
    from cards c
    left join attributes a
        on c.card_name = a.card_name
)

select * from final
  );
