{{
  config(
    severity = 'warning',
    )
}}
select 1 from
{{ source('staging','bookings') }}
where booking_amount <20