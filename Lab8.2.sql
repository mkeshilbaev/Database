--1
CREATE DATABASE lab8;
INSERT INTO salesman(salesman_id, name, city, comission)
VALUES (5001, 'James Hoog', 'New York', 0.15),
       (5002, 'Nail Knite', 'Paris', 0.13),
       (5003, 'Pit Alex', 'London', 0.11),
       (5004, 'Mc Lyon', 'Paris', 0.14),
       (5005, 'Lauson Hen', '', 0.12);

INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id)
VALUES (3002, 'Nick Romando', 'New York', 100, 5001),
       (3005, 'Graham Zusi', 'California', 200, 5002),
       (3001, 'Brad Guzan', 'London', 300, 5005),
       (3004, 'Fabian Johns', 'Paris', 200, 5003),
       (3007, 'Brad Davis', 'New York', 100, 5004);

INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES (70001, 150.5, '2012-10-05', 3005, 5002),
        (70009, 270.65, '2012-09-10', 3001, 5001),
        (70002, 65.26, '2012-10-05', 3003, 5004),
        (70004, 110.5, '2012-08-17', 3004, 5005),
        (70007, 948.5, '2012-09-10', 3002, 5003);

--2
CREATE TABLE salesman(
  salesman_id INT PRIMARY KEY ,
  name VARCHAR(50),
  city VARCHAR(20),
  comission NUMERIC(3, 2)
);

CREATE TABLE customers(
  customer_id INT PRIMARY KEY ,
  cust_name VARCHAR(50),
  city VARCHAR(20),
  grade INT,
  salesman_id INT REFERENCES salesman
);

CREATE TABLE orders(
  ord_no INT PRIMARY KEY ,
  purch_amt REAL,
  ord_date DATE,
  customer_id INT REFERENCES customers,
  salesman_id INT REFERENCES salesman
);
--3
CREATE ROLE junior_dev LOGIN PASSWORD 'oskemen7232';

--4
 CREATE VIEW salesman_view AS SELECT name, avg(purch_amt), COUNT(purch_amt)
    FROM salesman, orders WHERE orders.salesman_id = salesman.salesman_id GROUP BY name;

--5
CREATE VIEW num_of_ord AS SELECT city, COUNT (DISTINCT salesman_id) FROM customers GROUP BY city;
SELECT *FROM num_of_ord;
GRANT ALL PRIVILEGES ON num_of_ord TO junior_dev;

--6
CREATE VIEW cust_with_lowest_grade AS SELECT * FROM customers ORDER BY grade ASC LIMIT 1 OFFSET 0;
GRANT SELECT ON cust_with_lowest_grade TO junior_dev;
SELECT * from cust_with_lowest_grade;

--7
CREATE VIEW num_salesman AS SELECT grade, COUNT(salesman_id) FROM customers GROUP BY grade;
SELECT *FROM num_salesman;

--8
CREATE VIEW num_salesman_withMoreThan1Order AS SELECT s.name, count(*) FROM salesman AS s INNER JOIN customers AS c USING (salesman_id)
                                               GROUP BY salesman_id HAVING count(*) > 1;
SELECT *FROM num_salesman_withMoreThan1Order;

--9
CREATE ROLE intern;
REASSIGN OWNED BY junior_dev TO intern;
DROP OWNED BY junior_dev;
DROP ROLE junior_dev;