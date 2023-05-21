{{config(
  materialized='incremental',
  unique_key='id',
  incremental_strategy='merge'
)}}

select * from {{ ref('tv_series')}} a 

{% if is_incremental() %}
WHERE
  a.insert_ts > (SELECT MAX(x.insert_ts) FROM {{ this }} x) -- this = same table 
{% endif %}