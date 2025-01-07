create database Global_Employees;
use Global_Employees;


create table COUNTRY(
ID int auto_increment  primary key ,
Country_Name varchar(50) not null default 'Unknown',
Population int not null,
Area decimal(10,2) not null);

desc COUNTRY;

insert into COUNTRY (Country_Name,Population,Area)
values
('USA','2300000','5566770.00'),
('CANADA','3300000','3346789.00'),
('JAPAN','43000000','4454530.50'),
('GERMANY','5300000','9876540.21'),
('DENAMRK','63000000','8566770.55'),
('FINLAND','7300000','5566770.00'),
('UAE','8300000','12300.55'),
('OMAN','1300000','155600.60'),
('EGYPT','1400000','76534.51'),
('AUSTRALIA','4500000','9500000.90');



select * from  COUNTRY;


create table PERSONS(
ID int auto_increment  primary key ,
Fname varchar(50) not null default 'Unknown',
Lname varchar(50) not null default 'Unknown',
Population int not null,
Rating float,
Country_Id int,
Country_Name varchar(50) not null default 'Unknown',
foreign key  (Country_Id)  references  COUNTRY(ID));




insert into PERSONS (Fname,Lname,Population,Rating,Country_Id,Country_Name)
values
( 'Bershka', 'Eleve', '2300000', 4.5, 1,'USA'),                     -- Country Id 1
( 'Fraiza', 'khan', '3300000', 4.8, 2,'CANADA'),                    -- Country Id 2
( 'Rishwa', 'noel', '63000000', 4.7, 5,'DENAMRK'),                  -- Country Id 5
( 'Kiya', 'Default', '7300000', 4.2, 6,'FINLAND'),                  -- Country ID 6
( 'Reya', 'rizza', '8300000', 4.6, 7,'UAE'),                        -- Country ID 7
( 'Hersha', 'karl', '2300000', 4.3, 1,'USA'),                       -- Country ID 1
('Mirsha', 'walkers', '5300000', 4.4, 4,'GERMANY'),                 -- Country ID 4
('Kiara', 'joseph', '3300000', 4.5, 2,'CANADA'),                    -- Country ID 2
('Lara', 'george', '2300000', 4.7, 1,'USA'),                        -- Country ID 1
('Viana', 'newmen', '3300000', 4.8, 2,'CANADA');                    -- Country ID 2


 select * from  PERSONS;    
 
 
select distinct  Country_Name   from  PERSONS;
 
 
 select Fname as First_Name, Lname as Last_Name,  concat(Fname, '  ' ,Lname) as Full_Name from PERSONS;
 
 
select * from PERSONS where Rating>4.0;


select * from COUNTRY where Population>1000000;


select * from PERSONS where Country_Name='USA' or  Rating>4.5;


select * from PERSONS where Country_Name='NULL';
            -- OR
select * from PERSONS where Country_Name IS NULL;



select * from PERSONS where Country_Name in('USA', 'CANADA','UK');


select * from PERSONS where Country_Name  not in ('INDIA','AUSTRALIA');
 
 
select * from COUNTRY where Population between 500000 and 1000000;
 
 
select * from COUNTRY where Country_Name not like 'C%';
 
 
 