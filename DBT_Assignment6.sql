use assignment6;

-- 1.	Write function that accepts a positive number from a user and displays its factorial on the screen.

delimiter $$
create function QUE_011( val int) returns int
begin
declare  iterator int(10) default 1;
	loop1 : Loop
	if(val <= 0) then
    leave loop1;
    end if;
    set iterator = iterator*val;
    set val =val-1;
    iterate loop1;
    end loop;
return iterator;
end ; $$

 -- drop function  Que_01;
set @value=5;
select Que_01(@value);

-- 2.	Write a function that accepts a positive number ‘n’ and displays whether that number is a Prime number or not.

delimiter $$
create function Que00002(x int) returns varchar(10)
begin
declare m,i int;
set i =2;
set m=x/2;
if x=0 || x=1 || x=2  then
return 'not prime';
else 
l1: loop
WHILE I<=M DO
			IF X%i=0 THEN 
				RETURN 'NOT PRIME';
				LEAVE L1;
				ELSE
				SET I=I+1;
				ITERATE L1;
			END IF;
	   END WHILE;
       RETURN 'PRIME';
	END LOOP L1;
	END IF;
END$$

select que00002(101);

-- 3.	Write a function to Convert an inputed number of inches into yards, feet, and inches. For example, 124 inches equals 3 yards, 1 foot, and 4 inches.

delimiter $$
create function Que103( val int(20)) returns varchar(200)
begin
declare y, f int;

-- return concat(val , ' inches ', round(val/36),' yards ',round(val%36),' foot ' , round(val%36));
  set y=val/36;
    set val=val%432;
    set f=(val%24);
    set val=val%12;
    return concat (y, 'yard' , f  , 'foot', val, 'inches' );
 
end;$$
delimiter ;

 -- drop function Que103;
select Que103(124);

-- 4.	Write a function to update salary of the employees of specified dept by 10%. Take dept no as parameter.
use assignment5;
select * from emp;
delimiter ##
create function Ques_5(dept int) returns varchar(20)
begin
update emp set sal=sal+(sal*0.10) where dno=dept;
return 'updated';
end  ##

select Ques_5(30);

-- 5.Create a function named USER_ANNUAL_COMP that has a parameter p_eno for passing on the values of  an employee number of the employee and p_comp for passing the compansation.
-- In the function calculates and returns the annual compensation of the employee by using the following formula.annual_compensation =  (p_sal+p_comm)*12
-- If the salary or commission value is NULL then zero should be substituted for it.  Give a call to USER_ANNUAL_COMP.*/
use assignment5;
select * from emp;
delimiter $$
create function Ques_006(empn int , comp int ) returns int 
begin
declare val int;
set val= (select sal from emp where empno = empn );
return (val+comp)*12;
end ; $$

select Ques_006(1004 , 20) as 'update salary' ;

-- 6.	Create a procedure called USER_QUERY_EMP that accepts three parameters. Parameter p_myeno is of IN parameter mode 
-- which provides the empno value. The other two parameters p_myjob and p_mysal are of OUT mode. The procedure retrieves the salary and job of an employee 
--  does not exist in the EMP table by displaying an appropriate message
use assignment5;

delimiter //
create procedure user_Query_emp01 (in p_eno int , out p_job varchar(10), out p_sal int )
begin
declare no int;
set no = (select count(*) from emp where empno = p_eno);
if no = 0 then
select 'employee not exits' ; 
select p_job= ' ' ;
set p_sal = 0;
else
select sal, job into p_sal , p_job from emp where empno = p_eno;
end if ; 
end //

call user_query_emp01(1004, @job, @sal);
select @job, @sal ;

--  7.	Create a procedure to print the inputted string in reverse order. If  inputted string is null display an appropriate message
delimiter $$
create procedure Que07(inout str varchar (200))
begin
   if (str= '' || isnull(str)) then
   set str = 'no string found' ;
  else
  set str = (select reverse(str));
  end if;
  end $$
  
  set @str1= null;
  call Que07(@str1);
  select @str1;
  
-- 8.	Create a procedure named ‘tabledetails’ which gives all the details of a particular table stored in database.

delimiter $$
create procedure Que008()
begin
show databases;
end;$$

call Que008();  










