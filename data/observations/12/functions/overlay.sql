CREATE OR REPLACE FUNCTION pg_catalog."overlay"(bit, bit, integer)
 RETURNS bit
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$bitoverlay_no_len$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlay"(bit, bit, integer, integer)
 RETURNS bit
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$bitoverlay$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlay"(bytea, bytea, integer)
 RETURNS bytea
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$byteaoverlay_no_len$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlay"(bytea, bytea, integer, integer)
 RETURNS bytea
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$byteaoverlay$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlay"(text, text, integer)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$textoverlay_no_len$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlay"(text, text, integer, integer)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$textoverlay$function$
;
