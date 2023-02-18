CREATE OR REPLACE FUNCTION pg_catalog.pg_logical_emit_message(boolean, text, bytea)
 RETURNS pg_lsn
 LANGUAGE internal
 STRICT
AS $function$pg_logical_emit_message_bytea$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_logical_emit_message(boolean, text, text)
 RETURNS pg_lsn
 LANGUAGE internal
 STRICT
AS $function$pg_logical_emit_message_text$function$
;
