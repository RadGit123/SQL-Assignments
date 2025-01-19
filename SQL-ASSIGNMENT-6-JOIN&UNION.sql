create database Global_Employees_3;
use Global_Employees_3;


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
 
 
 
select PERSONS.ID as PersonID,concat(PERSONS.Fname, '  ' ,PERSONS.Lname) as fullName ,COUNTRY.Country_Name
 from PERSONS
 left join COUNTRY
 on PERSONS.Country_Id=COUNTRY.ID;
 
 
    
 select PERSONS.ID as PersonID,concat(PERSONS.Fname, '  ' ,PERSONS.Lname) as fullName ,COUNTRY.Country_Name
 from PERSONS
 right join COUNTRY
 on PERSONS.Country_Id=COUNTRY.ID;
 
 
 
    
 select PERSONS.ID as PersonID,concat(PERSONS.Fname, '  ' ,PERSONS.Lname) as fullName ,COUNTRY.Country_Name
 from PERSONS
 inner join COUNTRY
 on PERSONS.Country_Id=COUNTRY.ID;
 
 
 
select PERSONS.ID as PersonID,concat(PERSONS.Fname, '  ' ,PERSONS.Lname) as fullName ,COUNTRY.Country_Name
 from PERSONS
 left join COUNTRY
 on PERSONS.Country_Id=COUNTRY.ID
 
 union
 
 
 select PERSONS.ID as PersonID,concat(PERSONS.Fname, '  ' ,PERSONS.Lname) as fullName ,COUNTRY.Country_Name
 from PERSONS
 right join COUNTRY
 on PERSONS.Country_Id=COUNTRY.ID;
 
 
 
 
 select distinct   Country_Name from COUNTRY
 union
 select distinct   Country_Name from PERSONS;
  
  
  
select Country_Name from COUNTRY
union all
select Country_Name from PERSONS;
  




select ID as PersonID,concat(Fname, '  ' ,Lname) as PersonName,round(Rating) as RoundedRate from PERSONS;
