CREATE OR REPLACE FUNCTION pg_catalog.pg_create_logical_replication_slot(slot_name name, plugin name, OUT slot_name text, OUT xlog_position pg_lsn)
 RETURNS record
 LANGUAGE internal
 STRICT
AS $function$pg_create_logical_replication_slot$function$
;
