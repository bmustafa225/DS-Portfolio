select * from department;
go

select * from employee;
go
select * from company;
go
--- Update department name to 'Management where id=1---
update department
set department_name='Management'
where id=1
go
--- Query all employees with salary equal to 80 000---
select *
from employee
where salary=80000;
go

---Query all employees with salary not equal to 80 000---
select *
from employee 
where salary <> 80000;
go

---Query all names of employees with salary greater than 70 000 together with employees who work on the 'IT' department.---
select employee_name
from employee
join department on employee.department_id =department.id
where employee.salary >70000 and department.department_name='IT';
go

---Query all employees that work in city that starts with 'L'---
select *
from employee
where city like 'L%';
go

---Query all employees that work in city that starts with 'L' or ends with 's'---
select *
from employee
where city like 'L%' or city like '%s';
go

---Query names of all employees together with id of department they work in, but you cannot use JOIN---
select employee.employee_name, employee.department_id,department.department_name
from employee,department
where employee.department_id=department.id;
go

--- Query names of all employees together with id of department they work in, using JOIN---
select employee.employee_name, employee.department_id,department.department_name
from employee
join department on employee.department_id=department.id;
go

---Query name of every company together with departments without the 'Support' department---


---Query all employees that work in same department as Peter---
select employee_name,department_id
from employee
where department_id in (select department_id from employee where employee_name='Peter');
go