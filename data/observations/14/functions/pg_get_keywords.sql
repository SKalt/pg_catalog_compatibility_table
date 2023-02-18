CREATE OR REPLACE FUNCTION pg_catalog.pg_get_keywords(OUT word text, OUT catcode "char", OUT barelabel boolean, OUT catdesc text, OUT baredesc text)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 10 ROWS 500
AS $function$pg_get_keywords$function$
;
