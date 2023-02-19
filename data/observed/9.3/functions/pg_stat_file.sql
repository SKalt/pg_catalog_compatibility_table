CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_file(filename text, OUT size bigint, OUT access timestamp with time zone, OUT modification timestamp with time zone, OUT change timestamp with time zone, OUT creation timestamp with time zone, OUT isdir boolean)
 RETURNS record
 LANGUAGE internal
 STRICT
AS $function$pg_stat_file$function$
;
