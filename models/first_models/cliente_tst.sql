select * from {{ source('jaffle_shop', 'customers') }}
limit 10