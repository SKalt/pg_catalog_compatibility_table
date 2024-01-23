CREATE OR REPLACE FUNCTION pg_catalog.pg_input_error_info(value text, type_name text, OUT message text, OUT detail text, OUT hint text, OUT sql_error_code text)
 RETURNS record
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_input_error_info$function$
;
