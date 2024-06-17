CREATE DATABASE COMMANDS;
USE COMMANDS;

/*MySQL query to create a simple table countries including columns country_id, country_name and region_id.*/
CREATE TABLE countries(
    COUNTRY_ID varchar(2),
    COUNTRY_NAME varchar(40),
    REGION_ID decimal(10,0));
DESC countries;

/*MySQL query to create a simple table countries including columns country_id, country_name and region_id which is already exists.*/
CREATE TABLE IF NOT EXISTS countries(
    COUNTRY_ID varchar(2),
    COUNTRY_NAME varchar(40),
    REGION_ID decimal(10,0));
    DESC countries;
    
/*MySQL query to create a table countries including columns country_id, country_name and region_id and make sure that the combination of columns country_id and region_id will be unique*/
CREATE TABLE IF NOT EXISTS countries(
COUNTRY_ID varchar(2) NOT NULL UNIQUE DEFAULT '',
 COUNTRY_NAME varchar(40) DEFAULT NULL,
  REGION_ID decimal(10,0) NOT NULL,
   PRIMARY KEY (COUNTRY_ID,REGION_ID)
);

/*MySQL query to create a table countries including columns country_id, country_name and region_id and make sure that the column country_id will be unique and store an auto incremented value.*/
CREATE TABLE IF NOT EXISTS countries(
COUNTRY_ID integer NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL);
DESC countries;

/*MySQL query to create a table named countries including columns country_id, country_name and region_id and make sure that the country_id column will be a key field which will not contain any duplicate data at the time of insertion.*/
CREATE TABLE IF NOT EXISTS countries(
COUNTRY_ID varchar(2) NOT NULL UNIQUE PRIMARY KEY,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL);
DESC countries;

/*MySQL query to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.*/
CREATE TABLE IF NOT EXISTS jobs(
JOB_ID varchar(10) NOT NULL UNIQUE,
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ',
MIN_SALARY decimal(6,0) DEFAULT 8000,
MAX_SALARY decimal(6,0) DEFAULT NULL);
desc countries;

/*MySQL query to create a table named countries including columns country_id,country_name and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.*/
CREATE TABLE IF NOT EXISTS countries(
COUNTRY_ID varchar(2) NOT NULL,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL,
UNIQUE(COUNTRY_ID));

/* MySQL query to create a table named job_histry including columns employee_id, start_date, end_date, job_id and department_id and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.*/
CREATE TABLE IF NOT EXISTS job_history(
EMPLOYEE_ID decimal(6,0) NOT NULL,
START_DATE date NOT NULL,
END_DATE date NOT NULL,
CHECK (END_DATE LIKE '--/--/----'),
JOB_ID varchar(10) NOT NULL,
DEPARTMENT_ID decimal(4,0) NOT NULL);
desc countries;