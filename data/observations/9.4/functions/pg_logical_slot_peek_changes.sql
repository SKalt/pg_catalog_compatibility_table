CREATE OR REPLACE FUNCTION pg_catalog.pg_logical_slot_peek_changes(slot_name name, upto_lsn pg_lsn, upto_nchanges integer, VARIADIC options text[] DEFAULT '{}'::text[], OUT location pg_lsn, OUT xid xid, OUT data text)
 RETURNS SETOF record
 LANGUAGE internal
 COST 1000
AS $function$pg_logical_slot_peek_changes$function$
;
