CREATE OR REPLACE FUNCTION pg_catalog.is_normalized(text, text DEFAULT 'NFC'::text)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$unicode_is_normalized$function$
;
