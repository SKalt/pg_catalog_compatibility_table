CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_get_replication_slot(slot_name text, OUT slot_name text, OUT spill_txns bigint, OUT spill_count bigint, OUT spill_bytes bigint, OUT stream_txns bigint, OUT stream_count bigint, OUT stream_bytes bigint, OUT total_txns bigint, OUT total_bytes bigint, OUT stats_reset timestamp with time zone)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL RESTRICTED ROWS 1
AS $function$pg_stat_get_replication_slot$function$
;
