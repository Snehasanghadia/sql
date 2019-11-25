EXPLAIN SELECT location_id, avg(temp_celcius)
FROM time_series.location_temp
WHERE event_time BETWEEN '2019-03-05' AND '2019-03-06'
GROUP BY location_id;


EXPLAIN SELECT location_id, avg(temp_celcius)
FROM time_series.location_temp_p
WHERE event_time BETWEEN '2019-03-05' AND '2019-03-06'
GROUP BY location_id;


EXPLAIN SELECT location_id, avg(temp_celcius)
FROM time_series.location_temp_p
WHERE event_hour BETWEEN 0 and 4
GROUP BY location_id;
