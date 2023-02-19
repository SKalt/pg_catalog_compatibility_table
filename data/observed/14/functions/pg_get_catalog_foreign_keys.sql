CREATE OR REPLACE FUNCTION pg_catalog.pg_get_catalog_foreign_keys(OUT fktable regclass, OUT fkcols text[], OUT pktable regclass, OUT pkcols text[], OUT is_array boolean, OUT is_opt boolean)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 10 ROWS 250
AS $function$pg_get_catalog_foreign_keys$function$
;
