CREATE OR REPLACE FUNCTION pg_catalog.pg_copy_physical_replication_slot(src_slot_name name, dst_slot_name name, OUT slot_name name, OUT lsn pg_lsn)
 RETURNS record
 LANGUAGE internal
 STRICT
AS $function$pg_copy_physical_replication_slot_b$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_copy_physical_replication_slot(src_slot_name name, dst_slot_name name, temporary boolean, OUT slot_name name, OUT lsn pg_lsn)
 RETURNS record
 LANGUAGE internal
 STRICT
AS $function$pg_copy_physical_replication_slot_a$function$
;
