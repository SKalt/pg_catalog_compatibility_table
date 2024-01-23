CREATE OR REPLACE FUNCTION pg_catalog.length(bit)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$bitlength$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.length(bytea)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$byteaoctetlen$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.length(bytea, name)
 RETURNS integer
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$length_in_encoding$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.length(character)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$bpcharlen$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.length(lseg)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$lseg_length$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.length(path)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$path_length$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.length(text)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$textlen$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.length(tsvector)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$tsvector_length$function$
;
