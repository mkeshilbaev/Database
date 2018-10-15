CREATE DATABASE lab44; --1

CREATE TABLE Warehouses(    --2
  code INT PRIMARY KEY ,
  location VARCHAR(255),
  capacity INT
);

CREATE TABLE Boxes(
  code CHAR(4),
  contents VARCHAR(255),
  value REAL,
  warehouse INT REFERENCES Warehouses(code)
);

INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);  --3
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);

 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);

SELECT * FROM Warehouses;    --4

SELECT * FROM Boxes WHERE value > 150;   --5

SELECT DISTINCT ON(contents) * FROM Boxes;       --6

SELECT warehouse, count(*) FROM boxes GROUP BY warehouse;    --7

SELECT warehouse, count(*) FROM boxes GROUP BY warehouse HAVING count(*) > 2;      --8

INSERT INTO Warehouses VALUES (6, 'New York', 3);     --9

INSERT INTO boxes VALUES ('H5RT', 'Paper', 200, 6);    --10

SELECT * FROM boxes;

UPDATE boxes SET value = value*1.15 WHERE code IN (SELECT code FROM boxes    --11
ORDER BY value DESC LIMIT 1 OFFSET 2);

DELETE FROM Boxes WHERE value < 150;           --12

DELETE FROM Boxes WHERE warehouse IN (SELECT code FROM warehouses WHERE location = 'New York')   --13
RETURNING *;



