create database COMPANY;
use COMPANY;

create table MANAGERS(
Manager_Id int  auto_increment primary key,
First_Name varchar(50) not null  ,
Last_Name varchar(50) not null ,
DOB date Check(DOB<'2015-01-01'),
Age int check(age>0),
Last_Update timestamp not null default current_timestamp,   #TIMESTAMP STORE BOTH TIME AND DATE
Gender char(1) check(Gender in('M','F')),
Department varchar(50) not null,
Salary decimal(10,2)  not null  check(Salary>0));


desc MANAGERS;


insert into  MANAGERS (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary)
VALUES
(1, 'Esra', 'william', '1995-01-15', 30, 'M', 'IT', 50000),
(2, 'Rima', 'noa', '1991-02-22', 34, 'F', 'Finance', 10000),
(3, 'viana', 'Brown', '1990-05-10', 35, 'M', 'HR', 35000),
(4, 'Sophia', 'Taylor', '1992-05-18', 33, 'F', 'IT', 28000),
(5, 'Michael', 'Johnson', '1995-01-30', 30, 'M', 'Marketing', 22000),
(6, 'Emma', 'Davis', '1980-01-25', 43, 'F', 'Finance', 34000),
(7, 'fraiza', 'Martin', '1995-03-15', 30, 'F', 'IT', 35000),
(8, 'William', 'Anderson', '1983-12-05', 40, 'M', 'HR', 15000),
(9, 'Noah', 'Thomas', '1975-04-02', 48, 'M', 'IT', 27000),
(10, 'Bershaka', 'Garcia', '1998-03-12', 25, 'M', 'Marketing', 20000);


select* from MANAGERS;


select First_name, Last_Name,DOB from MANAGERS
where Manager_Id=1;


select Manager_Id ,(salary*12) as  Annual_Income from MANAGERS;  -- Anual income=monthly slary*12

select * from MANAGERS where First_name != 'Aaliya';


select * from MANAGERS where Department='IT'  and salary>25000;


select * from MANAGERS where  salary Between 10000  and 35000;

