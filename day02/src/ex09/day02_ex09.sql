SELECT DISTINCT person.name AS name FROM (
  SELECT * FROM person
  WHERE gender = 'female'
) AS person
JOIN person_order ON person_order.person_id = person.id
JOIN (
  SELECT * FROM menu
  WHERE pizza_name IN ('cheese pizza', 'pepperoni pizza')
) AS menu ON menu.id = person_order.menu_id
WHERE pizza_name IN ('cheese pizza', 'pepperoni pizza')
ORDER BY name;