{% macro total_runtime(number_of_episodes, episode_length) %}
     ROUND((number_of_episodes * episode_length) / 60, 2)
{% endmacro %}