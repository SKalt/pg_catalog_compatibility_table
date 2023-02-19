CREATE OR REPLACE FUNCTION pg_catalog.phraseto_tsquery(regconfig, text)
 RETURNS tsquery
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT COST 100
AS $function$phraseto_tsquery_byid$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.phraseto_tsquery(text)
 RETURNS tsquery
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 100
AS $function$phraseto_tsquery$function$
;
