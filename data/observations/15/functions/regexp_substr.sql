CREATE OR REPLACE FUNCTION pg_catalog.regexp_substr(text, text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$regexp_substr_no_start$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.regexp_substr(text, text, integer)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$regexp_substr_no_n$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.regexp_substr(text, text, integer, integer)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$regexp_substr_no_flags$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.regexp_substr(text, text, integer, integer, text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$regexp_substr_no_subexpr$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.regexp_substr(text, text, integer, integer, text, integer)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$regexp_substr$function$
;
