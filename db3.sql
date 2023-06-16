--sql in 3 category

1-DDL (Data Definition Language) is a subset of SQL used to define and modify the structure of database objects, such as tables, indexes, and constraints. Common DDL statements include CREATE, ALTER, and DROP, which are used to create, modify, and delete database objects.

2-DML (Data Manipulation Language) is a subset of SQL used to manipulate data stored in database objects, such as tables. Common DML statements include SELECT, INSERT, UPDATE, and DELETE, which are used to retrieve, add, modify, and remove data from tables.

3-DCL (Data Control Language) is a subset of SQL used to control access to database objects and enforce security policies. Common DCL statements include GRANT, REVOKE, and DENY, which are used to grant or revoke permissions to users or roles, and control access to database objects.

-----------------------------------------------------------------------
--view virtual table
-- save query in virtual table
In MySQL, a view is a virtual table that is based on the result set of a SELECT statement. It allows you to simplify complex queries by creating a reusable query object that can be used like a table, and can also be used to control access to sensitive data by limiting the columns or rows that users can see.

--create view `users_view` as SELECT * FROM users WHERE id=1
--select name as fullname from `users_view` where `id`=1
-----------------------------------------------------------------------
function procedure --return value
stored procedure --void

--direction-- (in -out -inout )---search 

stored procedure --void --in dbtest
select * from users where id=varid;
select * from users where name like concat("%",keyword,"%")

function procedure --return value
SELECT CONCAT(firstname, ' ', lastname) AS full_name
  FROM names;
  SELECT *, CONCAT(firstname, ' ', lastname) AS `fullname` FROM `names` ;
 --BEGIN  END --for more than line
BEGIN
IF is_admin =1 THEN
return "admin";
ELSE 
return 'user';
END IF;
END

SELECT `id`, `firstname`, `lastname`, `is_admin` (is_admin) as `admin` FROM `names` 

BEGIN
IF salary > 10000 THEN
return (salary*20)/100;
ELSE 
return (salary*5)/100;
END IF;
END

SELECT *,taxes(salary) as `taxes` FROM `users` 
-----------------------------------------------------------------------
trigger --OLD --NEW
insert into `log` (`name`) values (old.name)

CREATE TRIGGER wininsertuser
AFTER INSERT ON users
FOR EACH ROW
INSERT INTO log (name) VALUES (NEW.name);

-----------------------------------------------------------------------
The main difference between soft delete and delete is that soft delete marks a row as deleted without actually removing it from the table, while delete permanently removes the row from the table. 