SELECT a.route_long_name, a.route_id, b.stop_sequence, b.trip_code, c.date_of_the_day
FROM {{ ref('dim_route') }} a
INNER JOIN  {{ ref('dim_trips') }} b 
ON a.route_id=b.route_id 
INNER JOIN {{ ref('dim_calendar') }} c 
ON b.trip_date=CAST(c.date_of_the_day AS date)
WHERE b.trip_date BETWEEN CAST('2022-01-01' AS date) AND CAST('2024-11-01' AS date)
