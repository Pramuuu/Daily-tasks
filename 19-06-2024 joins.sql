create database dri;
use dri;

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
/*a  SQL query to find those orders where the order amount exists between 500 and 2000*/
SELECT a.ord_no, a.purch_amt,
b.cust_name, b.city FROM orders a, customers b WHERE a.customer_id = b.customer_id AND a.purch_amt BETWEEN 500 AND 2000;


/*SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.*/
SELECT salesman.name AS "Salesman", customers.cust_name, customers.city FROM salesman, customers WHERE salesman.city = customers.city;

/*a  SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.*/
SELECT a.cust_name AS "Customer Name",a.city,b.name AS "Salesman",b.commission FROM customers a INNER JOIN salesman b ON a.salesman_id = b.salesman_id;

/*a SQL query to find salespeople who received commissions of more than 12 percent from the company*/
SELECT a.cust_name AS "Customer Name", a.city, b.name AS "Salesman", b.commission 
FROM customers a INNER JOIN salesman b ON a.salesman_id = b.salesman_id WHERE b.commission >0.12;

/*SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.  */
SELECT a.cust_name AS "Customer Name",
a.city, b.Name AS "salesman",
b.city, b.commission FROM customers a INNER JOIN salesman b ON a.salesman_id = b.salesman_id WHERE b.commission>0.12
AND a.city <> b.city;


/*a  SQL query to find the details of an order.*/
SELECT a.ord_no, a.ord_date, a.purch_amt,
b.cust_name AS "Customer Name", b.grade,
c.name AS "Salesman", c.commission
FROM orders a
INNER JOIN customers b
ON a.customer_id = b.customer_id
INNER JOIN salesman c
ON a.salesman_id = c.salesman_id;

/*a SQL statement to join the tables salesman, customers and orders so that the same column of each table appears once and only the relational rows are returned. */
SELECT * FROM orders NATURAL JOIN customers NATURAL JOIN salesman;

/*SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.  */
SELECT a.cust_name, a.city, a.grade, b.name AS "Salesman", b.city
FROM customerS a LEFT JOIN salesman b ON a.salesman_id = b.salesman_id
ORDER BY a.customer_id;

/*SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id. */
SELECT a.cust_name, a.city, a.grade,
b.name AS "Salesman", b.city FROM customers a LEFT OUTER JOIN salesman b 
ON a.salesman_id = b.salesman_id
WHERE a.grade <300
ORDER BY a.customer_id;

/* SQL statement to make a  report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.*/
SELECT a.cust_name, a.city, b.ord_no,
b.ord_date, b.purch_amt AS "Order Amount"
FROM customers a LEFT OUTER JOIN orders b
ON a.customer_id = b.customer_id
ORDER BY b.ord_date;

/*SQL statement to generate a  report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.*/
SELECT a.cust_name , a.city b.ord_no,
b.ord_date , b.purch_amt as "Order Amount",
c.name, c.commission
FROM customer a
LEFT OUTER JOIN Ordes b
ON a 