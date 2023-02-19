CREATE OR REPLACE FUNCTION pg_catalog."substring"(bit, integer)
 RETURNS bit
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$bitsubstr_no_len$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."substring"(bit, integer, integer)
 RETURNS bit
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$bitsubstr$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."substring"(bytea, integer)
 RETURNS bytea
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$bytea_substr_no_len$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."substring"(bytea, integer, integer)
 RETURNS bytea
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$bytea_substr$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."substring"(text, integer)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$text_substr_no_len$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."substring"(text, integer, integer)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$text_substr$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."substring"(text, text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$textregexsubstr$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."substring"(text, text, text)
 RETURNS text
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
AS $function$select pg_catalog.substring($1, pg_catalog.similar_to_escape($2, $3))$function$
;
