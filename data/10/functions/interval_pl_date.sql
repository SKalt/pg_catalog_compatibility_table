CREATE OR REPLACE FUNCTION pg_catalog.interval_pl_date(interval, date)
 RETURNS timestamp without time zone
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select $2 + $1$function$
;
