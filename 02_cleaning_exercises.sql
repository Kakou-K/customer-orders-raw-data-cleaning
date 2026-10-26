-- Customer and order data-quality exercises (SQL Server / SSMS).
-- Run 01_raw_tables.sql first.
-- Highlight and execute one exercise at a time (F5).
-- Validation examples are intentionally introductory, not production-grade.
-- The final SELECT INTO creates customers_clean and should be run only once.

-- Exercise 01: How many customers are in the raw table?
select count(*) as total_customers
from customers

-- Exercise 02: How many orders are in the raw table?

select count(*) as total_orders
from orders


-- Exercise 03: Show all customers.

select* from customers
-- Exercise 04: Show all orders.

select*from orders
-- Exercise 05: Show CustomerID, FirstName and LastName.

select customerid, firstname, lastname from customers


-- Exercise 06: Find all different customer countries.

select distinct country from customers


-- Exercise 07: Find all different customer statuses.
select distinct status from customers

-- Exercise 08: Find customers where Email is NULL.

select* from customers where email is null


-- Exercise 09: Find customers where Phone is NULL.
select* from customers where phone is null


-- Exercise 10: Find customers where FirstName is NULL.
select* from customers where firstname is null


-- Exercise 11: Find customers where FirstName is an empty string.
select * from customers where firstname = ''

-- Exercise 12: Find customers where City is empty.

select * from customers where city = ''
-- Exercise 13: Count NULL emails.
select count(*) from customers where email is null 

-- Exercise 14: Count empty emails.
select count(*) from customers where email = ''

-- Exercise 15: Find orders with NULL Product.
select* from orders where product is null

-- Exercise 16: Find orders with NULL Quantity.

select * from orders where quantity is null


-- Exercise 17: Find customers with spaces around FirstName or LastName.
select * from customers 
where firstname <> trim (firstname)
or lastname <> trim (lastname)

-- Exercise 18: Display the original and cleaned FirstName.
select firstname as original,
trim(firstname) as cleaned from customers 

-- Exercise 19: Display the original and cleaned LastName.
select lastname as original,
trim(lastname) as cleaned from customers 


-- Exercise 20: Display the original and cleaned Email.
select email as original,
trim(email) as cleaned from customers


-- Exercise 21: Find orders where Product contains leading/trailing spaces.
select * from orders where product <> trim (product)

-- Exercise 22: Display emails in lowercase.

select lower (email) from customers


-- Exercise 23: Display countries in lowercase.
select lower (country) from customers


-- Exercise 24: Display customer statuses in lowercase.

select lower (status) from customers


-- Exercise 25: Find all customer records where Active appears with inconsistent capitalization.

select distinct status from customers
select* from customers where lower(status) = 'active'
and status collate Latin1_General_CS_AS <> 'Active'

-- Exercise 26: Find duplicate CustomerIDs.
select customerid, count(*) as total
from customers
group by customerid
having count(*) > 1



-- Exercise 27: Find duplicate OrderIDs.

select orderid, count(*) as total
from orders
group by orderid
having count(*) > 1

-- Exercise 28: Find potential duplicate customers using FirstName, LastName and Email, ignoring case and spaces.
select trim (lower(firstname)) as clean_firstname,
trim (lower(lastname)) as clean_lastname,
trim (lower(email)) as clean_email
from customers 
group by 
trim (lower(firstname)),
trim (lower(lastname)),
trim (lower(email))
having count(*) > 1 


-- Exercise 29: Show the duplicate customer records.

with duplicates as 

(select trim (lower(firstname)) as clean_firstname,
trim (lower(lastname)) as clean_lastname,
trim (lower(email)) as clean_email
from customers 
group by 
trim (lower(firstname)),
trim (lower(lastname)),
trim (lower(email))
having count(*) > 1 )

select customers.*
from customers
inner join duplicates on trim (lower(customers.firstname)) = duplicates.clean_firstname
and trim(lower(customers.lastname)) = duplicates.clean_lastname
and trim (lower(customers.email)) = duplicates.clean_email





-- Exercise 30: Find emails that do not contain @.

select * from customers
where email not like '%@%'

-- Exercise 31: Find emails containing more than one @.
select * from customers 
where email like '%@%@%'


-- Exercise 32: Find emails that do not contain a dot.

select * from customers 
where email not like '%.%'

-- Exercise 33: Create a CleanEmail column using LOWER and TRIM.

select trim (lower(email)) as cleanmail from customers

-- Exercise 34: Find phone numbers shorter than 7 characters.
select * from customers where len(phone) <7 


-- Exercise 35: Find phone numbers containing non-numeric characters.

select * from customers where phone like '%[^0-9]%'

-- Exercise 36: Display the phone and its length.

select phone, len(phone) as phone_length
from customers 



-- Exercise 37: clean the table

 SELECT
    customerid,

    CASE
        WHEN firstname = '' THEN NULL
        WHEN firstname LIKE ' %' THEN TRIM(firstname)
        WHEN firstname IS NULL THEN NULL
        ELSE firstname
    END AS firstname_cleaned,

    CASE
        WHEN lastname = '' THEN NULL
        WHEN lastname LIKE ' %' THEN TRIM(lastname)
        WHEN lastname IS NULL THEN NULL
        ELSE lastname
    END AS lastname_cleaned,

    CASE
        WHEN email = '' THEN NULL
        WHEN email IS NULL THEN NULL
        WHEN email NOT LIKE '%.com' THEN NULL
        WHEN email LIKE '%@@%' THEN NULL
        ELSE LOWER(email)
    END AS email_cleaned,

    CASE
        WHEN phone IS NULL THEN NULL
        WHEN LEN(phone) < 10 THEN NULL
        WHEN phone LIKE '%[A-Z]%' THEN NULL
        ELSE phone
    END AS phone_cleaned,

    CASE
        WHEN city = '' THEN NULL
        WHEN city IS NULL THEN NULL
        WHEN city LIKE ' %' THEN TRIM(city)
        ELSE city
    END AS city_cleaned,

    CASE
        WHEN country = '' THEN NULL
        WHEN country IS NULL THEN NULL
        WHEN country LIKE ' %' THEN TRIM(country)
        WHEN country = 'GREECE' THEN 'Greece'
        WHEN country = 'USA' THEN 'USA'
        ELSE country
    END AS country_cleaned,

    Signupdate,

    CASE
        WHEN LOWER(TRIM(status)) = 'active' THEN 'Active'
        WHEN LOWER(TRIM(status)) = 'inactive' THEN 'Inactive'
        ELSE NULL
    END AS status_cleaned

INTO customers_clean
FROM customers;

-- customers_clean must not already exist when SELECT INTO is run.
-- The status rule maps unrecognized values to NULL.
-- The .com-only email check is a learning example, not full validation.
