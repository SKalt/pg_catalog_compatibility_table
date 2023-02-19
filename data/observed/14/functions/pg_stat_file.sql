CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_file(filename text, OUT size bigint, OUT access timestamp with time zone, OUT modification timestamp with time zone, OUT change timestamp with time zone, OUT creation timestamp with time zone, OUT isdir boolean)
 RETURNS record
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_stat_file_1arg$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_file(filename text, missing_ok boolean, OUT size bigint, OUT access timestamp with time zone, OUT modification timestamp with time zone, OUT change timestamp with time zone, OUT creation timestamp with time zone, OUT isdir boolean)
 RETURNS record
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_stat_file$function$
;
