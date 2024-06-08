--Routes with number of stops in descending order
SELECT a.route_long_name, a.route_id, MAX(b.stop_sequence) AS nb_stops
FROM {{ ref('dim_route') }} a
INNER JOIN  {{ ref('dim_trips') }} b 
ON a.route_id=b.route_id
GROUP BY  a.route_long_name, a.route_id
ORDER BY MAX(b.stop_sequence) DESC