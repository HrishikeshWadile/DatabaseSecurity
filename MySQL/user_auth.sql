CREATE DATABASE auth_lab;

CREATE USER 'auth_user'@'localhost'
IDENTIFIED BY 'Auth@123';

GRANT SELECT, INSERT
ON auth_lab.*
TO 'auth_user'@'localhost';
FLUSH PRIVILEGES;

USE auth_lab;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255)
);