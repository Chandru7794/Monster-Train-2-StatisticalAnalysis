
  
  create view "mt2"."main"."stg_runs__dbt_tmp" as (
    with source as (
    select * from "mt2"."main"."base_runs"
),

renamed as (
    select
        run_id,
        cast(date as date) as run_date,
        primary_clan,
        cast(primary_level as integer) as primary_level,
        secondary_clan,
        cast(secondary_level as integer) as secondary_level,
        hero,
        cast(covenant_rank as integer) as covenant_rank,
        pyre_heart,
        cast(replace(score, ',', '') as integer) as score,
        cast(time as varchar) as run_time,
        trim(result) as result,
        battle_1,
        battle_2,
        battle_3,
        battle_4,
        battle_5,
        battle_6,
        battle_7,
        battle_8
    from source
)

select * from renamed
  );
