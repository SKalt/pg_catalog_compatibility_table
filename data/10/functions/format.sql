CREATE OR REPLACE FUNCTION pg_catalog.format(text)
 RETURNS text
 LANGUAGE internal
 STABLE
AS $function$text_format_nv$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.format(text, VARIADIC "any")
 RETURNS text
 LANGUAGE internal
 STABLE
AS $function$text_format$function$
;
