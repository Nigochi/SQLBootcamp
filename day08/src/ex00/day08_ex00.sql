-- session 1
BEGIN TRANSACTION;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- session 1
COMMIT WORK;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';