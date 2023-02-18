CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_get_wal_senders(OUT pid integer, OUT state text, OUT sent_location text, OUT write_location text, OUT flush_location text, OUT replay_location text, OUT sync_priority integer, OUT sync_state text)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE ROWS 10
AS $function$pg_stat_get_wal_senders$function$
;
