
  
    

  create  table "de_db"."public"."dim_taxi_zones__dbt_tmp"
  
  
    as
  
  (
    with zones as (
    select *
    from "de_db"."public"."stg_taxi_zones"
)

select
    location_id,
    borough,
    zone,
    service_zone
from zones
  );
  