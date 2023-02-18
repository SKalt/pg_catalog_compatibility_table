CREATE OR REPLACE FUNCTION pg_catalog.ts_parse(parser_name text, txt text, OUT tokid integer, OUT token text)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$ts_parse_byname$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_parse(parser_oid oid, txt text, OUT tokid integer, OUT token text)
 RETURNS SETOF record
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ts_parse_byid$function$
;
