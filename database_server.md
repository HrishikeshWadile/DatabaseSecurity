# Part 1: MySQL Setup (Local Database Server)

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

# Part 2: Azure Setup (Cloud Database / Infra)

What you said is incomplete—logging in is just the start.

## 1. Install Azure CLI

Yes, correct:

winget install Microsoft.AzureCLI

Check install:

az version

## 2. Login to Azure
az login

Verify:

az account show

### This only confirms login—not setup.

## 3. Create Resource Group

Azure needs a container for resources:

az group create --name myResourceGroup --location centralindia

## 4. Create MySQL Database on Azure

Use:

Azure Database for MySQL

Command:

az mysql flexible-server create \
  --resource-group myResourceGroup \
  --name mymysqlserver123 \
  --location centralindia \
  --admin-user myadmin \
  --admin-password MyPassword123!

## 5. Allow Access (Important)
az mysql flexible-server firewall-rule create \
  --resource-group myResourceGroup \
  --name mymysqlserver123 \
  --rule-name allowMyIP \
  --start-ip-address YOUR_IP \
  --end-ip-address YOUR_IP
  
## 6. Connect from Workbench

Use:

Host: mymysqlserver123.mysql.database.azure.com
User: myadmin
Password: (what you set)