create database BasicSQLqueries2;
use BasicSQLqueries2;
create table employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
department VARCHAR(30),
salary INT,
city VARCHAR(30));

INSERT INTO employees(emp_id,emp_name,department,salary,city) values
(1, 'Rahul Sharma' , 'HR', 40000, 'Pune'),
(2,'Sneha Patil','IT',55000,'Mumabi'),
(3,'Amit Verma','Finance', 60000,'Delhi'),
(4,'Priya Deshmukh','IT',70000,'Pune'),
(5,'Karan Joshi','Sales',30000,'Nagpur'),
(6,'Anjali Mehta','HR',45000,'Mumbai'),
(7,'Ravi Kulkarni','IT',80000,'Pune'),
(8,'Pooja Sawant','Sales',35000,'Delhi');
-- MYSQl Min and max
-- Minimum salary:
select Min(salary) AS lowest_salary From employees;

-- Maximum salary:
select Max(salary) As highst_salary from employees;

-- COUNT, AVG, SUM
-- count employess:
select count(*) as total_employees from employees;

-- average salary:
select avg(salary) as avg_salary from employees;

-- Total salary:
select sum(salary) as total_salary from employees;

-- MySqL LIKE:
-- Name starting with 'P':
select emp_name from employees
where emp_name Like 'P%';

-- Names ending with 'A':
select emp_name from employees where emp_name like '%a';

-- names containing 'an':
select emp_name from employees where emp_name LIKE '%an%';

-- MySQL wildcards:
-- _wildcard -> single character:

-- names where second letter = 'a':

select emp_name from employees where emp_name like '_a%';

-- % wildcard: multiple characters

-- cities containing 'u':
select city from employees where city like '%u%';

-- MySQl IN:
-- employees from Mumbai or Pune:
select emp_name , city from employees where city IN('Mumbai','Pune');

-- Employees in IT or HR:
select emp_name, department from employees 
where department In('IT','HR');

-- MySQL between
-- salary between 30k and 60k:
 select emp_name, salary from employees 
 where salary Between 30000 and 60000;
 
 -- emp_id between 3 and 6:
 select * from employees
 where emp_id between 3 and 6;
 
 -- Mysql Aliases
 -- Rename column:
 select emp_name as Name, salary as Monthly_salary
 from employees;

-- Total salary per department:
select department as dept , sum(salary) as Total_salary
from employees
group by department;
