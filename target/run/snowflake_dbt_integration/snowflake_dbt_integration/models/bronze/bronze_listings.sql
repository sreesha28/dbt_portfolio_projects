
  
    

create or replace transient table SNOWFLAKE_WAREHOUSE.bronze.bronze_listings
    
    
    
    as (select * from snowflake_warehouse.staging.listings
    )
;


  