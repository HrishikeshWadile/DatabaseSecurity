CREATE DATABASE webapp_db;
USE webapp_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    password VARCHAR(255),
    email VARCHAR(100)
);

CREATE USER 'web_user'@'localhost' IDENTIFIED BY 'StrongPass@123';

GRANT SELECT, INSERT, UPDATE 
ON webapp_db.* 
TO 'web_user'@'localhost';

SHOW GRANTS FOR 'web_user'@'localhost';

SHOW VARIABLES LIKE '%ssl%';

USE webapp_db;

INSERT INTO users (username, password, email)
VALUES ('admin', '1234', 'admin@test.com');

SET SQL_SAFE_UPDATES = 0;

UPDATE mysql.user 
SET host='localhost' 
WHERE user='root';

FLUSH PRIVILEGES;

SET GLOBAL general_log = 'ON';
SHOW VARIABLES LIKE 'general_log_file';
