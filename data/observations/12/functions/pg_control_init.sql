CREATE OR REPLACE FUNCTION pg_catalog.pg_control_init(OUT max_data_alignment integer, OUT database_block_size integer, OUT blocks_per_segment integer, OUT wal_block_size integer, OUT bytes_per_wal_segment integer, OUT max_identifier_length integer, OUT max_index_columns integer, OUT max_toast_chunk_size integer, OUT large_object_chunk_size integer, OUT float4_pass_by_value boolean, OUT float8_pass_by_value boolean, OUT data_page_checksum_version integer)
 RETURNS record
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_control_init$function$
;
