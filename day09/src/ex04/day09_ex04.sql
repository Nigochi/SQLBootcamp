CREATE FUNCTION fnc_persons_female()
RETURNS TABLE(
	id person.id%type,
	name person.name%type,
	age person.age%type,
	gender person.gender%type,
	address person.address%type) AS $BODY$
SELECT id, name, age, gender, address
FROM person
WHERE gender = 'female';
$BODY$
LANGUAGE SQL;

-- DROP FUNCTION fnc_persons_female()

CREATE FUNCTION fnc_persons_male()
RETURNS TABLE(
	id person.id%type,
	name person.name%type,
	age person.age%type,
	gender person.gender%type,
	address person.address%type) AS $BODY$
SELECT id, name, age, gender, address
FROM person
WHERE gender = 'male';
$BODY$
LANGUAGE SQL;

-- DROP FUNCTION fnc_persons_male()

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();