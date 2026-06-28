CREATE DATABASE trigger_tasks;
USE trigger_tasks;

CREATE TABLE employees(
    emp_id INT PRIMARY KEY ,
    emp_name VARCHAR(50),
    salary INT ,
    department VARCHAR(50)
);


INSERT INTO employees VALUES
(101, 'John', 50000, 'IT') ,
(102, 'Emma', 60000, 'HR') ,
(103 , 'David' , 55000 , 'Sales') ,
(104 , 'Sophia' , 70000,'IT') ;

SELECT * FROM employees ;
-- Practice tasks:

-- Prevent negative salary values.
DELIMITER //

CREATE TRIGGER prevent_negative_salary
BEFORE INSERT
ON employees
FOR EACH ROW
BEGIN
	IF NEW.salary < 0 THEN
    SET NEW.salary = 0 ;
    END IF;
END //
DELIMITER ;

INSERT INTO employees VALUES (105 , 'Neha', -10000 , 'HR');
SELECT * FROM employees; 

-- Store deleted customer records in backup table.
CREATE TABLE customers(
customer_id INT ,
customer_name VARCHAR(50)) ;

drop table custmores;

create table customer_backup(
customer_id INT ,
customer_name VARCHAR(50));

INSERT INTO customers VALUES
(1 , 'Aakanksha') ,
(2 , 'Sonali') ,
(3 , 'Sakshi') ;

DELIMITER //

CREATE TRIGGER customer_backup_trigger
AFTER DELETE
ON customers
FOR EACH ROW 
BEGIN

INSERT INTO customer_backup 
VALUES (
OLD.customer_id ,
OLD.customer_name);

END //
DELIMITER ;

DELETE FROM customers WHERE customer_id = 1;
desc customers;
SELECT * FROM customer_backup;

-- Automatically set joining date on insert.
CREATE TABLE staff(
	id INT , 
    name VARCHAR(50),
    joining_date DATE
);

DELIMITER //
CREATE TRIGGER auto_joinning_date
BEFORE INSERT
ON staff
FOR EACH ROW  

BEGIN

SET NEW.joining_date = CURDATE();
END //

DELIMITER ;

INSERT INTO staff (id , name ) VALUES (1 , 'Neha');
select * from staff;

-- Log every salary update.
CREATE TABLE salary_log(
	emp_id INT PRIMARY KEY ,
    emp_name VARCHAR(50) ,
    OLD_salary INT ,
    NEW_salary INT
    ) ;
    
DELIMITER //


CREATE TRIGGER log_salary
AFTER UPDATE
ON employees
FOR EACH ROW
BEGIN
	INSERT INTO salary_log VALUES (
    OLD.emp_id ,
    OLD.emp_name , 
    OLD.salary ,
    NEW.salary
    );
END //

DELIMITER ;

UPDATE employees 
SET salary = 100000
WHERE emp_id = 101 ;

select * from salary_log;

-- Restrict department changes after insertion.
DELIMITER //

CREATE TRIGGER prevent_depatment_change
BEFORE UPDATE
ON employees
FOR EACH ROW
BEGIN
	IF NEW.department <> OLD.department THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Department change is restricted.'  ;
    
    END IF;

END //
DELIMITER ;

UPDATE employees 
SET department = 'HR'
WHERE emp_id = 101;

-- Count total employees automatically in another table.
CREATE TABLE emp_count(
	total INT
    );
    
INSERT INTO emp_count VALUES(0) ;

DELIMITER //
CREATE TRIGGER employee_counter
AFTER INSERT 
ON employees
FOR EACH ROW

BEGIN
UPDATE emp_count 
SET total = total + 1;
END//
DELIMITER ;

INSERT INTO employees VALUES (106 , 'Sam' , 50000, 'HR') ;
SELECT * FROM emp_count;

-- Prevent duplicate email insertion.
CREATE TABLE users (
id INT ,
email VARCHAR(100));

DELIMITER //

CREATE TRIGGER duplicate_email_check
BEFORE INSERT 
ON users
FOR EACH ROW

BEGIN
IF EXISTS(
SELECT * 
FROM users
WHERE email = new.email)

THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Duplicate email not allowed' ;

END IF;

END //
DELIMITER ;

INSERT INTO users VALUES (1 , 'abc@gmail.com');
INSERT INTO users VALUES (2 , 'abc@gmail.com');


-- Store old salary before update.
CREATE TABLE old_salary(
emp_id INT ,
previous_salary INT
);

DELIMITER //
CREATE TRIGGER store_old_salary
BEFORE UPDATE
ON employees
FOR EACH ROW

BEGIN
INSERT INTO old_salary 
VALUES(
OLD.emp_id ,
OLD.salary
);
END//
DELIMITER ;

UPDATE employees 
SET salary = 90000
WHERE emp_id = 102 ;

select * from old_salary;

-- Create student attendance logs.
CREATE TABLE attendace (
student_id INT ,
status VARCHAR(20)
);

CREATE TABLE attendance_log(
message VARCHAR(100)
);

DELIMITER //
CREATE TRIGGER attendance_trigger
AFTER INSERT
ON attendace
FOR EACH ROW 
BEGIN

INSERT INTO attendance_log
VALUES(
CONCAT(
'Student ' ,
NEW.student_id ,
' marked', 
NEW.status)
);
END// 
DELIMETER ;
--  Create product stock update trigger.
CREATE TABLE products (
product_id INT , 
product_name VARCHAR(50), 
stock INT);


CREATE TABLE orders(
order_id INT ,
product_id INT ,
quantity INT
);

DELIMITER //
CREATE TRIGGER stock_update
AFTER INSERT
ON orders 
FOR EACH ROW
BEGIN

UPDATE products
SET stock = stock - NEW.quantity
WHERE product_id = NEW.product_id;

END //
DELIMITER ;

INSERT INTO orders VALUES (1 , 1, 5);
SELECT * FROM orders;