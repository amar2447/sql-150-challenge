-- NULL FUNCTIONS
/* FOR REPLACE VALUES
 1) FROM NULL TO ANY VALUE, WE WILL USE ISNULL AND ADVANCE TECHNIQUES LIKE COALESCE
 2)FROM ANY VALUE TO NULL ,WE WILL USE NULLIF FUNCTION
 FOR CHECKING FOR NULL
 1)IS NULL -TRUE
 2)IS NOT NULL -FALSE*/

 -- ISNULL(VALUE,REPLACEMENT_VALUE)
select
customerid,score,
AVG(score)over () avg_score,
avg(coalesce(score,0)) over () avg_score1
from sales.Customers

-- note null+string/integer==null
/* Display the full name of customers in a single field
by merging their first and last names,
and add 10 bonus points to each customer's score*/
select
customerid,
firstname,
lastname,
CONCAT(firstname, ' ',coalesce(lastname,'')) as full_name,
score,
coalesce(score,0) + 10 as updated_score
from sales.Customers

/* use cases in join
note - if any column cointains null value,subjecuent row value will also deleted or you will lose records in output
example-
select
a.year,a.type,a.orders,b.sales
from tablea as a join tableb as b on a.year =b.year 
and ISNULL (a.type,'') = ISNULL (b.type ,'')
*/

--handles null before sorting data
/* sort the customers from asc to desc score with nulls appearing last*/
select
customerid,score,
case when score is null then 1 else 0 end flag
from sales.Customers
order by case when score is null then 1 else 0 end ,Score

--NULLIF(VALUE1,VALUE2)
--IF TWO VALUES ARE EQUAL THE RESULTANT IS NULL,ELSE IT RETURNS VALUE1

 /* USE CASE -PREVENTING ERROR OF DIVIDING BY ZERO*/
 --FIND THE SALES PRICE FOR EACH ORDER BY DIVIDING SALES BY QUANTITY
 select
 orderid,
 sales,quantity,
 sales /nullif(quantity,0) as price
 from sales.Orders

 --check data whether is null or is not null
 select * from sales.Customers where score is null
 select * from sales.Customers where score is not null

 select c.*,o.orderid from sales.Customers as c
 left join sales.Orders o on c.CustomerID=o.CustomerID
 where o.CustomerID is null

  select c.*,o.orderid from sales.Customers as c
 right join sales.Orders o on c.CustomerID=o.CustomerID
 where c.CustomerID is null

 /* blank space - have space for one or two characters
 null -unknown,empty string -string value for zero characters*/
 with orders as (
 select 1 id ,'A' category union
 select 2, null union
 select 3,'' union
 select 4,' ') select *, datalength(category)lenght , datalength(trim(category)) as lenght1,
 nullif (trim(category),'') policy2,
 coalesce( nullif (trim(category),'') ,'unknown') policy3
 from orders

 -- replacing empty string/blanks/null with a default value during data preparation before using it in reporting to improve readbility and reduce confusion


  
