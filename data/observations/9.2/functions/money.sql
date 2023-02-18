CREATE OR REPLACE FUNCTION pg_catalog.money(bigint)
 RETURNS money
 LANGUAGE internal
 STABLE STRICT
AS $function$int8_cash$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.money(integer)
 RETURNS money
 LANGUAGE internal
 STABLE STRICT
AS $function$int4_cash$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.money(numeric)
 RETURNS money
 LANGUAGE internal
 STABLE STRICT
AS $function$numeric_cash$function$
;
