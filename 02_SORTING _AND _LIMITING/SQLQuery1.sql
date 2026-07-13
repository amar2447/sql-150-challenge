select * from Customers
select * from Products
select * from Orders


--sorting and limiting
select order_id,product_id,revenue from Orders order by revenue desc
select top 5 * from Orders order by revenue desc
select top 1 * from Products order by price asc
--another method
select min(price) as minimum_price from Products
--another method
select product_id,product_name,category,price from Products where price=(select min(price ) from Products);

select top 1 * from Products order by price desc
select product_id,product_name,category,price from Products where price=(select max(price ) from Products);

select top 10 * from Orders order by order_date desc
select top 3* from Customers order by customer_name asc
select product_name, category ,price from Products order by category asc, price desc
select product_name,category,price from products order by category,price
select top 5* from Orders order by revenue asc
select min(order_date) as earliest_order from Orders
select top 1* from Orders order by order_date asc
select product_name from products order by product_name asc
