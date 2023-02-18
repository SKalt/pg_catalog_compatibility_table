CREATE OR REPLACE FUNCTION pg_catalog.bit_length(bit)
 RETURNS integer
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select pg_catalog.length($1)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.bit_length(bytea)
 RETURNS integer
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select pg_catalog.octet_length($1) * 8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.bit_length(text)
 RETURNS integer
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select pg_catalog.octet_length($1) * 8$function$
;
