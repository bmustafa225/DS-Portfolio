--- Employee with attributes (id, name, city, department, salary)
---Department with attributes (id, name)
---Company with attributes (id, name, revenue)


CREATE TABLE department(
	id INT IDENTITY(1,1) PRIMARY KEY,
	department_name VARCHAR(50) NOT NULL,);

CREATE TABLE company(
	id INT IDENTITY(1,1) PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    revenue INT)

CREATE TABLE Employee(
	id INT IDENTITY(1,1) PRIMARY KEY ,
    employee_name VARCHAR(150) NOT NULL,
    city VARCHAR(150) NOT NULL,
    department_id INT NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id)
);

/*
4. Add rows into Department table
(1, 'IT'),
(2, 'Management'),
(3, 'IT'),
(4, 'Support');
*/
INSERT INTO department(department_name)
VALUES
('IT'),
('Management'),
('IT'),
('Support');

/*
5. Add rows into Company table
(1, 'IBM', 2000000),
(2, 'GOOGLE', 9000000),
(3, 'Apple', 10000000);
*/
INSERT INTO company(company_name,revenue)
VALUES
('IBM', 2000000),
('GOOGLE', 9000000),
('Apple', 10000000);

/*
3.Add rows into employee table:
(1, 'David', 'London', 'IT', 80000),
(2, 'Emily', 'London', 'IT', 70000),
(3, 'Peter', 'Paris', 'IT', 60000),
(4, 'Ava', 'Paris', 'IT', 50000),
(5, 'Penny', 'London', 'Management', 110000),
(6, 'Jim', 'London', 'Management', 90000),
(7, 'Amy', 'Rome', 'Support', 30000),
(8, 'Cloe', 'London', 'IT', 110000);
*/
INSERT INTO employee (employee_name,city,department_id,salary)
VALUES
('David', 'London', 3, 80000),
('Emily', 'London', 3, 70000),
('Peter', 'Paris', 3, 60000),
('Ava', 'Paris', 3, 50000),
('Penny', 'London', 2, 110000),
('Jim', 'London', 2, 90000),
('Amy', 'Rome', 4, 30000),
('Cloe', 'London', 3, 110000);
