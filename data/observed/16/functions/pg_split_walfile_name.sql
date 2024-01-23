CREATE OR REPLACE FUNCTION pg_catalog.pg_split_walfile_name(file_name text, OUT segment_number numeric, OUT timeline_id bigint)
 RETURNS record
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_split_walfile_name$function$
;
