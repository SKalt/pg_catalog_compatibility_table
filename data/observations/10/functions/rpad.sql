CREATE OR REPLACE FUNCTION pg_catalog.rpad(text, integer)
 RETURNS text
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select pg_catalog.rpad($1, $2, ' ')$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.rpad(text, integer, text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$rpad$function$
;
