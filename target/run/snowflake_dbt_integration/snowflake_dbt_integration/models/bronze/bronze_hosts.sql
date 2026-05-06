
  
    

create or replace transient table SNOWFLAKE_WAREHOUSE.bronze.bronze_hosts
    
    
    
    as (select * from snowflake_warehouse.staging.hosts
    )
;


  