SELECT generated_date AS missing_date FROM v_generated_dates
EXCEPT ALL SELECT person_visits.visit_date FROM person_visits
ORDER BY missing_date;