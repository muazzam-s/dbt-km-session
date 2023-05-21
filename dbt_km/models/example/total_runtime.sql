WITH my_table AS (
    SELECT
        ID,
        Name,
        number_of_episodes,
        episode_length
    FROM {{ ref('tv_series')}}
)

SELECT
    ID,
    Name,
    number_of_episodes,
    episode_length,
    {{ total_runtime('number_of_episodes', 'episode_length') }} AS hours
FROM
    my_table