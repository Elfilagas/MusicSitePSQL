CREATE TABLE IF NOT EXISTS departments(
	department_id serial PRIMARY KEY,
	department_name varchar(100)
);

CREATE TABLE IF NOT EXISTS employees(
	employee_id serial PRIMARY KEY,
	employee_name varchar(50),
	department_id integer references departments(department_id),
	chef_id integer	
);

ALTER TABLE employees ADD FOREIGN KEY (chef_id) REFERENCES employees(employee_id);