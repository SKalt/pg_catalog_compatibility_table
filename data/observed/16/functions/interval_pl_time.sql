CREATE OR REPLACE FUNCTION pg_catalog.interval_pl_time(interval, time without time zone)
 RETURNS time without time zone
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
RETURN ($2 + $1)
;
