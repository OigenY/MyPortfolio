show databases;
use mysql;
select*from info;
alter table info drop column data;
create table dopp
(id INT(11) not null primary key,
car varchar(50) null,
 gender varchar(50) null,
 phone varchar(50) null
 );
 show tables;
insert into dopp values 
(
1, "BMW","male","shaomi"
);
 select*from dopp;
 insert into dopp values 
(
2, "BMW","male","shaomi"
);
 insert into dopp values 
(
3, "AUDI","male","samsung"
);
 insert into dopp values 
(
4, "Mercedes","male","iphone"
);
 insert into dopp values 
(
5, "zhiguli","female","shaomi"
);
select*from dopp;
select*from info;

select dopp.car, info.surname, info.name   FROM dopp join info on dopp.id=info.id;
select dopp.car,dopp.gender,dopp.phone, info.surname, info.name   FROM dopp left join info on dopp.id=info.id;
select dopp.car,dopp.gender,dopp.phone, info.surname, info.name   FROM dopp right join info on dopp.id=info.id;
select car, gender, phone from dopp;
select surname, name, job from info where salary in(select salary from info where salary>=13);
select salary from info order by salary desc;
select sum(salary) from info;
show databases;
use mysql;
use clients;
show tables;
select * from db;
------
------
------
------
------
------
------
------
create database test;
use test;

CREATE TABLE Departments
    (id INT(11) not null primary key, 
    Name varchar(100) null)
;
select*from Departments;

CREATE TABLE Employees
(id INT(11) not null primary key, 
Name varchar(100) null, 
Salary int null, 
ManagerId int null, 
DepartamentId int null)
;
select*from Employees;

INSERT INTO Departments
VALUES (1, 'Sales'), (2, 'Development');

INSERT INTO Employees
VALUES
    (1, 'Ivanov', 100000, null, 1),
    (2, 'Petrov', 120000, 1, 1),
    (3, 'Sidorov', 130000, 2, 1),
    (4, 'Коротков', 120000, 2, 1),
    (5, 'Filev', 90000, 1, 1),
    (6, 'Smirnov', 125000, null, 2),
    (7, 'Godov', 125000, null, null) ;
    
select*from Departments;
select*from Employees;

select Name, Salary from Employees;
select Name, Salary from Employees order by Salary asc;
select Name, Salary from Employees order by Salary desc;
Select Name, Salary from Employees where Salary > 100000;
select Name, Salary from Employees where Salary >= 100000;
Select Name, Salary from Employees where Name = 'Ivanov'or name ='Godov';
select DepartamentId, max(Salary) from Employees group by DepartamentId;
select DepartamentId, min(Salary) from Employees group by DepartamentId;
select DepartamentId, avg(Salary) from Employees group by DepartamentId;

select emp.Name, dep.Name from Employees as emp
join Departments as dep on dep.Id = emp.DepartamentId;

select employ.Name, emplo.Name as chief from Employees as emplo
join Employees as employ on emplo.Id = employ.ManagerId;

insert into Employees values (8, 'Semenov', 70000, 1, 1); 
update Employees set ManagerId = 2 where Id = 5 or Id = 6 or Id = 7 or Id = 8;
-----
-----
-----
-----
select*from dopp;
select*from info;
select*from dopp left join info on dopp.id=info.id where info.id is null;
select*from dopp right join info on dopp.id=info.id where dopp.id is null;
select*from dopp left join info on dopp.id=info.id;
select*from dopp right join info on dopp.id=info.id;
##################--------------------------------------------------------------------------------------------------------------------------------------------------
##################--------------------------------------------------------------------------------------------------------------------------------------------------
##################--------------------------------------------------------------------------------------------------------------------------------------------------
##################--------------------------------------------------------------------------------------------------------------------------------------------------
##################--------------------------------------------------------------------------------------------------------------------------------------------------
##################--------------------------------------------------------------------------------------------------------------------------------------------------
# Створено БД test, в якій є таблиці users, products, products_2 - дана таблиця виключно для join (відношення users-products_2 -> 1 до багатьох)
show databases;
use test;
show tables;
create table users (
id_user int (10) AUTO_INCREMENT,
name varchar(20) NOT NULL,
email varchar(50) NOT NULL,
password varchar(15) NOT NULL,
date_bd date NOT null,
PRIMARY KEY (id_user)
);
INSERT INTO users (name, email, password, date_bd, happy_numb) 
VALUES ("Jimmy", "addask123@mail.ua", "vnxmmn1234", "2003-06-24", 50);

select*from users;
select*from products;
create table products (
id_prod int (10) AUTO_INCREMENT,
name_prod varchar(30) NOT NULL,
serial_numb varchar(50) NOT NULL,
id_user int (10) NOT NULL,
PRIMARY KEY (id_prod),
FOREIGN KEY (id_user) REFERENCES users (id_user)
);
INSERT INTO products (name_prod, serial_numb, id_user) 
VALUES ("Apples", "1aaaa", 2),
	   ("Apples", "1aaaa", 3),
       ("Apples", "1aaaa", 2),
       ("Cucumber", "2aaaa", 1),
       ("Cucumber", "2aaaa", 3),
       ("Cucumber", "2aaaa", 5),
       ("Cucumber", "2aaaa", 6),
       ("Carrot", "3aaaa", 1),
       ("Carrot", "3aaaa", 2),
       ("Carrot", "3aaaa", 4),
       ("Carrot", "3aaaa", 5),
	   ("Oil", "4aaaa", 3), 
       ("Oil", "4aaaa", 5),
       ("Oil", "4aaaa", 6),
       ("Oil", "4aaaa", 2),
       ("Cola", "5aaaa", 4),
       ("Cola", "5aaaa", 5),
       ("Cola", "5aaaa", 6),
       ("Cola", "5aaaa", 4),
       ("Pizza", "6aaaa", 1),
	   ("Pizza", "6aaaa", 2),
       ("Pizza", "6aaaa", 3),
       ("Pizza", "6aaaa", 4),
       ("Pizza", "6aaaa", 5),
       ("Pizza", "6aaaa", 6),
       ("Watermelon", "7aaaa", 4),
       ("Watermelon", "7aaaa", 2),
       ("Watermelon", "7aaaa", 3),
       ("Watermelon", "7aaaa", 6);
select*from products;
select*from users;
###------------------------------------------------------------------------------------------
UPDATE products 
SET comments = 'good' 
WHERE id_prod = 41;
###------------------------------------------------------------------------------------------
select email as Імейл from users;
###------------------------------------------------------------------------------------------
select distinct name_prod from products;
select distinct serial_numb from products;
###------------------------------------------------------------------------------------------
select*from users where happy_numb > 5;
select*from users where happy_numb >= 26 or happy_numb is null;
select*from products where comments is not null;
###------------------------------------------------------------------------------------------
SELECT * 
FROM users
WHERE email LIKE '%mail.ua';
SELECT * 
FROM users
WHERE hobby LIKE '%ing';
SELECT * 
FROM users
WHERE name LIKE '_a%';
SELECT * 
FROM users
WHERE name LIKE 'J___';
###------------------------------------------------------------------------------------------
SELECT *
FROM users 
WHERE happy_numb BETWEEN 15 AND 50;
SELECT *
FROM users 
WHERE name BETWEEN "A" AND "Q";  
###------------------------------------------------------------------------------------------  
SELECT *
FROM products 
WHERE name_prod BETWEEN "A" AND "Q"
	and comments="good"; 
SELECT *
FROM users 
WHERE hobby is null
	and happy_numb is not null;
SELECT *
FROM users 
WHERE name BETWEEN "A" AND "J"
	and happy_numb is null;
###------------------------------------------------------------------------------------------ 
SELECT *
FROM products 
WHERE comments is not null
order by name_prod desc;
SELECT *
FROM users 
WHERE happy_numb is not null
order by date_bd desc;
###------------------------------------------------------------------------------------------ 
SELECT *
FROM products 
WHERE comments is null
limit 10;
###------------------------------------------------------------------------------------------ 
SELECT name, email,date_bd,
 CASE
  WHEN happy_numb >= 13 and happy_numb < 26 THEN 'Fantastic'
  WHEN happy_numb >= 26 THEN 'Poorly Received'
  ELSE 'Avoid at All Costs'
 END
FROM users;
###------------------------------------------------------------------------------------------ 
SELECT count(*)
FROM products 
WHERE comments is null;
###------------------------------------------------------------------------------------------ 
SELECT SUM(happy_numb) as SUM
FROM users
where happy_numb is not null;
###------------------------------------------------------------------------------------------ 
SELECT MAX(happy_numb) as MAX
FROM users;
###------------------------------------------------------------------------------------------ 
SELECT MIN(happy_numb) as MIN
FROM users;
###------------------------------------------------------------------------------------------ 
SELECT round(AVG(happy_numb), 2) as AVG
FROM users;
###------------------------------------------------------------------------------------------
select*from products;
select*from users;
SELECT count(name_prod), serial_numb 
FROM products
GROUP BY name_prod
ORDER BY serial_numb desc;
###------------------------------------------------------------------------------------------
SELECT name_prod, 
   serial_numb,
   AVG(id_prod) as AVG_k,
   count(comments) as NOT_NULL_COMMENTS
FROM products
#where comments is not null
GROUP BY 1, 2
having AVG_k > 35 
order by name_prod desc;
###------------------------------------------------------------------------------------------
select*from products;
select*from users;
SELECT * 
FROM users
cross JOIN products;
desc products;
###------------------------------------------------------------------------------------------  
select*from products_2;
select*from users;
SELECT u.id_user, u.name, u.email, u.date_bd, p.id_user, p.name_prod, p.serial_numb, p.id_prod
FROM users as u
inner JOIN products_2 as p
  ON u.id_user = p.id_user;
SELECT u.id_user, u.name, u.email, u.date_bd, p.id_user, p.name_prod, p.serial_numb, p.id_prod
FROM users as u
left JOIN products_2 as p
  ON u.id_user = p.id_user;
# В таблиці users немає нічого відмінного від таблиці products_2, отже відбувається тільки inner join по суті
SELECT u.id_user, u.name, u.email, u.date_bd, p.id_user, p.name_prod, p.serial_numb, p.id_prod
FROM users as u
right JOIN products_2 as p
  ON u.id_user = p.id_user;
  
# Унікальні значення для лівої таблиці, результат - 0 
SELECT u.id_user, u.name, u.email, u.date_bd, p.id_user, p.name_prod, p.serial_numb, p.id_prod
FROM users as u
left JOIN products_2 as p
  ON u.id_user = p.id_user
where p.id_user is null;
# Унікальні значення для правої таблиці, результат - 9
SELECT u.id_user, u.name, u.email, u.date_bd, p.id_user, p.name_prod, p.serial_numb, p.id_prod
FROM users as u
right JOIN products_2 as p
  ON u.id_user = p.id_user
where u.id_user is null;

# full outer join
(SELECT u.id_user, u.name, u.email, u.date_bd, p.id_user, p.name_prod, p.serial_numb, p.id_prod
FROM users as u
right JOIN products_2 as p 
  ON u.id_user = p.id_user)
union 
(SELECT u.id_user, u.name, u.email, u.date_bd, p.id_user, p.name_prod, p.serial_numb, p.id_prod
FROM users as u
left JOIN products_2 as p 
  ON u.id_user = p.id_user);
#order by name asc;
# full outer join without inner join (>(-)<)
(SELECT u.id_user, u.name, u.email, u.date_bd, p.id_user, p.name_prod, p.serial_numb, p.id_prod
FROM users as u
right JOIN products_2 as p 
  ON u.id_user = p.id_user
where u.id_user is null)
union 
(SELECT u.id_user, u.name, u.email, u.date_bd, p.id_user, p.name_prod, p.serial_numb, p.id_prod
FROM users as u
left JOIN products_2 as p 
  ON u.id_user = p.id_user
where p.id_user is null);
###------------------------------------------------------------------------------------------  
select*from products_2;
select*from users;
(select name, email, date_bd, hobby, happy_numb
from users
where happy_numb is not null)
union
(select name, email, date_bd, hobby, happy_numb
from users
where happy_numb is not null)
order by name;

SELECT count(name_prod) as count, 
   serial_numb
FROM products_2
where serial_numb is not null and id_user is not null
GROUP BY 2
having count >= 3 
order by serial_numb;
