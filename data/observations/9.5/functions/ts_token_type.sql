CREATE OR REPLACE FUNCTION pg_catalog.ts_token_type(parser_name text, OUT tokid integer, OUT alias text, OUT description text)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE STRICT ROWS 16
AS $function$ts_token_type_byname$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_token_type(parser_oid oid, OUT tokid integer, OUT alias text, OUT description text)
 RETURNS SETOF record
 LANGUAGE internal
 IMMUTABLE STRICT ROWS 16
AS $function$ts_token_type_byid$function$
;
