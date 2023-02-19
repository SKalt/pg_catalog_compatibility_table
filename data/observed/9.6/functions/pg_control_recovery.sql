CREATE OR REPLACE FUNCTION pg_catalog.pg_control_recovery(OUT min_recovery_end_location pg_lsn, OUT min_recovery_end_timeline integer, OUT backup_start_location pg_lsn, OUT backup_end_location pg_lsn, OUT end_of_backup_record_required boolean)
 RETURNS record
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_control_recovery$function$
;
