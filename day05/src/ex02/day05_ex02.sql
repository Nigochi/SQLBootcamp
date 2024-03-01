CREATE INDEX idx_person_name ON person (UPPER(name));

SET enable_seqscan = OFF;

SELECT name FROM person
ORDER BY (UPPER(name));

EXPLAIN ANALYSE
SELECT name FROM person
ORDER BY (UPPER(name));