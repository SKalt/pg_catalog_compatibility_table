CREATE OR REPLACE FUNCTION pg_catalog.txid_current_if_assigned()
 RETURNS bigint
 LANGUAGE internal
 STABLE STRICT
AS $function$pg_current_xact_id_if_assigned$function$
;
