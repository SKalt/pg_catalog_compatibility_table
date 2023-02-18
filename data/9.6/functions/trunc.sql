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
CREATE OR REPLACE FUNCTION pg_catalog.trunc(numeric)
 RETURNS numeric
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
AS $function$select pg_catalog.trunc($1,0)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.trunc(numeric, integer)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_trunc$function$
;
