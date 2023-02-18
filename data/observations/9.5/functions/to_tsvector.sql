CREATE OR REPLACE FUNCTION pg_catalog.to_tsvector(regconfig, text)
 RETURNS tsvector
 LANGUAGE internal
 IMMUTABLE STRICT COST 100
AS $function$to_tsvector_byid$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_tsvector(text)
 RETURNS tsvector
 LANGUAGE internal
 STABLE STRICT COST 100
AS $function$to_tsvector$function$
;
