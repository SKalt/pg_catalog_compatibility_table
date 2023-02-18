CREATE OR REPLACE FUNCTION pg_catalog.pg_advisory_unlock(bigint)
 RETURNS boolean
 LANGUAGE internal
 PARALLEL RESTRICTED STRICT
AS $function$pg_advisory_unlock_int8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_advisory_unlock(integer, integer)
 RETURNS boolean
 LANGUAGE internal
 PARALLEL RESTRICTED STRICT
AS $function$pg_advisory_unlock_int4$function$
;
