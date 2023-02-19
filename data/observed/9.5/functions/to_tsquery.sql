CREATE OR REPLACE FUNCTION pg_catalog.to_tsquery(regconfig, text)
 RETURNS tsquery
 LANGUAGE internal
 IMMUTABLE STRICT COST 100
AS $function$to_tsquery_byid$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_tsquery(text)
 RETURNS tsquery
 LANGUAGE internal
 STABLE STRICT COST 100
AS $function$to_tsquery$function$
;
