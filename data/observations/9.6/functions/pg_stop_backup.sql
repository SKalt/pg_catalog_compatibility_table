CREATE OR REPLACE FUNCTION pg_catalog.pg_stop_backup()
 RETURNS pg_lsn
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_stop_backup$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_stop_backup(exclusive boolean, OUT lsn pg_lsn, OUT labelfile text, OUT spcmapfile text)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL SAFE STRICT ROWS 1
AS $function$pg_stop_backup_v2$function$
;
