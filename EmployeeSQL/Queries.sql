--Part 3: Data Analysis
--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp_no, last_name, first_name, sex
FROM employees;

SELECT * FROM salaries;

--Join employees and salary tables 
SELECT 
	employees.emp_no,
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM
	employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no ORDER BY emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT * FROM employees; 

-- total: 36232
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01'


--3. List the manager of each department along with:
-- Department number, department name, employee number, last name, and first name.

SELECT * FROM departments; 
SELECT * FROM employees;
SELECT * FROM dept_manager;

-- Rows: 24
SELECT
    dept_manager.dept_no,
    dept_manager.emp_no,
    departments.dept_no,
    departments.dept_name,
    employees.emp_no,
    employees.last_name,
    employees.first_name
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no
ORDER BY departments.dept_name;

--4. List the department number for each employee along with:
-- employee number, last name, first name, and department name. 

SELECT * FROM employees; 
SELECT * FROM dept_emp; 
SELECT * FROM departments;

--331603
SELECT 
	departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_emp
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
ORDER BY departments.dept_name;

--5. List the first name, last name, and sex of each employee whose first name is 'Hercules' and whose last name begins with the letter B.
--Rows: 20

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE '%B%'

--6. List each employee in the Sales Department, including their employee number, last name, and first name. 

--Total: 52245
SELECT 
	departments.dept_name,
	employees.last_name, 
	employees.first_name,
	employees.emp_no
FROM dept_emp
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales'

--7. List each employee in the Sales and Development Departments, including their employee number, last name, first name, and department name. 
SELECT * FROM employees; 
SELECT * FROM departments; 
SELECT * FROM dept_emp;

--137952
SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--8. List the frequency counts, in descending order, or all the employee's last names (that is, how many employees share each last name).
-- Total: 1638
SELECT last_name, COUNT(last_name) as "last_name_freq"
FROM employees
GROUP BY last_name
ORDER BY "last_name_freq" DESC;






