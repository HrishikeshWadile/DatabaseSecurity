STEP 1: Create Users
CREATE USER student1 WITH PASSWORD = 'Student@123';
CREATE USER admin1 WITH PASSWORD = 'Admin@123';
🔴 STEP 2: Simulate Privilege Escalation (VULNERABLE SETUP)

👉 Give excessive permissions:

ALTER ROLE db_owner ADD MEMBER student1;

📌 Problem:

student1 now has full control
Can create tables, delete data, grant permissions → privilege escalation
🔍 STEP 3: Show Impact
-- student1 can now do:
DROP TABLE users;

👉 Explain:
“Low-privileged user gained admin-level control.”

✅ STEP 4: Mitigation (FIX)
🔷 Remove excessive privilege
ALTER ROLE db_owner DROP MEMBER student1;
🔷 Assign least privilege
ALTER ROLE db_datareader ADD MEMBER student1;

👉 Now:

Can only read data
Cannot modify structure or permissions
🔒 STEP 5: Additional Protection
1. Avoid dangerous permissions
-- DO NOT grant:
GRANT CONTROL TO student1;
GRANT ALTER ANY USER TO student1;
2. Use custom roles
CREATE ROLE limited_role;

GRANT SELECT ON OBJECT::users TO limited_role;

ALTER ROLE limited_role ADD MEMBER student1;
3. Monitor permissions
SELECT * FROM sys.database_role_members;
🧠 What to say in viva

👉 What is privilege escalation?
“Unauthorized increase of user privileges beyond intended level.”

👉 How prevented?

Least privilege principle
Avoid db_owner role
Use custom roles
Regular auditing
🎯 FINAL ANSWER (write this)

“Privilege escalation was tested by assigning excessive permissions to a user and observing elevated access. It was mitigated by revoking unnecessary privileges and enforcing least privilege using role-based access control.”

🔥 Pro Tip (for marks)

Say this line:

“Security misconfiguration is a major cause of privilege escalation.”