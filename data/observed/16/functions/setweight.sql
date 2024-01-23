CREATE OR REPLACE FUNCTION pg_catalog.setweight(tsvector, "char")
 RETURNS tsvector
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$tsvector_setweight$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.setweight(tsvector, "char", text[])
 RETURNS tsvector
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$tsvector_setweight_by_filter$function$
;
