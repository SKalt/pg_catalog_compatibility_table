CREATE OR REPLACE FUNCTION pg_catalog.timetzdate_pl(time with time zone, date)
 RETURNS timestamp with time zone
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select ($2 + $1)$function$
;
