
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select pickup_date
from "de_db"."public"."mart_daily_revenue"
where pickup_date is null



  
  
      
    ) dbt_internal_test