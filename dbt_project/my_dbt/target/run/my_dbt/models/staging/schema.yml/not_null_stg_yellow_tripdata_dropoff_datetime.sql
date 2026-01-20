
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select dropoff_datetime
from "de_db"."public"."stg_yellow_tripdata"
where dropoff_datetime is null



  
  
      
    ) dbt_internal_test