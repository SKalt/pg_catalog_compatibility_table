CREATE OR REPLACE FUNCTION pg_catalog.txid_current()
 RETURNS bigint
 LANGUAGE internal
 STABLE STRICT
AS $function$pg_current_xact_id$function$
;
