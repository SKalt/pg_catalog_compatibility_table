CREATE OR REPLACE FUNCTION pg_catalog.getpgusername()
 RETURNS name
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$current_user$function$
;
