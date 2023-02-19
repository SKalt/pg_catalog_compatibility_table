CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_get_wal(OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT wal_buffers_full bigint, OUT wal_write bigint, OUT wal_sync bigint, OUT wal_write_time double precision, OUT wal_sync_time double precision, OUT stats_reset timestamp with time zone)
 RETURNS record
 LANGUAGE internal
 STABLE PARALLEL RESTRICTED
AS $function$pg_stat_get_wal$function$
;
