
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select passenger_count
from "de_db"."public"."stg_yellow_tripdata"
where passenger_count is null



  
  
      
    ) dbt_internal_test