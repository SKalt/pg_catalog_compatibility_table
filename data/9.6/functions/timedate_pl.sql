CREATE OR REPLACE FUNCTION pg_catalog.timedate_pl(time without time zone, date)
 RETURNS timestamp without time zone
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
AS $function$select ($2 + $1)$function$
;
