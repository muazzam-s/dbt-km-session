WITH my_table AS (
    SELECT
        ID,
        Name,
        first_air_date,
        last_air_date
    FROM {{ ref('tv_series')}}
)

SELECT
    ID,
    Name,
    first_air_date as start_date,
    last_air_date as end_date,
    {{ date_difference_in_days('start_date', 'end_date') }} AS total_air_days
FROM
    my_table