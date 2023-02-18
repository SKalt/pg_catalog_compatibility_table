CREATE OR REPLACE FUNCTION pg_catalog.substr(bytea, integer)
 RETURNS bytea
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$bytea_substr_no_len$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.substr(bytea, integer, integer)
 RETURNS bytea
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$bytea_substr$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.substr(text, integer)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$text_substr_no_len$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.substr(text, integer, integer)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$text_substr$function$
;
