create database edac_assignment7;
use edac_assignment7;

-- table 1
create table Ord_master(
				 Ord_no	int ,
                 Cust_cd varchar(10),	
                 Status  varchar(10)
			);
            
insert into Ord_master values(  1 , 'C1' ,  'P'); 
-- =========================================================  
-- table 2
create table Ord_dtl(
				 Ord_no	int ,
                 Prod_cd  varchar(10),	
                 Qty int(10)
			);
            
insert into Ord_dtl values(  1  ,	'P1' ,	100); 
insert into Ord_dtl values(  1  ,	'P2' ,	200); 
-- ===================================================================
-- table 3
create table Prod_master(
				 Prod_cd  varchar(10) ,
                 Prod_name  varchar(10),	
                 Qty_in_stock  int(10),
                 Booked_qty int(10)
			);
            
insert into Prod_master values( 'P1' ,	'Floppies' , 10000	, 1000);  
insert into Prod_master values( 'P2' ,	'Printers' , 5000  	, 600);
insert into Prod_master values( 'P3' ,	'Modems ' , 3000  	, 200);    

-- ================================================================================================

-- 1. Write a Before Insert trigger on Ord_dtl. Anytime a row is inserted in Ord_dtl, the Booked_qty in Prod_master 
-- should be increased accordingly.
delimiter $$
create trigger tri1
before insert
on Ord_dtl
for each row
begin
	insert into Prod_master(Booked_qty) values( 300 );
end $$
drop trigger tri1$$

insert into Ord_dtl values(  2  ,	'P3' ,	300)$$
select * from Ord_dtl;
select * from Prod_master;
-- ====================================================================================================
-- 2. Write a Before Delete trigger on Ord_dtl. Anytime a row is deleted from Ord_dtl, the
-- Booked_qty in Prod_mastershould be decreased accordingly.
delimiter $$
create trigger tri2
before delete
on Ord_dtl
for each row
begin
	
end $$


-- ==============================================================================================================
-- 3. write A trigger to update the total salary of a department in dept_sal  table  when an employee is added or removed from  emp table .
delimiter $$
create trigger tri3
after delete 
on emp
for each row 
begin
	update dept_sal set tota_salary   ;
end $$

delimiter $$
create trigger tri31
after insert  
on emp
for each row 
begin
	update dept_sal set tota_salary =    ;
end $$


-- ==============================================================================================================
-- Create table dept_sal (dept_no, tota_salary) – this table contains the total of salaries of employees working into 
-- that particular department
      
    Create table dept_sal (
					dept_no int ,
                    tota_salary int(10)
                    );   
      
      
      