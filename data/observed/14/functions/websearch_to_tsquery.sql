CREATE OR REPLACE FUNCTION pg_catalog.websearch_to_tsquery(regconfig, text)
 RETURNS tsquery
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT COST 100
AS $function$websearch_to_tsquery_byid$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.websearch_to_tsquery(text)
 RETURNS tsquery
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 100
AS $function$websearch_to_tsquery$function$
;
