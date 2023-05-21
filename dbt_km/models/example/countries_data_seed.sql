{{ config(
    materialized='table'
) }}


SELECT
    a.*,
    country_lookup.country_name
FROM "DBT_KM_DB"."DBT_KM_SCHEMA"."COUNTRIES" a
LEFT JOIN {{ ref('country_mapping') }} AS country_lookup
    ON a.country_code = country_lookup.country_code