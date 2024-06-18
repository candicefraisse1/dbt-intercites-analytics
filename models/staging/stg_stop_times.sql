SELECT *
FROM  {{ source('dbt', 'stop_times') }}
