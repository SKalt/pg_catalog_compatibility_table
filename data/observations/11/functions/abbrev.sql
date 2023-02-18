CREATE OR REPLACE FUNCTION pg_catalog.abbrev(cidr)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$cidr_abbrev$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.abbrev(inet)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$inet_abbrev$function$
;
