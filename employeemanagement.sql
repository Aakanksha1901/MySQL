create database Employee_Management_System;
use Employee_Management_System;

create table employees(
emp_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
phone VARCHAR(15),
hire_date DATE,
dept_id INT,
job_id INT
);
SELECT * FROM employees;

create table departments(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);    -- stores department info
select * from departments;

create table jobs(
job_id INT PRIMARY KEY,
job_title VARCHAR(50),
min_salaray DECIMAL(10,2) ,
max_salary DECIMAL(10,2)
);
SELECT * FROM jobs;

CREATE TABLE salaries(
salary_id INT PRIMARY KEY,
emp_id INT,
salary DECIMAL(10,2),
from_date DATE,
to_date DATE
);
select * from salaries;

CREATE TABLE attendance (
attendance_id INT PRIMARY KEY,
emp_id INT,
date DATE,
status VARCHAR(10)
);
select * from attendance;

CREATE TABLE users(
user_id INT PRIMARY KEY,
emp_id INT,
usename VARCHAR(50),
password VARCHAR(100),
role VARCHAR(20)
);
select * from users;

INSERT INTO departments VALUES
(1, 'IT', 'Pune') ,
(2, 'HR', 'Mumbai') ,
(3,'Finance','Delhi') ,
(4,'Sales','Bangalore') ,
(5,'Marketing','Hyderabad') ,
(6, 'Admin' ,'Pune') ,
(7, 'Support', 'Chennai') ,
(8, 'Operations' , 'Noida') ,
(9, 'R&D', 'Bangalore'),
(10, 'Legal', 'Delhi');

insert into jobs values
(1, 'Software Engineer', 40000, 90000) ,
(2, 'HR Executive', 30000, 60000) ,
(3, 'Accountant',  35000, 70000) ,
(4, 'Sales Executive', 30000, 80000) ,
(5, 'Marketing Manager', 50000, 100000) ,
(6, 'Admin Officer', 28000, 50000) ,
(7, 'Support Enhineer', 32000, 65000) ,
(8, 'Operations Manager', 60000, 120000) ,
(9, 'Research Analyst', 55000, 110000) ,
(10, 'Legal Advisor', 70000, 130000);

insert into employees values
(101 , 'Rahul' , 'Patil' ,'rahul@gmail.com', '9000000001', '2022-01-10', 1, 1) ,
(102, 'Sneha', 'Sharma', 'sneha@gmail.com', '9000000002', '2022-03-15', 2, 2) ,
(103, 'Amit','Verma','amit@gmail.com' , '9000000003' , '2021-07-01',3 ,3) ,
(104, 'Priya', 'Iyer', 'priya@gmail.com', '9000000004', '2023-02-20' , 4, 4 ) ,
(105, 'Kunal', 'Mehta', 'kunal@gmail.com', '9000000005', '2020-11-11',5 ,5) ,
(106, 'Neha', 'Joshi', 'neha@gmail.com', '9000000006', '2022-08-18', 6, 6 ) ,
(107, 'Rohit', 'Singh' , 'rohit@gmial.com', '9000000007', '2021-06-25', 7, 7) ,
(108, 'Anjali', 'Deshmukh', 'anjali@gmail.com', '9000000008', '2023-01-05', 8,8) ,
(109, 'Saurabh', 'Kulkarni', 'saurabh@gmail.com', '9000000009', '2019-09-09' , 9, 9),
(110, 'Pooja', 'Nair', 'pooja@gmail.com', '9000000010','2018-04-30', 10,10);

insert into salaries values
(1, 101, 60000 , '2023-01-01', '2023-12-31'),
(2, 102, 45000 , '2023-01-01', '2023-12-31'),
(3, 103, 55000 , '2023-01-01', '2023-12-31'),
(4, 104, 50000 , '2023-01-01', '2023-12-31'),
(5, 105, 85000 , '2023-01-01', '2023-12-31'),
(6, 106, 40000 , '2023-01-01', '2023-12-31'),
(7, 107, 48000 ,  '2023-01-01', '2023-12-31'),
(8, 108, 90000 , '2023-01-01', '2023-12-31'),
(9, 109, 95000 ,'2023-01-01', '2023-12-31'),
(10,110, 110000, '2023-01-01', '2023-12-31');

insert into attendance values
(1, 101, '2024-01-01', 'Present'),
(2, 102, '2024-01-01', 'Absent'),
(3, 103, '2024-01-01', 'Present'),
(4, 104, '2024-01-01', 'Present'),
(5, 105, '2024-01-01' ,'Present') ,
(6,106, '2024-01-01', 'Absent') ,
(7, 107 , '2024-01-01', 'Present'),
(8, 108, '2024-01-01', 'Present'),
(9 , 109, '2024-01-01', 'Present'),
(10, 110, '2024-01-01', 'Absent');

insert into users values
(1, 101, 'rahul', 'rahul@123', 'Employee'),
(2, 102, 'sneha', 'sneha@123', 'Employee'),
(3, 103, 'amit',  'amit@123',  'Employee'),
(4, 104, 'priya', 'priy@123', 'Employee'),
(5, 105, 'kunal', 'kunal@123','Manager'),
(6, 106, 'neha', 'neha@123','Employee'),
(7,107, 'rohit', 'rohit@123', 'Employee'),
(8, 108, 'anjali', 'anjali@123', 'Manager'),
(9,109, 'saurabh', 'saurabh@123', 'Admin'),
(10,110,'ppoja', 'pooja@123', 'Employee');

-- Display only employee first name and email.
select first_name, email from employees;

-- Show employees working in department ID = 1
select * from employees
 where dept_id = 1;

-- Display employees hired after 2022
select * from employees 
where hire_date > '2022-01-01';

-- Show employees whose job ID is 5
select * from employees 
where job_id = 5;

-- Show all unique department IDs from employees table
select distinct dept_id as departmentIds 
from employees;

-- Show distinct attendance status
select distinct status as AttendanceStatus
 from attendance;

-- List employees ordered by first name (A–Z)
select * from employees 
order by first_name;

--  Display employees ordered by hire date (latest first).
select * from employees 
order by hire_date desc; 

--  Display only first 5 employees
select * from employees limit 5;

-- Show top 3 highest paid employees (using salaries table)
select * from salaries as highest_paid_Employee order by salary desc limit 3;

#rename column using aliases
select
emp_id as Employee_ID,
first_name as Name,
hire_date as Joining_Date
from employees;

#show salary with alias name:
select 
   emp_id as Employee,
   salary as Monthly_salary
from salaries;

-- Show top 5 highest paid employees sorted by salary
select emp_id , salary from salaries
order by salary desc limit 5;

-- Show employees working in department 1 AND job id 1.
select * from employees 
where dept_id = 1 and job_id=1;

-- Show employees from department 1 OR department 2
select * from employees 
where dept_id = 1 or dept_id = 2;

-- Show employees NOT working in department 5
select * from employees
where dept_id != 5;

-- Show employees hired after 2021 AND working in department 3.
select * from employees 
where hire_date > '2021-01-01' and dept_id = 3;

--  Show employees working in departments 1, 3, or 5
select * from employees 
where dept_id in (1, 3, 5);

-- Show employees whose job id is 2, 4, or 6
select * from employees
where job_id in (2, 4, 6);

-- Show attendance records where status is Present or Absent
select * from attendance 
where status = 'Present' or 'Absent';

-- Show employees hired between 2020 and 2022.
select * from employees where hire_date  between '2020-01-01' and '2022-12-31' ;

-- Show employees with salary between 50,000 and 90,000
select * from salaries 
where salary between 50000 and 90000;

-- Show attendance records between two dates.
select * from attendance where date between '2024-01-01' and '2024-01-10';

-- shows employees whose 1st name starts with 'R'
select * from employees where first_name like 'R%';

--  Show employees whose email contains 'gmail'.
select * from employees where email like '%gmail%';

--  Show employees whose name ends with 'a'.
select * from employees where first_name like '%a';

-- Show employees whose phone number is NULL.
select * from employees where phone is not null;

-- Show employees whose email is NOT NULL.
select * from employees where email is not null;

--  Show salary records where to_date is NULL (current salary).
select * from salaries where to_date is null;

-- Show employees in departments 1 or 2 AND hired after 2021
select * from employees where dept_id = 1 or dept_id = 2 and hire_date > '2021-01-01' ;

--  Show employees whose name starts with 'A' AND email is NOT NULL
select * from employees  where first_name like 'A%' and email is not null;

-- Show employees NOT in department 3 and salary above 60,000.
select s.emp_id , s.salary
from salaries s
where s.salary > 60000
and s.emp_id not in(
select emp_id
from employees
where dept_id = 3
);


#add unique constraint to existing table on phone number
alter table employees
add constraint unique_phone unique(phone);

#make employee email unique(no two employees can have same email)
create table employees(
emp_id INT PRIMARY KEY,
first_name VARCHAR(50),
email VARCHAR(100) UNIQUE,
phone VARCHAR(15),
hire_date date
);

#make employee name mandatory
create table employees(
emp_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
email VARCHAR(100)
);

#add NOTNULL constraint to existing column
alter table employees
modify first_name VARCHAR(50) NOT NULL;



#Ensure Salary must be greater than 10,000
create table salaries (
salary_id INT PRIMARY KEY,
emp_id INT,
salary DECIMAL(10,2) CHECK(salary > 10000)
);

#ensure employee age is between 18 and 60
create table employees (
emp_id INT PRIMARY KEY,
first_name VARCHAr(50),
age INT CHECK (age between 18 and 60)
);

#Add check constraint to existing table(attendance status)
alter table attendance
add constraint chk_status
CHECK (status in('Present', 'Absent'));

-- Email must be unique and not null
-- email VARCHAR(100) unique not null

-- Salary must be between 30,000 and 1,50,000
-- salary decimal(10,2)
-- CHECK (salary BETWEEN 30000 AND 150000)

-- phone number must be exactly 10 digits
-- phone VARCHAR(10)
-- check (LENGTH(phone) = 10amazon_electronics)










