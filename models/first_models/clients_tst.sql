
select * 
from {{ source('jaffle_shop', 'customers') }}

{% if target.name == 'dev' or target.name == 'default'%}
limit 100
{% endif %}