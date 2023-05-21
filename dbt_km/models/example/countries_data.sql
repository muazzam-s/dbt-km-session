{{ config(
    materialized='table'
) }}

WITH case_cte AS (
    SELECT
        *,
        CASE country_code
            WHEN 'IN' THEN 'India'
            WHEN 'JP' THEN 'Japan'
            WHEN 'CH' THEN 'China'
            WHEN 'AU' THEN 'Australia'
            WHEN 'RU' THEN 'Russia'
            ELSE 'Unknown Country'
        END AS country_name
    FROM "DBT_KM_DB"."DBT_KM_SCHEMA"."COUNTRIES"
)
SELECT
    *
FROM case_cte