CREATE OR REPLACE FUNCTION pg_catalog.interval_pl_timestamptz(interval, timestamp with time zone)
 RETURNS timestamp with time zone
 LANGUAGE sql
 STABLE STRICT COST 1
AS $function$select $2 + $1$function$
;
