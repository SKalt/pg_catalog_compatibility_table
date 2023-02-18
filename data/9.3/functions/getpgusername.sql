CREATE OR REPLACE FUNCTION pg_catalog.getpgusername()
 RETURNS name
 LANGUAGE internal
 STABLE STRICT
AS $function$current_user$function$
;
