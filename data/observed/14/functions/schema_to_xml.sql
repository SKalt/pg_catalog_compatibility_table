CREATE OR REPLACE FUNCTION pg_catalog.schema_to_xml(schema name, nulls boolean, tableforest boolean, targetns text)
 RETURNS xml
 LANGUAGE internal
 STABLE PARALLEL RESTRICTED STRICT COST 100
AS $function$schema_to_xml$function$
;
