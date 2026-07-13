select * from Customers
select * from Products
select * from Orders


--aggregation
select SUM(revenue) as total_revenue from Orders 
select count(order_id) as total_order from Orders
select avg(revenue) as avg_ordervalue from Orders
select top 1* from Orders order by revenue asc
select MIN(revenue) from Orders
select top 1* from Orders order by revenue desc
select count(customer_id) as no_ofcustomer from Customers
select category,count(product_name) as total_pdt from Products group by category
select c.city,count(o.order_id) as total_orders from Customers as c join Orders as o on c.customer_id=o.customer_id group by c.city
--select customer_id,sum(revenue) as total_revenue from Orders group by customer_id
select p.category,avg(o.revenue) as avg_revenue from Orders as o join Products as p on o.product_id=p.product_id group by p.category
select category ,AVG(price) as avg_categoryprice from Products group by category
select MONTH(order_date),sum(revenue) as total from Orders group by MONTH(order_date)--Q.35
select SUM(quantity) as total_quantity ,p.product_name from Orders as o join Products as p on o.product_id=p.product_id 
group by p.product_name --34

-- question 33
select c.customer_id,c.customer_name,count(o.order_date) as total_order from Customers as c join Orders as o on c.customer_id=o.customer_id  group by 
c.customer_id,c.customer_name having  count(o.order_date)>2

--question 32
select p.category,AVG(o.revenue) as avg_revenuecategory from Products as p join Orders as o on p.product_id= o.product_id group by p.category
having AVG(o.revenue) > 20000

--question 31
select c.city,count(o.order_id) as total_order from Customers as c join Orders as o on c.customer_id=o.customer_id group by c.city
having count(o.order_id) >=3











