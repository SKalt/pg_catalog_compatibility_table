CREATE OR REPLACE FUNCTION pg_catalog.pg_hba_file_rules(OUT line_number integer, OUT type text, OUT database text[], OUT user_name text[], OUT address text, OUT netmask text, OUT auth_method text, OUT options text[], OUT error text)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_hba_file_rules$function$
;
