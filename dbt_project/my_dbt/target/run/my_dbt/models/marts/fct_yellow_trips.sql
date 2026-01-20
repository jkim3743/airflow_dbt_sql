
  
    

  create  table "de_db"."public"."fct_yellow_trips__dbt_tmp"
  
  
    as
  
  (
    -- models/marts/fct_yellow_trips.sql

with trips as (
    select *
    from "de_db"."public"."stg_yellow_tripdata"
),

final as (
    select
        vendor_id,
        pickup_datetime,
        dropoff_datetime,
        passenger_count,
        trip_distance,
        ratecode_id,
        store_and_fwd_flag,
        pu_location_id,
        do_location_id,
        payment_type,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        congestion_surcharge,
        airport_fee,
        cbd_congestion_fee,
        total_amount,

        -- derived metrics
        date_trunc('day', pickup_datetime)::date as pickup_date,
        extract(hour from pickup_datetime)::int as pickup_hour,
        greatest(
          extract(epoch from (dropoff_datetime - pickup_datetime)) / 60.0,
          0
        ) as trip_duration_min
    from trips
)

select * from final
  );
  