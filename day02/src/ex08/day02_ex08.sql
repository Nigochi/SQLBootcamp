SELECT person.name AS name FROM (
  SELECT * FROM person
  WHERE gender = 'male' AND address IN ('Moscow', 'Samara')
) AS person
JOIN person_order ON person_order.person_id = person.id
JOIN (
  SELECT * FROM menu
  WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')
) AS menu ON menu.id = person_order.menu_id
ORDER BY name DESC;