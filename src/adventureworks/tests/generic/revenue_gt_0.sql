{% test revenue_gt_0(model, column_name) %}
with validation as (
    select 
        {{ column_name }} as revenue_field
    from
        {{ model }}
),
validation_errors as (
    select
         revenue_field 
    from
        validation
    where revenue_field < 0.1
)
select * 
from validation_errors
{% endtest %}