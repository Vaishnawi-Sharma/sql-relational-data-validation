CREATE DATABASE SQL_JOIN;

/*When We need to find out details that are scattered along multiple tables in SQL 
then we need to bring all of that tables together , And for this we use Join.
For Writing a single Query that can access records from multiple tables .

join =cross Join + some condition

Types of Join :

1. Inner Join Or Join (Imp)
2. Left Join Or Left Outer Join(Imp)
3. Right Join Or Right Outer Join(Imp)
4. Full Join Or Full Outer Join
5. Cross Join (No need of On Condition)
6. Natural Join (No Need of On condition)
7. Self Join(Imp)
*/

-- Creating table employee
CREATE TABLE employee(
emp_id varchar(20) primary key ,
emp_name varchar(50) ,
salary int,
dept_id varchar(20) ,
manager_id varchar(20) ) ;
;

--Insert data into employee

INSERT INTO employee VALUES ('E1' ,'Rahul',15000,'D1','M1') ;
INSERT INTO employee VALUES ('E2' ,'Manoj',15000,'D1','M1') ;
INSERT INTO employee VALUES ('E3' ,'James',55000,'D2','M2') ;
INSERT INTO employee VALUES ('E4' ,'Michael',25000,'D2','M2') ;
INSERT INTO employee VALUES ('E5' ,'Ali',20000,'D10','M3') ;
INSERT INTO employee VALUES ('E6' ,'Robin',35000,'D10','M3') ;

--create table department 
CREATE TABLE  department (
dept_id varchar(20) ,
dept_name varchar(50) ) ; 

--Insert into department 
INSERT INTO department VALUES('D1' ,'IT') ;
INSERT INTO department VALUES('D2' ,'HR') ;
INSERT INTO department VALUES('D3' ,'Finance') ;
INSERT INTO department VALUES('D4' ,'Admin') ;

--Create table manager 
CREATE TABLE manager(
manager_id varchar(20) ,
manager_name varchar(50) ,
dept_id varchar(20) ) ;

--insert into manager 
INSERT INTO manager VALUES ('M1' ,'Prem','D3') ;
INSERT INTO manager VALUES ('M2' ,'Shripadh','D4') ;
INSERT INTO manager VALUES ('M3' ,'Nick','D1') ;
INSERT INTO manager VALUES ('M4' ,'Cory','D1') ;

--create table projects 
CREATE TABLE projects(
project_id varchar(20) ,
project_name varchar(100) ,
team_member_id varchar(20) ) ;

--insert into projects 
INSERT INTO projects VALUES('P1' ,'Data Miagration','E1') ;
INSERT INTO projects VALUES('P1' ,'Data Miagration','E2') ;
INSERT INTO projects VALUES('P1' ,'Data Miagration','M3') ;
INSERT INTO projects VALUES('P2' ,'ETL Tool','E1') ;
INSERT INTO projects VALUES('P2' ,'ETL Tool','M4') ;

-- Selecting all the data from employee
select * from employee ;

-- Selecting all the data from department
select * from department ;

-- Selecting all the data from manager
select * from manager ;

-- Selecting all the data from projects
select * from projects ;

--Inner Join/Join
-- does join based on matching condition , the column names can be differ
--Fetch the employee name and department name they belong to. 

select e.emp_name , d.dept_name
from employee e join department d 
on e.dept_id =d.dept_id ;

--Left Join
-- inner join + any additional records from the left table 

--Fetch all the employee name and department name they belong to.

select e.emp_name , d.dept_name
from employee e left join department d 
on e.dept_id =d.dept_id ;

--Right Join
-- inner join + any additional records from the right table 

--Fetch the employee name and all the department name they belong to. 

select e.emp_name , d.dept_name
from employee e right join department d 
on e.dept_id =d.dept_id ;

--multiple joins

--Fetch details of all emp , their manager , their department and the projects they work on

select e.emp_name , d.dept_name ,m.manager_name , p.project_name
from employee e left join department d on e.dept_id =d.dept_id 
join manager m on e.manager_id = m.manager_id 
left join projects p on e.emp_id = p.team_member_id ;

-- Full Join

--inner join +any additional records from the left table + any additional records from the right table 

--Fetch all the employee name and all the department name they belong to. 

select e.emp_name , d.dept_name
from employee e full  join department d 
on e.dept_id =d.dept_id ;

--Cross Join 
--It returns cartesian Product (Don't use on condition)

select e.emp_name , d.dept_name
from employee e cross join department d ;

-- Why We need Cross Join ? 
-- When we don't have similar matching columns but we still need to join it 

--Create table company
create table company(
company_id varchar(10) ,
company_name varchar(50) ,
location varchar(20) ) ;

--Insert into company 
insert into company values('C001','techFTQ Solutions' ,'Kuala Lumpur') ;

--Write a query to fetch the employee name and their corresponding department name .
--Also make sure to display the company name and the company location corresponding to each employee

select e.emp_name , d.dept_name,c.company_name,c.location
from employee e  join department d 
on e.dept_id =d.dept_id 
cross join company c ;

--Natural Join 


-- The SQL will decide which columns to join based on similar column names .
--Don't need to use on condition 
--the column names must be similar otherwise it can cause cross join or error

--Not available in SQL Server
/*select e.emp_name , d.dept_name
from employee e natural join department d ;
*/

--if we change the name of the column 

exec sp_rename 'department.dept_id','id','column' ;

--then we do natural join

/*select e.emp_name , d.dept_name
from employee e natural join department d ;
*/

/* then it will cause an cartesian product because no condition will be applied
by the SQL natural join , the column names are differ */


-- Self Join(No keyword of self join , you can do inner , left , right , full join

-- Create table family 

create table family(
member_id varchar(10) ,
name varchar(50) ,
age integer ,
parent_id varchar(10) ) ;

--insert into family 
insert into family values('F1','David',4,'F5') ;
insert into family values('F2','Carol',10,'F5') ;
insert into family values('F3','Michael',12,'F5') ;
insert into family(member_id,name, age) values('F4','Johnson',36) ;
insert into family values('F5','Maryam',40,'F6') ;
insert into family(member_id,name, age) values('F6','Stewart',70) ;
insert into family values('F7','Rohan',6,'F4') ;
insert into family values('F8','Aasha',8,'F4') ;

select * from family ;

--Write the query to fetch the child name and their age corresponding to their parent and parent name

select child.name , child.age , parent.name , parent.age
from family child join family parent 
on child.parent_id = parent.member_id ;

--Write the query to fetch all the child name and their age corresponding to their parent and parent name

select child.name , child.age , parent.name , parent.age
from family child left join family parent 
on child.parent_id = parent.member_id ;
