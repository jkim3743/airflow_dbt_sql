select
    payment_type,
    count(*) as trip_count,
    sum(total_amount) as total_revenue,
    avg(tip_amount) as avg_tip_amount
from {{ ref('fct_yellow_trips') }}
group by 1
order by trip_count desc
