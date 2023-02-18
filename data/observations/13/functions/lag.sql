CREATE OR REPLACE FUNCTION pg_catalog.lag(anyelement)
 RETURNS anyelement
 LANGUAGE internal
 WINDOW IMMUTABLE PARALLEL SAFE STRICT
AS $function$window_lag$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.lag(anyelement, integer)
 RETURNS anyelement
 LANGUAGE internal
 WINDOW IMMUTABLE PARALLEL SAFE STRICT
AS $function$window_lag_with_offset$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.lag(anyelement, integer, anyelement)
 RETURNS anyelement
 LANGUAGE internal
 WINDOW IMMUTABLE PARALLEL SAFE STRICT
AS $function$window_lag_with_offset_and_default$function$
;
