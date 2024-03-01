WITH all_visitors AS (
  SELECT person.gender AS gender, pizzeria.name AS name FROM person_order
  JOIN person ON person.id = person_order.person_id
  JOIN menu ON menu.id = person_order.menu_id
  JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
),
all_women AS (
  SELECT all_visitors.name AS pizzeria_name FROM all_visitors
  WHERE all_visitors.gender = 'female'
),
all_men AS (
  SELECT all_visitors.name AS pizzeria_name FROM all_visitors
  WHERE all_visitors.gender = 'male'
),
more_women AS (
  SELECT * FROM all_women
  EXCEPT SELECT * FROM all_men
),
more_men AS (
  SELECT * FROM all_men
  EXCEPT SELECT * FROM all_women
)

SELECT * FROM more_women
UNION SELECT * FROM more_men
ORDER BY pizzeria_name;