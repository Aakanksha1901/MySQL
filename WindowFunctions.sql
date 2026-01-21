CREATE DATABASE WINDOWFUNCTION;
USE WINDOWFUNCTION;

CREATE TABLE sales_data(
     sales_id INT,
     salesperson VARCHAR(50),
     region VARCHAR(20),
     sales_amount INT,
     sales_date DATE
);

INSERT INTO sales_data VALUES
(1, 'Amit' , 'North' , 50000 , '2025-01-01'),
(2, 'Neha' , 'North' , 70000 , '2025-01-01'),
(3, 'Ravi' , 'North' , 70000 , '2025-01-03'),
(4, 'Pooja' ,  'South' , 45000 , '2025-01-01'),
(5, 'Karan' , 'South' , 60000 , '2025-01-02'),
(6, 'Meera', 'South' , 60000 , '2025-01-03') ;

select * from sales_data;

-- RANK(Gaps in Ranking)

SELECT 
   salesperson ,
   region ,
   sales_amount ,
   RANK () OVER (
   PARTITION BY region
   ORDER BY sales_amount DESC
   ) AS rank_in_region
FROM sales_data;
-- 

-- DENSE_RANK()-No gaps
SELECT 
    salesperson ,
    region,
    sales_amount,
    DENSE_RANK() OVER(
    PARTITION BY region
    ORDER BY sales_amount DESC
   ) AS dense_rank_in_region
FROM sales_data;