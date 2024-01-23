CREATE OR REPLACE FUNCTION pg_catalog.pg_xact_commit_timestamp_origin(xid xid, OUT "timestamp" timestamp with time zone, OUT roident oid)
 RETURNS record
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_xact_commit_timestamp_origin$function$
;
