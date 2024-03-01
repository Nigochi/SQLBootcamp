select name, count(*) as count_of_visits from person_visits
join person on person.id = person_visits.person_id
GROUP by person.name
having count(*) > 3;