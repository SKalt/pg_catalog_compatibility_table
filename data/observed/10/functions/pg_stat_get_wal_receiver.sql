CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_get_wal_receiver(OUT pid integer, OUT status text, OUT receive_start_lsn pg_lsn, OUT receive_start_tli integer, OUT received_lsn pg_lsn, OUT received_tli integer, OUT last_msg_send_time timestamp with time zone, OUT last_msg_receipt_time timestamp with time zone, OUT latest_end_lsn pg_lsn, OUT latest_end_time timestamp with time zone, OUT slot_name text, OUT conninfo text)
 RETURNS record
 LANGUAGE internal
 STABLE PARALLEL RESTRICTED
AS $function$pg_stat_get_wal_receiver$function$
;
