CREATE OR REPLACE FUNCTION pg_catalog.pg_sequence_parameters(sequence_oid oid, OUT start_value bigint, OUT minimum_value bigint, OUT maximum_value bigint, OUT increment bigint, OUT cycle_option boolean)
 RETURNS record
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_sequence_parameters$function$
;
