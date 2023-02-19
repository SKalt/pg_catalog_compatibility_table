CREATE OR REPLACE FUNCTION pg_catalog.pg_stop_backup()
 RETURNS pg_lsn
 LANGUAGE internal
 PARALLEL RESTRICTED STRICT
AS $function$pg_stop_backup$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_stop_backup(exclusive boolean, wait_for_archive boolean DEFAULT true, OUT lsn pg_lsn, OUT labelfile text, OUT spcmapfile text)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL RESTRICTED STRICT
AS $function$pg_stop_backup_v2$function$
;
