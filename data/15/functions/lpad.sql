CREATE OR REPLACE FUNCTION pg_catalog.lpad(text, integer)
 RETURNS text
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
RETURN lpad($1, $2, ' '::text)
;
CREATE OR REPLACE FUNCTION pg_catalog.lpad(text, integer, text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$lpad$function$
;
