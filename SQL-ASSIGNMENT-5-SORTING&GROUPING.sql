create database Global_Employees_2;
use Global_Employees_2;


create table COUNTRY(
ID int auto_increment  primary key ,
Country_Name varchar(50) not null default 'Unknown',
Population int not null,
Area decimal(10,2) not null);

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

select left(Country_Name,3) as Fist_3_characters from   COUNTRY;

select concat(Fname, '  ' ,Lname) as Full_Name from PERSONS;

select  count( distinct Country_Name)  as   Number_of_distinctcountries from PERSONS   ;
  
select max(Population) as maximum_population from COUNTRY;
  
select min(Population) as minimum_population from PERSONS;


insert into PERSONS (Fname,Lname,Population,Rating,Country_Id,Country_Name)
values
( 'Nishita', 'NULL', '1300000', 4.4, 3,'JAPAN'),                     -- Country Id 1
( 'Krishitha', 'NULL', '1500000', 4.8, 2,'CANADA');

     
select * from  PERSONS;  

select count(Lname) as Lnamecount from PERSONS;

select count(ID) as number_of_rows from   PERSONS;
                 -- OR
select count(*) as number_of_rows from   PERSONS;



select Population as population_of_3rows from COUNTRY limit 3 ;
                   -- OR
select Population as population_of_3rows from  COUNTRY order by ID limit 3;
     
        
select * from COUNTRY order by rand() limit 3;


select * from  PERSONS order by   Rating   desc;  


select Country_Name ,sum( Population) as Total_population  from   PERSONS  group by   Country_Name;  

select Country_Name ,sum( Population) as Total_population  from   PERSONS  group by   Country_Name  having sum( Population)> 50000 ;  



select Country_Name ,count( ID) as Number_of__people,avg(Rating) as average_of_rating  from   PERSONS  group by   Country_Name  having Number_of__people>2  order by  average_of_rating asc ;  


