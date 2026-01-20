
  create view "de_db"."public"."02_driver_ranking_by_total_revenue_zone__dbt_tmp"
    
    
  as (
    

with agg as (
  select
    pu_location_id as zone_id,
    vendor_id,
    sum(total_amount) as total_revenue
  from "de_db"."public"."stg_yellow_tripdata"
  group by 1, 2
)

select
  zone_id,
  vendor_id,
  total_revenue,
  dense_rank() over (
    partition by zone_id
    order by total_revenue desc
  ) as revenue_rank_in_zone
from agg
  );