{{
    config(
        materialized='incremental',
        unique_key='id'
    )
}}

select * 
from  {{ source('stripe', 'payments') }}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where CREATED > (select max(CREATED) from {{ this }}) 
    
{% endif %}