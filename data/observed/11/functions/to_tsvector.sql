CREATE OR REPLACE FUNCTION pg_catalog.to_tsvector(json)
 RETURNS tsvector
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 100
AS $function$json_string_to_tsvector$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_tsvector(jsonb)
 RETURNS tsvector
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 100
AS $function$jsonb_string_to_tsvector$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_tsvector(regconfig, json)
 RETURNS tsvector
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT COST 100
AS $function$json_string_to_tsvector_byid$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_tsvector(regconfig, jsonb)
 RETURNS tsvector
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT COST 100
AS $function$jsonb_string_to_tsvector_byid$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_tsvector(regconfig, text)
 RETURNS tsvector
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT COST 100
AS $function$to_tsvector_byid$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_tsvector(text)
 RETURNS tsvector
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 100
AS $function$to_tsvector$function$
;
