Create database practice1 ;
-- ----------------------------
-- TABLE CREATION
-- ----------------------------

-- Employees Table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    salary INT,
    manager_id INT
);

-- Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Projects Table

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT
);

-- Employee_Projects Table
CREATE TABLE Employee_Projects (
    emp_id INT,
    project_id INT,
    assigned_date DATE
);

-- Attendance Table
CREATE TABLE Attendance (
    emp_id INT,
    attendance_date DATE,
    status VARCHAR(10)
);

-- ----------------------------
-- INSERT DATA
-- ----------------------------

-- Employees Data
INSERT INTO Employees (emp_id, name, department_id, salary, manager_id) VALUES
(1, 'Alice', 101, 70000, 4),
(2, 'Bob', 101, 60000, 4),
(3, 'Charlie', 102, 65000, 5),
(4, 'David', 101, 90000, NULL),
(5, 'Eve', 102, 85000, NULL),
(6, 'Frank', 103, 50000, 7),
(7, 'Grace', 103, 95000, NULL),
(8, 'Heidi', NULL, 40000, NULL);

-- Departments Data
INSERT INTO Departments (department_id, department_name) VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(104, 'Marketing');

-- Projects Data
INSERT INTO Projects (project_id, project_name, department_id) VALUES
(201, 'Onboarding System', 101),
(202, 'Website Redesign', 102),
(203, 'Budget Planning', 103),
(204, 'Campaign Strategy', 104),
(205, 'Cloud Migration', 102);

-- Employee_Projects Data
INSERT INTO Employee_Projects (emp_id, project_id, assigned_date) VALUES
(1, 201, '2024-01-15'),
(2, 201, '2024-01-20'),
(3, 202, '2024-02-10'),
(3, 205, '2024-03-01'),
(4, 201, '2024-01-10'),
(5, 205, '2024-03-05'),
(6, 203, '2024-04-01'),
(7, 203, '2024-04-05');

-- Attendance Data
INSERT INTO Attendance (emp_id, attendance_date, status) VALUES
(1, '2025-06-01', 'Present'),
(1, '2025-06-02', 'Absent'),
(2, '2025-06-01', 'Present'),
(3, '2025-06-01', 'Leave'),
(3, '2025-06-02', 'Present'),
(4, '2025-06-01', 'Present'),
(5, '2025-06-01', 'Present'),
(6, '2025-06-01', 'Absent'),
(6, '2025-06-02', 'Leave'),
(7, '2025-06-01', 'Present'),
(8, '2025-06-01', 'Absent');

select * from employees ;
select * from departments ;
select * from projects ;
select * from Employee_Projects ;
select * from Attendance;

-- ----------------------------
-- SQL QUESTIONS (MIXED)
-- ----------------------------

-- Below are 50 mixed SQL questions for practice

-- 1
-- Show the total number of employees in each department.
Select department_id, count(*) 
from Employees group by department_id ;

-- Join with Group By

select  d.department_name , count(e.emp_id) as Total  from Employees e 
join Departments d on e.department_id = d.department_id group by d.department_name ;

-- 2
-- List all employees with their respective department names.
select e.* , d.department_name from Employees e 
join Departments d on e.department_id = d.department_id ;

-- 3
-- Find departments where the average salary is greater than 60,000.

select  d.department_name , avg(e.salary) from Employees e 
join Departments d on e.department_id = d.department_id  
group by d.department_name having avg(e.salary) > 60000;

-- 4
-- Show names of employees and the names of the projects they are assigned to.

select e.name , p.project_name
from Employees e join Employee_Projects ep on e.emp_id = ep.emp_id 
join projects p on ep.project_id = p.project_id ;


-- 5
-- Find the number of employees managed by each manager.

-- For finding the manger_name and the employees that are working under the manager
select m.emp_id as manager_id,m.name as manager_name ,e.emp_id,e.name  as emp_name 
from employees m join employees e on  e.manager_id =m.emp_id ;

-- Answer
select  m.name as manager_name ,count(e.emp_id) as total 
from employees m join employees e on  e.manager_id =m.emp_id group by m.name;

-- 6
-- List departments that have more than 2 employees.
select d.department_name , count(*) from employees e join departments d
on e.department_id = d.department_id group by d.department_name having count(*) > 2;

-- 7
-- Show all employees and their manager names.
select e.name  as emp_name ,m.name as manager_name  
from employees m right join employees e on  e.manager_id =m.emp_id ;

-- 8
-- Show all departments even if they have no employees.
select d.department_name , count(e.emp_id) from employees e right join departments d 
on e.department_id = d.department_id group by d.department_name ;


-- 9
-- List all projects and the department they belong to.

select p.project_name , d.department_name
from projects p left join departments d on p.department_id =d.department_id ;
-- 10
-- Show the number of employees assigned to each project.
select p.project_name ,count(ep.emp_id)
from projects p join Employee_Projects ep on p.project_id=ep.project_id
group by p.project_name;

-- 11
-- List all employees and their attendance status on '2025-06-01'.
select e.emp_id,e.name ,a.status  
from employees e left join attendance a on e.emp_id = a.emp_id 
where a.attendance_date='2025-06-01';

-- 12
-- Find employees who have taken more than one 'Absent' leave.
select emp_id , count(*) as absent_days 
from Attendance where status= 'Absent' group by emp_id having count(*) > 1;
-- 13
-- List projects that are not assigned to any employee.
select p.project_name 
from projects p left join Employee_Projects ep on p.project_id = ep.project_id
where ep.emp_id=null;

-- 14
-- Show employee names and how many days they were present.
select e.name , count(*) as present_days
from employees e left join attendance a on e.emp_id = a.emp_id where status='Present' group by e.name ;
-- 15
-- List all departments along with the total salary cost.
select d.department_name , sum(e.salary ) 
from departments d left join employees e on e.department_id=d.department_id group by department_name ;

-- 16
-- Show employees who work on more than one project.
select e.name , count(*) from employees e 
join Employee_Projects ep on e.emp_id = ep.emp_id group by e.name having count(*) > 1 ;

-- 17
-- Show the department-wise average salary of employees.
select d.department_name , avg(e.salary) as Avg_salary from employees e 
join departments d on e.department_id=d.department_id group by department_name ;
-- 18
-- Find the total number of employees each project has.
select p.project_name , count(*) from
projects p join Employee_Projects ep on p.project_id=ep.project_id group by project_name ;
-- 19
-- Show employees who have no assigned department.
select name from employees where department_id Is NULL ;
-- 20
-- Find departments that have less than 2 projects.
select d.department_name , count(*) as project_count from departments d join 
projects p on d.department_id=p.department_id group by d.department_name having count(*)<2 ;
-- 21
-- List all projects even if no employee is assigned to them.
select distinct p.project_name from projects p left join Employee_Projects ep on p.project_id=ep.project_id ;
-- 22
-- Show employee name, their department name, and project name.
select e.name , d.department_name , p.project_name from employees e join departments d on e.department_id=d.department_id 
join projects p on p.department_id=e.department_id ;
