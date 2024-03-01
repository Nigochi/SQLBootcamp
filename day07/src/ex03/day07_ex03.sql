WITH visits_orders AS ((SELECT pizzeria.name, COUNT(*) AS count, 'order' AS action_type
FROM person_order 
JOIN menu m ON m.id = person_order.menu_id
JOIN pizzeria ON m.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY count DESC)
UNION
(SELECT pizzeria.name, COUNT(*) AS count, 'visit' AS action_type
FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY count DESC)
ORDER BY action_type, count DESC)

SELECT name, SUM(count) AS total_count
FROM visits_orders
GROUP BY name
ORDER BY total_count DESC, name