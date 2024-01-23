CREATE OR REPLACE FUNCTION pg_catalog.pg_sleep_for(interval)
 RETURNS void
 LANGUAGE sql
 PARALLEL SAFE STRICT COST 1
AS $function$select pg_catalog.pg_sleep(extract(epoch from pg_catalog.clock_timestamp() operator(pg_catalog.+) $1) operator(pg_catalog.-) extract(epoch from pg_catalog.clock_timestamp()))$function$
;
