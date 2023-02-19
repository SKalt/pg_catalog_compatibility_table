CREATE OR REPLACE FUNCTION pg_catalog.textanycat(text, anynonarray)
 RETURNS text
 LANGUAGE sql
 STABLE STRICT COST 1
AS $function$select $1 || $2::pg_catalog.text$function$
;
