CREATE OR REPLACE FUNCTION pg_catalog.pg_options_to_table(options_array text[], OUT option_name text, OUT option_value text)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT ROWS 3
AS $function$pg_options_to_table$function$
;
