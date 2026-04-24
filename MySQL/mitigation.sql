CREATE DATABASE injection_lab;
USE injection_lab;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50)
);

INSERT INTO users (username, password)
VALUES ('admin', 'admin123'),
       ('user1', 'pass123');

INSERT INTO users (username, password) 
VALUES ('admin', 'admin123');

INSERT INTO users (username, password) 
VALUES ('john', 'john@123');

INSERT INTO users (username, password) 
VALUES ('alice', 'alice@456');

INSERT INTO users (username, password) 
VALUES ('rohit', 'rohit@789');

INSERT INTO users (username, password) 
VALUES ('testuser', '1234');

INSERT INTO users (username, password) 
VALUES ('hacker', 'pass123');


SELECT * FROM users 
WHERE username = ' " + user_input + " ' 
AND password = ' " + password_input + " ';

SELECT * FROM users 
WHERE username = '' OR '1'='1' 
AND password = 'anything';

PREPARE stmt FROM 
'SELECT * FROM users WHERE username=? AND password=?';

SET @uname='admin';
SET @pass='admin123';

EXECUTE stmt USING @uname, @pass;

DEALLOCATE PREPARE stmt;
