CREATE DATABASE lab4;  --1

CREATE TABLE customers(  --2
  customer_id INTEGER, REFERENCES customers,
  cust_name VARCHAR(50),
  city VARCHAR(50),
  grade INTEGER,
  salesman_id INTEGER
  CONSTRAINT p_key PRIMARY KEY (order_id)
);

SELECT * FROM customers WHERE grade > 100 ;  --3

SELECT * FROM customers           --4
WHERE city = 'New York' AND grade > 100;

SELECT * FROM customers            --5
WHERE city = 'New Work' OR grade > 100;

SELECT * FROM customers              --6
WHERE city = 'Paris' OR city ='London';

SELECT * FROM customers    --7
WHERE cust_name LIKE 'B%';

CREATE TABLE orders(         --8
  order_id SERIAL PRIMARY KEY ,
  customers_id INTEGER,
  description text,
  purch_amt INTEGER
);

SELECT * FROM orders        --9
WHERE customers_id IN (SELECT customers_id FROM customers WHERE city='New York');

SELECT * FROM customers   --10
WHERE customer_id = (SELECT customer_id FROM orders GROUP BY customer_id HAVING count(order_id) > 10);

SELECT sum(purch_amt) AS "Total purchase amount"  --11
FROM orders;

SELECT avg(purch_amt) AS "Average purchase amount"   --12
FROM orders;

SELECT * FROM customers    --13
WHERE cust_name NOTNULL ;

SELECT max(purch_amt) AS "Max purchase amount"  --14
FROM orders;

