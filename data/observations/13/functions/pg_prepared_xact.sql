CREATE OR REPLACE FUNCTION pg_catalog.pg_prepared_xact(OUT transaction xid, OUT gid text, OUT prepared timestamp with time zone, OUT ownerid oid, OUT dbid oid)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_prepared_xact$function$
;
