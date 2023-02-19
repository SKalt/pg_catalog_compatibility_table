CREATE OR REPLACE FUNCTION pg_catalog.pg_try_advisory_lock_shared(bigint)
 RETURNS boolean
 LANGUAGE internal
 PARALLEL RESTRICTED STRICT
AS $function$pg_try_advisory_lock_shared_int8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_try_advisory_lock_shared(integer, integer)
 RETURNS boolean
 LANGUAGE internal
 PARALLEL RESTRICTED STRICT
AS $function$pg_try_advisory_lock_shared_int4$function$
;
