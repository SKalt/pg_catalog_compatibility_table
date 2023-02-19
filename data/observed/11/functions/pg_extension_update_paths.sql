CREATE OR REPLACE FUNCTION pg_catalog.pg_extension_update_paths(name name, OUT source text, OUT target text, OUT path text)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 10 ROWS 100
AS $function$pg_extension_update_paths$function$
;
