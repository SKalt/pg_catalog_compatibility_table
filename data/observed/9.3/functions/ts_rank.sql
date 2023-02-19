CREATE OR REPLACE FUNCTION pg_catalog.ts_rank(real[], tsvector, tsquery)
 RETURNS real
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$ts_rank_wtt$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_rank(real[], tsvector, tsquery, integer)
 RETURNS real
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$ts_rank_wttf$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_rank(tsvector, tsquery)
 RETURNS real
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$ts_rank_tt$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_rank(tsvector, tsquery, integer)
 RETURNS real
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$ts_rank_ttf$function$
;
