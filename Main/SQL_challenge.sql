-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no
,e.last_name
,e.first_name
,e.sex
,s.salary
FROM public."Employee"  as e
left join public."Salary" as s on e.emp_no = s.emp_no
limit 10;
--first name, last name, and hire date for the employees who were hired in 1986.
SELECT
e.first_name
,e.last_name
,e.hire_date 
FROM public."Employee"  as e
where date_part('year', e.hire_date) = 1986;
-- manager of each department, department number, department name, employee number, last name, and first name.
SELECT 
dm.dept_no
,d.dept_name
,dm.emp_no
,e.last_name
,e.first_name
FROM public."Dept_managers" dm
join public."Department"  as d on dm.dept_no = d.dept_no
join public."Employee"  as e on dm.emp_no = e.emp_no ;


--Department number for each employee along with that employee’s employee number, last name, first name, and department name.
 
 SELECT 
 de.dept_no
 ,e.emp_no
 ,e.last_name
 ,e.first_name
 ,d.dept_name
 
 FROM
public."Employee"  as e  
left join public."Department_employee" as de  on de.emp_no = e.emp_no
left join public."Department" as d  on d.dept_no =de.dept_no ;

-- first name, last name, and sex of each employee whose first name is Hercules and has surname beginning with the letter B.
SELECT
e.first_name
,e.last_name
,e.sex
from public."Employee" as e
Where e.first_name = 'Hercules' and e.last_name like 'B%' ;
-- employee in the Sales department, including their employee number, last name, and first name.
SELECT 
 e.emp_no
 ,e.last_name
 ,e.first_name
 FROM
public."Employee"  as e  
left join public."Department_employee" as de  on de.emp_no = e.emp_no
left join public."Department" as d  on d.dept_no =de.dept_no 
where d.dept_name = 'Sales';

--employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
 e.emp_no
 ,e.last_name
 ,e.first_name
 ,d.dept_name
 FROM
public."Employee"  as e  
left join public."Department_employee" as de  on de.emp_no = e.emp_no
left join public."Department" as d  on d.dept_no =de.dept_no 
where d.dept_name in ( 'Sales' , 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT 
count(1) as frequency
,e.last_name
from public."Employee"  as e  
group by e.last_name
order by 1 desc
