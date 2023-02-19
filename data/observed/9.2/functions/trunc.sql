CREATE OR REPLACE FUNCTION pg_catalog.trunc(double precision)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$dtrunc$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.trunc(macaddr)
 RETURNS macaddr
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$macaddr_trunc$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.trunc(numeric)
 RETURNS numeric
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select pg_catalog.trunc($1,0)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.trunc(numeric, integer)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$numeric_trunc$function$
;
