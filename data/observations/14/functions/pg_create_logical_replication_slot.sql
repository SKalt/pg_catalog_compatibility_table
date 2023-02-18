CREATE OR REPLACE FUNCTION pg_catalog.pg_create_logical_replication_slot(slot_name name, plugin name, temporary boolean DEFAULT false, twophase boolean DEFAULT false, OUT slot_name name, OUT lsn pg_lsn)
 RETURNS record
 LANGUAGE internal
 STRICT
AS $function$pg_create_logical_replication_slot$function$
;
