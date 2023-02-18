CREATE OR REPLACE FUNCTION pg_catalog.ts_delete(tsvector, text)
 RETURNS tsvector
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$tsvector_delete_str$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_delete(tsvector, text[])
 RETURNS tsvector
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$tsvector_delete_arr$function$
;
