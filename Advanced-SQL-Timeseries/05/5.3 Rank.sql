select
  dept_id, server_id, cpu_utilization,
  rank() OVER (PARTITION BY dept_id ORDER BY cpu_utilization DESC)
from
   time_series.v_utilization
where
   event_time BETWEEN '2019-03-05' AND '2019-03-06'
