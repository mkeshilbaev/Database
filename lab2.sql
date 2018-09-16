Create database lab2; --1

CREATE TABLE countries( --2
  country_id SERIAL PRIMARY KEY,
  country_name VARCHAR(50),
  region_id INTEGER,
  population INTEGER
);

INSERT INTO countries(country_id, country_name, region_id, population) --3
VALUES (DEFAULT , 'Kazakhstan', 16, 18000000);

INSERT INTO countries(country_id, country_name) --4
VALUES (3, 'Russia');

SELECT * From countries;

INSERT INTO countries(region_id) --5
VALUES (NULL);

SELECT * FROM countries;

INSERT INTO countries( --6
         VALUES (6, 'Belgium', 89, 560000),
       (7, 'England', 90, 9800000),
       (8, 'Georgia', 91, 456000)
    );

INSERT INTO countries(country_name) --7
VALUES ('Kazakhstan');

INSERT INTO countries(country_name) --8
VALUES (DEFAULT);

SELECT * FROM countries;

CREATE TABLE countries_new( --10
  LIKE countries
);

INSERT INTO countries_new --11
SELECT * FROM countries;

UPDATE countries_new SET region_id = 1 --12
WHERE region_id IS NULL ;

UPDATE countries_new SET population  = population + (population * 0.10) --13
RETURNING country_name, population as "New population";

DELETE FROM countries --14
WHERE population < 100000;

DELETE FROM countries_new AS cn USING countries AS  c2 --15
WHERE c2.country_id = cn.country_id;

DELETE FROM countries
RETURNING *; -- 16

