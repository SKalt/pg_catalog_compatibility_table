CREATE OR REPLACE FUNCTION pg_catalog.quote_nullable(anyelement)
 RETURNS text
 LANGUAGE sql
 STABLE PARALLEL SAFE COST 1
AS $function$select pg_catalog.quote_nullable($1::pg_catalog.text)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.quote_nullable(text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE
AS $function$quote_nullable$function$
;
