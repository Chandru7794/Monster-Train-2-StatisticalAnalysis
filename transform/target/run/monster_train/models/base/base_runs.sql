
  
  create view "mt2"."main"."base_runs__dbt_tmp" as (
    select
    *,
    row_number() over () as run_id
from read_csv_auto(
        'C:\Machine Learning Projects\Monster Train\data\Monster Train 2.csv',
        nullstr = '',
        types = {'score': 'VARCHAR'}
    )
where date is not null
  );
