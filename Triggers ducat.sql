create database Triggers_example;

use Triggers_example;

create table collectibles(
name varchar(50),
value decimal(5,2));

create table count_collectibles(
count int unsigned,
sum float);


create table collectibles_archive(
name varchar(50),
value decimal(5, 2),
deleted_on datetime default current_timestamp);


insert into count_collectibles
values(0,0);


create trigger generate_count after insert
on collectibles
for each row
update count_collectibles
set count=(
select COUNT(name) from collectibles
), sum =(
select SUM(value) from collectibles);

insert into collectibles
values('c',170),
('Data science',300);

select * from collectibles;
select * from count_collectibles;


create trigger update_count after delete
on collectibles
for each row
update count_collectibles
set count=(
select COUNT(name) from collectibles
), sum =(
select SUM(value) from collectibles);

delete from collectibles where name='java';
select * from count_collectibles;


create trigger update_sum after update
on collectibles
for each row
update count_collectibles
set sum =(
select SUM(value) from collectibles);

update collectibles set value=150
where name='python';

select * from count_collectibles;


create trigger generate_archive before delete
on collectibles
for each row
insert into collectibles_archive(name,value) values
(old.name,old.value);
delete from collectibles where name ='Data science';
select*from collectibles_archive;








