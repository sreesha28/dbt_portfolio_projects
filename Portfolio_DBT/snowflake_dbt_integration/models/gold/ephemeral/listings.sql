{{config (
    materialized='ephemeral'
)}}

WITH listings as (
    SELECT LISTING_ID,HOST_ID,ROOM_TYPE,PRICE_PER_NIGHT,ACCOMMODATES,BEDROOMS ,CREATED_AT from {{ ref('obt') }}

)

select * from listings