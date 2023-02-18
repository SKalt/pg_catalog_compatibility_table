CREATE OR REPLACE FUNCTION pg_catalog.pg_show_all_settings(OUT name text, OUT setting text, OUT unit text, OUT category text, OUT short_desc text, OUT extra_desc text, OUT context text, OUT vartype text, OUT source text, OUT min_val text, OUT max_val text, OUT enumvals text[], OUT boot_val text, OUT reset_val text, OUT sourcefile text, OUT sourceline integer, OUT pending_restart boolean)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$show_all_settings$function$
;
