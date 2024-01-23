CREATE OR REPLACE FUNCTION pg_catalog.txid_snapshot_xip(txid_snapshot)
 RETURNS SETOF bigint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT ROWS 50
AS $function$pg_snapshot_xip$function$
;
