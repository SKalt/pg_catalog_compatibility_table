CREATE OR REPLACE FUNCTION pg_catalog.txid_status(bigint)
 RETURNS text
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_xact_status$function$
;
