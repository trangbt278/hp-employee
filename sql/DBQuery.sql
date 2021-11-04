--List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT e.id as "Employee Numner", e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
FROM employees e 
JOIN salaries s ON e.id = s.emp_id
ORDER BY e.id;

--List first name, last name, and hire date for employees who were hired in 1986
SELECT e.last_name as "Last Name", e.first_name as "First Name", e.hire_date as "Hire Date"
FROM employees e
WHERE date_part('year', e.hire_date) = 1986
ORDER BY e.id;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
SELECT d.id as "Department Number", d.name as "Department Name", dm.emp_id as "the managers employee number", e.last_name as "Last Name", e.first_name as "First Name"
FROM dept_manager dm
JOIN departments d ON d.id = dm.dept_id
JOIN employees e ON dm.emp_id = e.id
ORDER BY dm.emp_id;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.id as "Employee Numner", e.last_name as "Last Name", e.first_name as "First Name", d.name as "Department Name"
FROM employees e
JOIN dept_emp de ON e.id = de.emp_id
JOIN departments d ON de.dept_id = d.id
ORDER BY e.id;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.id as "Employee Numner", e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Sex"
FROM employees e 
WHERE e.first_name = 'Hercules'
AND e.last_name like 'B%'
ORDER BY e.id;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.id as "Employee Numner", e.last_name as "Last Name", e.first_name as "First Name", d.name as "Department Name"
FROM employees e
JOIN dept_emp de ON e.id = de.emp_id
JOIN departments d ON de.dept_id = d.id
WHERE d.id = 'd007'
ORDER BY e.id;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.id as "Employee Numner", e.last_name as "Last Name", e.first_name as "First Name", d.name as "Department Name"
FROM employees e
JOIN dept_emp de ON e.id = de.emp_id
JOIN departments d ON de.dept_id = d.id
WHERE d.id in ('d007','d005')
ORDER BY e.id;

Select  from departments
