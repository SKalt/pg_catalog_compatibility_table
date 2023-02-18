CREATE OR REPLACE FUNCTION pg_catalog.pg_get_replication_slots(OUT slot_name name, OUT plugin name, OUT slot_type text, OUT datoid oid, OUT temporary boolean, OUT active boolean, OUT active_pid integer, OUT xmin xid, OUT catalog_xmin xid, OUT restart_lsn pg_lsn, OUT confirmed_flush_lsn pg_lsn)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL SAFE ROWS 10
AS $function$pg_get_replication_slots$function$
;
