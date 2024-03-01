SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE person.name IN ('Denis', 'Anna')
ORDER BY pizza_name, pizzeria_name;