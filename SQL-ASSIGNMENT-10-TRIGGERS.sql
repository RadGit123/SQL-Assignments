create database TEACHINGSTAFFS;
use TEACHINGSTAFFS;


create table TEACHERS
(ID int primary key,
NAME varchar(100),
SUBJECT varchar(50),
EXPERIENCE int,
SALARY decimal(10,2)
);

insert into TEACHERS(ID,NAME,SUBJECT,EXPERIENCE,SALARY)
values
(1,'Anita','math','2','30000'),
(2,'Arika','math','5','50000'),
(3,'Celin','Science','3','35000'),
(4,'Filda','IT','2','30000'),
(5,'Neha','SS','6','50000'),
(6,'Phelix','PE','5','40000'),
(7,'Clair','Music','2','20000'),
(8,'Merin','English','3','36000'),
(9,'Alen','GK','2','30000'),
(10,'Shelin','French','2','20000');


select * from TEACHERS;



Delimiter $$
create trigger Before_insert_teacher
Before insert on TEACHERS
For each row

Begin
  if new.SALARY<0 then
  signal sqlstate '45000'  set message_text ='The Salary canot be a negative value';
  end if;
end $$
Delimiter ;


-- EXAMPLE

insert into TEACHERS(ID,NAME,SUBJECT,EXPERIENCE,SALARY)
values
(11,'Tina','math','2','-20000');



create table TEACHERS_LOG
(Teacher_ID int,
Action varchar(50),
Timestamp timestamp
);
select * from TEACHERS_LOG



Delimiter $$
create trigger After_insert_Teacher
after insert on TEACHERS
for each row

Begin
  insert into TEACHERS_LOG(Teacher_ID,Action,Timestamp )
  Values(NEW.ID,'insert',now());

End $$
Delimiter ;



-- EXAMPLE
insert into TEACHERS(ID,NAME,SUBJECT,EXPERIENCE,SALARY)
values
(11,'Tina','math','2','20000');
select * from TEACHERS_LOG



Delimiter $$
 
create trigger  before_delete
before delete on TEACHERS
for each row
 Begin
 if OLD.EXPERIENCE > 10 then
 signal sqlstate '45000' set message_text='Canot delete as the teacher is having more than 10 years of experince';
 end if ;
 end $$
 
 Delimiter ;
 
 
 -- EXAMPLE 
 
 
insert into TEACHERS(ID,NAME,SUBJECT,EXPERIENCE,SALARY)
values
(12,'Rina','math','13','6200000');
 
 Delete from TEACHERS where ID= 12;
 



Delimiter $$
create trigger AFTER_DELETION
after delete on TEACHERS
for each row
begin
 
insert into TEACHERS_LOG(Teacher_ID,Action,Timestamp)
VALUES
(OLD.ID,'DELETE', now());
 end $$
Delimiter ;

 
 -- EXAMPLE
 
insert into TEACHERS(ID,NAME,SUBJECT,EXPERIENCE,SALARY)
values
(13,'limna','math','5','400000');

delete from TEACHERS where ID=13;


insert into TEACHERS(ID,NAME,SUBJECT,EXPERIENCE,SALARY)
values
(14,'Fidha','IT','2','200000');

delete from TEACHERS where ID=14;


select * from TEACHERS_LOG;


SHOW TRIGGERS;

