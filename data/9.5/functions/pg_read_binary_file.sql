CREATE OR REPLACE FUNCTION pg_catalog.pg_read_binary_file(text)
 RETURNS bytea
 LANGUAGE internal
 STRICT
AS $function$pg_read_binary_file_all$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_read_binary_file(text, bigint, bigint)
 RETURNS bytea
 LANGUAGE internal
 STRICT
AS $function$pg_read_binary_file_off_len$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_read_binary_file(text, bigint, bigint, boolean)
 RETURNS bytea
 LANGUAGE internal
 STRICT
AS $function$pg_read_binary_file$function$
;
