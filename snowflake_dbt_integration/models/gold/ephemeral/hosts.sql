{{config (
    materialized='ephemeral'
)}}

WITH hosts as (
    SELECT HOST_ID,HOST_NAME,HOST_SINCE,IS_SUPERHOST ,CREATED_AT ,RESPONSE_RATE ,RESPONSE_RATE_QUALITY from {{ ref('obt') }}

)

select * from hosts