STEP 1: Create Cosmos DB
Go to Azure Portal
Search → Cosmos DB
Click Create
🔷 STEP 2: Choose API

👉 Select:

Core (SQL) (document-based, like MongoDB)
🔷 STEP 3: Configure
Account Name → unique (e.g., mycosmosdb123)
Region → nearest
Capacity mode → Provisioned / Serverless (choose serverless if available)

Click Create

🔷 STEP 4: Create Database & Container
Go to Data Explorer
Click:
New Database → testdb
New Container → users
Partition key → /id
🔷 STEP 5: Insert Data
{
  "id": "1",
  "name": "Hrishikesh",
  "role": "student"
}
🔐 STEP 6: Implement Security Controls
✅ 1. Authentication (Access Keys)
Go to Keys
Use:
Primary Key (secure access)
✅ 2. RBAC (IMPORTANT)
Go to Access Control (IAM)
Add Role Assignment:
Role → Cosmos DB Built-in Data Reader / Contributor
Assign to user
✅ 3. Network Security
Go to Networking
Enable:
Selected networks only
Add your IP
✅ 4. Encryption
Data at rest → Enabled by default
Data in transit → TLS enabled
✅ 5. Fine-Grained Access (Optional)

Use Resource Tokens (advanced)

🧠 What to say in exam

“Implemented NoSQL security using Azure Cosmos DB with role-based access control, network restrictions, authentication keys, and encryption mechanisms.”

✅ ✅ WHAT TO SHOW (Firebase Security Practical)

Focus on Security Rules + Authentication

🔷 STEP 1: Enable Authentication
Go to Firebase Console
Open your project
Go to Authentication → Sign-in method
Enable:
Email/Password (or Google)
🔷 STEP 2: Create Database

Use Cloud Firestore (recommended)

Go to Firestore Database
Click Create Database
Start in Test mode (for now)
🔷 STEP 3: Implement Security Rules (MAIN PART)

Go to Firestore → Rules

❌ Insecure (show this first)
allow read, write: if true;

👉 Explain:

Anyone can access → insecure
✅ Secure Rules
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {

    match /users/{userId} {
      allow read, write: if request.auth != null 
                         && request.auth.uid == userId;
    }

  }
}
🔒 What this does
Only logged-in users can access
Users can access only their own data
🔷 STEP 4: Test

👉 Without login:

❌ Access denied

👉 After login:

✅ Access allowed
🔷 STEP 5: Extra Security (say for marks)
Role-based access:
allow read: if request.auth.token.role == "admin";
Input validation:
allow write: if request.resource.data.age > 0;
🧠 What to say in exam

“Implemented security in Firebase using authentication and Firestore security rules to restrict read/write access based on user identity and roles.”

🔥 Why Firebase is a GREAT choice
Real-time DB (bonus point)
Easy to demonstrate security failure + fix
Industry-relevant
🎯 FINAL ANSWER (write this)

“Security controls in Firebase are implemented using authentication and Firestore security rules to enforce access control, data validation, and user-based authorization.”