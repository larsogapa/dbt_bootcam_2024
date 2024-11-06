
select 
    ID ,
    {{upper_mc('FIRST_NAME')}} as FIRST_NAME, 
    LAST_NAME
from {{ source('jaffle_shop', 'customers') }}

{% if target.name == 'dev' or target.name == 'default'%}
limit 10
{% endif %}