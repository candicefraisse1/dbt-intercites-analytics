
-- Top 10 most popular routes in August 2022 
-- Changed to June 2024 to make it work
SELECT route_long_name, route_id, COUNT(trip_code) AS nb_trips
FROM {{ ref('fait_info_routes') }} 
WHERE date_of_the_day BETWEEN '2024-06-01' AND '2024-06-31'
GROUP BY route_long_name, route_id
ORDER BY COUNT(trip_code) DESC