SELECT 	f.origin,
	f.dest,
	CAST(AVG(f.distance) AS decimal(5, 2)) AS avg_distance,
	CEIL(COUNT(*) / 10) AS avg_flights,
	CEIL(SUM(p.seats) / 10) AS avg_seats,
	CAST(AVG(f.arr_delay) AS decimal(5,2)) AS avg_arr_delay
FROM fly.flights AS f
	LEFT JOIN fly.planes AS p
	    ON f.tailnum = p.tailnum
WHERE f.distance BETWEEN 300 AND 400
GROUP BY origin, dest
HAVING avg_flights >= 5000
ORDER BY avg_flights DESC;
