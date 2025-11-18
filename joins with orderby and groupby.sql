create database joins;
use joins;

create table customers(
     customer_id INT PRIMARY KEY,
	 customer_name varchar(50),
     city varchar(50));

create table orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    product varchar(50),
    amount decimal(10,2)
);

insert into customers values
(1,'Amit','Mumbai'),
(2,'Priya','Pune'),
(3,'Rahul','Delhi'),
(4,'Sneha','Mumbai');

insert into orders values
(101,1,'Laptop',55000),
(102,1,'Mouse',500),
(103,2,'Keyboard',800),
(104,3,'Monitor',9000);

-- INNER JOIN:
-- returns only matching rows betweeen tables:

select c.customer_name , o.product, o.amount
from customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- LEFT JOIN
-- Returns all  customers- even those with no orders.

select c.customer_name, o.product, o.amount
from customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- RIGHT JOIN
-- Returns all the orders-even if customer is missing(rare but possible)

select c.customer_name, o.product, o.amount
from customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- cross join:
--  Every customer x Every Order(cartesian Product)

SELECT c.customer_name , o.product
from customers c
CROSS JOIN orders o;

-- SELF JOIN:

-- use when compairing rows within the same table.
-- Example: List customers from the same city

select a.customer_name as person1,
       b.customer_name as person2,
       a.city
from customers a
join customers b
ON a.city = b.city
AND a.customer_id<> b.customer_id;

-- Practice Questions:
create table Hospital_Records(
patient_id INT,
patient_name VARCHAR(50),
department varchar(50),
doctor varchar(50),
bill_amount INT,
city varchar(50),
visit_date DATE);

INSERT INTO Hospital_Records VALUES
(1, 'Rahul',     'Cardiology',   'Dr. Sharma', 12000, 'Mumbai', '2025-01-02'),
(2, 'Sneha',     'Orthopedics',  'Dr. Mehta',  8000,  'Pune',   '2025-01-05'),
(3, 'Amit',      'Neurology',    'Dr. Rao',    15000, 'Delhi',  '2025-02-12'),
(4, 'Riya',      'Cardiology',   'Dr. Sharma', 18000, 'Mumbai', '2025-03-10'),
(5, 'Arjun',     'Orthopedics',  'Dr. Mehta',  6000,  'Pune',   '2025-01-18'),
(6, 'Priya',     'Dermatology',  'Dr. Kapoor', 4000,  'Delhi',  '2025-02-22'),
(7, 'Kunal',     'Neurology',    'Dr. Rao',    22000, 'Mumbai', '2025-03-01'),
(8, 'Anita',     'Cardiology',   'Dr. Sharma', 10000, 'Pune',   '2025-01-27'),
(9, 'Vikas',     'Dermatology',  'Dr. Kapoor', 5000,  'Delhi',  '2025-02-11'),
(10,'Mira',      'Neurology',    'Dr. Rao',    17000, 'Pune',   '2025-03-04');

-- ORDER BY Questions

-- Display all hospital records sorted by bill_amount in ascending order.
   select * from Hospital_Records ORDER BY bill_amount ASC;
   
-- Show patient names and departments sorted by department alphabetically.
select patient_name, department from Hospital_Records ORDER BY patient_name;

-- List records sorted by visit_date (latest first).
select * from Hospital_Records Order BY visit_date asc;

-- Show all patients sorted by city ASC, and within city by bill_amount DESC.
select * from Hospital_Records ORDER BY city asc , bill_amount desc;

-- Display doctor-wise records sorted by doctor name.
select * from Hospital_records Order by doctor asc;

-- Show patients sorted by bill_amount DESC, and if equal, sort by patient_name ASC.
select * from Hospital_Records ORDER BY bill_amount desc , patient_name asc;


-- Sort the entire table first by department, then by visit_date.
select * from Hospital_Records ORDER BY department asc, visit_date asc ;

-- List patients from Mumbai, sorted by bill_amount ASC.
select * from Hospital_Records where city ='Mumbai' ORDER BY bill_amount asc ;

-- Display unique departments sorted alphabetically.
select * from Hospital_Records ORDER BY department asc;


-- Show all patients sorted by bill_amount, placing highest bills at the top.
select * from Hospital_Records order by bill_amount desc;

-- *GROUP BY Questions*
-- Find total bill amount per department.
select department as dept, sum(bill_amount) as Total_bill_amount
from Hospital_Records 
group by department;

-- Count number of patients per doctor.
select doctor, count(*) as total_patient 
from Hospital_Records
group by doctor;

-- Find average bill amount per city.
select city, avg(bill_amount) as avg_bill_amount
from Hospital_Records
group by city;

-- Count how many patients visited each department.
select department, count(*) as patients
from hospital_Records
group by department;

-- Show maximum bill amount per doctor.
select doctor, max(bill_amount) as highest_bill_amount
from Hospital_records
group by doctor;

-- Show minimum bill amount per department.
select department, min(bill_amount) as lowest_bill
from Hospital_Records
group by department;

-- Find total number of patients per city.
select city, count(*) as patients
from Hospital_Records
group by  city;

-- Find total bill amount per doctor.
select doctor,sum(bill_amount) as Total_Billamount
from Hospital_Records
group by doctor;

-- Display number of visits per month (use MONTH(visit_date)).
select count(*) , MONTH(visit_date) as month_number
from Hospital_records
group by month(visit_date);


-- Show average bill amount for each department.
select department, avg(bill_amount) as avg_bill
from Hospital_Records
group by department;


