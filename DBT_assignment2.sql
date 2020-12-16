use assignment2;
create table publishers
(
	pubid int(3) primary key,
    pname varchar(30),
    email varchar(50), 
    phone varchar(30),
    unique (email)
);
drop table publishers;
create table subjects
(
	subid varchar(5) primary key,
    sname varchar(30)
);
create table authors
(
	auid int(5) primary key,
    aname varchar(30),
    email varchar(50),
    phone varchar(30),
	unique (email)
);
create table titles
(
	titleid int(5) primary key,
    title varchar(30),
    pubid int(3),
    subid varchar(5),
    pubdate date,
    cover char(1)  check (cover in('P','H','p','h')),
    price int(4),
    constraint title_pubid_fk foreign key (pubid) references publishers(pubid),
    constraint title_subid_fk foreign key (subid) references subjects(subid)
);
drop table titles;
select * from titles;
drop table titles;
create table titleauthors
(
	titleid int(5),
    auid int(2),
    importance int(2),
    primary key(titleid,auid),
    constraint titleauthors_titleid_fk foreign key(titleid) references titles(titleid),
    constraint titleauthors_authorid_fk foreign key(auid) references authors(auid)
);
drop table titleauthors;
create table subject_backup
(
	subid varchar(5),
    sname varchar(30),
    primary key (subid)
);
desc titles;
desc subjects;
desc publishers;
desc subject_backup;
desc titleauthors;
insert into subjects values ('ora','oracle database 10g');
insert into subjects values ('java','java language');
insert into subjects values ('jee','java enterprise edition');
insert into subjects values ('VB','visual basics.net');
insert into subjects values ('asp','asp.net');

insert into publishers values (1,'willey','info@wrox.com','7745001618');
insert into publishers values (2,'wrox','info@vsnl.com',null);
insert into publishers values (3,'tata mcgraw','feedback@tatamcgrawhill.com',8899764533);
insert into publishers values (4,'techmedia','books@techmedia.com',7768984563);

insert into authors values (101,'herbert schild','herbert@yahoo.com',null);
insert into authors values (102,'james goodwill','goodwill@hotmail.com',null);
insert into authors values (103,'david hunter','huter@hotmail.com',null);
insert into authors values (104,'stephen walther','walther@gmail.com',null);
insert into authors values (105,'kevin loney','loney@oracle.com',null);
insert into authors values (106,'ed. romans','romans@theserverside.com',null);


insert into titleauthors values (1001,104,1);
insert into titleauthors values (1002,105,1);
insert into titleauthors values (1003,106,1);
insert into titleauthors values (1004,101,1);
insert into titleauthors values (1005,103,1);
insert into titleauthors values (1005,102,2);

select * from authors;
select * from publishers;
select * from subjects;
select * from titleauthors;
select * from titles;

select sname from subjects where sname like 'oracle%';
select sname from subjects where sname like 'j%';
select sname from subjects where sname like '%.net%';
select pname from publishers where pname like '%hill%';
select aname from authors where aname like '%er';

select title from titles where price<500;
select * from titles where pubdate <= '03-04-05';
select sname from subjects where sname=('java' or 'jee');
select aname from authors where auid > 103;
select * from titles where (titleid=101 or price > 400); 
select * from publishers where pname=('techmedia' or 'wrox');

select max(price) from titles;
select avg(importance) from titleauthors;
select count(*) from authors;
select sum(price) from titles;

select title from titles where month(pubdate)=4;
select year(current_date());
select month(current_date());
select last_day(pubdate) from titles where subid='java'; 

create table emp
(
sal float(7,3)
);
create table employee
(
	empid int,
    empname char(50)
);
desc employee;
insert into employee values(1,'Nikhil shrikhande');
insert into employee values(2,'Naman patil');
insert into employee values(3,'Abhishek Patil');
insert into employee values(4,'Kishore pandit');
insert into employee values(5,'Amit Gade');
alter table employee add column deptid int;
alter table employee modify column empname varchar(20);
alter table employee rename scott;
show tables;
truncate table employee;

select round(1234.567,-1)as roundvalue;
select round(1234.567,2);
select ceil(1530.019);
select floor(1652.786);
select sign(-15);
select 16 mod 7;
select sqrt(225);
select power(5,2);

select ascii('CDAC JUHU');
select bin('CDAC JUHU');
select hex('CDAC JUHU');
select bit_length('CDAC JUHU');
select char('CDAC JUHU');
select lcase('CDAC JUHU');
select ucase('CDAC JUHU'); 
select concat('CDAC JUHU');
select mid('CDAC JUHU',2,5);
select reverse('CDAC JUHU');
select lower('cdac juhu');
select upper('cdac juhu');
select left('CDAC JUHU',5);
select right('CDAC JUHU',3);
select length('CDAC JUHU');   
select trim('    CDAC JUHU'); 

SELECT DATE_ADD('1995-02-19', INTERVAL 31 DAY);
SELECT ADDTIME('1995-04-22 15:25:10.999999','1 1:1:1.000002');
SELECT CONVERT_TZ('2000-05-07 10:00:00','GMT','MET');
SELECT CONVERT_TZ('1999-01-01 12:00:00','+00:00','+10:00');
SELECT CURDATE();
SELECT CURDATE()+0;
SELECT CURTIME();
SELECT CURTIME()+0;
SELECT DATE('2013-11-15 01:02:03');
SELECT DATEDIFF('1995-09-21 15:59:59','1997-12-30');
SELECT DATE_ADD('1997-12-31 23:59:59', INTERVAL '1:1' MINUTE_SECOND);
SELECT DATE_ADD('1999-01-01', INTERVAL 1 HOUR);
SELECT DATE_FORMAT('1995-02-19 22:23:00', '%W %M %Y');
SELECT DAYNAME('1995-02-19');
SELECT MONTHNAME('1994-04-22');
SELECT DAYOFWEEK('1993-05-11');
SELECT DAYOFYEAR('1992-08-14');
SELECT EXTRACT(YEAR FROM '2000-07-02');
SELECT EXTRACT(YEAR_MONTH FROM '2002-08-16 01:02:03');
SELECT HOUR('15:09:03');
SELECT LAST_DAY('2015-09-23');
SELECT MAKEDATE(2014,31), MAKEDATE(2001,32);
SELECT MAKETIME(15,14,26);
SELECT NOW();



