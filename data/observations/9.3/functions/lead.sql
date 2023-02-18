CREATE OR REPLACE FUNCTION pg_catalog.lead(anyelement)
 RETURNS anyelement
 LANGUAGE internal
 WINDOW IMMUTABLE STRICT
AS $function$window_lead$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.lead(anyelement, integer)
 RETURNS anyelement
 LANGUAGE internal
 WINDOW IMMUTABLE STRICT
AS $function$window_lead_with_offset$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.lead(anyelement, integer, anyelement)
 RETURNS anyelement
 LANGUAGE internal
 WINDOW IMMUTABLE STRICT
AS $function$window_lead_with_offset_and_default$function$
;
