{{
    config(
        materialized='incremental',
        unique_key='ID'
    )
}}

select *
from {{ source('jaffle_shop', 'orders') }}


{% if is_incremental() %}
  
    where ORDER_DATE > (select max(ORDER_DATE) from {{ this }}) 

{% endif %} 

