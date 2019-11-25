EXPLAIN SELECT location_id, avg(temp_celcius)
FROM time_series.location_temp
WHERE event_time BETWEEN '2019-03-05' AND '2019-03-06'
GROUP BY location_id;


CREATE INDEX idx_loc_temp_time_loc ON time_series.location_temp(event_time,location_id);


EXPLAIN SELECT location_id, avg(temp_celcius)
FROM time_series.location_temp
WHERE event_time BETWEEN '2019-03-05' AND '2019-03-06'
GROUP BY location_id;


DROP INDEX time_series.idx_loc_temp_location_id;


CREATE INDEX idx_loc_temp_loc_time ON time_series.location_temp(location_id,event_time);


EXPLAIN SELECT location_id, avg(temp_celcius)
FROM time_series.location_temp
WHERE event_time BETWEEN '2019-03-05' AND '2019-03-06'
GROUP BY location_id;


explain SELECT location_id, avg(temp_celcius)
FROM time_series.location_temp
WHERE event_time BETWEEN '2019-03-05 00:00:00' AND '2019-03-05 00:20:00'
GROUP BY location_id 




DROP INDEX  idx_loc_temp_loc_time;