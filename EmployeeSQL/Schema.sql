-- SQL Schema - creating table schema 
-- Perform the following tasks: 
-- 1. Create a table schema for each of the six CSV files. 
-- 2. Specify the data types, primary keys, foreign keys, and other constraints
-- 3. Import each CSV file into its corresponding SQL table 

----------------------------
-- Part 2: Creating table schema    
-- Create Table: Departments   
DROP TABLE if exists departments;

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_no)
);

SELECT * from departments; 
--Rows: 9

-- Create Table: Employees 
DROP TABLE if exists employees;

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL, 
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (emp_no)
);

SELECT * from employees; 
--Rows: 300024

-- Create Table: Department Employees 
DROP TABLE if exists dept_emp;

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

SELECT * from dept_emp;
--Rows: 331603

-- Create Table: Department Manager
DROP TABLE if exists dept_manager;

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

SELECT * from dept_manager;
--Rows: 24

-- Create Table: Salaries
DROP TABLE if exists salaries;

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary VARCHAR NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * from salaries;
--Rows: 300024

-- Create Table: Titles 
DROP TABLE if exists titles;

CREATE TABLE titles (
    title_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (title_id)
);

SELECT * from titles; 
--Rows: 7