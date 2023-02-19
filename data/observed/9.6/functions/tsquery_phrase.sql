CREATE OR REPLACE FUNCTION pg_catalog.tsquery_phrase(tsquery, tsquery)
 RETURNS tsquery
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$tsquery_phrase$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.tsquery_phrase(tsquery, tsquery, integer)
 RETURNS tsquery
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$tsquery_phrase_distance$function$
;
