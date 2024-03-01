WITH all_visitors AS (
  SELECT person.gender AS gender, pizzeria.name AS name FROM person_visits
  JOIN person ON person.id = person_visits.person_id
  JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
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
  EXCEPT ALL SELECT * FROM all_men
),
more_men AS (
  SELECT * FROM all_men
  EXCEPT ALL SELECT * FROM all_women
)

SELECT * FROM more_women
UNION ALL SELECT * FROM more_men
ORDER BY pizzeria_name;