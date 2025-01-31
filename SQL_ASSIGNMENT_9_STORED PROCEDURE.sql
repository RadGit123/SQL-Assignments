create database WORKERSINFO;
use WORKERSINFO;

create table WORKER
(WORKERS_ID int,
FIRSTNAME char(25),
LASTNAME  char(25),
SALARY int,
JOINING_DATE datetime,
DEPARTMENT varchar(25)
);

delimiter $$

create procedure New_Worker (
 in N_WORKERS_ID int,
 in N_FIRSTNAME char(25),
 in N_LASTNAME  char(25),
 in N_SALARY  int,
 in N_JOINING_DATE datetime,
 in N_DEPARTMENT varchar(25)
)

Begin
insert into WORKER(WORKERS_ID ,FIRSTNAME,LASTNAME ,SALARY ,JOINING_DATE,DEPARTMENT)
values(N_WORKERS_ID ,N_FIRSTNAME ,N_LASTNAME  ,N_SALARY ,N_JOINING_DATE ,N_DEPARTMENT);
End $$
delimiter ;

call New_Worker('1','Bershka','shan','450000','1995-02-24','IT');
call New_Worker('2','Arika','Ray','350000','1994-02-22','finance');
call New_Worker('3','Milan','Nay','500000','1992-02-15','IT');
call New_Worker('4','Mariya','M','450000','1996-02-11','HR');


select* from WORKER;


delimiter $$

create procedure SalaryofWorker (
 in N_WORKERS_ID int,
 out N_SALARY int
 )
 
 
 Begin
 select SALARY into N_SALARY from WORKER where WORKERS_ID=N_WORKERS_ID ;
 End $$
 
delimiter ;
   
call SalaryofWorker(1,@Salary);
select @Salary as SalaryofWorker;
call SalaryofWorker(3,@Salary);
select @Salary as SalaryofWorker;


delimiter $$

create procedure Upadate_Department (
 in N_WORKERS_ID int,
 in N_DEPARTMENT  varchar(25)
 )
 
 
Begin
update  WORKER
SET DEPARTMENT = N_DEPARTMENT  where  WORKERS_ID= N_WORKERS_ID ;
End $$
 
 
 call Upadate_Department (1,'HR');
 
 select* from WORKER;
 
 delimiter $$

create procedure Count_Workers (
 in N_DEPARTMENT  varchar(25),
 out N_Countworker int
 )
 
 Begin
 select  count( DEPARTMENT) into  N_Countworker from WORKER where DEPARTMENT = N_DEPARTMENT  group by DEPARTMENT;
 End $$
 
 call Count_Workers ('HR',@CountofWorkers);               # instead of p_worker count  i used N_countworker as ouput parameter
select @CountofWorkers as NumberofWorkers;




delimiter $$

create procedure Average_Salary_Workers (
 in N_DEPARTMENT  varchar(25),
 out N_AverageSalary int                               # instead of p_average salary i us5d N_average salary as output parameter.
 )
 
 Begin
 select  avg( SALARY) into  N_AverageSalary from WORKER where DEPARTMENT = N_DEPARTMENT  group by DEPARTMENT;
 End $$
 
 call Average_Salary_Workers ('HR',@AverageSalary);
 
select @AverageSalary as AverageSalaryofEmployee;






