CREATE DATABASE lab7;

--1
--SELECT * FROM countries WHERE name = ‘string’;
CREATE INDEX index_1 ON countries USING hash(name);

--2
--SELECT * FROM employees WHERE name = ‘string’ AND surname = ‘string’;
CREATE INDEX index_2 ON employees USING hash(name, surname);

--3
--SELECT * FROM employees WHERE salary < value1 AND salary > value2;
CREATE UNIQUE INDEX index_3 ON employees (salary);  --By default it uses btree

--4
--SELECT * FROM employees WHERE substring(name from 1 for 4) = ‘abcd’;
CREATE INDEX index_4 ON employees USING hash(substring(name FROM 1 FOR 4));

--5
/*SELECT * FROM employees e JOIN departments d ON d.department_id = e.department_id
WHERE d.budget > value2 AND e.salary < value2;  */
CREATE INDEX index_5 ON employees (department_id, salary);
CREATE INDEX index_6 ON departments(department_id, budget);