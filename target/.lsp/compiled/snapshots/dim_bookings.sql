with __dbt__cte__bookings as (


WITH Bookings as (
    SELECT BOOKING_ID,CREATED_AT from SNOWFLAKE_WAREHOUSE.gold.obt

)

select * from Bookings
)
--EPHEMERAL-SELECT-WRAPPER-START
select * from (
select * from __dbt__cte__bookings
--EPHEMERAL-SELECT-WRAPPER-END
)