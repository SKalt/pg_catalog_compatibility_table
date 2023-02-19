CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_get_subscription(subid oid, OUT subid oid, OUT relid oid, OUT pid integer, OUT received_lsn pg_lsn, OUT last_msg_send_time timestamp with time zone, OUT last_msg_receipt_time timestamp with time zone, OUT latest_end_lsn pg_lsn, OUT latest_end_time timestamp with time zone)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL RESTRICTED ROWS 10
AS $function$pg_stat_get_subscription$function$
;
