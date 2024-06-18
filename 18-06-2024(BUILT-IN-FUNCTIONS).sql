CREATE DATABASE ordered;

use ordered;


CREATE TABLE orders (
    ORD_NUM INT PRIMARY KEY,
    ORD_AMOUNT DECIMAL(10, 2),
    ADVANCE_AMOUNT DECIMAL(10, 2),
    ORD_DATE DATE,
    CUST_CODE VARCHAR(20),
    AGENT_CODE VARCHAR(20),
    ORD_DESCRIPTION VARCHAR(100)
);


INSERT INTO orders (ORD_NUM, ORD_AMOUNT, ADVANCE_AMOUNT, ORD_DATE, CUST_CODE, AGENT_CODE, ORD_DESCRIPTION) VALUES
(200114, 3500, 2000, '2008-08-15', 'C00002', 'A008', ''),
(200122, 2500, 400, '2008-09-16', 'C00003', 'A004', ''),
(200118, 500, 100, '2008-07-20', 'C00023', 'A006', ''),
(200119, 4000, 700, '2008-09-16', 'C00007', 'A010', ''),
(200121, 1500, 600, '2008-09-23', 'C00008', 'A004', ''),
(200130, 2500, 400, '2008-07-30', 'C00025', 'A011', ''),
(200134, 4200, 1800, '2008-09-25', 'C00004', 'A005', ''),
(200108, 4000, 600, '2008-02-15', 'C00008', 'A004', ''),
(200103, 1500, 700, '2008-05-15', 'C00021', 'A005', ''),
(200105, 2500, 500, '2008-07-18', 'C00025', 'A011', ''),
(200109, 3500, 800, '2008-07-30', 'C00011', 'A010', ''),
(200101, 3000, 1000, '2008-07-15', 'C00001', 'A008', ''),
(200111, 1000, 300, '2008-07-10', 'C00020', 'A008', ''),
(200104, 1500, 500, '2008-03-13', 'C00006', 'A004', ''),
(200106, 2500, 700, '2008-04-20', 'C00005', 'A002', ''),
(200125, 2000, 600, '2008-10-10', 'C00018', 'A005', ''),
(200117, 800, 200, '2008-10-20', 'C00014', 'A001', ''),
(200123, 500, 100, '2008-09-16', 'C00022', 'A002', ''),
(200120, 500, 100, '2008-07-20', 'C00009', 'A002', ''),
(200116, 500, 100, '2008-07-13', 'C00010', 'A009', ''),
(200124, 500, 100, '2008-06-20', 'C00017', 'A007', ''),
(200126, 500, 100, '2008-06-24', 'C00022', 'A002', ''),
(200129, 2500, 500, '2008-07-20', 'C00024', 'A006', ''),
(200127, 2500, 400, '2008-07-20', 'C00015', 'A003', ''),
(200128, 3500, 1500, '2008-07-20', 'C00009', 'A002', ''),
(200135, 2000, 800, '2008-09-16', 'C00007', 'A010', ''),
(200131, 900, 150, '2008-08-26', 'C00012', 'A012', ''),
(200133, 1200, 400, '2008-06-29', 'C00009', 'A002', ''),
(200100, 1000, 600, '2008-01-08', 'C00015', 'A003', ''),
(200110, 3000, 500, '2008-04-15', 'C00019', 'A010', ''),
(200107, 4500, 900, '2008-08-30', 'C00007', 'A010', ''),
(200112, 2000, 400, '2008-05-30', 'C00016', 'A007', ''),
(200113, 4000, 600, '2008-06-10', 'C00022', 'A002', ''),
(200102, 2000, 300, '2008-05-25', 'C00012', 'A012', '');

/* AGGREGATE FUNCTIONS*/
/* number of rows in the 'orders' table*/
SELECT COUNT(*) FROM orders;

/*total SUM of 'advance_amount' of the 'orders' table*/
SELECT SUM(advance_amount) FROM orders;

/*average of 'advance_amount' from the 'orders' table,*/
SELECT AVG(advance_amount) FROM orders;

/*maximum 'ord_amout' from the 'orders' table*/
SELECT MAX(ord_amount) FROM orders;

/*minimum or lowest value of 'ord_amout' from the orders table*/
SELECT MIN(ord_amount) FROM orders;

/* ARITHMETIC FUNCTIONS*/
/*absolute value of the number -17.36 from the DUAL table*/

SELECT ABS(-17.36) FROM dual;

/*the ceiling or nearest rounded up value of 17.36 from the DUAL table*/
SELECT CEIL(-17.36) FROM dual;

/*the rounded down to next integer value of 17.36 from the DUAL table*/
SELECT FLOOR(17.36) FROM dual;

/*the e raised by 2's power from the DUAL table*/
SELECT EXP(2) AS e_to_2s_power FROM dual;

/*To get the natural logarithm of 65 from the DUAL table*/
SELECT LN(65) "natural_log of 65" FROM dual;

/*remainder of a division of 25 by 7 from the DUAL table*/
SELECT MOD(25,7) FROM dual;

/*the power of 2 raised by 3 from the DUAL table,*/
SELECT POWER(2,3) FROM dual;

/*the square root of 36 from the DUAL table*/
SELECT SQRT(36) FROM dual;


/* SQL CHARACTER FUNCTION*/
/*string 'TESTING FOR LOWER FUNCTION' in lower case from the DUAL table*/
SELECT LOWER('TESTING FOR LOWER FUNCTION') AS Testing_lower FROM dual;

/*string the 'testing for upper function' in upper case from the DUAL table*/
SELECT UPPER('testing for upper function') AS Testing_Upper FROM dual;

/*To remove the right most '1' from '1234567896541' from the DUAL table*/
SELECT TRIM(TRAILING '1' FROM 1234567896541) AS TRAILING_TRIM FROM dual;

/*get the string where all occurrences of 'abcdefghijklmnopqrstuvwxyz' will be replaced with corresponding characters in the string 'defghijklmnopqrstuvwxyzabc'*/
SELECT TRANSLATE('this is my string','qwertyuiopasdfghjklzxcvbnmqwe') AS encode_string FROM dual;
SELECT 
    TRANSLATE('this is my string',
              'abcdefghijklmnopqrstuvwxyz', 
              'defghijklmnopqrstuvwxyzabc') 
    AS encode_string 
FROM 
    dual;