{% test datetime_check(model, column_name) %}

with validation as (
    select 
        try_to_date( {{column_name }}) as date_field,
        case when date_field regexp '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' then 1
            else 0
        end as valid_date
    from {{ model }}
),

date_error as (
    select valid_date from validation
    where valid_date = 0
)
select * from date_error

{% endtest %}