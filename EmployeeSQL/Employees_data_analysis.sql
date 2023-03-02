-- 1
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees as e
LEFT JOIN salaries as s
ON e.emp_no=s.emp_no
ORDER BY e.emp_no;

-- 2
SELECT e.first_name, e.last_name, e.hire_date 
FROM employees as e
WHERE EXTRACT(YEAR FROM hire_date) = '1986';



-- 3
-- List the manager of each department along with their department number,
-- department name, employee number, last name, and first name.

SELECT e.emp_title_id,e.emp_no,e.first_name, e.last_name, dm.dept_no
FROM employees as e
JOIN dept_manager as dm
ON e.emp_no=dm.emp_no;

--4
--List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.
--does this make sense?

SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d
JOIN dept_emp as de
on d.dept_no=de.dept_no
JOIN employees as e
ON de.emp_no=e.emp_no;

-- 5
--List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.

SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6
--List each employee in the Sales department, including their employee number, last name, and first name.
HELP!!

SELECT de.dept_no, e.emp_no, e.last_name, e.first_name 
FROM dept_emp as de
JOIN employees as e
ON de.emp_no=e.emp_no
WHERE dept_no ='d007'
;
--7
-- List each employee in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name 
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name,d.dept_name
FROM departments as d
JOIN dept_emp as de
ON d.dept_no=de.dept_no
JOIN employees as e
ON de.emp_no=e.emp_no
WHERE d.dept_name IN ('Sales', 'Development');

--8
-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) as "employees last name" FROM employees
GROUP BY last_name
ORDER BY "employees last name" DESC
;
