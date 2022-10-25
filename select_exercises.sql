-- How many rows are in the albums table? 6
-- How many unique artist names are in the albums table? 23
-- What is the primary key for the albums table? ID
-- What is the oldest release date for any album in the albums table? 1967
-- What is the most recent release date? 2011
SELECT name FROM albums WHERE artist='Pink Floyd';
SELECT * FROM albums WHERE artist='The Beatles';
SELECT genre FROM albums WHERE name='Nevermind';
SELECT name, release_date FROM albums WHERE release_date BETWEEN 1990 AND 2000;
SELECT name, sales FROM albums WHERE sales < 20;
SELECT name FROM albums WHERE genre = 'Rock';
-- The query for Rock only queried for Rock by itself not other different types of rock
