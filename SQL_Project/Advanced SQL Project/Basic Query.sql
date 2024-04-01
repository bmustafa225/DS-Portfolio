

--- How many total employees in this company ?---
select 
		COUNT(*) as total_employees
from staff;
go

---What about gender distribution?---
select 
		gender,
		COUNT(*) as gender_count
from staff
group by gender;
go

---How many employees in each department ?---
select 
		department,
		COUNT(*) as no_of_employees
from staff
group by department;
go


---What is the highest and lowest salary of employees?---
select
		MIN(salary) as lowest_salary, 
		MAX(salary) as highest_salary
from staff;
go

---what about salary distribution by gender group?---
select 
		gender,
		MIN(salary) as min_salary,
		AVG(salary) as avg_salary,
		MAX(salary) as max_salary,
		ROUND(STDEV(salary),3) as stdev_salary
from staff
group by gender;
go

---What is the distribution of min, max average salary by department ?---
select 
		department,
		MIN(salary) as min_salary,
		AVG(salary) as avg_salary,
		MAX(salary) as max_salary,
		ROUND(STDEV(salary),3) as stdev_salary
from staff
group by department;
go

---how spread out those salary around the average salary in each department ?---
select 
		MIN(salary) as min_salary,
		AVG(salary) as avg_salary
		MAX(salary) as max_salary,
		STDEV(salary) as var_salary
from staff
group by department;
go

---which department has the highest salary spread out ?---
select TOP 5
		department,
		ROUND(STDEV(salary),3) as highest_salary_spread
from staff 
group by department
order by highest_salary_spread desc;
go

---Show Health department salary---
select 
		department,
		MIN(salary) as min_salary,
		AVG(salary) as avg_salary,
		MAX(salary) as max_salary,
		ROUND(STDEV(salary),3) as stdev_salary
from staff
group by department
having department like '%Health%';
go

---we will make 3 buckets to see the salary earning status for Health Department ---
select 
		department,
		last_name,
		salary,
		(CASE
			WHEN salary >= (AVG(salary)+STDEV(salary)) THEN 'High Income'
			WHEN salary BETWEEN (AVG(salary)-STDEV(salary),AVG(salary)+STDEV(salary)) THEN 'Average income'
			ELSE 'Low Income'
			) END as earning_status
from staff
group by department
having deparment like '%Health%';
go

CREATE VIEW health_dept_earning_status
AS 
	SELECT 
		CASE
			WHEN salary >= 100000 THEN 'high earner'
			WHEN salary >= 50000 AND salary < 100000 THEN 'middle earner'
			ELSE 'low earner'
		END AS earning_status
	FROM staff
	WHERE department LIKE 'Health';
go

