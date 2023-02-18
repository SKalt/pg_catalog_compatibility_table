CREATE OR REPLACE FUNCTION pg_catalog.to_hex(bigint)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$to_hex64$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_hex(integer)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$to_hex32$function$
;
