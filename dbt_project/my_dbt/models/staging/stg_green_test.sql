with source as (

    select *
    from {{ source('raw', 'green_tripdata_test') }}

),

renamed as (

    select
        "VendorID" as vendor_id,
        "lpep_pickup_datetime" as pickup_datetime,
        "lpep_dropoff_datetime" as dropoff_datetime,
        "RatecodeID" as rate_code_id,
        "PULocationID" as pu_location_id,
        "DOLocationID" as do_location_id
    from source

)

select * from renamed
