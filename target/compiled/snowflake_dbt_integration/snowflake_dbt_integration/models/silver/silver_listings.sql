    
Select
    LISTING_ID,
    HOST_ID,
    ROOM_TYPE,
    PRICE_PER_NIGHT,
    Accommodates,
    bedrooms,
    created_at,
    
    case
        when cast(PRICE_PER_NIGHT as numeric) < 200 then 'low'
        when cast(PRICE_PER_NIGHT as numeric) < 500 then 'medium'
        else 'high'
    end
 as PRICE_TAG
from SNOWFLAKE_WAREHOUSE.bronze.bronze_listings