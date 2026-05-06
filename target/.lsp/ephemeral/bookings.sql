__dbt__cte__bookings as (


WITH Bookings as (
    SELECT BOOKING_ID,CREATED_AT from SNOWFLAKE_WAREHOUSE.gold.obt

)

select * from Bookings
)