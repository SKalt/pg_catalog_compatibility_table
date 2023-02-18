CREATE OR REPLACE FUNCTION pg_catalog.gtsquery_consistent(internal, internal, integer, oid, internal)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$gtsquery_consistent_oldsig$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.gtsquery_consistent(internal, tsquery, smallint, oid, internal)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$gtsquery_consistent$function$
;
