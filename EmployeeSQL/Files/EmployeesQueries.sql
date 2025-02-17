#SQL Queries

#1

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no

#2

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE employees.hire_date BETWEEN '1986-01-01' AND '1986-12-31'

#3

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM ((departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no)
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no)

#4 

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no)
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no)

#5

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%'

#6

SELECT employees.emp_no, employees.last_name, employees.first_name
FROM ((departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no)
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no)
WHERE departments.dept_name = 'Sales'

#7

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no)
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no)
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'

#8

SELECT employees.last_name, COUNT(employees.last_name) AS LastNameCount
FROM employees
GROUP BY employees.last_name
ORDER BY LastNameCount DESC