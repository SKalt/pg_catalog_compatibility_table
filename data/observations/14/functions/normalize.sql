CREATE OR REPLACE FUNCTION pg_catalog."normalize"(text, text DEFAULT 'NFC'::text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$unicode_normalize_func$function$
;
