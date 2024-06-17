/*DIFFERENT TYPES OF OPERATORS*/

create database sept;
use sept;
CREATE TABLE customers(
customer_id INT PRIMARY KEY,
cust_name VARCHAR(50),
city VARCHAR(50),
grade INT,
salesman_id INT);

INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);
/*SQL query to locate the details of customers with grade values above 100*/
select * FROM customers WHERE grade>100;

/* SQL query to find all the customers in ‘New York’ city who have a grade value above 100*/
SELECT * FROM customers WHERE city= 'NEW YORK' AND grade >100;

/*SQL query to find customers who are from the city of  New York or have a grade of over 100*/
/*SQL Boolean Operator */
SELECT * FROM customers WHERE city = 'NEW YORK' OR grade >100;

/*SQL query to find customers who are either from the city ' New York' or who do not have a grade greater than 100.*/
SELECT * FROM customers WHERE city = 'NEW YORK' OR NOT grade >100;

/*SQL query to identify customers who do not belong to the city of ' New York' or have a grade value that exceeds 100.*/
SELECT * FROM customers WHERE NOT (city = 'NEW YORK' OR grade >100);

/*  SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009*/
SELECT * FROM customers WHERE customer_id IN (3007, 3008, 3009);

/*SQL query to locate all customers with a grade value*/
SELECT * FROM customers WHERE grade IS NOT NULL;
/*OR EQUIVALENT*/
SELECT * FROM customers WHERE NOT grade IS NULL ;

/*SQL query to find all those customers who does not have any grade*/
SELECT * FROM customers WHERE grade IS NULL;

/*SQL query to find the details of the customers whose names end with the letter 'n'*/
SELECT * FROM customers WHERE cust_name LIKE '%n';

/*SQL query to retrieve the details of the customers whose names begins with the letter 'B'.*/
SELECT * FROM customers WHERE cust_name LIKE '%B';


CREATE TABLE orders(
ord_no INT PRIMARY KEY,
purch_amt DECIMAL(10,2),
ord_date DATE,
customer_id INT,
salesman_id INT);
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.40, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.60, '2012-04-25', 3002, NULL);

/*SQL query to find details of all orders excluding those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000*/
SELECT * FROM orders WHERE NOT ((ord_date = '2012-09-10' AND salesman_id > 5005) OR purch_amt > 1000.00);

/*write a SQL query to find the details of the salespeople who come from either ' Paris' or 'Rome'. Return salesman_id, name, city, commission. */
SELECT * FROM salesman WHERE city = 'Paris' OR city='Rome';

/*SQL query to find the details of those salespeople who live in cities other than  Paris and Rome*/
SELECT * FROM salesman WHERE city NOT IN('Paris','Rome');
/* or equivalent*/
SELECT * FROM salesman WHERE NOT city IN('Paris','Rome');




CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);
/*write a SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12*/
SELECT salesman_id, name, city, commission FROM salesman WHERE (commission > 0.10 AND commission < 0.12);

/*write a SQL query to find the details of those salespeople who come from the ' Paris' City or 'Rome' City. Return salesman_id, name, city, commission.*/
/* Wildcard& special operator*/
SELECT * FROM salesman WHERE city='Paris' OR city = 'Rome'

/*SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive)*/

SELECT * FROM salesman WHERE name BETWEEN 'A' AND 'L';

/* SQL query to find the details of all salespeople except those whose names begin with any letter between 'A' and 'M'*/
SELECT * FROM salesman WHERE name NOT BETWEEN 'A' AND 'L';








CREATE TABLE orders1 (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);
INSERT INTO orders1 (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.40, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.60, '2012-04-25', 3002, NULL);

/*SQL query to find details of all orders with a purchase amount less than 200 or exclude orders with an order date greater than or equal to '2012-02-10' and a customer ID less than 3009.*/
SELECT * FROM orders WHERE (purch_amt < 200 OR NOT (ord_date>= '2012-02-10' AND customer_id <3009));

/*SQL query to find all orders that meet the following conditions. Exclude combinations of order date equal to '2012-08-17' or customer ID greater than 3005 and purchase amount less than 1000.*/
SELECT * FROM orders WHERE NOT ((ord_date ='2012-08-17' OR customer_id > 3005) AND purch_amt<1000);

/*SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.*/
SELECT ord_no, purch_amt,(100 * purch_amt) / 6000 AS "Achieved %",(100 * (6000 - purch_amt)/6000) AS "Unachieved %" FROM orders WHERE (100 * purch_amt) / 6000>50;






