CREATE OR REPLACE FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL RESTRICTED ROWS 100
AS $function$pg_show_replication_origin_status$function$
;
