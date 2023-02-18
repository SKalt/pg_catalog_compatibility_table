CREATE OR REPLACE FUNCTION pg_catalog.integer_pl_date(integer, date)
 RETURNS date
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select $2 + $1$function$
;
