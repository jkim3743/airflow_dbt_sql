
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select do_location_id
from "de_db"."public"."mart_trip_facts"
where do_location_id is null



  
  
      
    ) dbt_internal_test