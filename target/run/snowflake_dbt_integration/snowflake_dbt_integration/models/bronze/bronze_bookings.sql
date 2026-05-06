
  
    

create or replace transient table SNOWFLAKE_WAREHOUSE.bronze.bronze_bookings
    
    
    
    as (select * from snowflake_warehouse.staging.bookings
    )
;


  