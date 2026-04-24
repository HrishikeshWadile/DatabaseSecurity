STEP 1: Enforce Encryption in Transit (TLS)
Go to your SQL Server (not database)
Open Networking
Set:
Minimum TLS Version → 1.2

👉 This ensures all app–DB communication is encrypted

🔷 STEP 2: Use Secure Authentication
Option 1 (basic)
Use strong username/password
Option 2 (better – mention in exam)

Use Microsoft Entra ID

👉 Benefits:

Supports MFA
No hardcoded passwords
🔷 STEP 3: Restrict Network Access
Go to Networking
Select:
Selected networks only
Add:
Your IP
App server IP

👉 Prevents unauthorized access

🔷 STEP 4: Secure Connection String
❌ Bad (vulnerable)
Server=xyz.database.windows.net;Database=testdb;User Id=admin;Password=1234;
✅ Good (secure)
Server=xyz.database.windows.net;
Database=testdb;
Authentication=Active Directory Default;
Encrypt=True;
TrustServerCertificate=False;

👉 Important:

Encrypt=True → TLS enabled
Avoid hardcoding password
🔷 STEP 5: Store Secrets Securely

Use:
👉 Azure Key Vault

Store DB credentials
App retrieves securely
🔷 STEP 6: Prevent SQL Injection

Use:

Parameterized queries
Stored procedures

(You already implemented this 👍)

🔷 STEP 7: Verify Secure Connection

Run:

SELECT session_id, encrypt_option 
FROM sys.dm_exec_connections;

👉 Should show:

encrypt_option = TRUE
🔐 Additional Measures (say for extra marks)
Use Private Endpoint
Enable firewall rules
Use least privilege users
Enable auditing/logging
🧠 FINAL ANSWER (write this)

“Secured the connection between web application and database by enforcing TLS encryption, using secure authentication mechanisms, restricting network access, storing credentials securely, and preventing SQL injection using parameterized queries.”

🎯 What examiner expects

✔ TLS enabled
✔ Secure auth explained
✔ Network control
✔ Safe connection handling