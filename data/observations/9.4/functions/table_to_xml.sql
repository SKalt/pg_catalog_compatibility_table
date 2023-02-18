CREATE OR REPLACE FUNCTION pg_catalog.table_to_xml(tbl regclass, nulls boolean, tableforest boolean, targetns text)
 RETURNS xml
 LANGUAGE internal
 STABLE STRICT COST 100
AS $function$table_to_xml$function$
;
