CREATE OR REPLACE FUNCTION pg_catalog.pg_xlogfile_name_offset(wal_location pg_lsn, OUT file_name text, OUT file_offset integer)
 RETURNS record
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$pg_xlogfile_name_offset$function$
;
