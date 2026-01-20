
  
    

  create  table "de_db"."public"."stg_taxi_zones__dbt_tmp"
  
  
    as
  
  (
    with source as (
    select *
    from "de_db"."public"."taxi_zones_raw"
),

renamed as (
    select
        "LocationID"::int as location_id,
        "Borough"::text   as borough,
        "Zone"::text      as zone,
        "service_zone"::text as service_zone
    from source
)

select * from renamed
  );
  