CREATE OR REPLACE FUNCTION pg_catalog.to_timestamp(double precision)
 RETURNS timestamp with time zone
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select ('epoch'::pg_catalog.timestamptz + $1 * '1 second'::pg_catalog.interval)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_timestamp(text, text)
 RETURNS timestamp with time zone
 LANGUAGE internal
 STABLE STRICT
AS $function$to_timestamp$function$
;
