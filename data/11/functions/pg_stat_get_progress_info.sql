CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_get_progress_info(cmdtype text, OUT pid integer, OUT datid oid, OUT relid oid, OUT param1 bigint, OUT param2 bigint, OUT param3 bigint, OUT param4 bigint, OUT param5 bigint, OUT param6 bigint, OUT param7 bigint, OUT param8 bigint, OUT param9 bigint, OUT param10 bigint)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL RESTRICTED STRICT ROWS 100
AS $function$pg_stat_get_progress_info$function$
;
