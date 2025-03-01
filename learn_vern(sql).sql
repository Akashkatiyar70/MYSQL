create database if not exists learn_vern;

drop database if exists learn_vern;
 
create database learn_vern;
 
show databases;


                   -- CREATE TABLE --

use learn_vern;
create table if not exists products(prod_id 
int unsigned not null  auto_increment,prod_code 
char(4) not null,name varchar(50) not null ,quantity 
int unsigned not null default 0 ,price decimal(10.2)
 not null default 9999.99,primary key(prod_id));


insert into products(prod_id,prod_code,name,quantity,price)
values(101,'mark','black marker',18,1800),
(102,'mark','blue marker',20,2000),
(103,'penc','pencil',12,111.80),
(104,'mark','red marker',30,3400.49),
(105,'pen','black-pen',100,1000.22);


alter table products_master drop column suppliers_id;
ALTER TABLE products_master DROP FOREIGN KEY products_master_ibfk_2;

-- this is second type to insert data

insert into products
values(106,'mark','black marker',10,1900);

select * from  products;
select products.prod_id,products.prod_code,
products.name from `products`
where prod_id <= 103;
    
select products.prod_id,products.prod_code,
products.name from `products`
where name = 'blue marker';

select * from `products` where name like 'blue%';


select * from `products` where name not like 'r_%' 
and prod_code = 'mark';

select * from `products` where name not like 'r_%' 
or prod_code = 'mark';

select * from `products` where 
quantity < 1500 or prod_code = 'mark';

select * from `products` where 
quantity < 1500 and prod_code = 'mark';

select * from `products` where name='red marker' 
or name= 'blue marker' or name= 'pencil';

select *from `products` where name in
('red marker','blue marker','pencil');

select * from `products` where prod_code is not null;

select * from `products` where name like '_e%';

select * from  `products` where name like '_e%'
 order by prod_code asc;
 
select * from  `products` where name like '_e%'
order by prod_code desc;

select * from  `products` where name like '_e%'
 order by quantity asc, price desc;
 
 select * from `products` limit 2;
 
 select * from `products` where prod_id > 102 limit 3;
 
 select * from `products` limit 3,4;
 
           -- Alias function
 
select prod_id as 'Product Id',prod_code as 'Product Code', 
name as 'Product Name',quantity as'Product Quantity',
price as 'Product Price' from `products`;

          -- concat() function

select concat(prod_code,'-',name) as 'Product Desc.',prod_code,prod_id,quantity,
name from products;

           -- Distinct Clause

select distinct price,name from products;

          -- Group By Clause
		
select * from `products` group by prod_code;
select * from `products` group by prod_code;
SELECT * FROM `products` GROUP BY prod_code, prod_id, price
 LIMIT 0, 1000;


		  -- Having Clause
          
select prod_code as 'Product Code', COUNT(*) as 'Count',
 cast(avg(price) as float) as 'Average' from products
 group by prod_code;

SELECT COUNT(*) AS 'Count', 
CAST(AVG(price) AS FLOAT) AS 'Average'
FROM products;

select prod_code as 'Product Code',
count(*) as 'Count',cast(avg(price)as float) 
as 'Average' from products
group by prod_code having Count >=2;


select prod_code as 'Product Code',
count(*) as 'Count',cast(avg(price)as float) 
as 'Average' from products
where Count>= 2 group by prod_code;


                -- Update Query
                
update products set prod_code = 'Mark' where prod_id=103;
revoke select on products from prod_id=103;
select * from  products_master;

update products set prod_code = 'Test';

update products set prod_code = 'mark' where prod_id < 105;

update products set prod_code = 'Penc' where prod_id > 104;
update products set quantity = quantity+10;
delete from products where prod_id = 104;

                    -- ALTER Query
                    
alter table products add supplier_id  int not null default 0  after 
prod_code;

                    -- Modify column
                    
alter table products modify supplier_names varchar(100);
ALTER TABLE products ADD supplier_name VARCHAR(100);
ALTER TABLE products ADD supplier_contct VARCHAR(100);

                       -- Rename Column
                       
alter table products change column 
supplier_contct supplier_mobile char(10);

                       -- Drop Column
                       
alter table products drop column supplier_mobile;
alter table products_master drop column supplier_id;
alter table products_master drop column suppliers_id;


                      -- Rename Table
                      
alter table products rename to products_master;
alter table products_master rename to products;

                     -- Truncate table
truncate products;
desc products;

select * from  products_master;
DESCRIBE products_master;

alter table products_master ;

                -- foreign Key

create table suppliers(sup_id int unsigned auto_increment 
not null , name varchar(100) not null,phone char(10) 
not null,primary key (sup_id));



insert into suppliers values
(101,'Rajput Company',7896253414),
(102,'katiyar company',8318955852),
(103,'yadav company',4569823569),
(104,'Dubey company',2569874130);

select * from suppliers;
desc suppliers;

alter table products_master add column suppliers_id 
int unsigned not null ;

update products_master set suppliers_id=1001;
update `products_master` set ` suppliers_id` = '101' where `products_master`.`prod_id`=106;
alter table products_master drop column suppliers_id;
ALTER TABLE products_master DROP FOREIGN KEY products_master_ibfk_3;

alter table products_master add foreign key(suppliers_id) 
references suppliers(sup_id);


                          -- Inner joins
select * from Products_master join suppliers on 
products_master.suppliers_id = suppliers.sup_id;
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          


create database learn_vern_join;

use learn_vern_join;

create table if not exists products(prod_id 
int unsigned not null  auto_increment,prod_code 
char(4) not null,name varchar(50) not null ,quantity 
int unsigned not null default 0 ,price decimal(10.2)
 not null default 9999.99,primary key(prod_id));
 


insert into products(prod_id,prod_code,name,quantity,price)
values(101,'mark','black marker',18,1800),
(102,'mark','blue marker',20,2000),
(103,'penc','pencil',12,111.80),
(104,'mark','red marker',30,3400.49),
(105,'pen','black-pen',100,1000.22);

select *from products;

create table suppliers(sup_id int unsigned auto_increment 
not null , name varchar(100) not null,phone char(10) 
not null,primary key (sup_id));

insert into suppliers values
(101,'Rajput Company',7896253414),
(102,'katiyar company',8318955852),
(103,'yadav company',4569823569),
(104,'Dubey company',2569874130);

alter table products add column suppliers_id 
int auto_increment ;

ALTER TABLE products 
ADD COLUMN suppliers_id INT NOT NULL ;


update products set suppliers_id=101+1;

alter table products drop column suppliers_id;         


                          -- Inner joins
select * from Products join suppliers on 
products.suppliers_id = suppliers.sup_id;

                         -- left join
select * from Products left join suppliers on 
products.suppliers_id = suppliers.sup_id;   
 
                         -- Right join
select * from Products right join suppliers on 
products.suppliers_id = suppliers.sup_id; 

                         -- full join
select * from Products left join suppliers on 
products.suppliers_id = suppliers.sup_id union all
select * from Products right join suppliers on 
products.suppliers_id = suppliers.sup_id where products.prod_id is null;       

                         -- cross join
select * from products cross join suppliers;
             
                         
                        -- view 

create or replace view product_view as 
select products.prod_id,products.prod_code,products.name as `product_name`,
products.quantity,products.price, suppliers.sup_id,suppliers.name as `supplier_name` 
from products left 
join suppliers on products.suppliers_id = suppliers.sup_id;
                        
select*from `product_view`;                        
                        
							-- modify view
alter  view product_view as 
select products.prod_id,products.prod_code,products.name as `product_name`,
products.quantity,products.price, suppliers.sup_id,suppliers.name as `supplier_name` 
from products left 
join suppliers on products.suppliers_id = suppliers.sup_id where prod_code ="mark";

select*from `product_view` where prod_id = 101;                        

drop view product_view;

                                        -- function


create table  if not exists student(id int,fname varchar(50),
Iname varchar(50),class char(4),age int,marks int);

insert into student values(1,'meet','shah','CE',22,55),
(2,'Shubham','Gupta','EC',26,85),
(3,'Jigar','Darji','EE',22,65),
(4,'Keval','Gajjar','EC',32,70),
(5,'Parth','Mehta','CE',23,20);

DELIMITER //
create function MarkFunction(marks int) returns varchar(50)
DETERMINISTIC
begin
declare level varchar(50);
if marks <20 then set level = 'Poor';
elseif(marks >20 and maeks<60) then set level = 'Modrate';
elseif(marks >60) then set level = 'Excellent';
end if;
return (level);
end //
DILIMITER;


select concat(fname,'',Iname) as 'Full Name',
class,age,marks,
MarkFunction(marks) as
'performance' from `student`;




                       -- THIS TYPE TO DONE IT

  
DELIMITER $$

CREATE FUNCTION MarkFunction(marks INT) 
RETURNS VARCHAR(50) 
DETERMINISTIC
BEGIN 
    DECLARE level VARCHAR(50);
    
    IF marks < 20 THEN 
        SET level = 'Poor';
    ELSEIF marks >= 20 AND marks < 60 THEN 
        SET level = 'Moderate';  -- Fixed spelling mistake: "Modrate" -> "Moderate"
    ELSE 
        SET level = 'Excellent';
    END IF;
    
    RETURN level;
END $$

DELIMITER ;

SET GLOBAL log_bin_trust_function_creators = 1;



SELECT CONCAT(fname, ' ', Iname) AS 'Full Name', 
class, age, marks, MarkFunction(marks) AS 'Performance' 
FROM student;

                                   -- Procedure

DELIMITER //
create procedure view_products()
begin
select * from products;
End //
DELIMITER ;

CALL view_products();

DELIMITER //
DROP PROCEDURE IF EXISTS insert_products;
create procedure insert_products(
in p_prod_code char(4),
 in p_name varchar(50),
in p_quantity int(10),
in p_price decimal(10,2)
)
begin
insert into products (prod_code,name,quantity,price) 
values (p_prod_code,p_name,p_quantity,p_price);
end //
DELIMITER ;

CALL insert_products('P001', 'Laptop', 10, 999.99);



                          -- Tigger Function
create table marks(id int not null auto_increment,name varchar(50),m1 int not null,m2 int not null ,m3 int not null,
total int not null,primary key(id));                          

insert into marks values(1,'akash',50,20,30,60);

DELIMITER //
create trigger marks_trigger
before insert on marks
for each row
begin set
new.total = new.m1+new.m2+new.m3;
end //
DELIMITER ;

select * from marks;

insert into marks values(null,'Parth',60,70,20,30);

insert into marks values(null,'Shubham',100,200,100,50);
























































