CREATE OR REPLACE FUNCTION pg_catalog.ts_rank_cd(real[], tsvector, tsquery)
 RETURNS real
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ts_rankcd_wtt$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_rank_cd(real[], tsvector, tsquery, integer)
 RETURNS real
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ts_rankcd_wttf$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_rank_cd(tsvector, tsquery)
 RETURNS real
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ts_rankcd_tt$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_rank_cd(tsvector, tsquery, integer)
 RETURNS real
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ts_rankcd_ttf$function$
;
