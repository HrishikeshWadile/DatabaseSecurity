# MySQL Setup (Local Database Server)

Yes, but here’s the correct full flow:

## 1. Install MySQL

Download and install:

MySQL Server
MySQL Workbench

### Use the MySQL Installer (it installs both together)

## 2. Configure MySQL Server

During installation:

Set root username → root
Set password (remember this)
Choose:
Standalone server
Default port: 3306

## 3. Start the Server
It usually starts automatically
Or check via:
Windows Services → MySQL → Running

## 4. Connect using Workbench

Open MySQL Workbench:

Create new connection:
Host: localhost
Port: 3306
User: root
Password: (your password)

## 5. Test Database

Run:
`
SHOW DATABASES;

CREATE DATABASE testdb;
USE testdb;

CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50)
);
`
INSERT INTO users (name) VALUES ('Hrishikesh');

SELECT * FROM users;

### If this works → your MySQL setup is done.