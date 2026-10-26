-- SQL Server sample data: intentionally messy customers and orders.
-- Run in a practice database once; existing tables will cause CREATE TABLE errors.
-- Preserve these raw values for the cleaning exercises.

CREATE TABLE dbo.Customers
(
    CustomerID  INT,
    FirstName   VARCHAR(50),
    LastName    VARCHAR(50),
    Email       VARCHAR(100),
    Phone       VARCHAR(30),
    City        VARCHAR(50),
    Country     VARCHAR(50),
    SignupDate  VARCHAR(30),
    Status      VARCHAR(30)
);


/********************************************************************
    PART 2 — CREATE RAW ORDERS TABLE
********************************************************************/

CREATE TABLE dbo.Orders
(
    OrderID     INT,
    CustomerID  INT,
    Product     VARCHAR(50),
    Quantity    VARCHAR(20),
    Price       VARCHAR(20),
    OrderDate   VARCHAR(30),
    Status      VARCHAR(30)
);


/********************************************************************
    PART 3 — INSERT DIRTY CUSTOMERS
********************************************************************/

INSERT INTO dbo.Customers
VALUES
(1,  'John',        'Smith',        'john@gmail.com',        '2105551111', 'Athens',        'Greece',   '2024-01-10', 'Active'),
(2,  'Maria',       'Papadopoulou', 'maria@gmail.com',       '2105552222', 'Athens',        'Greece',   '2024-01-12', 'Active'),
(3,  'Peter',       'Brown',        'peter@gmail.com',       '2105553333', 'Thessaloniki', 'Greece',   '2024-01-15', 'Active'),
(4,  'Anna',        'Miller',       'anna@gmail.com',        '2105554444', 'London',        'UK',       '2024-01-20', 'Inactive'),
(5,  'George',      'Wilson',       'george@gmail.com',      '2105555555', 'Athens',        'Greece',   '2024-02-01', 'Active'),

(6,  '  Michael',   'Johnson',      'michael@gmail.com',     '2105556666', 'Athens',        'Greece',   '2024-02-03', 'active'),
(7,  'Sofia',       ' Garcia ',     'sofia@gmail.com',       '2105557777', 'Madrid',        'Spain',    '2024-02-05', 'ACTIVE'),
(8,  'ROBERT',      'Taylor',       'ROBERT@GMAIL.COM',      '2105558888', 'New York',      'USA',      '2024-02-07', 'Active'),
(9,  'elena',       'Kosta',        'elena@gmail.com',       '2105559999', 'Athens',        'GREECE',   '2024-02-10', 'Active'),
(10, 'Thomas',      'Anderson',     'thomas@gmail.com',      '2105550000', 'London',        'UK',       '2024-02-12', 'ACTIVE'),

(11, 'Nikos',       'Georgiou',     NULL,                    '2105551234', 'Athens',        'Greece',   '2024-02-15', 'Active'),
(12, 'Laura',       'Martin',       'laura@gmail.com',       NULL,         'Paris',         'France',   '2024-02-18', 'Active'),
(13, 'Peter',       NULL,           'peter2@gmail.com',      '2105555678', 'Athens',        'Greece',   '2024-02-20', 'Inactive'),
(14, NULL,          'Young',        'jane@gmail.com',        '2105556789', 'Toronto',       'Canada',   '2024-02-22', 'Active'),

(15, 'Chris',       'Moore',        '',                      '2105557890', 'Athens',        'Greece',   '2024-02-25', 'Active'),
(16, '',            'Thomas',       'lucy@gmail.com',        '2105558901', '',              '',         '2024-02-27', 'Active'),

(17, 'Mark',        'Davis',        'mark@gmail',            '2105559012', 'Chicago',       'USA',      '2024-03-01', 'Active'),
(18, 'Sarah',       'White',        'sarah@@gmail.com',      '2105550123', 'Chicago',       'USA',      '2024-03-03', 'Active'),

(19, 'Alex',        'King',         'alex@gmail.com',        '2105551234', 'Boston',        'USA',      '2024-03-05', 'Active'),
(20, 'Alex ',       'King ',        'ALEX@GMAIL.COM',        '2105551234', 'Boston',        'usa',      '2024-03-05', 'ACTIVE'),

(21, 'Daniel',      'Scott',        'daniel@gmail.com',      '123',        'London',        'UK',       '2024-03-08', 'Active'),
(22, 'Emma',        'Green',        'emma@gmail.com',        'abcdef',     'London',        'UK',       '2024-03-10', 'Active'),

(23, 'James',       'Baker',        'james@gmail.com',       '2105553456', 'New York',      'USA',      '2027-12-01', 'Active'),
(24, 'Olivia',      'Adams',        'olivia@gmail.com',      '2105554567', 'Berlin',        'Germany',  '2024-03-15', 'Active'),
(25, 'William',     'Turner',       'william@gmail.com',     '2105555678', 'Berlin',        'Germany',  '2024-03-20', 'Unknown');


/********************************************************************
    PART 4 — INSERT DIRTY ORDERS
********************************************************************/

INSERT INTO dbo.Orders
VALUES
(1001, 1,  'Laptop',      '1',    '900',     '2024-04-01', 'Completed'),
(1002, 2,  'Mouse',       '2',    '20',      '2024-04-02', 'Completed'),
(1003, 3,  'Keyboard',    '1',    '50',      '2024-04-03', 'Shipped'),
(1004, 4,  'Monitor',     '1',    '250',     '2024-04-04', 'Completed'),
(1005, 5,  'USB Cable',   '3',    '10',      '2024-04-05', 'Completed'),

(1006, 6,  'Laptop',      '1',    '900',     '2024-04-06', 'completed'),
(1007, 7,  'Mouse',       '2',    '20',      '2024-04-07', 'COMPLETED'),
(1008, 8,  'Keyboard',    '1',    '50',      '2024-04-08', 'shipped'),
(1009, 9,  'Monitor',     '2',    '250',     '2024-04-09', 'Shipped'),
(1010, 10, 'USB Cable',   '5',    '10',      '2024-04-10', 'Completed'),

(1011, 6,  ' Laptop ',    '1',    '900',     '2024-04-11', 'Completed'),
(1012, 7,  'Mouse',        ' 2',   '20',      '2024-04-12', 'Completed'),

(1013, 8,  'Keyboard',     '-1',   '50',      '2024-04-13', 'Completed'),
(1014, 9,  'Mouse',        '0',    '20',      '2024-04-14', 'Completed'),
(1015, 10, 'Monitor',      'two',  '250',     '2024-04-15', 'Completed'),

(1016, 1,  'Laptop',       '1',    '-900',    '2024-04-16', 'Completed'),
(1017, 2,  'Mouse',        '2',    'free',   '2024-04-17', 'Completed'),

(1018, 3,  NULL,           '1',    '20',      '2024-04-18', 'Completed'),
(1019, 4,  'Monitor',      NULL,   '250',     '2024-04-19', 'Completed'),
(1020, 5,  'Laptop',       '1',    NULL,      '2024-04-20', 'Completed'),

(1021, 6,  'Mouse',        '2',    '20',      '2024-04-21', 'completed'),
(1022, 7,  'Keyboard',     '1',    '50',      'bad date',  'Completed'),
(1023, 8,  'Webcam',       '1',    '70',      '2027-01-01', 'Completed'),

(1024, 9,  'Monitor',      '1',    '250',     '2024-04-24', 'complete'),
(1025, 10, 'Keyboard',     '1',    '50',      '2024-04-25', 'DONE'),

(1026, 1,  'Laptop',       '1',    '900',     '2024-04-26', 'pending'),
(1027, 2,  'Mouse',        '2',    '20',      '2024-04-27', 'CANCELLED'),

(1028, 999,'Laptop',       '1',    '900',     '2024-04-28', 'Completed'),
(1029, NULL,'Mouse',       '1',    '20',      '2024-04-29', 'Completed'),

(1030, 3,  'Keyboard',     '1',    '50',      '2024-04-30', 'Completed'),
(1030, 3,  'Keyboard',     '1',    '50',      '2024-04-30', 'Completed'),

(1031, 4,  'Monitor',      '1',    '250',     '2024-05-01', 'Completed'),
(1032, 5,  'USB Cable',    '3',    '10',      '2024-05-02', 'Completed'),
(1033, 11, 'Headphones',   '1',    '80',      '2024-05-03', 'Shipped'),
(1034, 12, 'Webcam',       '1',    '70',      '2024-05-04', 'Completed'),
(1035, 13, 'Mouse',        '2',    '20',      '2024-05-05', 'Completed'),
(1036, 14, 'Keyboard',     '1',    '50',      '2024-05-06', 'Completed'),
(1037, 15, 'Laptop',       '1',    '900',     '2024-05-07', ' completed '),
(1038, 16, 'Laptop Bag',   '1',    '60',      '2024-05-08', 'SHIPPED'),
(1039, 17, 'Mouse',        '1',    '20',      '2024-05-09', NULL),
(1040, 18, 'USB Cable',    '999',  '10',      '2024-05-10', 'Completed'),
(1041, 19, 'Mouse',        '1',    '99999',   '2024-05-11', 'Completed'),
(1042, 20, 'Unknown',      '1',    '25',      '2024-05-12', 'Completed'),
(1043, 21, 'Keyboard',     '1',    '50',      '2024-05-13', 'complete'),
(1044, 22, 'Monitor',      '1',    '250',     '2024-05-14', 'COMPLETE'),
(1045, 23, 'Laptop',       '1',    '900',     '2024-05-15', 'Completed')
