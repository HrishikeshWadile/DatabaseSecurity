✅ Step 1: Login to Azure
Go to 👉 https://portal.azure.com
Sign in using your student account
✅ Step 2: Create SQL Database
In the search bar, type “SQL Database”
Click Create
✅ Step 3: Configure Basics

Fill the form:

Subscription → Select your student subscription
Resource Group → Click Create new → name it (e.g., db-rg)
Database Name → mydb
Server → Click Create new
✅ Step 4: Create Database Server

While creating server:

Server name → must be globally unique (e.g., hrishi-sql-server123)
Region → Choose nearest (e.g., Central India)
Authentication method → SQL authentication
Admin username → adminuser
Password → Strong password (important for security practical)

Click OK

✅ Step 5: Configure Compute + Storage
Click Configure database
Choose:
Basic (cheap/free-tier suitable)
Apply
✅ Step 6: Networking (IMPORTANT for exam)

Under Networking:

Select:
✅ Public endpoint
✅ Allow Azure services to access server
Click:
👉 Add current client IP (VERY IMPORTANT or you can’t connect)
✅ Step 7: Security Settings (Mention this in exam!)
Enable:
Transparent Data Encryption (TDE) → ON (default)
Optional (good for extra marks):
Defender for SQL → Basic plan
✅ Step 8: Review + Create
Click Review + Create
Wait for validation
Click Create

⏳ Deployment takes ~2–5 minutes

✅ Step 9: Access Database

After deployment:

Go to Resource
Click Query Editor
Login using:
Username: adminuser
Password: (your password)
✅ Step 10: Test (VERY IMPORTANT FOR PRACTICAL)

Run:

CREATE TABLE Students (
    id INT,
    name VARCHAR(50)
);

INSERT INTO Students VALUES (1, 'Hrishikesh');

SELECT * FROM Students;