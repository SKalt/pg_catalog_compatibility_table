CREATE OR REPLACE FUNCTION pg_catalog.plainto_tsquery(regconfig, text)
 RETURNS tsquery
 LANGUAGE internal
 IMMUTABLE STRICT COST 100
AS $function$plainto_tsquery_byid$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.plainto_tsquery(text)
 RETURNS tsquery
 LANGUAGE internal
 STABLE STRICT COST 100
AS $function$plainto_tsquery$function$
;
