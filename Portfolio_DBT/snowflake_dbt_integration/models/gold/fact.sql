{{ config(
    materialized='table', 
    schema='gold'
) }}


{% set configs= [
{
    "table_name": "GOLD.OBT",
    "columns": "GOLD_OBT.BOOKING_ID, GOLD_OBT.HOST_ID, GOLD_OBT.LISTING_ID, GOLD_OBT.PRICE_PER_NIGHT, GOLD_OBT.ACCOMMODATES, GOLD_OBT.BEDROOMS, GOLD_OBT.RESPONSE_RATE",
    "alias": "GOLD_OBT"
},
{
    "table_name": "GOLD.DIM_LISTINGS",
    "columns": "GOLD_DIM_LISTINGS.ROOM_TYPE",
    "alias": "GOLD_DIM_LISTINGS",
    "join": "GOLD_OBT.LISTING_ID = GOLD_DIM_LISTINGS.LISTING_ID"
},
{
    "table_name": "GOLD.DIM_HOSTS",
    "columns": "GOLD_DIM_HOSTS.RESPONSE_RATE_QUALITY",
    "alias": "GOLD_DIM_HOSTS",
    "join": "GOLD_OBT.HOST_ID = GOLD_DIM_HOSTS.HOST_ID"
},
{
    "table_name": "GOLD.DIM_BOOKINGS",
    "columns": "",
    "alias": "GOLD_DIM_BOOKINGS",
    "join": "GOLD_OBT.BOOKING_ID = GOLD_DIM_BOOKINGS.BOOKING_ID"
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