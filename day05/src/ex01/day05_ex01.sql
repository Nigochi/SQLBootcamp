SET enable_seqscan = off;
SELECT pizza_name, pizzeria.name AS pizzeria_name FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id;
EXPLAIN ANALYZE
SELECT pizza_name, pizzeria.name AS pizzeria_name FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id;