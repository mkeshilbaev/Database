CREATE DATABASE lab1; --1

CREATE TABLE users( --2
  id SERIAL,
  firstname VARCHAR(50),
  lastname VARCHAR(50)
);

SELECT * FROM users;

ALTER TABLE users --3
    ADD COLUMN isadmin INT;

ALTER TABLE users --4
    ALTER isadmin TYPE BOOL USING CASE WHEN isadmin = 0 THEN FALSE ELSE TRUE END ;

ALTER TABLE users --5
    ALTER COLUMN isadmin SET DEFAULT FALSE ;

SELECT *FROM users;

ALTER TABLE users --6
    ADD CONSTRAINT pc PRIMARY KEY (id);

SELECT *FROM users;

CREATE TABLE tasks( --7
  id SERIAL,
  name VARCHAR(50),
  user_id INTEGER
);

SELECT *FROM tasks;

DROP TABLE tasks; --8

DROP DATABASE lab1; --9