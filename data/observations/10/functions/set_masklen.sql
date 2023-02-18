CREATE OR REPLACE FUNCTION pg_catalog.set_masklen(cidr, integer)
 RETURNS cidr
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$cidr_set_masklen$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.set_masklen(inet, integer)
 RETURNS inet
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$inet_set_masklen$function$
;
