
  create view "de_db"."public"."01_rolling_avg_zone__dbt_tmp"
    
    
  as (
    

with daily as (
  select
    pu_location_id,
    date(pickup_datetime) as pickup_date,
    sum(total_amount) as total_revenue
  from public.fct_yellow_trips_enriched
  group by 1,2
)

select
  pu_location_id,
  pickup_date,
  total_revenue,
  avg(total_revenue) over (
    partition by pu_location_id
    order by pickup_date
    rows between 6 preceding and current row
  ) as rolling_7d_avg_revenue
from daily
  );