create database SALES;
use SALES;

create table ORDERS(
Order_Id int auto_increment primary key,
Customer_Name varchar(50) not null default 'Unknown',  -- pevent'NULL' entry
Product_catagory varchar(50) not null default'Missellanious',
Order_Item varchar(50) not null,
Contact_No varchar(15) unique not null
);

desc ORDERS;


alter table ORDERS
add Order_Quantity  int not null;

rename table ORDERS to Sales_Orders;


insert into Sales_Orders (Customer_Name,Product_catagory,Order_Item,Contact_No,Order_Quantity)
values
('Bershka','Electronics','Laptop','9292929292',1),
('fraiza','Electronics','Phone','8282828282',2),
('rishwa','Furniture','chair','7272727272',1),
('kiya',default,'mouse','62626262626',3),
('reya','Clothing','scarf','5252525252',3),
('hersha','Clothing','jacket','4242424242',1),
('mirsha','Electronics','phone','987654321',1),
('kiara','Furniture','tablemat','897654321',2),
('lara','Books','Guide','789654321',1),
('viana','Electronics','laptop','9938475621',2),
(default,'Furniture','table','9988776543',1);

Select * from Sales_Orders; 


select Customer_Name,Order_Item from Sales_Orders;

update Sales_Orders
set Order_Item='headphone' where Order_Id=2;

drop table  Sales_Orders;
