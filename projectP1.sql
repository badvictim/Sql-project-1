Create Database sql_project_p1;

use sql_project_p1;

Drop table if exists Retail_sales;
Create Table Retail_sales
(
	Transaction_id Int PRIMARY KEY,
    sale_date DATE,
    sales_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    Catogery VARCHAR (25),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale float
    );
    
    select * from retail_sales;
    
   -- insert into INSERT INTO Retail_sales (Transaction_id, sale_date, sales_time, customer_id, 
  --  gender, age, Category, quantity, price_per_unit, cogs, total_sale) ;
-- VALUES ( ) 

-- DATA CLEANIG 

    select * from retail_sales;
    
    

SELECT COUNT(*) FROM Retail_sales;  



   select * from retail_sales
   where transaction_id is null;

 select * from retail_sales
   where sale_date is null;

 select * from retail_sales
   where transaction_id is null
   or 
   sale_date is null
   or 
   sales_time is null
   or 
   customer_id is null
   or 
   gender is null 
   or 
   age is null
   or 
   catogery is null 
   or 
   quantity is null 
   or 
   price_per_unit is null 
   or 
   cogs is null 
   or 
   total_sale is null ;
   

delete from retail_sales
where transaction_id is null
   or 
   sale_date is null
   or 
   sales_time is null
   or 
   customer_id is null
   or 
   gender is null 
   or 
   age is null
   or 
   catogery is null 
   or 
   quantity is null 
   or 
   price_per_unit is null 
   or 
   cogs is null 
   or 
   total_sale is null ;

SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;

-- Data exploration 

-- How many sales we have

    select * from retail_sales;
    
  
SELECT SUM(total_sale) AS total_sale FROM retail_sales;

-- HOW MANY UINQUE CUSTOMERS WE HAVE?

SELECT COUNT(DISTINCT customer_id) AS unique_customers FROM Retail_sales;

SELECT distinct Catogery from retail_sales;



-- data analysis and business key problems 

-- *Write a SQL query to retrieve all columns for sales made on '2022-11-05**:

Select * from retail_sales
where sale_date = '2022-11-05' ;

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
Select * from retail_sales
where catogery = 'Clothing' 
 and 
 date_format(sale_date, 'YYYY-MM-DD') = '2022-11-05' 
 And 
 quantity  >='1' ;
 
-- Write a SQL query to calculate the total sales (total_sale) for each category.:
SELECT 
     distinct Catogery,
     SUM(total_sale) as net_sale,
     count(*) as total_order
     from retail_sales
     group by 1;

-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:--
Select * from retail_sales;
select 
avg(age)
from retail_sales
where catogery = 'Beauty' ;

-- Write a SQL query to find all transactions where the total_sale is greater than 1000.:

Select 
total_sale from retail_sales 
where total_sale >= '1000' ;

-- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:

Select catogery,
gender, 
count(*) as total_trans 
from retail_sales
group by 
catogery,
gender
order by 1;

-- Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

Select 
year,
month,
avg_sale
 from 
(
Select 
  year(sale_date) as year,
  month(sale_date) as month,
   avg (total_sale) as avg_sale,
	Rank() over(partition by year(sale_date)order by  avg (total_sale) desc) as Best_selling 
     from retail_sales
      group by 1,2
       order by 1, 3 desc) as T1
       where best_selling = 1
;

-- **Write a SQL query to find the top 5 customers based on the highest total sales **:

Select * from retail_sales;

select 
  Customer_id, 
  sum(total_sale) as total_sales 
  from retail_sales
  group by 1
  order by 2 desc 
  limit 5;

-- Write a SQL query to find the number of unique customers who purchased items from each category.:
Select * from retail_sales;

select 
catogery,
count(customer_id) as unique_customers 
from retail_sales
group by catogery ;

-- Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
with hourly_sale
as
(
Select 
case 
when hour(sales_time) < 12 Then ' Morning'
when hour(sales_time) between 12 and 17 then 'Afternoon'
else 'Evening'
end as shift 
from retail_sales
 )
select 
count(*) as total_orders
from hourly_sale
group by shift ;




 
-- END OF PROJECT




















    
