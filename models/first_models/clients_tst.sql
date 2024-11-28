

{% if var('snfwarehouse')=='true' %}
{{
    config(
        materialized='table',
        snowflake_warehouse=var('snfwarehouse')
    )
}}

{%else%}
{{
    config(
        materialized='table'
    )
}}
    
{% endif %}



select 
    {{dbt_utils.generate_surrogate_key(['ID','FIRST_NAME','LAST_NAME'])}} as skey,
    ID ,
    {{upper_mc('FIRST_NAME')}} as FIRST_NAME, 
    LAST_NAME
from {{ source('jaffle_shop', 'customers') }}

{% if target.name == 'dev' or target.name == 'default'%}
limit 10
{% endif %}