CREATE OR REPLACE FUNCTION pg_catalog.isparallel(line, line)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$line_parallel$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.isparallel(lseg, lseg)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$lseg_parallel$function$
;
