
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select passenger_count_clean
from "de_db"."public"."stg_yellow_tripdata"
where passenger_count_clean is null



  
  
      
    ) dbt_internal_test