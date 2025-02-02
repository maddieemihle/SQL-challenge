-- Create table: Employees 
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE, 
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR(1) NOT NULL, 
	hire_date DATE NOT NULL, 
	PRIMARY KEY (emp_no, emp_title_id)
);

SELECT * from employees 

-- Create table: Departments   
CREATE TABLE departments (
	"dept_no" VARCHAR NOT NULL,
	"dept_name" VARCHAR(20) NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * from departments 

-- Create table: Department Employees 
CREATE TABLE dept_emp (
	"emp_no" INT NOT NULL,
	"dept_no" VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

SELECT * from dept_emp

-- Create table: Department Manager
CREATE TABLE dept_manager (
	"dept_no" VARCHAR NOT NULL,
	"emp_no" INT NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

SELECT * from dept_manager 

-- Create table: Salaries
CREATE TABLE salaries (
	"emp_no" INT NOT NULL,
	"salary" VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * from salaries 

-- Create table: Titles 
CREATE TABLE titles (
	"title_id" INT NOT NULL,
	"title" VARCHAR NOT NULL,
	PRIMARY KEY (title_id) REFERENCES employees(emp_title_id)
);

SELECT * from titles 