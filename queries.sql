use hr;

# 1) From the following table, write a SQL query to find those employees whose salaries are less than 6000. Return full name (first and last name), and salary.
select concat(first_name,' ',last_name)as full_name,salary
from employees
where salary <6000;

# 2) From the following table, write a SQL query to find those employees whose salary is higher than 8000. Return first name, last name and department number and salary.
select first_name,last_name,department_id,salary
from employees
where salary >8000;

# 3) From the following table, write a SQL query to find those employees whose last name is "McEwen." Return first name, last name and department ID.
select first_name,last_name,department_id 
from employees 
where last_name="Mcewen";


# 4) From the following table, write a SQL query to identify employees who do not have a department number. Return employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id and department_id.
select department_id, employee_id, first_name, last_name, email,
phone_number, hire_date, job_id, salary, commission_pct,
manager_id, department_id 
from employees 
where department_id is null;


# 5) From the following table, write a SQL query to find the details of 'Marketing' department. Return all fields.
Select * from departments
where department_name="marketing";

# 6) From the following table, write a SQL query to find those employees whose first name does not contain the letter ‘M’. Sort the result-set in ascending order by department ID. Return full name (first and last name together), hire_date, salary and department_id
select concat(first_name,' ',last_name) as full_name, hire_date, salary, department_id 
from employees 
where first_name not like '%m%' 
order by department_id;

# 7) From the employees table, write a SQL query to retrieve all employees who either :
#earn a salary between 8000 and 12000 (inclusive) and receive a commission (commission_pct is not null),
#or were hired before '2003-06-05' and do not belong to the departments with IDs 40, 120, or 70. Return all fields.
select *from employees
where (salary between 8000 and 12000 and commission_pct is not null)
or (hire_date < '2003-06-05' and department_id not in (40,120,70));

# 8) From the following table, write a SQL query to find those employees who do not earn any commission. Return full name (first and last name), and salary
select concat(first_name,' ',last_name)as full_name,salary
from employees
where commission_pct is null ;

#9)From the following table, write a SQL query to find the employees whose salary is in the range 9000,17000 (Begin and end values are included). Return full name, contact details and salary.
select concat(first_name,' ',last_name)as full_name,salary
from employees
where salary between 9000 and 17000;

#10) From the following table, write a SQL query to find the employees whose first name ends with the letter ‘m’. Return the first and last name, and salary.
select concat(first_name,' ',last_name)as full_name,salary
from employees
where first_name like '%m';

#11)From the following table, write a SQL query to find those employees whose salaries are not between 7000 and 15000 (Begin and end values are included). Sort the result-set in ascending order by the full name (first and last). Return full name and salary
select concat(first_name,' ',last_name)as full_name,salary
from employees
where salary not between 7000 and 15000;

# 12) From the following table, write a SQL query to find those employees who were hired between November 5th, 1993 and July 5th, 1997. Return full name (first and last), job id and hire date
select concat(first_name,' ',last_name) as full_name, job_id, hire_date 
from employees
where hire_date between '1993-11-05' and '1997-07-05';


# 13) From the following table, write a SQL query to find those employees who work either in department 70 or 90. Return full name (first and last name), department id.
select concat(first_name,' ',last_name) as full_name, department_id
from employees
where department_id in (70,90);


# 14) From the following table, write a SQL query to find those employees who work under a manager. Return full name (first and last name), salary, and manager ID.
select concat(first_name,' ',last_name) as full_name, salary, manager_id
from employees
where manager_id is not null;

#15)From the following table, write a SQL query to find the employees who were hired before June 21st, 2002. Return all fields
select * from employees
where hire_date < '2002-06-11';

#16)From the following table, write a SQL query to find the employees whose managers hold the ID 120, 103, or 145. Return first name, last name, email, salary and manager ID.
select first_name, last_name, salary, email, manager_id
from employees
where manager_id in (120,103,145);

#17) From the following table, write a SQL query to find employees whose first names contain the letters D, S, or N. Sort the result-set in descending order by salary. Return all fields.
select * from employees
where first_name like '%D%'
or first_name like '%S%'
or first_name like '%N%'
order by salary desc;

#18)From the following table, write a SQL query to find those employees who earn above 11000 or the seventh character in their phone number is 3. Sort the result-set in descending order by first name. Return full name (first name and last name), hire date, commission percentage, email, and telephone separated by '-', and salary.
select concat(first_name,' ' ,last_name) as full_name,hire_date,commission_pct, salary, concat(email,'-', phone_number)as contact_details 
from employees
where salary> 11000 or phone_number like '______3%'
order by first_name desc;

#19) From the following table, write a SQL query to find those employees whose first name contains a character 's' in the third position. Return first name, last name and department id.
select first_name, last_name,department_id
from employees
where first_name like '__s%';

#20)From the following table, write a SQL query to find those employees work in the departments that are not part of the department 50 or 30 or 80. Return employee_id, first_name,job_id, department_id.
select employee_id, first_name, job_id, department_id
from employees
where department_id  not in (30,50,80);

#21) From the following table, write a SQL query to find the employees whose department numbers are included in 30, 40, or 90. Return employee id, first name, job id, department id
select employee_id, first_name, job_id, department_id
from employees
where department_id in (30,40,90);

#22)From the following table, write a SQL query to find those employees who worked more than two jobs in the past. Return employee id
select employee_id,count(*) as total_count
from job_history
group by employee_id
having total_count>= 2;

#23)From the following table, write a SQL query to count the number of employees, the sum of all salary, and difference between the highest salary and lowest salaries by each job id. Return job_id, count, sum, salary_difference.
select job_id,sum(salary)as sum_of_salary,count(*) as total_count,max(salary)-min(salary)as salary_difference
from employees
group by job_id; 

#24)From the following table, write a SQL query to find each job ids where two or more employees worked for more than 300 days. Return job id.
select employee_id,count(*) as total_count
from job_history
where end_date-start_date >300
group by employee_id
having total_count>= 2;
 
#25)From the following table, write a SQL query to count the number of cities in each country. Return country ID and number of cities.
select country_id, count(city)as number_of_cities
from locations
group by country_id;

#26)From the following table, write a SQL query to count the number of employees worked under each manager. Return manager ID and number of employees.
select manager_id, count(employee_id)as number_of_employees
from employees
where manager_id is not null
group by manager_id;

#27)From the following table, write a SQL query to find all jobs. Sort the result-set in descending order by job title. Return all fields.
select * 
from jobs
order by job_title desc;

#28)From the following table, write a SQL query to find all those employees who are either Sales Representatives or Salesmen. Return first name, last name and hire date.
select first_name, last_name, hire_date
from employees 
where job_id in ('SA_REP','SA_MEN');

#29)From the following table, write a SQL query to calculate the average salary of employees who receive a commission percentage for each department. Return department id, average salary.
select department_id, avg(salary)as average_salary
from employees
where commission_pct is not null
group by department_id;

#31)From the following table, write a SQL query to find the departments where more than ten employees receive commissions. Return department id
select department_id
from employees
where commission_pct is not null
group by department_id
having count(*) > 10; 
use hr;
#33) From the following table, write a SQL query to find those employees who do not have commission percentage and have salaries between 7000, 12000 (Begin and end values are included.) and who are employed in the department number 50. Return all the fields of employees.
select * 
from employees
where commission_pct is null
and salary between 7000 and 12000
and department_id=50;

#34) From the following table, write a SQL query to compute the average salary of each job ID. Exclude those records where average salary is on or lower than 8000. Return job ID, average salary.
select job_id, avg(salary)
from employees
group by job_id
having avg(salary) >8000;

#35)From the following table, write a SQL query to find those job titles where maximum salary falls between 12000 and 18000 (Begin and end values are included.). Return job_title, max_salary-min_salary
select job_id, max_salary-min_salary as salary_diff
from jobs
where max_salary between 12000 and 18000;

#36)From the following table, write a SQL query to find the employees whose first or last name begins with 'D'. Return first name, last name.
select first_name, last_name
from employees
where first_name like 'D%'
or last_name like 'D%';

#37)From the following table, write a SQL query to find details of those jobs where the minimum salary exceeds 9000. Return all the fields of jobs.
select *
from jobs 
where min_salary >9000;

#38) From the following table, write a SQL query to find those employees who joined after 7th September 1987. Return all the fields.
select * 
from employees
where hire_date  > '1987-09-07';

# subquery
#1)Write a query to display the name ( first name and last name ) for those employees who gets more salary than the employee whose ID is 103
select concat(first_name,' ',last_name)as full_name 
from employees
where salary>(select salary from employees where employee_id=103);

#Write a query to display the name ( first name and last name ), salary, department id, job id for those employees who works in the same designation as the employee works whose id is 169. 
select concat(first_name,' ',last_name)as full_name,department_id,job_id 
from employees
where job_id =(select job_id from employees where employee_id=169);

#Write a query to display the employee name ( first name and last name ), employee id and salary of all employees who report to Payam
select concat(first_name,' ',last_name)as full_name,employee_id,salary 
from employees
where manager_id=(select employee_id from employees where first_name="Payam");

#. Write a query to display all the information of the employees who does not work in those departments where some employees works whose manager id within the range 100 and 200.  
 select * 
 from employees
 where department_id not in (select department_id from employees where manager_id between 100 and 200);
 
 #Write a query to display the employee number and name( first name and last name ) for all employees who work in a department with any employee whose name contains a T.  
 select concat(first_name,' ',last_name)as full_name,employee_id
from employees
where department_id in (select department_id from employees where first_name like '%T%' or last_name like '%T%');

#Write a query to display the name ( first name and last name ), salary, department id for those employees who earn such amount of salary which is the smallest salary of any of the departments.
 select concat(first_name,' ',last_name)as full_name,department_id,salary
from employees
where salary in (select min(salary) from employees group by department_id);


#Write a query to display all the information of the employees whose salary is within the range of smallest salary and 2500
select * 
from employees
where salary between(SELECT MIN(salary) FROM employees) AND 2500;

#-- Write a query to display the employee name
#-- ( first name and last name ) and hiredate for all
#- employees in the same department as Clara. Exclude Clara
select concat(first_name,' ',last_name)as full_name, hire_date
from employees 
where first_name not like 'Clara' and (select department_id from employees where First_name='Clara');

#Write a query to display the employee number,
#name( first name and last name ), and salary for all
#employees who earn more than the average salary and
#who work in a department with any employee with a J in their name.

SELECT employee_id,  concat(first_name,' ',last_name) as full_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
AND department_id IN (SELECT department_id FROM employees WHERE first_name LIKE '%J%' OR last_name LIKE '%J%');

 #Write a query to display the employee number,
#name( first name and last name ) and job_ID
#for all employees whose salary is smaller than
#any salary of those employees whose job_ID is MK_MAN.
SELECT employee_id, concat(first_name, ' ', last_name) as Full_Name, job_id
FROM employees
WHERE salary < ANY ( SELECT salary FROM employees WHERE job_id = 'MK_MAN');

#Write a query to display the employee number,
#name( first name and last name ) and job ID
#for all employees whose salary is smaller than any salary
#of those employees whose job ID is MK_MAN. Exclude Job ID MK_MAN.
SELECT employee_id, concat(first_name, ' ', last_name) as Full_Name, job_id
FROM employees
WHERE salary < ANY ( SELECT salary FROM employees WHERE job_id = 'MK_MAN') 
and job_id != 'MK_MAN';

#Write a query to display the employee number,
#name( first name and last name ) and job ID
#for all employees whose salary is more
#than any average salary of any department.
SELECT employee_id, concat(first_name, ' ', last_name) as Full_Name, job_id
FROM employees
WHERE salary > any (select avg(salary) from employees group by department_id);

use hr;
#Write a query to display all the information
#for those employees whose id is any id who earn the second highest salary

select * from employees order by salary desc limit 1 offset 1;

select * from employees where salary=
(select max(salary) from employees
where salary<(select max(Salary) from employees));

-- From the following tables, write a SQL query to
-- find the first name, last name, department number,
-- and department name for each employee.

select e.first_name,e.last_name ,e.department_id,
d.department_name
from employees e join departments d using (department_id);

#write a sql to find the average salary of each department.
#return department_name and average salary.
select d.department_name ,avg(e.salary) as average_Salary
from employees e join departments d using (department_id)
group by d.department_name;

-- From the following tables, write a SQL query to find all
-- those employees who work in department ID 80 or 40.
-- Return first name, last name,
-- department number and department name
select e.first_name,e.last_name,d.department_name,d.department_name
 from employees as e
 join departments as d using  (department_id)
 where department_id in (80,40);
 
 -- From the following tables, write a SQL query to find those
-- employees whose first name contains the letter ‘z’.
-- Return first name, last name, department, city, and  state province
select e.first_name,e.last_name,d.department_name,l.state_province
from employees as e
join departments as d using (department_id)
join locations as l using (location_id)
where first_name like '%z%';

# From the following tables, write a SQL query to display the
-- department name, city, and state province for each department.
select d.department_name,l.city,l.state_province
from departments as d
join locations as l using (location_id);

-- . From the following tables, write a SQL query to
-- find all employees who joined on or after 1st January 1993
-- and on or before 31 August 1997. Return job title,
-- department name, employee name, and joining date of the job
select j.job_title,d.department_name,concat(e.first_name,' ',e.last_name)
as employee_name , jh.start_date from jobs j join job_history
jh using (job_id) join departments d using (department_id)
join employees e using (employee_id)
where start_Date between '1993-01-01' and '1997-08-31';
 
 use hr;
 
 -- From the following tables, write a SQL query to calculate the difference  between the maximum salary of the job and
-- the employee's salary. Return job title, employee name, and salary difference.
select j.job_title,concat(e.first_name,' ',e.last_name) as employee_name ,j.max_salary- e.salary as salary_difference
from employees as e 
join jobs as j using (job_id);

-- From the following table, write a SQL query to calculate  the average salary, the number of employees receiving
-- commissions in that department. Return department name, average salary and number of employees.
select d.department_name,avg(salary)as avg_salary,count(employee_id) as number_of_employees
from employees as e
join departments as d using(department_id)
where e.commission_pct is not null
group by department_name;

-- From the following table, write a SQL query to find the name of the country, city, and departments, which are running there
SELECT C.COUNTRY_NAME, L.CITY, D.DEPARTMENT_NAME
FROM DEPARTMENTS D 
JOIN LOCATIONS L USING (LOCATION_ID)
JOIN COUNTRIES C USING (COUNTRY_ID);

-- From the following table, write a SQL query to find the  employees who earn less than the employee of ID 182.
-- Return first name, last name and salary.
SELECT E.FIRST_NAME, E.LAST_NAME, E.SALARY
FROM EMPLOYEES E JOIN EMPLOYEES M
ON E.SALARY < M.SALARY WHERE M.EMPLOYEE_ID = 182;

-- From the following tables, write a SQL query to find the employees who work in the same department as the employee
-- with the last name Taylor. Return first name, last name and department ID
SELECT E.FIRST_NAME, E.LAST_NAME, E.DEPARTMENT_ID
FROM EMPLOYEES E JOIN EMPLOYEES M
ON E.SALARY = M.SALARY WHERE E.LAST_NAME = "Taylor";

#write a sql query to find the employee and their manager_name
select e.first_name as employee_name,
m.first_name as manager_name
from employees e join employees m
on e.manager_id = m.employee_id;

#Write a sql query to find the employees who are working in the same department where clara works
SELECT E.FIRST_NAME, E.salary, E.DEPARTMENT_ID
FROM EMPLOYEES E JOIN EMPLOYEES M
ON E.department_id = M.department_id WHERE m.first_NAME ="clara";

use hr;
#From the following tables, write a SQL query to find all departments,
#including those without employees. Return first name, last name, department ID,department name.
select e.first_name,e.last_name,d.department_id,d.department_name
from employees as e
right join departments as d using(department_id);


-- From the following tables, write a SQL query to find out which employees have or do not have a department. 
-- Return first name, last name, department ID, department name.
select e.first_name,e.last_name,e.department_id,d.department_name
from employees as e
left join departments as d using(department_id);

-- From the following tables, write a SQL query to find the department name, department ID, and number of employees in each department.
select d.department_name,d.department_id,count(e.employee_id)as number_of_employees
from employees as e
join departments as d using (department_id)
group by d.department_id;

-- From the following tables, write a SQL query to find out the full name
-- (first and last name) of the employee with an ID and the name of the  country where he/she is currently employed
select e.employee_id,concat(e.first_name,' ',e.last_name) as employee_name,c.country_name
from employees as e
join departments as d using (department_id)
join locations as l using(location_id)
join countries as c using (country_id);

use hr;
/*Q1.Find each employee's salary and rank them within their department */

select department_id, first_name , last_name, salary, rank() over
(partition by department_id order by salary desc ) as salary_rank
from employees;

#Q2. show each employees salary and the average salary of their department

select first_name , last_name, department_id , salary , avg(salary) over
(partition by department_id) as avg_dept_salary from employees;


use hr;
#Q3.show employees with their cumulative salary within their department .
select department_id , first_name, last_name, salary, sum(salary) over
(partition by department_id order by salary desc ) as cummulative_salary
from employees;


# Q4. FIND THE TOP 3 HIGHEST-PAID EMPLOYEES IN EACH DEPARTMENT.
SELECT * FROM (SELECT DEPARTMENT_ID, FIRST_NAME, LAST_NAME, SALARY, DENSE_RANK()over
(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) AS RNK FROM EMPLOYEES)
RANKED WHERE RNK <= 3;

# Q5. SHOW EACH EMPLOYEE'S SALARY DIFFERENCE FROM THE DEPARTMENT'S HIGHEST
SELECT DEPARTMENT_ID, FIRST_NAME, LAST_NAME, SALARY, MAX(SALARY) OVER
(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) -
SALARY AS DIFF_FROM_MAX FROM EMPLOYEES;

/*Q6.find employees whose salary is above the average salary of their department*/
select * from (select first_name, last_name, department_id, salary, avg(salary)over
(partition by department_id) as dept_avg_salary from employees)
sub where salary > dept_avg_salary;

/*Q7.find the average year-wise hiring trend and comulative hiring count */

select year(hire_date) as hire_year , count(*) as hire_as_year ,
sum(count(*)) over
(order by year(hire_date)) as comulative_hires from employees
group by year(hire_date)
order by hire_year;
use hr;

-- write a sql query to fetch the employee details who earn more than their department's average salary by using cte
WITH avg_salary_per_dept AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT e.first_name, e.salary, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN avg_salary_per_dept avg ON e.department_id = avg.department_id
WHERE e.salary > avg.avg_salary
ORDER BY e.salary DESC;

WITH total_salary_per_dept AS (
    -- Calculate total salary per department
    SELECT department_id, SUM(salary) AS total_salary
    FROM employees
    GROUP BY department_id
),
average_salary_per_dept AS (
    -- Calculate average salary per department
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
),
employees_above_avg_salary AS (
    -- Select employees who earn more than the average salary of their department
    SELECT e.employee_id, e.first_name, e.last_name, e.salary, e.department_id
    FROM employees e
    JOIN average_salary_per_dept a ON e.department_id = a.department_id
    WHERE e.salary > a.avg_salary
)
-- Main query: Join the CTEs to retrieve the final result
SELECT e.first_name, e.last_name, e.salary, d.department_name, t.total_salary, a.avg_salary
FROM employees_above_avg_salary e
JOIN departments d ON e.department_id = d.department_id
JOIN total_salary_per_dept t ON e.department_id = t.department_id
JOIN average_salary_per_dept a ON e.department_id = a.department_id
ORDER BY e.salary DESC;

-- highest salary per job
WITH highest_salary_per_job AS (
    SELECT job_id, MAX(salary) AS highest_salary
    FROM employees
    GROUP BY job_id
)
SELECT * FROM highest_salary_per_job;


WITH same_department_employees AS (
    SELECT department_id
    FROM employees
    WHERE employee_id = 100
)
SELECT e.first_name, e.last_name, e.department_id
FROM employees e
JOIN same_department_employees sde ON e.department_id = sde.department_id;