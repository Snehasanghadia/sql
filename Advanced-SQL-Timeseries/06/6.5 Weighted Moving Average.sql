
WITH daily_avg_temp AS
 (SELECT date_trunc('day',event_time) event_date, avg(temp_celcius) avg_temp
  FROM time_series.location_temp
  GROUP BY date_trunc('day',event_time))
SELECT
  event_date,
  round(avg_temp, 2),
  (SELECT round(avg_temp * 0.5, 2)
   FROM daily_avg_temp dat2
   WHERE date_trunc('day', dat1.event_date) - interval '1' day =
         date_trunc('day', dat2.event_date))+
  (SELECT round(avg_temp * 0.333,2)
   FROM daily_avg_temp dat3
   WHERE date_trunc('day', dat1.event_date) - interval '2' day =
        date_trunc('day', dat3.event_date))+
  (SELECT round(avg_temp * 0.167,2)
   FROM daily_avg_temp dat4
  WHERE date_trunc('day', dat1.event_date) - interval '3' day =
        date_trunc('day', dat4.event_date)) wmp_temp
FROM
  daily_avg_temp dat1
