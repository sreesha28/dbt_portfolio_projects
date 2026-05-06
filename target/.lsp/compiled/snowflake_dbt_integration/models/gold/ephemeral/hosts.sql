

WITH hosts as (
    SELECT HOST_ID,HOST_NAME from SNOWFLAKE_WAREHOUSE.gold.obt

)

select * from hosts