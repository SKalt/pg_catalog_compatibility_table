CREATE OR REPLACE FUNCTION pg_catalog.pg_relation_size(regclass)
 RETURNS bigint
 LANGUAGE sql
 PARALLEL SAFE STRICT COST 1
RETURN pg_relation_size($1, 'main'::text)
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_relation_size(regclass, text)
 RETURNS bigint
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_relation_size$function$
;
