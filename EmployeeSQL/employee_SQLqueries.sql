-- Data Analysis Queries

-- 1 
SELECT employee_num, last_name, first_name, gender FROM employees as e
JOIN salaries as s 
ON s.emp_num=e.employee_num;

-- 2
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-1';

-- 3
SELECT m.dept_no, d.dept_name, m.employee_num, e.first_name, e.last_name
FROM "dept_Managers" as "m"
	JOIN department as d ON 
		m.dept_no=d.dept_no
	JOIN employees as e ON 
		m.employee_num=e.employee_num;

-- 4
SELECT e.employee_num, e.last_name, e.first_name, d.dept_name
FROM employees as e
	JOIN department_employee as de ON
		e.employee_num=de.employee_num
	JOIN department as d ON
		de.dept_no=d.dept_no;

-- 5
SELECT first_name, last_name, gender
FROM employees
WHERE first_name = 'Hercules' AND
last_name LIKE 'B%';

-- 6
SELECT e.employee_num, e.first_name, e.last_name, d.dept_name
FROM employees as e
	JOIN department_employee as de ON
		e.employee_num=de.employee_num
	JOIN department as d ON
		de.dept_no=d.dept_no
WHERE d.dept_no IN ('d007');

-- 7
SELECT e.employee_num, e.first_name, e.last_name, d.dept_name
FROM employees as e
	JOIN department_employee as de ON
		e.employee_num=de.employee_num
	JOIN department as d ON
		de.dept_no=d.dept_no
WHERE d.dept_no IN ('d005','d007');

-- 8
SELECT last_name, 
	COUNT(last_name) AS "Count"
FROM employees 
GROUP BY last_name 
ORDER BY COUNT(last_name) DESC;

-- Epilogue
SELECT * FROM employees
WHERE employee_num = 499942;