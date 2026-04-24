Using Azure Portal and Azure SQL Database

🔷 STEP 1: Open your Database
Go to SQL Databases
Click your DB → free-sql-db-8266076
Click Query Editor (preview)
Login using admin credentials
🔷 STEP 2: Implement Username/Password Authentication

👉 Run this (MAIN CODE):

CREATE USER user1 WITH PASSWORD = 'User@1234';

ALTER ROLE db_datareader ADD MEMBER user1;
ALTER ROLE db_datawriter ADD MEMBER user1;

✅ This:

Creates user with username/password
Grants read/write access
🔷 STEP 3: Verify User (IMPORTANT)

Run:

SELECT name, type_desc 
FROM sys.database_principals;

👉 You should see:

user1
🔷 STEP 4: Create Sample Table (for proof)
CREATE TABLE test_auth (
    id INT,
    name VARCHAR(50)
);

INSERT INTO test_auth VALUES (1, 'test');
SELECT * FROM test_auth;
🔷 STEP 5: (THEORY PART – MFA)

You usually won’t configure fully in exam, just explain:

👉 MFA is implemented using
Microsoft Entra ID

Say:

Enable MFA via Entra ID
Use Authenticator app / OTP
Apply via Conditional Access