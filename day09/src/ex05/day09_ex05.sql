DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

CREATE FUNCTION fnc_persons(pgender varchar default 'female')
RETURNS TABLE(
	id person.id%type,
	name person.name%type,
	age person.age%type,
	gender person.gender%type,
	address person.address%type) AS $BODY$
SELECT id, name, age, gender, address
FROM person
WHERE gender = pgender;
$BODY$
LANGUAGE SQL;

SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();