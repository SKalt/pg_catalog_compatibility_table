CREATE OR REPLACE FUNCTION pg_catalog.pg_backup_stop(wait_for_archive boolean DEFAULT true, OUT lsn pg_lsn, OUT labelfile text, OUT spcmapfile text)
 RETURNS record
 LANGUAGE internal
 PARALLEL RESTRICTED STRICT
AS $function$pg_backup_stop$function$
;
