#CREATEING DATA BASE AND TABLE


create database SCHOOL;                          
use SCHOOL;


create table STUDENT(
Roll_Number int primary key,
Name varchar(50) not null,
Mark int,
Grade char(1)
);

desc STUDENT;


#INSERTING VALUES

insert into STUDENT(Roll_Number,Name,Mark,Grade)
values
(1,'Tessa',120,'A'),
(2,'Bershka',130,'A'),
(3,'Zefra',125,'B'),
(4,'Kiara',130,'B');


select * from STUDENT;




#ADD COLUMN

alter table STUDENT
add Contact varchar(50);


#DROP COLUMN


alter table STUDENT
drop column Grade;


#RENAME TABLE

rename table STUDENT TO CLASSTEN;

desc CLASSTEN;
select * from CLASSTEN;



# DLETE ALL ROWS

truncate table CLASSTEN;


#DELETE THE TABLE

 drop table CLASSTEN;



