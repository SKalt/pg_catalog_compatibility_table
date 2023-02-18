CREATE OR REPLACE FUNCTION pg_catalog.regexp_count(text, text)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$regexp_count_no_start$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.regexp_count(text, text, integer)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$regexp_count_no_flags$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.regexp_count(text, text, integer, text)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$regexp_count$function$
;
