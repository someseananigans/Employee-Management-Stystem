CREATE DATABASE employees_db;
​
USE employees_db;
​
CREATE TABLE departments (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(25) UNIQUE NOT NULL
);
​
CREATE TABLE roles (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(25) UNIQUE NOT NULL,
  salary FLOAT UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (department_id) REFERENCES departments(id)
);
​
CREATE TABLE employees (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR(25) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  manager_id INT UNSIGNED,
  FOREIGN KEY (role_id) REFERENCES roles(id),
  FOREIGN KEY (manager_id) REFERENCES employees(id)
);
​
SELECT employees.id, employees.first_name, employees.last_name, roles.title, roles.salary, departments.name AS 'department', CONCAT(manager.first_name, ' ', manager.last_name) AS manager
FROM employees
LEFT JOIN roles ON employees.role_id = roles.id
LEFT JOIN departments ON roles.department_id = departments.id
LEFT JOIN employees manager ON manager.id = employees.manager_id;