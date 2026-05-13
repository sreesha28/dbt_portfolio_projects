{% set nights_booked = 1 %}

{% set Flag = 1 %}

select * from {{ ref('bronze_bookings') }} 
{% if Flag == 1 %}
    where nights_booked > {{ nights_booked }}
{%else  %}  
    where nights_booked =1
{% endif %}
