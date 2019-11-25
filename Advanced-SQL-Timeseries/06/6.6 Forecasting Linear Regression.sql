/* y = mx + b
   m = slope
   b = intercept
   x = input value
   y = predicted value
*/

SELECT
  regr_slope(free_memory, cpu_utilization) m,
  regr_intercept(free_memory, cpu_utilization) b
FROM
  time_series.utilization
WHERE
  event_time BETWEEN '2019-03-05' AND '2019-03-06';

SELECT
  regr_slope(free_memory, cpu_utilization) * 0.60 +
  regr_intercept(free_memory, cpu_utilization) predicted_free_memory
FROM
  time_series.utilization
WHERE
  event_time BETWEEN '2019-03-05' AND '2019-03-06';
