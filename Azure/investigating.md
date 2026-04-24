HOW TO PERFORM THIS PRACTICAL
🔷 STEP 1: Create Sample Database
CREATE TABLE users (
    id INT,
    username VARCHAR(50),
    password VARCHAR(50)
);

INSERT INTO users VALUES (1, 'admin', 'admin123');
INSERT INTO users VALUES (2, 'user', 'user123');
🔴 STEP 2: Attack 1 – SQL Injection
❌ Vulnerable Query (Explain)
SELECT * FROM users 
WHERE username = 'input' AND password = 'input';

👉 Malicious input:

' OR 1=1 --

✔ Result:

Authentication bypass
✅ Mitigation

👉 Use stored procedure (safe method in Azure)

CREATE PROCEDURE safe_login
    @username VARCHAR(50),
    @password VARCHAR(50)
AS
BEGIN
    SELECT * FROM users
    WHERE username = @username AND password = @password;
END;
EXEC safe_login 'admin', 'admin123';
🔴 STEP 3: Attack 2 – Privilege Escalation
❌ Vulnerability
ALTER ROLE db_owner ADD MEMBER user1;

👉 Problem:

Normal user becomes admin
✅ Mitigation
ALTER ROLE db_owner DROP MEMBER user1;
ALTER ROLE db_datareader ADD MEMBER user1;

✔ Apply least privilege

🔴 STEP 4: Attack 3 – Weak Authentication
❌ Problem
Simple passwords like 1234
No MFA
✅ Mitigation
Strong passwords
Use Microsoft Entra ID
Enable MFA
🔴 STEP 5: Attack 4 – Data Exposure
❌ Problem
Plain text sensitive data
✅ Mitigation
INSERT INTO users VALUES (
    3,
    'secure_user',
    HASHBYTES('SHA2_256', 'mypassword')
);

✔ Data stored securely

🔴 STEP 6: Attack 5 – Unauthorized Access
❌ Problem
Open firewall / public access
✅ Mitigation
Restrict IP in Azure Networking
Use private endpoints
🔐 STEP 7: Encryption Attacks
Mitigation:
Enable TDE (encryption at rest)
Use TLS (encryption in transit)
🧠 FINAL ANSWER (write this)

“Investigated database vulnerabilities such as SQL injection, privilege escalation, weak authentication, and data exposure. Implemented mitigation strategies including parameterized queries, role-based access control, encryption, and secure authentication mechanisms.”