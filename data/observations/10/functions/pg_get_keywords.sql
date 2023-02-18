CREATE OR REPLACE FUNCTION pg_catalog.pg_get_keywords(OUT word text, OUT catcode "char", OUT catdesc text)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE STRICT COST 10 ROWS 400
AS $function$pg_get_keywords$function$
;
