
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    pickup_date as unique_field,
    count(*) as n_records

from "de_db"."public"."mart_daily_revenue"
where pickup_date is not null
group by pickup_date
having count(*) > 1



  
  
      
    ) dbt_internal_test