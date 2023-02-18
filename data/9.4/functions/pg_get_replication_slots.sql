CREATE OR REPLACE FUNCTION pg_catalog.pg_get_replication_slots(OUT slot_name name, OUT plugin name, OUT slot_type text, OUT datoid oid, OUT active boolean, OUT xmin xid, OUT catalog_xmin xid, OUT restart_lsn pg_lsn)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE ROWS 10
AS $function$pg_get_replication_slots$function$
;
