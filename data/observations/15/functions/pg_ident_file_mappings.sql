CREATE OR REPLACE FUNCTION pg_catalog.pg_ident_file_mappings(OUT line_number integer, OUT map_name text, OUT sys_name text, OUT pg_username text, OUT error text)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_ident_file_mappings$function$
;
