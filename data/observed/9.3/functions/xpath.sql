CREATE OR REPLACE FUNCTION pg_catalog.xpath(text, xml)
 RETURNS xml[]
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select pg_catalog.xpath($1, $2, '{}'::pg_catalog.text[])$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.xpath(text, xml, text[])
 RETURNS xml[]
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$xpath$function$
;
