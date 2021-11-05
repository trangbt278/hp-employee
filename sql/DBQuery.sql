--1. List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT e.id as "Employee Numner", e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
FROM employees e 
JOIN salaries s ON e.id = s.emp_id
ORDER BY e.id;

--2. List first name, last name, and hire date for employees who were hired in 1986
SELECT e.last_name as "Last Name", e.first_name as "First Name", e.hire_date as "Hire Date"
FROM employees e
WHERE date_part('year', e.hire_date) = 1986
ORDER BY e.id;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
SELECT d.id as "Department Number", d.name as "Department Name", dm.emp_id as "the managers employee number", e.last_name as "Last Name", e.first_name as "First Name"
FROM dept_manager dm
JOIN departments d ON d.id = dm.dept_id
JOIN employees e ON dm.emp_id = e.id
ORDER BY dm.emp_id;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.id as "Employee Numner", e.last_name as "Last Name", e.first_name as "First Name", d.name as "Department Name"
FROM employees e
JOIN dept_emp de ON e.id = de.emp_id
JOIN departments d ON de.dept_id = d.id
ORDER BY e.id;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.id as "Employee Numner", e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Sex"
FROM employees e 
WHERE e.first_name = 'Hercules'
AND e.last_name like 'B%'
ORDER BY e.id;

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.id as "Employee Numner", e.last_name as "Last Name", e.first_name as "First Name", d.name as "Department Name"
FROM employees e
JOIN dept_emp de ON e.id = de.emp_id
JOIN departments d ON de.dept_id = d.id
WHERE d.id = 'd007'
ORDER BY e.id;

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.id as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", a.department1, b.department2
FROM (SELECT de1.emp_id, de1.dept_id, d1.name as department1
		FROM dept_emp de1, departments d1
	  	WHERE de1.dept_id = d1.id
	  	AND de1.dept_id = 'd005') as a
JOIN (SELECT de2.emp_id, de2.dept_id, d2.name as department2
		FROM dept_emp de2, departments d2
	  	WHERE de2.dept_id = d2.id
		AND de2.dept_id = 'd007') as b
ON a.emp_id = b.emp_id
JOIN employees e ON e.id = a.emp_id
JOIN departments d ON d.id = a.dept_id
ORDER BY e.id DESC

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(*) as count_employees_same_last_name
FROM employees
GROUP BY last_name
ORDER BY  count_employees_same_last_name DESC