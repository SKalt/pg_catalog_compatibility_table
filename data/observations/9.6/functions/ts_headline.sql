CREATE OR REPLACE FUNCTION pg_catalog.ts_headline(regconfig, text, tsquery)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT COST 100
AS $function$ts_headline_byid$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_headline(regconfig, text, tsquery, text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT COST 100
AS $function$ts_headline_byid_opt$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_headline(text, tsquery)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 100
AS $function$ts_headline$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_headline(text, tsquery, text)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 100
AS $function$ts_headline_opt$function$
;
