create database edac_assignment8;
use edac_assignment8;

Create table EMP ( 
			EMPNO numeric(4) primary key not null, 
            ENAME varchar(30) not null, 
            JOB varchar(10), 
            MGR numeric(4), 
            HIREDATE date, 
            SAL numeric(7,2), 
            DEPTNO numeric(2) 
            ) ;    
     select * from emp ;    drop table emp;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1000,  'Manish' , 'SALESMAN', 1003,  '2020-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1001,  'Manoj' , 'SALESMAN', 1003,  '2018-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1002 , 'Ashish', 'SALESMAN',1003 , '2013-02-18',  750,  30 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1004,  'Rekha', 'ANALYST', 1006 , '2001-02-18', 3000,  10) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1005 , 'Sachin', 'ANALYST', 1006 ,  '2019-02-18', 3000, 10 ) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1006,  'Pooja',  'MANAGER' , null    , '2000-02-18' ,6000, 10 ) ;


-- 1.	Write a Procedure that displays names and salaries of all Analysts recorded in the “emp” table by making use of a cursor.
delimiter $$
create procedure proc1()
begin
	declare name1 varchar(10);
    declare salary int;
    declare finish int default 0;
    
    declare cur1 cursor for select ename , sal from emp where job = 'ANALYST' ;   -- cursor declaration
    declare  exit  handler for not found set finish = 1;
    
    open cur1;    -- opening a cursor 
      
      l1 : loop
       fetch cur1 into name1 , salary ;    -- fetching data from emp table.
		if finish = 1 then
			leave l1;
		end if; 
      select name1 , salary ;
      end loop l1;
      
      close cur1;   -- closing a cursor
end $$

call proc1$$
-- ======================================================================================================================
-- 2.	Write a Procedure to display top 5 employees based on highest salary and display employee number, employee name 
-- and salary using Cursor.
delimiter ??
create procedure proc2()
begin
    declare  eno int ;
    declare name1 varchar(10);
    declare salary int;
    declare finish int default 0; 
    
	declare cur2 cursor for select empno , ename , sal from emp  order by sal desc limit 5;
    declare continue handler for not found set finish = 1;
    open cur2;
		l2 : loop
        fetch cur2 into eno , name1 , salary ;
        
		  if finish = 1 then
		  leave l2;
          end if;
            select eno , name1 , salary ;
       
          end loop l2;        
          
   end ??
 
call proc2??
-- ===================================================================================================================
-- 3.	Write  a procedure to display the concatenated first_name and last_name from “emp” table using cursors handle the  
-- errors with Exit handler
delimiter $$
create procedure proc3()
begin
	declare e1 varchar(10);
    declare e2 varchar(10);
    declare finish int default 0;
    
	declare cur3 cursor for select ename , job from emp;
    declare exit handler for not found set finish = 1;
    
    open cur3;
    l3 : loop
    fetch cur3   into e1 , e2;
    
		if finish=1 then
			leave l3;
        end if;
        
        select concat( e1 , '  ' , e2)  as name_and_job;
        end loop l3;
end $$

call proc3$$
 
-- ===============================================================================================================
-- 4.	Write a procedure which select all the data from employee table and display the data of employee where employee 
-- name is ‘Manish’ using cursors.
delimiter ##
create procedure proc4()
begin                      -- (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) 
	declare e1 int;
	declare e2 varchar(10);
    declare e3 varchar(10);
    declare e4 int(10);
    declare e5 date;
    declare e6 int(10);
    declare e7 int(10);
	declare finish int default 0;

	declare cur4 cursor for select * from emp;
    declare continue handler for not found set finish = 1;
	open cur4;
    
    l4 : loop
		fetch cur4 into e1 , e2 , e3 , e4 , e5 , e6 , e7;
        if finish =1 then
			leave l4;
        end if ;
        if e2 = 'Manish' then
        select e1 , e2 , e3 , e4 , e5 , e6 , e7;
        end if;
        end loop l4;
end ##

 call proc4##

-- =============================================================================================================
-- 5.	Write a procedure which select delete the data from employee table if emp sal is less than 750  using cursor and
--  handle the  Sqlexception with continue handler
delimiter $$                    -- uncomplete
create procedure proc5()
begin 
	declare salary int(10);
	declare finish int default 0;
		
   declare cur5 cursor for select sal from emp;
   declare continue handler for  Sqlexception set finish = 1;  -- The following handler rolls back the previous operations
   open cur5;
      delete from emp where sal < 750;
   l1 : loop
   fetch cur5 into salary;
   if finish = 1 then
	leave  l1;
   end if;
		delete from emp where salary < 750;	
   end loop l1;
   
end $$
select * from emp$$  
call proc5$$

 drop procedure proc5$$
-- ==================================================================================================================