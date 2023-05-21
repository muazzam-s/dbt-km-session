{% macro date_difference_in_days(start_date, end_date) %}
    DATEDIFF(DAY, start_date, end_date) 
{% endmacro %}

