/* baselin execution time without index */
explain select location_id, avg(temp_celcius)
from time_series.location_temp
group by location_id;


CREATE INDEX idx_loc_temp_location_id ON time_series.location_temp(location_id);


/* execution location with index */
explain select location_id, avg(temp_celcius)
from time_series.location_temp
group by location_id;


/* add where clause, this is when index is helpful */
explain select location_id, avg(temp_celcius)
from time_series.location_temp
where location_id = 'loc2'
group by location_id;


/* Without index, WHERE clause takes much longer */
drop index time_series.idx_loc_temp_location_id; 


explain select location_id, avg(temp_celcius)
from time_series.location_temp
where location_id = 'loc2'
group by location_id;