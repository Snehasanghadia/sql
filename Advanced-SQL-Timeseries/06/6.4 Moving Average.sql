SELECT
  event_time,
  server_id,
  avg(cpu_utilization)
     OVER (ORDER BY event_time ROWS BETWEEN 12 PRECEDING AND CURRENT ROW)
	 AS hourly_cpu_util
FROM
  time_series.utilization
