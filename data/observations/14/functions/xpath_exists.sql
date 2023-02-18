CREATE OR REPLACE FUNCTION pg_catalog.xpath_exists(text, xml)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
RETURN xpath_exists($1, $2, '{}'::text[])
;
CREATE OR REPLACE FUNCTION pg_catalog.xpath_exists(text, xml, text[])
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$xpath_exists$function$
;
