CREATE DATABASE encryption_lab;
USE encryption_lab;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARBINARY(255) NOT NULL
);

INSERT INTO users (username, password)
VALUES (
    'hrishi',
    AES_ENCRYPT('MySecurePassword', 'secretkey123')
);

SELECT * FROM users;

SELECT 
    username,
    AES_DECRYPT(password, 'secretkey123') AS decrypted_password
FROM users;

SELECT password FROM users;

SELECT 
    username,
    AES_DECRYPT(password, 'wrongkey') AS decrypted_password
FROM users;

