{{ config(
    materialized = 'incremental',
    unique_key= 'trip_id',
    on_schema_change = 'append_new_columns'
) }}

WITH join_trips_stop_times AS (
SELECT SPLIT(a.trip_id, ':')[1] AS trip_code, CAST(SPLIT(SPLIT(a.trip_id, ':')[2], 'T')[1] AS date) as trip_date, a.route_id, a.direction_id, b.stop_id, b.stop_sequence, b.arrival_time, b.departure_time
FROM {{ ref('stg_trips') }} a
LEFT JOIN {{ source('dbt', 'stop_times') }} b
ON a.trip_id=b.trip_id)

, temp_table AS (
    SELECT *
    FROM join_trips_stop_times
    
    {% if is_incremental() %}
    where trip_date > (select max(trip_date) from {{ this }} )
    {% endif %}

)

SELECT *, '{{ invocation_id }}' AS batch_id
FROM temp_table
ORDER BY trip_code, route_id, trip_date, stop_sequence ASC
