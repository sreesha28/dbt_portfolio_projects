    
Select
    HOST_ID,
    REPLACE(HOST_NAME, ' ', '_') as HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    RESPONSE_RATE,
    CASE 
        WHEN RESPONSE_RATE > 95 THEN 'Very Responsive'
        WHEN RESPONSE_RATE > 80 THEN 'Moderately Responsive'
        ELSE 'Less Responsive'
    END AS RESPONSE_RATE_QUALITY,
    CREATED_AT
from SNOWFLAKE_WAREHOUSE.bronze.bronze_hosts