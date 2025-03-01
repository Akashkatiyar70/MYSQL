-- sql constraints - rules which aplies on table columns
-- not null
-- unique
-- primary key(contain notnull and unique those properties)
-- default 
-- check 
-- foreign key
-- create table student
-- (id int unsigned primary key,name varchar(50) not null,
-- contact bigint unsigned unique,course varchar(20) not null,
-- test_marks float default 0,grade char,
-- exam_date datetime default current_timestamp);

create database mydb_11am;
-- drop database mydb_11_am;

use mydb_11am;

create table student
(id int unsigned,name varchar(50),
contact bigint unsigned,course varchar(20),
test_marks float,grade varchar(20),
exam_date datetime);

-- alter table student
-- modify column stu_id
-- smallint unsigned primary key;

-- alter table student
-- modify column name varchar(50) not null;

alter table student
add constraint unique_contact
unique(contact);

alter table student
drop constraint unique_contact;

alter table student
modify column test_marks float(3,1) default 0;

alter table student
modify column exam_date datetime
default current_timestamp;

alter table student
add column email varchar(100) not null;

alter table student
drop column email;

truncate table student; -- truncate remove all data from the table(student);

-- DML ( INSERT,UPDATE,DELETE)
alter table student
modify contact char(10);

alter table student
modify column test_marks float(3,1) 
check (test_marks<=100 and test_marks>=0);

insert into student(stu_id,name,contact,
course,test_marks,grade)
values(5,'Akash','8318977470','Data',99,'A');

select *from student;

alter table student rename column id to stu_id;

--  DML(DATA Manupulation language)


insert into student(stu_id,contact,name,test_marks,grade)
values(505,'Rohit','5821456537',67,'A++');

delete from student where stu_id=505;

update student
set grade='c+' where stu_id=1;

select * from student;

update student set course=case stu_id when 2 then
'java' when 3 then 'data science' 
when 1 then 'Python' END
where stu_id in (1,2,3,4,5);

select * from student;

-- DQL(Data Query lanuage)(select)

select * from student;

select name,contact from student;

select name,contact,exam_date from student
where stu_id=1;

select weekday(exam_date) from student;

select max(test_marks) from student;

select min(test_marks) from student;

select * from student where 
test_marks=(select max(test_marks) from student);






select current_date();
select current_time();
select current_timestamp();

select * from student where name LIKE 'a%';

select * from student order by test_marks;
select * from student order by test_marks DESC;

select grade,min(test_marks) from student group by grade;
select grade,count(grade) from student group by grade;


create view student_name_A as
select * from student where name LIKE 'a%';

select * from student_name_A;

create or replace view student_name_A as
select name,test_marks,exam_date
from student where name LIKE 'a%';


create or replace view grade_count as 
select grade,count(grade) from student
group by grade;

select * from grade_count;



-- DCL(data control language)(grant,revoke)

select user from mysql.user;

create user 'ducat_user'@'localhost' identified by '1234';

grant insert on mydb_11am.student to 'ducat_user'
@'localhost';

grant select,update on mydb_11am.student
to 'ducat_user'@'localhost';


grant all privileges on *.* to 'ducat_user'@'localhost';

revoke select,insert,update on *.* from 'ducat_user'@'localhost';
revoke select,insert,update on mydb_11am.student from 'ducat_user'@'localhost';


-- all permision dinie
 revoke all privileges,grant option from 
 'ducat_user'@'localhost';

    
--            TCL(Transaction control language)
-- multiple time update delete insert(commit,rollback,savepoint)

savepoint s1;
insert into student(stu_id,name,contact,course,test_marks,grade)
values(5,'sumit','859679512','hello java',88,'A');
rollback;
select * from student;

rollback to s2;
commit;

savepoint s2;
delete from student where stu_id=5;
commit;

-- database - ecom 
             -- customers
                       -- customer_id(primary key),name,gender,contact,address
			-- products
                       -- product_id(pren key),name,price
			-- orders
                       -- order_id,customer_id(f.k),product_id,quantity,total_price

create database ecom;

use  ecom;
create table  customer(customer_id int unsigned primary key,
 name varchar(10),gender varchar(10),contact bigint unsigned,
 address varchar(100));

create table products( product_id int unsigned primary key, 
name varchar(50), price bigint  default 0.0);

create table orders(order_id int unsigned primary key,
customer_id int unsigned,
product_id int unsigned,
quantity tinyint unsigned check(quantity>=1 and quantity<=10),
total_price float default 0.0,
foreign key(customer_id) references customer(customer_id),
foreign key(product_id) references products(product_id));

insert into customer(customer_id,name,gender,contact,address)
values(1,'Akash','male',7896589745,'kannauj'),
(2,'vikash','male',8965320212,'patan'),
(3,'Anshu','male',7856471456,'Noida'),
(4,'Priya','Female',5632417855,'Mumbai'),
(5,'Neha','female',2356898520,'kanpur');

insert into products values(101,'Tv',25000),
(102,'Laptop',60000),
(103,'Bag',2000),
(104,'Keyboard',1500),
(105,'Smartwatch',2500);

insert into orders(order_id,customer_id,product_id,quantity)
values (1001,2,103,5),
(1002,1,105,2),
(1003,4,101,1),
(1004,5,104,3),
(1005,5,102,1);

select * from orders;

update orders,products
set total_price=products.price*quantity
where products.product_id=orders.product_id;

                    -- -- join
select orders.customer_id,customer.name,
customer.address from orders 
join customer on orders.customer_id=customer.customer_id; 


select orders.customer_id,customer.name,
products.name,products.price,quantity,
total_price,customer.address  from orders 
join customer on orders.customer_id=customer.customer_id
join products on orders.product_id=products.product_id;


select orders.order_id,customer.name
from orders right join customer on
orders.customer_id=customer.customer_id;


select orders.order_id,customer.name
from orders full join customer on
orders.customer_id=customer.customer_id;

select orders.*,customer.*from orders right join customer on 
orders.customer_id=customer.customer_id
union all
select orders.*,customer.*from orders left join customer on 
orders.customer_id=customer.customer_id;

select orders.* , customer.*
from orders cross join customer
on orders.customer_id=customer.customer_id;

create table shapes(shape varchar(10));
create table colors(color varchar(10));

insert into shapes values('Circle'),('Triangle'),('square');

insert into colors values('Red'),('green'),('blue');

select shapes.* , colors.*from shapes cross join colors;

                             -- Stored Procedures

delimiter //

create procedure display()
begin 
    select * from customer;
    select * from products;
    select * from orders;
end
//

call display();

                              -- Three type parameter
                              
-- in type parameter
-- out type parameter
-- inout type parameter

delimiter //

create procedure customer_detail(in id int unsigned )      
begin
select * from customer where customer_id=id;
end
//    
         
set @id=3;
call customer_detail(@id);

delimiter //
create procedure get_customer_name(in id int,out customer_name varchar(50))
begin
select name into customer_name
from customer where customer_id=id;
end
//

set @id=5;
call get_customer_name(@id,@customer_name);

select @customer_name;


delimiter //
create procedure price_id(inout priceid int )
begin
select price into priceid from products where 
product_id=priceid;
end
//

set @id=105;
call price_id(@id);
select @id;

select * from  products;


                             -- user defined function / stored functions

delimiter //
create function calculate_area(width int , length int)
returns int 
reads sql data
deterministic
begin 
return width*length;
end
//

select calculate_area(4,6);

                                    -- Tigger





































































