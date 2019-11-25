/* Loading Data */
/* See instructions file if error reading file. */

COPY time_series.location_temp(event_time, location_id, temp_celcius)
FROM '/Users/danielsullivan/data/location_temp.txt' DELIMITER ',';
