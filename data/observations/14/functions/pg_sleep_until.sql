CREATE OR REPLACE FUNCTION pg_catalog.pg_sleep_until(timestamp with time zone)
 RETURNS void
 LANGUAGE sql
 PARALLEL SAFE STRICT COST 1
RETURN pg_sleep(((EXTRACT(epoch FROM $1) - EXTRACT(epoch FROM clock_timestamp())))::double precision)
;
