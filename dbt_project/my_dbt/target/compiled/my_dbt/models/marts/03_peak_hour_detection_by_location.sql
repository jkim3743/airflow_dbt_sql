

with hourly as (
  select
    pu_location_id as zone_id,
    extract(hour from pickup_datetime)::int as pickup_hour,
    count(*) as trip_count
  from "de_db"."public"."stg_yellow_tripdata"
  group by 1, 2
),

ranked as (
  select
    *,
    row_number() over (
      partition by zone_id
      order by trip_count desc
    ) as rn
  from hourly
)

select
  zone_id,
  pickup_hour as peak_hour,
  trip_count as peak_hour_trip_count
from ranked
where rn = 1