CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_get_wal_senders(OUT pid integer, OUT state text, OUT sent_lsn pg_lsn, OUT write_lsn pg_lsn, OUT flush_lsn pg_lsn, OUT replay_lsn pg_lsn, OUT write_lag interval, OUT flush_lag interval, OUT replay_lag interval, OUT sync_priority integer, OUT sync_state text, OUT reply_time timestamp with time zone)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL RESTRICTED ROWS 10
AS $function$pg_stat_get_wal_senders$function$
;
