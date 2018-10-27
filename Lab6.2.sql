--1
CREATE DATABASE lab6joins;

--2
CREATE TABLE locations(
  location_id SERIAL PRIMARY KEY,
  street_address VARCHAR(25),
  postal_code VARCHAR(12),
  city VARCHAR(30),
  state_province VARCHAR(12)
);

CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(50) UNIQUE,
  budget INT,
  location_id INT REFERENCES locations
);

CREATE TABLE employees(
  employee_id SERIAL PRIMARY KEY ,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(20),
  salary INT,
  manager_id INT REFERENCES employees,
  department_id INT REFERENCES departments
);

CREATE TABLE job_grades(
  grade CHAR(1),
  lowest_slary INT,
  highest_salary INT
);

INSERT INTO locations(location_id, street_address, postal_code, city, state_province)
VALUES (DEFAULT , 'Abay', '010200', 'Almaty', 'Almaly'),
       (DEFAULT , 'Tole bi', '010201', 'Astana', 'KWT'),
       (DEFAULT , 'Auezova', '010202', 'Uka', 'Baiterek'),
       (DEFAULT , 'Alfarabi', '010203', 'Karaganda', 'Shakhtinsk');

INSERT INTO departments(department_id, department_name, budget, location_id)
VALUES (DEFAULT , 'IT', 1000, 1),
        (DEFAULT , 'HR', 10500, 2),
        (DEFAULT , 'PR', 10600, 2),
        (DEFAULT , 'ADM', 10080, 4);

INSERT INTO employees(employee_id, first_name, last_name, email, phone_number, salary, manager_id, department_id)
VALUES (DEFAULT , 'Madi', 'Kesh', 'm.keshilbaev@gmail.com', 87072293775, 15000, DEFAULT, 1),
       (DEFAULT , 'Daur', 'Yerb', 'yerb@gmail.com', 87072293700, 20000, DEFAULT, 1),
       (DEFAULT , 'Aibek', 'Abd', 'abkabd@gmail.com', 87072293701, 30000, DEFAULT, 2),
      (DEFAULT , 'Islom', 'Abduk', 'isekegmail.com', 87072293702, 15000, DEFAULT, 3);

INSERT INTO employees(employee_id, first_name, last_name, email, phone_number, salary, manager_id, department_id)
VALUES (DEFAULT , 'Madi', 'Kesh', 'm.keshilbaev@gmail.com', 87072293775, 15000, 2, 1),
       (DEFAULT , 'Daur', 'Yerb', 'yerb@gmail.com', 87072293700, 20000, 3, 1);


INSERT INTO job_grades(grade, lowest_slary, highest_salary)
VALUES ('C', 11000, 16000),
        ('B', 16500, 22000),
               ('A', 23000, 31000);

--3
SELECT first_name, last_name, department_id, city, state_province
FROM employees INNER JOIN departments
         using (department_id) inner join locations using (location_id) where last_name like '%b%';

--4
SELECT department_name, city, state_province
FROM departments as d LEFT JOIN locations as l ON l.location_id = d.location_id;

--5
SELECT e1.first_name FROM employees e1 right join employees e2 on e1.employee_id = e2.manager_id;

--6
select grade, avg(salary) from employees e inner join job_grades j on (e.salary between j.lowest_slary and j.highest_salary) group by grade;

--7
SELECT first_name, last_name, d.department_id
FROM employees e INNER JOIN departments d
         ON e.department_id = d.department_id INNER JOIN locations l on d.location_id = l.location_id WHERE city = 'Almaty';
