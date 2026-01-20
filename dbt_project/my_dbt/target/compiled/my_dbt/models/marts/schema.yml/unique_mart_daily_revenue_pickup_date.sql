
    
    

select
    pickup_date as unique_field,
    count(*) as n_records

from "de_db"."public"."mart_daily_revenue"
where pickup_date is not null
group by pickup_date
having count(*) > 1


