CREATE OR REPLACE FUNCTION pg_catalog.regexp_matches(text, text)
 RETURNS SETOF text[]
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT ROWS 1
AS $function$regexp_matches_no_flags$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.regexp_matches(text, text, text)
 RETURNS SETOF text[]
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT ROWS 10
AS $function$regexp_matches$function$
;
