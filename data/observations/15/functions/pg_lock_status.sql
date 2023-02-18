CREATE OR REPLACE FUNCTION pg_catalog.pg_lock_status(OUT locktype text, OUT database oid, OUT relation oid, OUT page integer, OUT tuple smallint, OUT virtualxid text, OUT transactionid xid, OUT classid oid, OUT objid oid, OUT objsubid smallint, OUT virtualtransaction text, OUT pid integer, OUT mode text, OUT granted boolean, OUT fastpath boolean, OUT waitstart timestamp with time zone)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_lock_status$function$
;
