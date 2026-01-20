select
    pickup_date,
    count(*) as trip_count,
    sum(total_amount) as total_revenue,
    avg(total_amount) as avg_total_amount,
    avg(trip_distance) as avg_trip_distance,
    avg(trip_duration_min) as avg_trip_duration_min
from {{ ref('fct_yellow_trips') }}
group by 1
order by 1
