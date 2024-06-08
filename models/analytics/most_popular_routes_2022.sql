
-- Top 10 most popular routes in August 2022
SELECT a.route_long_name, a.route_id, COUNT(b.trip_code) AS nb_trips
FROM dim_route a
INNER JOIN dim_trips b 
ON a.route_id=b.route_id
INNER JOIN dim_calendar c 
ON b.trip_date=CAST(c.date_of_the_day AS date)
WHERE b.trip_date BETWEEN CAST('2022-01-01' AS date) AND CAST('2024-11-01' AS date)
GROUP BY a.route_long_name, a.route_id
ORDER BY COUNT(b.trip_code) DESC