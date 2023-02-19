CREATE OR REPLACE FUNCTION pg_catalog.ts_headline(json, tsquery)
 RETURNS json
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 100
AS $function$ts_headline_json$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_headline(json, tsquery, text)
 RETURNS json
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 100
AS $function$ts_headline_json_opt$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_headline(jsonb, tsquery)
 RETURNS jsonb
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 100
AS $function$ts_headline_jsonb$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_headline(jsonb, tsquery, text)
 RETURNS jsonb
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 100
AS $function$ts_headline_jsonb_opt$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_headline(regconfig, json, tsquery)
 RETURNS json
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT COST 100
AS $function$ts_headline_json_byid$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_headline(regconfig, json, tsquery, text)
 RETURNS json
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT COST 100
AS $function$ts_headline_json_byid_opt$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_headline(regconfig, jsonb, tsquery)
 RETURNS jsonb
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT COST 100
AS $function$ts_headline_jsonb_byid$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_headline(regconfig, jsonb, tsquery, text)
 RETURNS jsonb
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT COST 100
AS $function$ts_headline_jsonb_byid_opt$function$
;
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
