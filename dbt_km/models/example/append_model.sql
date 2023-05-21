{{config(
  materialized='incremental',
  incremental_strategy='append'
)}}

SELECT *
FROM
  {{ ref ('tv_series')}} a

{% if is_incremental() %}
WHERE
  a.insert_ts > (SELECT MAX(x.insert_ts) FROM {{ this }} x)
{% endif %}