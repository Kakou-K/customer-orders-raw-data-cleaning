-- Introductory exploration of the deliberately messy raw tables.
-- Run 01_raw_tables.sql first. Execute queries individually.

-- Intro query 01
select len (firstname),trim (firstname),   firstname from customers
where firstname like 'M%'

-- Intro query 02
select* from orders

-- Intro query 03
select firstname, lastname from customers
where firstname <> trim (firstname)
or lastname <> trim (lastname)

-- Intro query 04
select* from customers

-- Intro query 05
select trim (product), product from orders
where product <> trim (product)
