CREATE OR REPLACE FUNCTION pg_catalog.txid_current_snapshot()
 RETURNS txid_snapshot
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$txid_current_snapshot$function$
;
