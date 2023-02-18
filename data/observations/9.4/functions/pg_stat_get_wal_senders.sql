CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_get_wal_senders(OUT pid integer, OUT state text, OUT sent_location pg_lsn, OUT write_location pg_lsn, OUT flush_location pg_lsn, OUT replay_location pg_lsn, OUT sync_priority integer, OUT sync_state text)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE ROWS 10
AS $function$pg_stat_get_wal_senders$function$
;
