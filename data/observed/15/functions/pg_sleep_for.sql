CREATE OR REPLACE FUNCTION pg_catalog.pg_sleep_for(interval)
 RETURNS void
 LANGUAGE sql
 PARALLEL SAFE STRICT COST 1
RETURN pg_sleep(((EXTRACT(epoch FROM (clock_timestamp() + $1)) - EXTRACT(epoch FROM clock_timestamp())))::double precision)
;
