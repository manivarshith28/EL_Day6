use day6;

-- Finding employees who work in a department
-- Method 1 : 
select eid, ename from emp where exists 
(
	select * from dept where dept.eid = emp.eid
);
-- Method 2 :
select emp.eid, ename from emp, dept where emp.eid = dept.eid;
-- Method 3 : 
select eid, ename from emp where eid in 
(
	select eid from dept
);

-- details of a student with max intern_salary 
select * from student where intern_salary = 
(
	select max(intern_salary) from student
);

-- 2nd highest intern_salary
select max(intern_salary) from student where intern_salary <> 
(
	select max(intern_salary) from student
);

-- details of a student with 2nd highest intern_salary
select * from student where intern_salary = 
(
	select max(intern_salary) from student where intern_salary <>
    (
		select max(intern_salary) from student
	)
);

-- no.of students working in a role
select role as Department, count(*) as No_of_Employees 
from student group by role;

-- roles with less than two working students & their details
select sname, role from student where role in 
(
	select role from student group by role having count(*) < 2
);

-- roles with exactly two working students & their details
select sname, role from student where role in
(
	select role from student group by role having count(*) = 2
);

-- highest inter_salary role wise
select sname, role, intern_salary from student where intern_salary in 
(
	select max(intern_salary) from student group by role
);
