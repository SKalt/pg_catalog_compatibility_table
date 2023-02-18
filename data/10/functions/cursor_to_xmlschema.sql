CREATE OR REPLACE FUNCTION pg_catalog.cursor_to_xmlschema(cursor refcursor, nulls boolean, tableforest boolean, targetns text)
 RETURNS xml
 LANGUAGE internal
 STABLE STRICT COST 100
AS $function$cursor_to_xmlschema$function$
;
