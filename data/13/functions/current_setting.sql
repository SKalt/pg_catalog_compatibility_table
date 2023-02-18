CREATE OR REPLACE FUNCTION pg_catalog.current_setting(text)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$show_config_by_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.current_setting(text, boolean)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$show_config_by_name_missing_ok$function$
;
