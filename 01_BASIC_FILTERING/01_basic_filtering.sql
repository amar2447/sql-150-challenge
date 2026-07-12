select * from Customers;

select * from Products;

select * from Orders;

select order_id,customer_id,order_date,revenue from Orders where revenue <20000;

select customer_name,city from Customers where city='mumbai';

select order_id,customer_id,order_date from Orders where order_date > '2024-01-01';

select product_id,product_name,category from Products where category ='electronics';

select * from customers where customer_name like 'A%';

select product_id,product_name ,price from Products where price between 1000 and 5000;

select order_id,customer_id,quantity from orders where quantity >=2;

select customer_name,city from Customers where city <> 'delhi';
