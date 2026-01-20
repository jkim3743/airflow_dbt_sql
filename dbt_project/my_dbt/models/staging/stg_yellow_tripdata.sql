with source as (

    select *
    from {{ source('raw', 'yellow_tripdata_raw') }}

),

renamed as (

    select
        "VendorID" as vendor_id,
        "tpep_pickup_datetime" as pickup_datetime,
        "tpep_dropoff_datetime" as dropoff_datetime,
        "passenger_count" as passenger_count,
        "trip_distance" as trip_distance,
        "RatecodeID" as ratecode_id,
        "store_and_fwd_flag" as store_and_fwd_flag,
        "PULocationID" as pu_location_id,
        "DOLocationID" as do_location_id,
        "payment_type" as payment_type,
        "fare_amount" as fare_amount,
        "extra" as extra,
        "mta_tax" as mta_tax,
        "tip_amount" as tip_amount,
        "tolls_amount" as tolls_amount,
        "improvement_surcharge" as improvement_surcharge,
        "total_amount" as total_amount,
        "congestion_surcharge" as congestion_surcharge,
        "Airport_fee" as airport_fee,
        "cbd_congestion_fee" as cbd_congestion_fee
    from source

)

select * from renamed
