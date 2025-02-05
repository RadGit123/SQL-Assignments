create database LIBRARY;
use LIBRARY;

-- table 1

create table BRANCH
(
BRANCH_NO int  primary key,
MANAGERS_ID varchar(50),
BRANCH_ADRESS varchar(100),
CONATCT_NO int  );


select * from BRANCH;

insert into BRANCH  (BRANCH_NO,MANAGERS_ID,BRANCH_ADRESS,CONATCT_NO)
values
(1,101,'Delhi','98778910'),
(2,102,'Pune','98998720'),
(3,103,'Agra','97887630'),
(4,104,'Punjab','83443211'),
(5,105,'Gujarath','87887630');



-- table 2

create table EMPLOYEE
(
EMP_ID int  primary key,
EMP_NAME varchar(50),
POSITION varchar(50),
SALARY Decimal(10,2),
BRANCH_NO int ,
foreign key (BRANCH_NO) references BRANCH(BRANCH_NO)
);

select * from EMPLOYEE;

insert into EMPLOYEE(EMP_ID,EMP_NAME,POSITION,SALARY,BRANCH_NO)
values
(101,'Amritha','Manager','45000',1),
(102,'Kia','Manager','55000',2),
(103,'Rayan','Manager','56000',3),
(104,'Nisha','Manager','49000',4),
(105,'Jeeva','Manager','57000',5),
(106,'Kiran','AssistantManager','25000',1),
(107,'Rahana','Clerk','15000',1),
(108,'kishore','AssistantManager','25000',2),
(109,'Layana','Clerk','15000',2),
(110,'Mariya','AssistantManager','28000',3),
(111,'Vinay','Clerk','17000',3),
(112,'Nima','AssistantManager','26000',4),
(113,'Ashok','Clerk','19000',4),
(114,'Rishika','AssistantManager','30000',5),
(115,'Linda','Clerk','18000',5),
(116,'Pinky','Clerk','18000',1),
(117,'Dev','Attender','11000',1);




-- table 3

create table BOOKS
(
ISBN varchar(50)  primary key,
BOOK_TITLE varchar(100),
CATAGORY varchar(50),
RENTAL_PRICE Decimal(10,2),
STATUS varchar(4) check(STATUS in('YES','NO')) ,
AUTHOR  varchar(100),
PUBLISHER  varchar(100)
);

insert into BOOKS (ISBN,BOOK_TITLE,CATAGORY,RENTAL_PRICE,STATUS,AUTHOR,PUBLISHER)
values('1-86092-049-7','The Grass is Always Greener','Story',50,'YES','Jeffrey Archer','MR publishers'),
('1-86092-049-9','Murder!','Crime',22.50,'NO','Arnold Bennett ','Classic '),
('1-86092-010-1','The Higgler','Romance',25.70,'YES','A. E. Coppard','Shell'),
('1-86092-025-x','The Open Boat','Classic',75.50,'NO','Stephen Crane','Writters'),
('1-86092-031-4','The Five Orange Pips','Crime',30,'NO','Arthur Conan Doyle','Writters'),
('1-86092-038-1','The Signalman','Suspense',20,'YES','Charles Dickens','Shell'),
('978-0062397348','A people History of US','Historic',90,'YES','Howard ZInn','Shell');

select * from BOOKS;




-- table 4

create table CUSTOMER
(
CUSTOMER_ID int  primary key,
CUSTOMER_NAME varchar(50),
CUSTOMER_ADRESS varchar(100),
REG_DATE date
);

insert into CUSTOMER (CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_ADRESS,REG_DATE)
values(201,'Amith','Delhi','2021-01-10'),
(202,'Kavitha','Agra','2022-01-25'),
(203,'Amith','Punjab','2023-01-10'),
(204,'Vivek','Gujarath','2021-12-30'),
(205,'Vimal','Gujarath','2021-12-29');

select * from CUSTOMER;

UPDATE CUSTOMER 
SET CUSTOMER_NAME='Amrita'
where CUSTOMER_ID=203;




-- table 5

create table ISSUE_STATUS
(
ISSUE_ID int  primary key,
ISSUED_CUST int,
ISSUED_B00K_NAME varchar(50),
ISSUE_DATE date,
ISBN_BOOK varchar(50),
foreign key (ISBN_BOOK) references BOOKS(ISBN),
foreign key (ISSUED_CUST) references CUSTOMER(CUSTOMER_ID)
);

insert into  ISSUE_STATUS(ISSUE_ID,ISSUED_CUST,ISSUED_B00K_NAME,ISSUE_DATE,ISBN_BOOK)
values(301,202,'The Five Orange Pips','2022-06-10','1-86092-031-4'),
      (302,203,'The Open Boat','2023-02-10','1-86092-025-x'),
      (303,204,'The Signalman','2022-01-02','1-86092-038-1'),
      (304,204,'Murder','2023-06-10','1-86092-049-9');
      

select * from ISSUE_STATUS;



-- table 6


create table RETURN_STATUS
(
RETURN_ID int  primary key,
RETUN_CUST int,
RETURN_B00K_NAME varchar(50),
RETURN_DATE date,
ISBN_BOOK_2 varchar(50),
foreign key (RETUN_CUST) references CUSTOMER(CUSTOMER_ID),
foreign key (ISBN_BOOK_2) references BOOKS(ISBN)
);


insert into RETURN_STATUS(RETURN_ID,RETUN_CUST,RETURN_B00K_NAME,RETURN_DATE,ISBN_BOOK_2)
values(401,204,'The Signalman','2022-02-16','1-86092-038-1');

select * from RETURN_STATUS;


-- answers
-- 1

select BOOK_TITLE,CATAGORY ,RENTAL_PRICE 
 from BOOKS
 where STATUS='YES';
 
 
 -- 2
 select EMP_NAME,SALARY from EMPLOYEE order by SALARY desc;
 
 
 -- 3
 
 select ISSUED_B00K_NAME as BOOK_TITLE,ISSUED_CUST  from 
  ISSUE_STATUS  where ISSUED_B00K_NAME=(select BOOK_TITLE from BOOKS Where BOOK_TITLE= ISSUED_B00K_NAME);   -- SUBQUERY
 --  OR
 
 select BOOKS.BOOK_TITLE,CUSTOMER.CUSTOMER_NAME
 from   BOOKS
 join   ISSUE_STATUS  on BOOKS.ISBN=ISSUE_STATUS.ISBN_BOOK
 join   CUSTOMER  on  ISSUE_STATUS.ISSUED_CUST=CUSTOMER.CUSTOMER_ID;
 
 -- or
 
 select B.BOOK_TITLE,C.CUSTOMER_NAME
 from   BOOKS B
 join   ISSUE_STATUS I on B.ISBN=I.ISBN_BOOK
 join   CUSTOMER C on  I.ISSUED_CUST=C.CUSTOMER_ID;
  
  
  
-- 4


select CATAGORY,count(CATAGORY)  as Total_Number from BOOKS group by  CATAGORY;
-- OR
select CATAGORY,count(*)  as Total_Number from BOOKS group by  CATAGORY;


-- 5


select EMP_NAME,POSITION from EMPLOYEE where SALARY>50000;


-- 6

select  CUSTOMER.CUSTOMER_NAME 
from  CUSTOMER 
left join ISSUE_STATUS on ISSUE_STATUS.ISSUED_CUST=CUSTOMER.CUSTOMER_ID
where CUSTOMER.REG_DATE<'2022-01-01' and ISSUE_STATUS.ISSUED_CUST IS NULL;



-- 7


select BRANCH.BRANCH_NO,count(EMPLOYEE.EMP_NAME)  as Total_Employees 
from BRANCH
join EMPLOYEE  on BRANCH.BRANCH_NO=EMPLOYEE.BRANCH_NO   group by  BRANCH_NO ;

-- or

select EMPLOYEE .BRANCH_NO, count(EMPLOYEE .EMP_ID) as Total_Employees from EMPLOYEE  group by  BRANCH_NO;





-- 8

select  CUSTOMER.CUSTOMER_NAME 
from  CUSTOMER 
join ISSUE_STATUS on ISSUE_STATUS.ISSUED_CUST=CUSTOMER.CUSTOMER_ID
where month(ISSUE_STATUS.ISSUE_DATE )=6  and  year( ISSUE_STATUS.ISSUE_DATE)=2023;

-- 9

select BOOK_TITLE
from BOOKS
where BOOK_TITLE like '%history%';


-- 10

insert into EMPLOYEE(EMP_ID,EMP_NAME,POSITION,SALARY,BRANCH_NO)
values
(118,'Harsh','Manager','45000',1);

 update EMPLOYEE
 set POSITION='Attendent'
 where EMP_ID=118;


select BRANCH_NO, count(*) as Total_Employees  from EMPLOYEE group by BRANCH_NO  having  count(*) >5;
  
  
-- 11


select  EMPLOYEE.EMP_NAME ,BRANCH.BRANCH_ADRESS
from 
EMPLOYEE
join
BRANCH on  EMPLOYEE.EMP_ID=BRANCH.MANAGERS_ID;


-- 12

select  CUSTOMER.CUSTOMER_NAME 
from  CUSTOMER 
join ISSUE_STATUS on ISSUE_STATUS.ISSUED_CUST=CUSTOMER.CUSTOMER_ID
join BOOKS on BOOKS.ISBN=ISSUE_STATUS.ISBN_BOOK
where BOOKS.RENTAL_PRICE>25;


  