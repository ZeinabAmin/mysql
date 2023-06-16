SELECT * FROM `customers` ORDER BY creditlimit DESC limit 1
SELECT max(creditlimit) FROM `customers` --return one value
SELECT max(creditlimit) as maxcredit FROM `customers`
SELECT customernumber, max(creditlimit) FROM `customers`--false --not match
SELECT customernumber, creditlimit FROM `customers` --true
SELECT count(creditlimit) FROM `customers` --not count null
SELECT count(state) FROM `customers`
SELECT count(country) FROM `customers`
SELECT count(distinct country) FROM `customers`
SELECT max(creditlimit),min(creditlimit),sum(creditlimit),avg(creditlimit),count(creditlimit) FROM `customers`
SELECT max(contactfirstname) FROM `customers` --desc z-a
SELECT contactfirstname FROM `customers` order by contactfirstname DESC
SELECT min(contactfirstname) FROM `customers` --asce --a-z
----------------------------------------------------------------------------
--min,max  int and string
--sum ,avg only with numbers Otherwise return zero
--group by extend functionality of aggregation functions
SELECT country,count(customernumber) FROM `customers` group by country
SELECT sum(creditlimit) FROM `customers` group by country
SELECT country,sum(creditlimit) FROM `customers` group by country
SELECT state,sum(creditlimit) FROM `customers` where country='USA' group by state
----------------------------------------------------------------------------
--having only with aggregation functions
--condition after group by useing having not where
--sum(creditlimit) no space
SELECT state,sum(creditlimit) FROM `customers` where country='USA' and creditlimit > 10000 group by state
SELECT state,sum(creditlimit) FROM `customers` where country='USA' group by state having sum(creditlimit)  > 100000 
----------------------------------------------------------------------------
SELECT ordernumber , (quantityordered*priceeach) from `orderdetails`
SELECT orderNumber , productCode, (quantityordered*priceeach) as totalforproduct from `orderdetails`
SELECT concat(contactfirstname,contactlastname) FROM `customers`
SELECT concat(contactfirstname,contactlastname) as fullname FROM `customers`
SELECT concat(contactfirstname," ",contactlastname) as fullname FROM `customers`
----------------------------------------------------------------------------
--subqueries --one nested query
SELECT country,count(customernumber) FROM `customers` group by country order by count(customernumber) DESC limit 1
--usa
--outer query (inner query) inner excute first
SELECT * from `customers` where country = ( SELECT country FROM `customers` group by country order by count(customernumber) DESC limit 1)
SELECT customername from `customers` where creditlimit > (SELECT avg(creditlimit) FROM `customers`)--69
SELECT customernumber FROM `customers` where country='USA'
--SELECT * from `orders` where customernumber (SELECT customernumber FROM `customers` where country='USA')
SELECT * from `orders` where customernumber in (112,124)
SELECT customernumber FROM `customers` where country='USA' or country='FRANCE' or country='AUSTRALIA' --53
SELECT * FROM customers WHERE country IN ('usa' ,'france' ,'australia' ) --53 --i search for more than one value
----------------------------------------------------------------------------
-- join then filter
SELECT * from `orders` join orderdetails on orders.ordernumber = orderdetails.ordernumber where orders.orderdate like "2003-01%"

SELECT *FROM `orders`JOIN `orderdetails` ON `orders`.`ordernumber` = `orderdetails`.`ordernumber`
WHERE `orderdate` LIKE '2003-01%'

SELECT * from `orders` join orderdetails on orders.ordernumber = orderdetails.ordernumber where orderdate not like "2003-01%" هاتلي كله ماعدا دا

SELECT * from `orders` join orderdetails on orders.ordernumber = orderdetails.ordernumber where YEAR(orderdate)=2003 and  month(orderdate)=1
----------------------------------------------------------------------------
--inner join is default
SELECT * from `orders` join orderdetails join `customers` on 
orders.ordernumber = orderdetails.ordernumber and orders.customernumber = customers.customernumber

SELECT orders.ordernumber,`customers`.customername from
SELECT orders.* ,customers.country  from `orders`  join `customers` on orders.customernumber = customers.customernumber 

SELECT * from `orders` join orderdetails on orders.ordernumber = orderdetails.ordernumber

SELECT * from products join orderdetails join orders on products.productcode = orderdetails.productcode 
and orderdetails.ordernumber = orders.orderNumber

SELECT students.name ,courses.name  from `enroll` inner join `students` on enroll.student_id = students.id
inner join `courses` on courses.id = enroll.course_id
----------------------------------------------------------------------------
--self join
SELECT * from employees as emp  join employees as mang on emp.reportsto=mang.employeenumber
SELECT emp.firstname , mang.firstname , mang.employeenumber from .....
SELECT * from `customers` join orders on `customers`.customernumber = orders.customernumber
--left join
SELECT * from `customers` left join orders on `customers`.customernumber = orders.customernumber
--right join
SELECT * from `customers` right join orders on `customers`.customernumber = orders.customernumber
SELECT `customers`.customernumber,  `customers`.contactfirstname , orders.customernumber from
--SELECT * from `orders` join orderdetails --false --cross join --on is must
----------------------------------------------------------------------------
task 6

1- from “orderdetails” table. Write a query to get all order numbers (without repetition) that contain any product starting with code S18 and price more than 100.

2- from “payments” table. Write a query to get all payments that were made on day 5 or 6 (whatever month or year).

3- from “customers” table. Write a query to get the fifth-highest credit limit of the customers who (live in the USA and their phone number contains 5555).

1-SELECT distinct ordernumber from `orderdetails` where productCode like "S18%" and priceEach > 100;
2- SELECT * from `payments` where paymentDate like "%-05" or paymentDate like"%-06";
3-SELECT * FROM `customers` WHERE `country` = 'USA' AND `phone` LIKE '%5555%' ORDER BY `creditLimit` DESC
LIMIT 5
----------------------------------------------------------------------------

task 7

1- from “orderdetails” table. Write a query to get the total payment for each order.

2- from “employees” table. Write a query to get the full name of all employees side by side with the full name of their managers. The employee number of the manager is stored in “reportsTo” column.
Hint: search for “Self Join” to write this query.

3- Write a query to get all employees who work in the London office (using subqueries). 

4- Write a query to get all employees who work in the London office (using joins).

5- From “customers”, “orders” and “orderdetails” tables. Write a query to get all customer names and the total amount they paid.


1-SELECT ordernumber, SUM(quantityordered * priceeach) AS totalpayment FROM `orderdetails` GROUP BY ordernumber;

2---self join
SELECT * from employees as emp  join employees as mang on emp.reportsto=mang.employeenumber

3-SELECT * FROM `employees` where`officeCode`= ( SELECT `officeCode` FROM `offices` WHERE `city` = 'London' );

4-SELECT * from employees join offices on employees.officeCode = offices.officeCode where offices.city like 'London';

5-SELECT `customers`.`customerName`, SUM(`orderdetails`.`quantityOrdered` * `orderdetails`.`priceEach`) AS`totalPaid`FROM `customers`JOIN `orders` ON `customers`.`customerNumber` = `orders`.`customerNumber`JOIN `orderdetails` ON `orders`.`orderNumber` = `orderdetails`.`orderNumber`GROUP BY `customers`.`customerNumber`