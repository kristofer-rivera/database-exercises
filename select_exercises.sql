-- 3. a 31 Rows b. 
SELECT DISTINCT artist FROM albums;
-- 3. b 23 unique artists in the table.
-- 3. c The primary key is the id field. 
-- 3. d The older release date is 1967. The newest is 2011.

SELECT artist, name FROM albums WHERE artist = "Pink Floyd";
SELECT release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
SELECT genre FROM albums WHERE name = "Nevermind";
SELECT name FROM albums WHERE release_date < 2000 and release_date > 1989;
SELECT name FROM albums WHERE sales < 20;
SELECT name FROM albums WHERE genre = 'Rock';
-- 4.f They don't because the equal function requires the syntax of the string to be an exact match. 
