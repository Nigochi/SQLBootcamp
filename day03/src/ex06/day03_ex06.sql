SELECT menu.pizza_name, pizzeria1.name AS pizzeria_name_1, pizzeria2.name AS pizzeria_name_2, menu.price
FROM menu
JOIN menu AS menu2 ON menu2.pizza_name = menu.pizza_name
JOIN pizzeria AS pizzeria1 ON pizzeria1.id = menu.pizzeria_id
JOIN pizzeria AS pizzeria2 ON pizzeria2.id = menu2.pizzeria_id
WHERE menu.price = menu2.price AND menu.pizzeria_id > menu2.pizzeria_id
ORDER BY pizza_name;