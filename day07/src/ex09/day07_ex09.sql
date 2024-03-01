SELECT person.address,
	ROUND(MAX(person.age)-(MIN(person.age)/MAX(person.age)::numeric), 2) AS formula,
	ROUND(AVG(person.age), 2) AS average,
	ROUND(MAX(person.age)-(MIN(person.age)/MAX(person.age)::numeric), 2)> ROUND(AVG(person.age), 2) AS comparison
FROM person
GROUP BY address
ORDER BY address;