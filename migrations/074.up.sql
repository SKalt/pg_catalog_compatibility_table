CREATE VIEW pg_stats AS (SELECT $$...$$);
CREATE VIEW pg_tables AS (SELECT $$...$$);
CREATE VIEW pg_indexes AS (SELECT $$...$$);
CREATE VIEW pg_rules AS (SELECT $$...$$);
CREATE VIEW pg_locks AS (SELECT $$...$$);
CREATE VIEW pg_user AS (SELECT $$...$$);
CREATE VIEW pg_settings AS (SELECT $$...$$);
CREATE VIEW pg_views AS (SELECT $$...$$);

ALTER TABLE pg_statistic ALTER COLUMN stavaluesn SET TYPE anyarray;

ALTER TABLE pg_am ADD COLUMN amvacuumcleanup regproc NULL;

ALTER TABLE pg_index ADD COLUMN indexprs text NULL;
ALTER TABLE pg_index ADD COLUMN indnatts int2 NULL;
ALTER TABLE pg_index DROP COLUMN indproc;
ALTER TABLE pg_index DROP COLUMN indreference;

ALTER TABLE pg_type ADD COLUMN typreceive regproc NULL;
ALTER TABLE pg_type ADD COLUMN typsend regproc NULL;
