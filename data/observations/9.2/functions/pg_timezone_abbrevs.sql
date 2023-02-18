CREATE OR REPLACE FUNCTION pg_catalog.pg_timezone_abbrevs(OUT abbrev text, OUT utc_offset interval, OUT is_dst boolean)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE STRICT
AS $function$pg_timezone_abbrevs$function$
;
