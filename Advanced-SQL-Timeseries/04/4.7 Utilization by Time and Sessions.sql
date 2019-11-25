EXPLAIN SELECT server_id, avg(cpu_utilization)
FROM time_series.utilization
WHERE event_time BETWEEN '2019-03-05' AND '2019-03-06'
GROUP BY server_id;


CREATE INDEX idx_util_time_serv ON utilization(event_time,server_id);


EXPLAIN SELECT server_id, avg(cpu_utilization)
FROM time_series.utilization
WHERE event_time BETWEEN '2019-03-05' AND '2019-03-06'
GROUP BY server_id;


DROP INDEX idx_util_time_serv;


CREATE INDEX dx_util_time_serv ON utilization(server_id,event_time);


EXPLAIN SELECT server_id, avg(cpu_utilization)
FROM time_series.utilization
WHERE event_time BETWEEN '2019-03-05' AND '2019-03-06'
GROUP BY server_id;


DROP INDEX  idx_util_time_serv;
