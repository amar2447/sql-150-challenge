--case statement(it is used in data transformation)
--used for categorizing data on certain conditions

/* generate  a report showing the total sales for each category
-HIGH : IF SALES IS HIGHER THAN 50
-MEDIUM: IF SALES BETWEEN 20 AND 50
-LOW:LESS THAN 20
SORT THE RESULTS FROM LOWEST TO HIGHEST*/
select
category,
sum(sales) as total_sales
from(
select
orderid,
sales,
case
    when sales > 50 then 'higher'
    when sales between 20 and 50 then 'medium'
    else 'low' 
end category
from sales.Orders
)t
group by category
order by sum(sales) desc

--case statement rule
--data type of output  in case statement be same data type
--case statement can be used in any query

--used as mapping (transform values from one form to another)
 
 /* retrieve employee details with gender displayed as full text*/
select
employeeid,
firstname,lastname,
gender,
case 
   when gender ='F' then 'FEMALE'
   when gender ='M' then 'MALE'
   else 'NA'
end gender_fullname
from sales.Employees

/* count no. of males and females*/
select
count(gender) as candidates,
gender_fullname
from(
select
employeeid,
firstname,lastname,
gender,
case 
   when gender ='F' then 'FEMALE'
   when gender ='M' then 'MALE'
   else 'NA'
end gender_fullname
from sales.Employees
)t
group by gender_fullname

/* retrieve customer details with abbreviated country code*/
select
customerid,
firstname,
lastname,

case country
           when 'GERMANY' then 'GM'
           when 'USA'      then 'US'
           else 'NA'
end abbreviated_form
from sales.Customers

--use case handling nulls
/* find the average scores of customers and treat nulls as 0
additionally provide details such as customerid and lastname*/
select
customerid,
lastname,
score,
case
    when score is null then 0
    else score
end updated_score,
avg (score) over () as avg1,
avg(case
        when score is null then 0
        else score
end ) over () as avg2
from sales.Customers

--conditional aggregation
--apply aggregate functions only on subsets of data that fulfill certain conditions.
/* count how many times each customer has made an order with sales greater than 30 and another program of binary flaf order > 30*/

select 
orderid,
customerid,
sales,
case
    when sales > 30 then 1
    else 0
end flag
from sales.Orders
order by CustomerID


select 
customerid,
sum(
case
    when sales > 30 then 1
    else 0
end) sum_flag_order,
count (*) total_orders
from sales.Orders
group by CustomerID








