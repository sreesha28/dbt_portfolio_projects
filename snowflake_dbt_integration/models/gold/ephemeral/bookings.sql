{{config (
    materialized='ephemeral'
)}}

WITH Bookings as (
    SELECT BOOKING_ID,CREATED_AT from {{ ref('obt') }}

)

select * from Bookings