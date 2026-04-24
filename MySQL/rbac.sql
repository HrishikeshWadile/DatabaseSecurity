CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10,2)
);

CREATE ROLE 'admin_role';
CREATE ROLE 'manager_role';
CREATE ROLE 'employee_role';

GRANT ALL PRIVILEGES ON company_db.* TO 'admin_role';
GRANT SELECT, UPDATE ON company_db.employees TO 'manager_role';
GRANT SELECT ON company_db.employees TO 'employee_role';

CREATE USER 'admin1'@'localhost' IDENTIFIED BY 'admin123';
CREATE USER 'manager1'@'localhost' IDENTIFIED BY 'manager123';
CREATE USER 'emp1'@'localhost' IDENTIFIED BY 'emp123';

GRANT 'admin_role' TO 'admin1'@'localhost';
GRANT 'manager_role' TO 'manager1'@'localhost';
GRANT 'employee_role' TO 'emp1'@'localhost';

SET DEFAULT ROLE 'admin_role' TO 'admin1'@'localhost';
SET DEFAULT ROLE 'manager_role' TO 'manager1'@'localhost';
SET DEFAULT ROLE 'employee_role' TO 'emp1'@'localhost';

SHOW GRANTS FOR 'manager1'@'localhost';
