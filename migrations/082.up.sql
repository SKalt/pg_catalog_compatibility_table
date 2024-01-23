
CREATE TABLE pg_shdescription (
  classoid oid NULL
  , "description" text NULL
  , objoid oid NULL
);
CREATE VIEW pg_timezone_abbrevs AS (SELECT $$...$$);
CREATE VIEW pg_cursors AS (SELECT $$...$$);
CREATE VIEW pg_timezone_names AS (SELECT $$...$$);
CREATE VIEW pg_prepared_statements AS (SELECT $$...$$);

ALTER TABLE pg_am ADD COLUMN amclusterable bool NULL;
ALTER TABLE pg_am ADD COLUMN amoptions regproc NULL;
ALTER TABLE pg_am ADD COLUMN amstorage bool NULL;

ALTER TABLE pg_am DROP COLUMN amconcurrent;


ALTER TABLE pg_class ADD COLUMN relfrozenxid xid NULL;
ALTER TABLE pg_class ADD COLUMN reloptions text[] NULL;


ALTER TABLE pg_autovacuum ADD COLUMN freeze_max_age int4 NULL;
ALTER TABLE pg_autovacuum ADD COLUMN freeze_min_age int4 NULL;



ALTER TABLE pg_database DROP COLUMN datvacuumxid;


ALTER TABLE pg_index ADD COLUMN indisvalid bool NULL;


/* view `pg_settings`
add column `unit text NULL`
*/
