SELECT day::date 
FROM generate_series('2022-01-01'::timestamp, '2022-01-10', '1 day') DAY
LEFT JOIN person_visits ON (person_id = 1 OR person_id = 2) AND visit_date = DAY
WHERE visit_date IS NULL
ORDER BY visit_date ASC;