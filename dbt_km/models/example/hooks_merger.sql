{{config(
  materialized='incremental',
  unique_key='id',
  incremental_strategy='merge',
  pre_hook=[
    "CREATE TABLE IF NOT EXISTS merge_pre_hook (ID INT, NAME VARCHAR, number_of_episodes INT)"],
  post_hook=[
    "INSERT INTO dbt_km_db.dbt_km_schema.merge_pre_hook SELECT ID, NAME, number_of_episodes FROM hooks_merger"
  ]
)}}

select * from {{ ref('tv_series')}} a 

{% if is_incremental() %}
WHERE
  a.insert_ts > (SELECT MAX(x.insert_ts) FROM {{ this }} x)
{% endif %}