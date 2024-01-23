CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_get_backend_subxact(bid integer, OUT subxact_count integer, OUT subxact_overflowed boolean)
 RETURNS record
 LANGUAGE internal
 STABLE PARALLEL RESTRICTED STRICT
AS $function$pg_stat_get_backend_subxact$function$
;
