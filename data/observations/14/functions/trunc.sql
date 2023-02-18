CREATE OR REPLACE FUNCTION pg_catalog.trunc(double precision)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$dtrunc$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.trunc(macaddr)
 RETURNS macaddr
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$macaddr_trunc$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.trunc(macaddr8)
 RETURNS macaddr8
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$macaddr8_trunc$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.trunc(numeric)
 RETURNS numeric
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
RETURN trunc($1, 0)
;
CREATE OR REPLACE FUNCTION pg_catalog.trunc(numeric, integer)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_trunc$function$
;
