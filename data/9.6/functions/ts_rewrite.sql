CREATE OR REPLACE FUNCTION pg_catalog.ts_rewrite(tsquery, text)
 RETURNS tsquery
 LANGUAGE internal
 STRICT COST 100
AS $function$tsquery_rewrite_query$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_rewrite(tsquery, tsquery, tsquery)
 RETURNS tsquery
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$tsquery_rewrite$function$
;
