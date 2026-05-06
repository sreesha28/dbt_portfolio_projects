{{ config(
    materialized='incremental', 
    unique_key='BOOKING_ID',
    on_schema_change='sync_all_columns'
) }}

Select
    BOOKING_ID,
    LISTiNG_ID,
    NIGHTS_BOOKED,
    BOOKING_AMOUNT,
    BOOKING_DATE,
    BOOKING_STATUS,
    CREATED_AT
from {{ ref('bronze_bookings') }}