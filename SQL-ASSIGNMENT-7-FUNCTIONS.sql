create database Global_Employees_4;
use Global_Employees_4;

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
( 'Bershka', 'Eleve', '2300000', 4.5, 1,'USA'),                     
( 'Fraiza', 'khan', '3300000', 4.8, 2,'CANADA'),                    
( 'Rishwa', 'noel', '63000000', 4.7, 5,'DENAMRK'),                  
( 'Kiya', 'Default', '7300000', 4.2, 6,'FINLAND'),                  
( 'Reya', 'rizza', '8300000', 4.6, 7,'UAE'),                        
( 'Hersha', 'karl', '2300000', 4.3, 1,'USA'),                       
('Mirsha', 'walkers', '5300000', 4.4, 4,'GERMANY'),                 
('Kiara', 'joseph', '3300000', 4.5, 2,'CANADA'),                    
('Lara', 'george', '2300000', 4.7, 1,'USA'),                        
('Viana', 'newmen', '3300000', 4.8, 2,'CANADA') ,                  
( 'Nishita', 'NULL', '1300000', 4.4, 3,'JAPAN'),                     
( 'Krishitha', 'NULL', '1500000', 4.8, 2,'CANADA');


select * from    PERSONS;


alter table PERSONS
add DOB date;

update  PERSONS
set DOB='1995-02-24' where ID=1;

update  PERSONS
set DOB='1996-02-24' where ID=2;

update  PERSONS
set DOB='1997-02-24' where ID=3;

update  PERSONS
set DOB='1998-02-24' where ID=4;


update  PERSONS
set DOB='1999-02-24' where ID=5;



delimiter $$
create function  AgeonDob(DOB date)
returns int
deterministic
no sql

begin
declare Age int;
set Age=timestampdiff(year,DOB ,curdate());

if
 (month(DOB)< month(curdate()))
 or
 (month(DOB)= month(curdate()) and date(DOB)>day(curdate()))
   then set Age=Age-1;

end if;
return Age;


end $$
delimiter ;


select   AgeonDob(DOB) as Age from PERSONS;


select  Fname, AgeonDob(DOB) as Age from PERSONS;




select Country_Name,length(Country_Name) as lengthofcountry from COUNTRY;

select Country_Name, substring(Country_Name,1,3) as Firstthreechar from COUNTRY;
                                 -- or
select Country_Name, left(Country_Name,3) as Firstthreechar from COUNTRY;



select Country_Name ,upper(Country_Name) as UppercaseCountryName,
lower(Country_Name) as LowerrcaseCountryName  from COUNTRY;

 