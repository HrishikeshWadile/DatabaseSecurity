CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'Test@123';

SELECT user, host FROM mysql.user;

GRANT SELECT ON *.* TO 'testuser'@'localhost';

SHOW GRANTS FOR 'testuser'@'localhost';

SHOW STATUS LIKE 'Ssl_cipher';

CREATE ROLE 'analyst_role';

CREATE USER 'analyst_user'@'localhost' IDENTIFIED BY 'Test@123';

GRANT 'analyst_role' TO 'analyst_user'@'localhost';

GRANT 'analyst_role' TO 'analyst_user'@'localhost';
SET DEFAULT ROLE 'analyst_role' TO 'analyst_user'@'localhost';

SHOW GRANTS FOR 'analyst_user'@'localhost';


SET GLOBAL general_log = 'ON';

SHOW VARIABLES LIKE 'general_log';

USE COMPANY_DB;
SHOW TABLES FROM COMPANY_DB;
SELECT * FROM employees;

INSERT INTO employees (name, department, salary)
VALUES ('Rahul', 'HR', 50000), ('Sneha', 'IT', 60000);

CREATE VIEW masked_employees AS
SELECT 
    id,
    name,
    'XXXXX' AS salary
FROM employees;

SELECT * FROM masked_employees;

CREATE ROLE 'analyst_role';
GRANT SELECT ON masked_employees TO 'analyst_role';

GRANT 'analyst_role' TO 'analyst_user'@'localhost';
SET DEFAULT ROLE 'analyst_role' TO 'analyst_user'@'localhost';


SELECT user, host FROM mysql.user;

SHOW GRANTS FOR 'testuser'@'localhost';

SHOW VARIABLES LIKE 'validate_password%';

SHOW STATUS LIKE 'Ssl_cipher';