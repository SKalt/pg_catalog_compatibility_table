CREATE OR REPLACE FUNCTION pg_catalog.quote_literal(anyelement)
 RETURNS text
 LANGUAGE sql
 STABLE STRICT COST 1
AS $function$select pg_catalog.quote_literal($1::pg_catalog.text)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.quote_literal(text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$quote_literal$function$
;
