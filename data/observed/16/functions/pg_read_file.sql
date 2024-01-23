CREATE OR REPLACE FUNCTION pg_catalog.pg_read_file(text)
 RETURNS text
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_read_file_all$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_read_file(text, bigint, bigint)
 RETURNS text
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_read_file_off_len$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_read_file(text, bigint, bigint, boolean)
 RETURNS text
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_read_file_off_len_missing$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_read_file(text, boolean)
 RETURNS text
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_read_file_all_missing$function$
;
