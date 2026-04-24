CREATE DATABASE attack_test_db;
USE attack_test_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    password VARCHAR(100),
    role VARCHAR(50)
);

INSERT INTO users (username, password, role)
VALUES 
('admin', 'admin123', 'administrator'),
('user1', 'user123', 'employee');

SELECT * FROM users 
WHERE username = 'admin' AND password = 'admin123';

SELECT * FROM users 
WHERE username = 'admin'; -- ' AND password = ;

PREPARE stmt FROM 
'SELECT * FROM users WHERE username = ? AND password = ?';

SET @u = 'admin';
SET @p = 'admin123';

EXECUTE stmt USING @u, @p;

CREATE DATABASE attack_test_db;

CREATE USER 'low_user'@'localhost' IDENTIFIED BY 'low123';

GRANT SELECT ON attack_test_db.* TO 'low_user'@'localhost';

GRANT ALL PRIVILEGES ON attack_test_db.* 
TO 'low_user'@'localhost';

REVOKE ALL PRIVILEGES ON attack_test_db.* FROM 'low_user'@'localhost';

GRANT SELECT ON attack_test_db.users TO 'low_user'@'localhost';

SHOW GRANTS FOR 'low_user'@'localhost';

SHOW VARIABLES LIKE 'general_log';

SET GLOBAL general_log = 'ON';

SHOW STATUS LIKE 'Ssl_cipher';

