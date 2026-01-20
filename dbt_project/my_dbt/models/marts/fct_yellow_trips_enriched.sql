with trips as (
    select *
    from {{ ref('fct_yellow_trips') }}
),

zones as (
    select *
    from {{ ref('dim_taxi_zones') }}
),

final as (
    select
        t.*,

        pu.borough as pu_borough,
        pu.zone as pu_zone,
        pu.service_zone as pu_service_zone,

        dz_do.borough as do_borough,
        dz_do.zone as do_zone,
        dz_do.service_zone as do_service_zone

    from trips t
    left join zones pu
        on t.pu_location_id = pu.location_id
    left join zones dz_do
        on t.do_location_id = dz_do.location_id
)

select * from final
