WITH sad_pizza AS (
  SELECT menu.id AS menu_id FROM menu
  EXCEPT SELECT menu_id FROM person_order
)
SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name FROM menu
JOIN sad_pizza ON menu_id = menu.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY pizza_name, price;