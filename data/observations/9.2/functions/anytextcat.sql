CREATE OR REPLACE FUNCTION pg_catalog.anytextcat(anynonarray, text)
 RETURNS text
 LANGUAGE sql
 STABLE STRICT COST 1
AS $function$select $1::pg_catalog.text || $2$function$
;
