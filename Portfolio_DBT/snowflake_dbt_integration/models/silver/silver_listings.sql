{{config(materialized='incremental', schema='silver',unique_key='LISTING_ID') }}    
Select
    LISTING_ID,
    HOST_ID,
    ROOM_TYPE,
    PRICE_PER_NIGHT,
    Accommodates,
    bedrooms,
    created_at,
    {{ tag('PRICE_PER_NIGHT') }} as PRICE_TAG
from {{ ref('bronze_listings') }}   