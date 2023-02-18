CREATE OR REPLACE FUNCTION pg_catalog.lead(anycompatible, integer, anycompatible)
 RETURNS anycompatible
 LANGUAGE internal
 WINDOW IMMUTABLE PARALLEL SAFE STRICT
AS $function$window_lead_with_offset_and_default$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.lead(anyelement)
 RETURNS anyelement
 LANGUAGE internal
 WINDOW IMMUTABLE PARALLEL SAFE STRICT
AS $function$window_lead$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.lead(anyelement, integer)
 RETURNS anyelement
 LANGUAGE internal
 WINDOW IMMUTABLE PARALLEL SAFE STRICT
AS $function$window_lead_with_offset$function$
;
