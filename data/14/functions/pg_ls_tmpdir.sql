CREATE OR REPLACE FUNCTION pg_catalog.pg_ls_tmpdir(OUT name text, OUT size bigint, OUT modification timestamp with time zone)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL SAFE STRICT COST 10 ROWS 20
AS $function$pg_ls_tmpdir_noargs$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_ls_tmpdir(tablespace oid, OUT name text, OUT size bigint, OUT modification timestamp with time zone)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL SAFE STRICT COST 10 ROWS 20
AS $function$pg_ls_tmpdir_1arg$function$
;
