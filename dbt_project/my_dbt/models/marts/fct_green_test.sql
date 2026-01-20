
with trips as (
    select *
    from {{ ref('stg_green_test') }}
),

final as (
    select
        vendor_id,
        pickup_datetime,
        rate_code_id,
        pu_location_id,
        do_location_id
    from trips
)

select * from final

