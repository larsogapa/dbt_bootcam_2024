
select 
    {{upper_mc('ID')}} as id, 
    FIRST_NAME, 
    LAST_NAME
from {{ source('jaffle_shop', 'customers') }}

{% if target.name == 'dev' or target.name == 'default'%}
limit 100
{% endif %}