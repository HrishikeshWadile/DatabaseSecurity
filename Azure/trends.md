✅ ✅ WHAT YOU WILL DEMONSTRATE

You’ll show 3 emerging trends practically:

Fine-grained access control
Authentication & Zero Trust
Encryption

Using:

Azure SQL Database
Firebase
(Optional but strong) Supabase
🔷 🔷 DEMO 1: Fine-Grained Access Control (VERY IMPORTANT)
👉 Option A (Firebase – easiest)

Go to Firestore → Rules

❌ Show insecure:
allow read, write: if true;
✅ Then fix:
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null 
                         && request.auth.uid == userId;
    }
  }
}

👉 Show:

Without login → ❌ denied
After login → ✅ allowed

✔ This demonstrates:

Zero Trust
Fine-grained access
👉 Option B (Supabase – BEST if you want extra marks)

Enable RLS:

ALTER TABLE users ENABLE ROW LEVEL SECURITY;

CREATE POLICY "User can access own data"
ON users
FOR SELECT
USING (auth.uid() = user_id);

👉 Explain:

Users can only access their own data
🔷 🔷 DEMO 2: Authentication (Zero Trust)
Firebase:
Go to Authentication
Enable Email/Password
Login user

👉 Show:

Before login → no access
After login → access allowed

✔ Say:
“Access is granted only after identity verification.”

🔷 🔷 DEMO 3: Encryption
Azure SQL:
Step 1: Check TDE

Go to:

Database → Transparent Data Encryption
Show: ON
Step 2: Verify via query
SELECT name, is_encrypted 
FROM sys.databases;
Step 3: Show TLS
SELECT encrypt_option 
FROM sys.dm_exec_connections;

👉 Should show TRUE

🔷 🔷 DEMO 4 (Optional but good): Secure Data Storage
INSERT INTO users VALUES (
    1,
    'secure_user',
    HASHBYTES('SHA2_256', 'mypassword')
);

👉 Show hashed password

🧠 WHAT TO SAY DURING DEMO

Say these lines:

“Implemented fine-grained access using rules/RLS”
“Applied Zero Trust using authentication”
“Ensured encryption at rest and in transit”
“Protected sensitive data using hashing”
🎯 FINAL FLOW (DO THIS IN EXAM)

✔ Firebase:

Show rules + login

✔ Azure:

Show TDE + TLS

✔ (Optional):

Show RLS in Supabase
🧾 FINAL ANSWER (WRITE THIS)

“Demonstrated emerging trends in DBMS security including zero-trust authentication, fine-grained access control using security rules, and encryption mechanisms for securing data at rest and in transit.”