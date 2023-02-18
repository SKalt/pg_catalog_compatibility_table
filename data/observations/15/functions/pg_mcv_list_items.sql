CREATE OR REPLACE FUNCTION pg_catalog.pg_mcv_list_items(mcv_list pg_mcv_list, OUT index integer, OUT "values" text[], OUT nulls boolean[], OUT frequency double precision, OUT base_frequency double precision)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_stats_ext_mcvlist_items$function$
;
