{% snapshot snp_customer %}

    {{
        config(

            unique_key='ID',
            strategy='timestamp',
            invalidate_hard_deletes=False,
            updated_at='updated_at'
        )
    }}


    select * 
    from {{ source('jaffle_shop', 'customers') }}

 {% endsnapshot %}