# User Authentication in MySQL (Local DB)

## Step 1: Create User
CREATE USER 'appuser'@'localhost' IDENTIFIED BY 'password123';

## Step 2: Grant Permissions
GRANT ALL PRIVILEGES ON testdb.* TO 'appuser'@'localhost';
FLUSH PRIVILEGES;

## Step 3: Test Login

Login using:

Username: appuser
Password: password123

### This implements username/password authentication

## (Optional – MFA Concept for Exam)

MySQL doesn’t directly provide MFA by default, but you can mention:

Use plugins like:
MySQL Enterprise Authentication
Or implement MFA at application level (OTP/email)

### Example explanation line:

MFA can be implemented by combining password login with OTP verification using external services.



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