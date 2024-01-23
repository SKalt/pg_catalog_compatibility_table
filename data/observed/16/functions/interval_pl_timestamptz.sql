CREATE OR REPLACE FUNCTION pg_catalog.interval_pl_timestamptz(interval, timestamp with time zone)
 RETURNS timestamp with time zone
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT COST 1
RETURN ($2 + $1)
;
