CREATE OR REPLACE FUNCTION pg_catalog.pg_walfile_name_offset(lsn pg_lsn, OUT file_name text, OUT file_offset integer)
 RETURNS record
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$pg_walfile_name_offset$function$
;
