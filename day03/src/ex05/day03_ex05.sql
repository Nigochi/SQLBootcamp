WITH visit AS (
  SELECT DISTINCT pizzeria.name AS pizzeria_name FROM person_visits
  JOIN (SELECT * FROM person
        WHERE person.name = 'Andrey') AS person ON person.id = person_visits.person_id
  JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
),
order_pizza AS (
  SELECT DISTINCT pizzeria.name AS pizzeria_name FROM person_order
  JOIN (SELECT * FROM person
        WHERE person.name = 'Andrey') AS person ON person.id = person_order.person_id
  JOIN pizzeria ON pizzeria.id = person_order.person_id
)
SELECT * FROM visit
EXCEPT SELECT * FROM order_pizza
ORDER BY pizzeria_name;