CREATE OR REPLACE FUNCTION pg_catalog.ts_stat(query text, OUT word text, OUT ndoc integer, OUT nentry integer)
 RETURNS SETOF record
 LANGUAGE internal
 STRICT COST 10 ROWS 10000
AS $function$ts_stat1$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_stat(query text, weights text, OUT word text, OUT ndoc integer, OUT nentry integer)
 RETURNS SETOF record
 LANGUAGE internal
 STRICT COST 10 ROWS 10000
AS $function$ts_stat2$function$
;
