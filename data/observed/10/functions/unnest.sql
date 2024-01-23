CREATE OR REPLACE FUNCTION pg_catalog.unnest(anyarray)
 RETURNS SETOF anyelement
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT ROWS 100
AS $function$array_unnest$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.unnest(tsvector tsvector, OUT lexeme text, OUT positions smallint[], OUT weights text[])
 RETURNS SETOF record
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT ROWS 10
AS $function$tsvector_unnest$function$
;
