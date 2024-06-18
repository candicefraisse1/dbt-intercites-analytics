SELECT *
FROM {{ source('dbt', 'trips') }} 
