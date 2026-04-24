🔷 🔐 PART 1: Encryption at Rest (TDE)
✅ What it means

Data stored on disk is encrypted automatically.

🔷 Steps to Enable / Verify
Go to your SQL Database
In left menu → Click Transparent Data Encryption
Check:
👉 Status = ON
✅ If OFF:
Click ON
Save
🧠 What to say in exam

“Encryption at rest is implemented using Transparent Data Encryption (TDE), which encrypts database files, backups, and logs.”

🔷 🔐 PART 2: Encryption in Transit (SSL/TLS)
✅ What it means

Data moving between:

Client ↔ Database
is encrypted using SSL/TLS
🔷 Steps to Enable
Go to SQL Server (not database)
Click Networking
Find:
👉 Minimum TLS Version
Set:
👉 TLS 1.2 (or higher)
🔷 Also ensure:
“Allow Azure services” is ON (for connectivity)
Connections use encrypted channels (default)
🧠 What to say in exam

“Encryption in transit is ensured using TLS protocol, which secures communication between client and database server.”

🔷 🔍 STEP 3: Verify Encryption
For TDE:

Run:

SELECT name, is_encrypted 
FROM sys.databases;

👉 1 = encrypted

For TLS:

Explain:

Azure enforces encrypted connections
Clients like SSMS connect using SSL by default
🔥 EXTRA (for more marks)

Mention:

Certificates used for TLS
Azure manages keys automatically
Can use customer-managed keys via Azure Key Vault
