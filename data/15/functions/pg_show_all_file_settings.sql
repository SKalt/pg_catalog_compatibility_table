CREATE OR REPLACE FUNCTION pg_catalog.pg_show_all_file_settings(OUT sourcefile text, OUT sourceline integer, OUT seqno integer, OUT name text, OUT setting text, OUT applied boolean, OUT error text)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$show_all_file_settings$function$
;
