{{ config(
    materialized='table', 
    schema='gold'
) }}


{% set configs= [
{
    "table_name": "SILVER.SILVER_LISTINGS",
    "columns": "SILVER_LISTINGS.LISTING_ID, SILVER_LISTINGS.HOST_ID, SILVER_LISTINGS.ROOM_TYPE, SILVER_LISTINGS.PRICE_PER_NIGHT, SILVER_LISTINGS.ACCOMMODATES, SILVER_LISTINGS.BEDROOMS",
    "alias": "SILVER_LISTINGS"
},
{
    "table_name": "SILVER.SILVER_HOSTS",
    "columns": "SILVER_HOSTS.HOST_NAME, SILVER_HOSTS.HOST_SINCE, SILVER_HOSTS.IS_SUPERHOST, SILVER_HOSTS.RESPONSE_RATE, SILVER_HOSTS.RESPONSE_RATE_QUALITY",
    "alias": "SILVER_HOSTS",
    "join": "SILVER_LISTINGS.HOST_ID = SILVER_HOSTS.HOST_ID"
},
{
    "table_name": "SILVER.SILVER_BOOKINGS",
    "columns": "SILVER_BOOKINGS.BOOKING_ID,  SILVER_BOOKINGS.NIGHTS_BOOKED, SILVER_BOOKINGS.BOOKING_AMOUNT,SILVER_BOOKINGS.CREATED_AT",
    "alias": "SILVER_BOOKINGS",
    "join": "SILVER_LISTINGS.LISTING_ID = SILVER_BOOKINGS.LISTING_ID"
}

]

%}

select 
    {% for config in configs %}
        {{ config.columns }}{% if not loop.last %}, {% endif %}
    {% endfor %} 
from {{ configs[0].table_name }} as {{ configs[0].alias }}
{% for config in configs[1:] %}
    left join {{ config.table_name }} as {{ config.alias }}
    on {{ config.join }}
{% endfor %}   