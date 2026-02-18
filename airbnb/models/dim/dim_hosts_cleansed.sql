{{ config(
    materialized='view'
) }}


WITH src_hosts_cleansed AS (
    SELECT
        *
    FROM
        {{ ref('src_hosts') }}
)
SELECT
    host_id,
    NVL(
        host_name,
        'Unknown'
    ) AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts_cleansed
