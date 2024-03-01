SELECT pizzeria.name AS pizzeria_name FROM (
  SELECT * FROM person
  WHERE person.name = 'Dmitriy'
) AS person
JOIN (
  SELECT * FROM person_visits
  WHERE visit_date = '2022-01-08'
) AS person_visits ON person_visits.person_id = person.id
JOIN pizzeria AS pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN (
  SELECT * FROM menu
  WHERE price < 800
) AS menu ON menu.pizzeria_id = pizzeria.id;