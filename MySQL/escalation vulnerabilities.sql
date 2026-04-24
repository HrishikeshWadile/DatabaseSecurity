CREATE DATABASE security_test_db;
USE security_test_db;

CREATE TABLE records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    confidential_data VARCHAR(255)
);

INSERT INTO records (username, confidential_data)
VALUES 
('user1', 'Private Info 1'),
('user2', 'Private Info 2');

CREATE USER 'low_user'@'localhost' IDENTIFIED BY 'low123';
CREATE USER 'high_user'@'localhost' IDENTIFIED BY 'high123';

GRANT SELECT, INSERT, UPDATE, DELETE ON security_test_db.* 
TO 'low_user'@'localhost' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON security_test_db.* 
TO 'high_user'@'localhost';

REVOKE GRANT OPTION ON security_test_db.* 
FROM 'low_user'@'localhost';

REVOKE ALL PRIVILEGES ON security_test_db.* 
FROM 'low_user'@'localhost';

GRANT SELECT ON security_test_db.records 
TO 'low_user'@'localhost';

SHOW GRANTS FOR 'low_user'@'localhost';

CREATE ROLE 'read_only_role';
GRANT SELECT ON security_test_db.records TO 'read_only_role';
GRANT 'read_only_role' TO 'low_user'@'localhost';
SET DEFAULT ROLE 'read_only_role' TO 'low_user'@'localhost';

