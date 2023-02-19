CREATE OR REPLACE FUNCTION pg_catalog.pg_sleep_until(timestamp with time zone)
 RETURNS void
 LANGUAGE sql
 PARALLEL SAFE STRICT COST 1
AS $function$select pg_catalog.pg_sleep(extract(epoch from $1) operator(pg_catalog.-) extract(epoch from pg_catalog.clock_timestamp()))$function$
;
