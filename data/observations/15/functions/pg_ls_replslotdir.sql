CREATE OR REPLACE FUNCTION pg_catalog.pg_ls_replslotdir(slot_name text, OUT name text, OUT size bigint, OUT modification timestamp with time zone)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL SAFE STRICT COST 10 ROWS 20
AS $function$pg_ls_replslotdir$function$
;
