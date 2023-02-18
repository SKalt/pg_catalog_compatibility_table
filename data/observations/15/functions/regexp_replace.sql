CREATE OR REPLACE FUNCTION pg_catalog.regexp_replace(text, text, text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$textregexreplace_noopt$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.regexp_replace(text, text, text, integer)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$textregexreplace_extended_no_n$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.regexp_replace(text, text, text, integer, integer)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$textregexreplace_extended_no_flags$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.regexp_replace(text, text, text, integer, integer, text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$textregexreplace_extended$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.regexp_replace(text, text, text, text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$textregexreplace$function$
;
