METHOD 1 (BEST FOR EXAM): Always Encrypted (Concept + Steps)
🔐 Step 1: Create Keys (conceptual in exam)

You mention:

Column Master Key (CMK) → stored securely (Key Vault)
Column Encryption Key (CEK) → used to encrypt data

👉 Use Azure Key Vault

🔐 Step 2: Create Table with Encrypted Columns
CREATE TABLE UsersSecure (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    aadhaar VARCHAR(20) 
        COLLATE Latin1_General_BIN2
        ENCRYPTED WITH (
            COLUMN_ENCRYPTION_KEY = CEK1,
            ENCRYPTION_TYPE = DETERMINISTIC,
            ALGORITHM = 'AEAD_AES_256_CBC_HMAC_SHA_256'
        )
);
🔐 Step 3: Insert Data (client-side encryption)

👉 Data gets encrypted automatically before storing

🧠 What to say in viva

“Sensitive columns are encrypted using Always Encrypted with Column Encryption Keys, ensuring data remains encrypted at rest and in transit.”

⚠️ Reality (important for you)

👉 This method:

❌ May NOT fully work in Portal Query Editor
✅ Works in SSMS / real environments

So for practical execution, use below method 👇

✅ METHOD 2 (WORKING IN AZURE PORTAL): Simple Column Encryption using HASH
🔷 Step 1: Create Table
CREATE TABLE Users (
    id INT,
    name VARCHAR(50),
    password_hash VARBINARY(256)
);
🔷 Step 2: Insert Encrypted Data
INSERT INTO Users VALUES (
    1,
    'Hrishikesh',
    HASHBYTES('SHA2_256', 'mypassword123')
);
🔷 Step 3: Verify
SELECT * FROM Users;

👉 Password will be stored as encrypted hash

🔐 Why this works for exam
Shows encryption applied to sensitive column
Actually runs in Azure portal
Easy to demonstrate