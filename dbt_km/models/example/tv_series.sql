{{ config(
    materialized='table',
    transient = false
    )
}}

with tv_series as (
    select ROW_NUMBER() OVER (ORDER BY in_production) as ID, *
    from (select name, in_production,number_of_episodes, number_of_seasons, first_air_date, last_air_date, 30 as episode_length, current_timestamp as insert_ts
          from {{ ref ('tv_series_shows')}}
          where first_air_date is not null AND first_air_date < '2023-05-10' AND number_of_episodes BETWEEN 5 AND 25 AND in_production = 'TRUE'
          order by id  
          limit 20
        ) a 
)
select * from tv_series 