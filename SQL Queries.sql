create database project;
use project;
select * from urbanmart_transactions;
describe table urbanmart_transactions;
describe urbanmart_transactions;
 -- total records
select count(*) from urbanmart_transactions;

 -- q1. how many customers are in urbanmart
select count(distinct customerid) from urbanmart_transactions;  
 -- data type change
alter table urbanmart_transactions modify column transactiondate date;
 -- start date
select min(transactiondate) as start_date from urbanmart_transactions;
 -- end date
select max(transactiondate) as end_date from urbanmart_transactions;
-- list of product category
select distinct productcategory from urbanmart_transactions;
 -- no of payments by payment method
select paymentmethod,count(*) as no_payments from urbanmart_transactions group by paymentmethod;
 -- no of male and female customers
select customergender,count(distinct customerid) from urbanmart_transactions where customergender="female";
select customergender,count(distinct customerid) from urbanmart_transactions where customergender="male";

 -- product  wise revenue
select productcategory,sum(transactionvalue) as total_salesvalue from urbanmart_transactions group by productcategory order by total_salesvalue desc;
 -- max payment method used
select paymentmethod,sum(transactionvalue) as max_payment_used from urbanmart_transactions group by paymentmethod order by max_payment_used desc;
 -- gender wise product preference
select productcategory,customergender,count(transactionid) from urbanmart_transactions group by productcategory,customergender order by customergender;
 -- region wise revenue
select region,productcategory,sum(transactionvalue) as region_sales from urbanmart_transactions group by region,productcategory order by region_sales desc;
  -- age wise preference
select productcategory,customeragegroup,count(transactionid) as age_preference from urbanmart_transactions group by productcategory,customeragegroup order by age_preference desc;
 -- region wise transaction_count
select region,count(transactionid) region_transaction_count from urbanmart_transactions group by region;
 -- top 10 customers
select customerid,sum(transactionvalue) as top_10_sales,rank() over(order by sum(transactionvalue) desc) as ranks  from urbanmart_transactions group by customerid order by top_10_sales desc limit 10;
 -- percentage of transaction
select productcategory,round(sum(transactionvalue*100.0)/(select sum(transactionvalue) from urbanmart_transactions),2) as percentage_value from urbanmart_transactions group by productcategory order by percentage_value desc;
 -- highest revenue day
select distinct transactiondate,sum(transactionvalue) from urbanmart_transactions group by transactiondate order by sum(transactionvalue) desc limit 1;
 -- monthly sales rank
select monthname(transactiondate) as month, sum(transactionvalue) as sales,rank() over(order by sum(transactionvalue) desc) as ranks from urbanmart_transactions group by month order by ranks;
 -- days of week rank
select dayname(transactiondate) as days_of_week,sum(transactionvalue) as total_sales,rank() over(order by sum(transactionvalue) desc) as ranks from urbanmart_transactions group by days_of_week order by ranks ;
 -- year of sales rank
select year(transactiondate) as year_sales,sum(transactionvalue) as total_sales,rank() over(order by sum(transactionvalue) desc) as ranks from urbanmart_transactions group by year_sales order by year_sales;
 -- quarter sales
select quarter(transactiondate) as year_sales,sum(transactionvalue) as total_sales from urbanmart_transactions group by year_sales order by year_sales;
 -- product revenue rank
select productcategory,sum(transactionvalue) as revenue ,rank() over(order by sum(transactionvalue) desc) as ranks from urbanmart_transactions group by productcategory;
 -- region revenue rank
select region,sum(transactionvalue) as revenue,rank() over(order by sum(transactionvalue) desc) as region_ranks from urbanmart_transactions group by region;
 -- total revenue
select sum(transactionvalue) as total_revenue from urbanmart_transactions;
