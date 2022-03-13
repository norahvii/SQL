-- ctrl + shift + l
-- selects multiple lines in sublime
-- ctrl + alt in atom is cooler

-- Utra basic example; create a table for people
CREATE TABLE people (
	id INTEGER,
	name VARCHAR (255)
);

-- Let's add two people to the table
INSERT INTO people VALUES (1, 'Norah');
INSERT INTO people VALUES (2, 'Travis');

-- Create a table for the workers
CREATE TABLE workers (
    id INTEGER,
    first_name VARCHAR (255),
    last_name VARCHAR (255),
    age INTEGER,
    occupation VARCHAR (255)
);

-- Let's add a person's data to the table
INSERT INTO workers VALUES ('9', 'Tasha', 'Yar', '31', 'major');

-- Let's add a bunch of people to the table but alther the value syntax
INSERT INTO workers (id, first_name, last_name, age, occupation) VALUES ('1', 'Anthony', 'Hopkins', '54', 'actor');
INSERT INTO workers (id, first_name, last_name, age, occupation) VALUES ('2', 'Vivian', 'Hanson', '54', 'nurse');
INSERT INTO workers (id, first_name, last_name, age, occupation) VALUES ('3', 'Erik', 'Brute', '23', 'soldier');
INSERT INTO workers (id, first_name, last_name, age, occupation) VALUES ('4', 'Laura', 'Turing', '54', 'scientist');
INSERT INTO workers (id, first_name, last_name, age, occupation) VALUES ('5', 'Josh', 'Peters', '54', 'electrician');
INSERT INTO workers (id, first_name, last_name, age, occupation) VALUES ('6', 'Sammy', 'Kennedy', '54', 'spy');
INSERT INTO workers (id, first_name, last_name, age, occupation) VALUES ('7', 'Julia', 'Barwick', '33', 'musician');
INSERT INTO workers (id, first_name, last_name, age, occupation) VALUES ('8', 'Emma', 'Snark', '22', 'warrior');

-- We need to change Antony's age to 42
UPDATE workers
set age = 42
WHERE first_name = 'Anthony';

-- Select all workers under the age 30
SELECT * FROM workers
WHERE age < 30;

-- Order by id
SELECT * FROM workers
ORDER BY id;

-- Order by id descending order
SELECT * FROM workers
ORDER BY id DESC;

-- Insert into workers table
INSERT INTO workers (id, first_name, last_name, age, occupation) VALUES ('8', 'Emma', 'Snark', '22', 'warrior');

-- Josh turned 29 let's wish him a happy birthday
UPDATE workers
SET age = 29
WHERE first_name = 'Josh';

-- Select just the first and last names
SELECT first_name, last_name
FROM workers;

-- Select but exclude people between age 24 - 27
SELECT id, age
FROM workers
WHERE age > 27
    OR age < 24;

-- Find the spy
SELECT * FROM workers
WHERE occupation = 'spy';

-- What's your age of attraction?
SELECT * FROM workers
WHERE age BETWEEN 24 AND 60;

-- What's NOT your age of attraction?
SELECT * FROM workers
WHERE age NOT BETWEEN 21 AND 60;

-- The first three entries
SELECT * FROM workers
ORDER BY ID
LIMIT 3;

-- Find all people whose names start with "J"
SELECT first_name FROM workers
WHERE first_name LIKE 'J%';

-- Find all people whose names do not start with "J"
SELECT first_name FROM workers
WHERE first_name NOT LIKE 'J%';

-- Find the spy again using "LIKE"
SELECT DISTINCT id, occupation, first_name, last_name
FROM workers
WHERE occupation LIKE 'sp%' -- This should find spy ;)
ORDER BY id;

-- Find the last 5 entries
SELECT DISTINCT * FROM workers
ORDER BY id
DESC LIMIT 5;

-- Select the first 3 entries
SELECT * FROM workers
ORDER BY id
LIMIT 3;

-- Select the next 3 entries
SELECT * FROM workers
ORDER BY id
LIMIT 3
OFFSET 3;

-- Select every actress
SELECT occupation FROM workers
WHERE occupation = 'actress'
ORDER BY occupation;

-- Select just one actress without duplicates
SELECT DISTINCT occupation
FROM workers
WHERE occupation = 'actress'
ORDER BY occupation;

-- Group and count to find the row with more than 1 occupation
SELECT occupation, COUNT(id) as NumJobs
FROM workers
GROUP BY occupation;

-- Find the average age for the workers
SELECT AVG(age) as avg_age
FROM workers;

-- Now we need to practice joining data and updating dates
-- We just learned that everyone in our table is an alien from another world

-- Create table
CREATE TABLE aliens (
	id INTEGER,
	planet_origin VARCHAR (255),
	trnasfer_date DATE
);

-- Load the data
INSERT INTO aliens VALUES ('1','Mars','1804-09-27');
INSERT INTO aliens VALUES ('2','Ego','2049-01-27');
INSERT INTO aliens VALUES ('3','Etheria','1819-05-27');
INSERT INTO aliens VALUES ('4','LV-426','2049-04-27');
INSERT INTO aliens VALUES ('5','Gallifrey','2019-12-27');
INSERT INTO aliens VALUES ('6','Krypton','2014-10-27');
INSERT INTO aliens VALUES ('7','Hell','1666-10-27');
INSERT INTO aliens VALUES ('8','Arda','1844-02-27');
INSERT INTO aliens VALUES ('9','Asgard','2015-04-27');
INSERT INTO aliens VALUES ('10','Solaris','1819-07-27');
INSERT INTO aliens VALUES ('11','Apokolips','1366-06-27');
INSERT INTO aliens VALUES ('12','Aiur','1819-03-27');
INSERT INTO aliens VALUES ('13','Cybertron','1974-01-27');
INSERT INTO aliens VALUES ('14','Zerus','0214-12-12');

-- Now let's join the two tables together
SELECT *
FROM workers
INNER JOIN aliens
ON workers.id = aliens.id;

-- Let's try this
SELECT w.first_name, w.last_name, a.transfer_date, a.id
FROM workers AS w
INNER JOIN aliens as a
ON w.id = a.id;

-- We got an error because we mispelled "transfer_date"
ALTER TABLE aliens
RENAME COLUMN trnasfer_date TO transfer_date;

-- Now our code should work
SELECT w.first_name, w.last_name, a.transfer_date, a.id, a.planet_origin
FROM workers AS w
INNER JOIN aliens as a
ON w.id = a.id
ORDER BY transfer_date;
-- It looks like the oldest alien is from Zerus: the Zerg homeworld

-- Let's only make the planet origin public information
CREATE VIEW alien_public AS
SELECT planet_origin
FROM aliens;

-- Create a column
SELECT id, first_name, "workers" AS status
FROM workers;

--- Select the max age, min, age, and average age, respectively
SELECT MAX(age)
FROM workers;

SELECT MIN(age)
FROM workers;

SELECT AVG(age)
FROM workers;

-- Combined age?
SELECT SUM(age)
FROM workers;

-- What if we fired everyone above a certain age?
DELETE FROM workers
WHERE age > 70

-- Krypton was destroyed so let's remove it
DELETE FROM aliens
where planet_origin = "Krypton";

-- Sad to lose an entire planet, but what about all the data on aliens?
DROP TABLE aliens;

-- Pause
-- https://sqlbolt.com/lesson/select_queries_review
-- https://www.kaggle.com/learn/advanced-sql
