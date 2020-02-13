-- Write queries to return the following:
-- Make the following changes in the "world" database.
USE [World]
-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The 
-- countrycode is 'USA', and population of 45001. (Yes, I looked it up on 
-- Wikipedia.)
INSERT INTO city (name,countrycode,district,population)
VALUES ('Smallville','USA','kansas',45001)

SELECT * FROM city WHERE district = 'kansas'
-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.
INSERT INTO countrylanguage (countrycode,language,isofficial,percentage)
VALUES ('USA','Kryptonese',1,0.0001)

SELECT * FROM countrylanguage WHERE language = 'Kryptonese'
-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble", change 
-- the appropriate record accordingly.
UPDATE countrylanguage SET language = 'Krypto-babble'
WHERE language = 'Kryptonese'

-- 4. Set the US captial to Smallville, Kansas in the country table.
UPDATE country SET capital = '4080'
WHERE code = 'USA'

SELECT * FROM country WHERE capital = '4080'
-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
--DELETE FROM city WHERE name = 'Smallville' --because its set to the capital in country

-- 6. Return the US captial to Washington.
UPDATE country SET capital = '3813'
WHERE code = 'USA'
-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
--DELETE FROM city WHERE name = 'Smallville' --it is no longer the capital

-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972 
-- (exclusive). 
-- (590 rows affected)
UPDATE countrylanguage SET isofficial = ~isofficial
FROM country 
JOIN countrylanguage ON countrylanguage.countrycode = country.code
WHERE (country.indepyear > 1800 AND country.indepyear < 1972)

-- 9. Convert population so it is expressed in 1,000s for all cities. (Round to
-- the nearest integer value greater than 0.)
-- (4079 rows affected)
UPDATE city
SET population = CEILING(CAST(population AS FLOAT)/1000)
SELECT * FROM CITY

-- 10. Assuming a country's surfacearea is expressed in square miles, convert it to 
-- square meters for all countries where French is spoken by more than 20% of the 
-- population.
-- (7 rows affected)

UPDATE country SET country.surfacearea = country.surfacearea/0.00000038610
FROM country
JOIN countrylanguage on countrylanguage.countrycode = country.code
WHERE countrylanguage.language = 'French' AND countrylanguage.percentage > 20

