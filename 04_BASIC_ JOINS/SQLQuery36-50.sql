select * from Orders
select * from Products
select * from Customers

-- basic joins(36-50)
select order_id , customer_name from Orders as o inner join Customers as c on o.customer_id=c.customer_id --36
select order_id,p.product_id,product_name,category from Products as p inner join Orders as o on o.product_id=p.product_id --37
select o.revenue,product_name from Orders as o inner join Products as p on o.product_id=p.product_id --38
select city ,o.revenue from Customers as c inner join Orders as o on c.customer_id=o.customer_id --39
 
select  distinct c.customer_id,customer_name from Customers as c join Orders as o on o.customer_id=c.customer_id --41
-- using left join 
select c.customer_id,customer_name,o.order_id from Customers as c left join Orders as o on o.customer_id=c.customer_id--41
select distinct p.product_id,product_name from Products as p join Orders as o on o.product_id=p.product_id --42
select * from Customers as c left join Orders as o on o.customer_id=c.customer_id where o.customer_id is  null --43
select * from Orders as o right join Products as p on o.product_id=p.product_id where o.product_id is null --44
select * from Orders as o left join Customers as c on o.customer_id=c.customer_id where c.customer_id is null --45
select o.customer_id,SUM(revenue) as total_revenue,customer_name from Orders as o join Customers as c on o.customer_id=c.customer_id 
group by o.customer_id,customer_name --46
select order_id,order_date,category from Orders as o join Products as p on o.product_id=p.product_id --47
select c.customer_id,customer_name,order_id ,category from Customers as c join Orders as o on o.customer_id=c.customer_id join Products as p on
p.product_id=o.product_id where category='electronics' --48
--another method using left join
select o.customer_id,o.order_id,c.customer_name,category from Orders as o left join Customers as c on c.customer_id=o.customer_id left join
Products as p on p.product_id=o.product_id where category = 'electronics'

select o.order_id,c.customer_id, p.product_id,customer_name,product_name,city from Products as p join Orders as o on o.product_id=p.product_id join 
Customers as c on o.customer_id=c.customer_id where city='mumbai' --49
-- another method using left join
select o.order_id,o.product_id,o.customer_id,customer_name,product_name,category,city from Orders as o left join Products as p on
p.product_id=o.product_id left join Customers as c on c.customer_id=o.customer_id where city='mumbai'

--per product name with category
select product_name ,category ,count(order_id) as total_orderpercategory from Products as p join Orders as o on o.product_id=p.product_id
group by product_name,category --50
--per product category
select category ,count(order_id) as total_orderpercategory from Products as p join Orders as o on o.product_id=p.product_id
group by category --50

-- SET OPERATIONS

select customer_id from Customers intersect select customer_id from Orders

select customer_id from Customers except  select customer_id from Orders

select product_id from Products intersect select product_id  from Orders

select product_id from Products except select product_id  from Orders

--with duplicates
select customer_id,customer_name,city from Customers union all select product_id,product_name,category  from Products

