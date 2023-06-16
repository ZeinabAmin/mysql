-- comment in sql
------------------------------------------------------
"utf8mb4_unicode_ci"  better than "utf8mb4_general_ci" 

utf8 languages
mb4 emotions
ci case insensitive
cs case sensitive
------------------------------------------------------
table
1-attributes --name of columns(fields)

2-datatypes
string varchar(255)
integer(11)
boolean (true or false)
enum() --options like male ,female
float - double - decimal(10,2) 12345678,12
text - longtext
date - time - datetime

3-constraints
not null
unique
default --default now() == current_timestamp()

4-primary key --dont change dont repeat //unique
FOREIGN key for relationships between tables
---------------------------------------------------------
pagination

limit  offset  page
5       0       1
5       5       2
5       10      3

offset=(page-1)*limit

select  where  orderby  limit  offset
----------------------------------------------------------
where =,<,>, >=,<=, between , like ,in ,<> --not equal
----------------------------------------------------------
truncate --delete all values and reset index --empty the table
----------------------------------------------------------
phone varchar(50)
----------------------------------------------------------
logical operator 
and or 
----------------------------------------------------------
% any number of characters --zero or more
_ one character
like search for pattern
----------------------------------------------------------
asc  ascending  default
DESC descending
----------------------------------------------------------
write key words capital perefer
----------------------------------------------------------
ERD entity relationship daigram  erdplus.com
entities relations tables

--------------
empty string not null
---------------
Structure schema  browse select * from table

CREATE DATABASE `route` COLLATE "UTF8MB4_UNICODE_CI"

DROP DATABASE route
--name datatype constraint
CREATE TABLE `users` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL ,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `age` INT(3) UNSIGNED NOT NULL,
    `bio` TEXT,
    `type` ENUM ('user','admin') NOT NULL DEFAULT 'user',
    `created_at` DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY (id)
);

CREATE TABLE posts (
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    body VARCHAR(255) NOT NULL,
    user_id INTEGER UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (name,email,age) VALUES ('Ali','ali@gmail.com',22);

INSERT INTO users (name,email,age) VALUES ('Ali','ali@gmail.com',22),
('Mona','mona@gmail.com',20),
('hana','hana@gmail.com',27),
('saad','saad@gmail.com',24);

UPDATE users SET type='admin',name='omar' WHERE id=3

UPDATE users SET bio = NULL WHERE id > 2

SELECT id, name , email FROM users WHERE id=1

SELECT * FROM users WHERE id=1

SELECT * FROM users --ALL TABLE

DELETE FROM users --ALL TABLE --DROP

DELETE FROM users WHERE id=1

SELECT type FROM users 

SELECT DISTINCT type FROM users 
-------------------------------------------------------------------------
SELECT contactfirstname, contactlastname FROM customers
SELECT  DISTINCT contactfirstname FROM customers
SELECT DISTINCT contactfirstname, contactlastname FROM customers

SELECT * FROM customers
SELECT * FROM customers WHERE country ='usa' OR country ='france' OR country ='australia' --53
SELECT * FROM customers WHERE country IN ('usa' ,'france' ,'australia' ) --53 --i search for more than one value
SELECT * FROM customers WHERE country NOT IN ('usa' ,'france' ,'australia' )--69
SELECT * FROM customers WHERE country ='usa' OR 'france' OR 'australia' --RETURN usa ONLY 36

SELECT * FROM customers WHERE customernumber >=120 AND customernumber <=130
SELECT * FROM customers WHERE customernumber BETWEEN 120 AND 130 

WHERE STATE = 1 --FALSE  zero rows
WHERE STATE = NULL --FALSE zero rows
IS NULL --TRUE

SELECT * FROM customers WHERE STATE IS NULL--73
SELECT * FROM customers WHERE STATE IS NOT NULL--49
SELECT * FROM customers WHERE STATE = 0 --49

SELECT * FROM customers WHERE customername ="Signal Gift Stores"
SELECT * FROM customers WHERE customername LIKE "%A"
SELECT * FROM customers WHERE customername LIKE "A%"
SELECT * FROM customers WHERE customername LIKE "%A%"

SELECT * FROM customers WHERE country ='usa' AND (STATE LIKE "C%" OR STATE LIKE "%C")

SELECT * FROM orders WHERE requireddate LIKE "_____03___"
SELECT * FROM orders WHERE requireddate LIKE "%_03_%"
SELECT * FROM orders WHERE MONTH(requireddate)=3
SELECT * FROM orders WHERE YEAR(requireddate)=2003
SELECT * FROM orders WHERE DAY(requireddate)=18

SELECT customernumber , customername FROM customers ORDER BY customername DESC  
SELECT * FROM customers ORDER BY customernumber DESC
SELECT country,city FROM customers ORDER BY country ,city  --ASC DEFAULT

SELECT country,city FROM customers ORDER BY country ASC,city DESC
SELECT * FROM customers WHERE country ='usa' ORDER BY customernumber DESC LIMIT 5
SELECT * FROM customers WHERE country ='usa' ORDER BY STATE

SELECT * FROM customers LIMIT 10
SELECT * FROM customers LIMIT 10 OFFSET 10

SELECT * FROM customers WHERE country ='usa' ORDER BY creditlimit DESC LIMIT 5
SELECT * FROM customers WHERE country ='usa' ORDER BY creditlimit DESC LIMIT 1 OFFSET 1
SELECT * FROM customers WHERE country ='usa' AND customername LIKE "C%" ORDER BY customernumber DESC LIMIT 3 OFFSET 5  --1

----------------------------------------------------
In MySQL, ENUM is used to store a single value from a list of predefined options, while SET is used to store multiple values from a list of predefined options. 

CREATE TABLE `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL,
  `gender` ENUM('Male', 'Female', 'Other') NOT NULL
);

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  interests SET('Music', 'Sports', 'Reading', 'Travel', 'Cooking')
);
---------------------------------------------------------

MySQL is an open source relational database management system (RDBMS) that uses Structured Query Language (SQL) to manage and manipulate data stored in tables.

---------------------------------------------------------

phpMyAdmin is a free and open source web-based application used to manage and administer MySQL databases through a graphical user interface (GUI) accessible via a web browser.
---------------------------------------------------------

table and field in ``

SELECT * FROM `products` WHERE 1

SELECT `name`, `id` FROM `products` WHERE 1

INSERT INTO `products`(`name`, `id`) VALUES ('[value-1]','[value-2]')

UPDATE `products` SET `name`='[value-1]',`id`='[value-2]' WHERE 1

DELETE FROM `products` WHERE 0
---------------------------------------------------------
search on
single rows
multi row function 