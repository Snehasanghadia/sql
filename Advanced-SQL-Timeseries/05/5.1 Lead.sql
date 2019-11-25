create view time_series.v_utilization as
 select *, server_id % 10 dept_id from time_series.utilization

 SELECT
   dept_id, server_id, cpu_utilization,
   lead(cpu_utilization) OVER (PARTITION BY dept_id
 							  ORDER BY cpu_utilization DESC)
 FROM
   time_series.v_utilization
 WHERE
   event_time BETWEEN '2019-03-05' AND '2019-03-06'
