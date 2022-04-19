-- LESSON 1
SELECT title FROM movies;
SELECT director FROM movies; 
SELECT title, director FROM movies;
SELECT title, year FROM movies; 
SELECT * FROM movies; 

-- LESSON 2
SELECT id, title FROM movies 
WHERE id = 6;

SELECT title, year FROM movies
WHERE year BETWEEN 2000 AND 2010;

SELECT title, year FROM movies
WHERE year < 2000 OR year > 2010;

SELECT title, year FROM movies
WHERE year <= 2003;

-- LESSON 3
SELECT title, director FROM movies 
WHERE title LIKE "Toy Story%";

SELECT title, director FROM movies 
WHERE director = "John Lasseter";

SELECT title, director FROM movies 
WHERE director != "John Lasseter";

SELECT * FROM movies 
WHERE title LIKE "WALL-_";

-- LESSON 4
SELECT DISTINCT director FROM movies
ORDER BY director ASC;

SELECT title, year FROM movies
ORDER BY year DESC
LIMIT 4;

SELECT title FROM movies
ORDER BY title ASC
LIMIT 5;

SELECT title FROM movies
ORDER BY title ASC
LIMIT 5 OFFSET 5;

-- LESSON 5
SELECT city, population FROM north_american_cities
WHERE country = "Canada";

SELECT city, latitude FROM north_american_cities
WHERE country = "United States"
ORDER BY latitude DESC;

SELECT city, longitude FROM north_american_cities
WHERE longitude < -87.629798
ORDER BY longitude ASC;

SELECT city, population FROM north_american_cities
WHERE country LIKE "Mexico"
ORDER BY population DESC
LIMIT 2;

SELECT city, population FROM north_american_cities
WHERE country LIKE "United States"
ORDER BY population DESC
LIMIT 2 OFFSET 2;

-- LESSON 6
SELECT title, domestic_sales, international_sales 
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

    SELECT title, domestic_sales, international_sales
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id
WHERE international_sales > domestic_sales;

SELECT title, rating
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id
ORDER BY rating DESC;

-- LESSON 7
SELECT DISTINCT building FROM employees;

SELECT * FROM buildings;

SELECT DISTINCT building_name, role 
FROM buildings 
  LEFT JOIN employees
    ON building_name = building;

-- LESSON 8
SELECT name, role FROM employees
WHERE building IS NULL;

SELECT DISTINCT building_name
FROM buildings 
  LEFT JOIN employees
    ON building_name = building
WHERE role IS NULL;

-- LESSON 9
SELECT title, (domestic_sales + international_sales) / 1000000 AS gross_sales_millions
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

SELECT title, rating * 10 AS rating_percent
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

SELECT title, year
FROM movies
WHERE year % 2 = 0;

-- LESSON 10
SELECT MAX(years_employed) as Max_years_employed
FROM employees;

SELECT role, AVG(years_employed) as Average_years_employed
FROM employees
GROUP BY role;

SELECT building, SUM(years_employed) as Total_years_employed
FROM employees
GROUP BY building;

-- LESSON 11
SELECT role, COUNT(*) as Number_of_artists
FROM employees
WHERE role = "Artist";

SELECT role, COUNT(*)
FROM employees
GROUP BY role;

SELECT role, SUM(years_employed)
FROM employees
GROUP BY role
HAVING role = "Engineer";

-- LESSON 12
SELECT director, COUNT(id) as Num_movies_directed
FROM movies
GROUP BY director;

SELECT director, SUM(domestic_sales + international_sales) as Cumulative_sales_from_all_movies
FROM movies
    INNER JOIN boxoffice
        ON movies.id = boxoffice.movie_id
GROUP BY director;

-- LESSON 13
INSERT INTO movies VALUES (4, "Toy Story 4", "El Directore", 2015, 90);

INSERT INTO boxoffice VALUES (4, 8.7, 340000000, 270000000);

-- LESSON 14
UPDATE movies
SET director = "John Lasseter"
WHERE id = 2;

UPDATE movies
SET year = 1999
WHERE id = 3;

UPDATE movies
SET title = "Toy Story 3", director = "Lee Unkrich"
WHERE id = 11;

-- LESSON 15
DELETE FROM movies
where year < 2005;

DELETE FROM movies
where director = "Andrew Stanton";

-- LESSON 16
CREATE TABLE Database (
    Name TEXT,
    Version FLOAT,
    Download_count INTEGER
);

-- LESSON 17
ALTER TABLE Movies
  ADD COLUMN Aspect_ratio FLOAT DEFAULT 2.39;

ALTER TABLE Movies
  ADD COLUMN Language TEXT DEFAULT "English";

-- LESSON 18
DROP TABLE Movies;

DROP TABLE BoxOffice;