
WHAT YOU SHOULD EXECUTE IN AZURE

Using Azure SQL Database

🔷 STEP 1: Create Sample Table
CREATE TABLE users (
    id INT,
    username VARCHAR(50),
    password VARCHAR(50)
);
🔷 STEP 2: Insert Data
INSERT INTO users VALUES (1, 'admin', 'admin123');
INSERT INTO users VALUES (2, 'user', 'user123');
🔴 STEP 3: Show Vulnerable Query (JUST EXPLAIN)
-- This is vulnerable (DO NOT USE IN REAL SYSTEM)
SELECT * FROM users 
WHERE username = 'admin' AND password = 'admin123';

👉 Explain:
If input is:

' OR 1=1 --

→ login bypass

✅ STEP 4: SAFE METHOD (Execute THIS)

👉 Use Stored Procedure (acts like parameterized query)

CREATE PROCEDURE safe_login
    @username VARCHAR(50),
    @password VARCHAR(50)
AS
BEGIN
    SELECT * FROM users
    WHERE username = @username AND password = @password;
END;
🔷 STEP 5: Execute Procedure
EXEC safe_login 'admin', 'admin123';
🔒 Why this works
Parameters are not executed as SQL
Prevents injection attacks
🧠 What to say in exam

“Parameterized queries are implemented using stored procedures in Azure SQL, which prevent SQL injection by treating user inputs as parameters instead of executable SQL.”

🔥 EXTRA (optional but good)

You can say:

Input validation is done at application level
Stored procedures + least privilege improve security
🎯 FINAL PRACTICAL FLOW

✔ Create table
✔ Insert data
✔ Create stored procedure
✔ Execute procedure

👉 That’s enough for full marks


For this practical, the examiner wants to see that you understand why SQL injection happens and how to prevent it in code + database usage. You usually demonstrate with a small example, not just theory.

🔷 What you need to show
❌ Vulnerable query (SQL Injection)
✅ Input validation
✅ Parameterized query (main solution)
🔴 PART 1: Vulnerable Example (Explain only)
SELECT * FROM users WHERE username = ' " + input + " ' AND password = ' " + pass + " ';

👉 If user enters:

' OR 1=1 --

✔ Query becomes always true → login bypass

✅ PART 2: Input Validation

👉 Basic filtering before query execution

Example (logic)
Reject:
'
--
;
Allow only:
letters + numbers
Example (pseudo-code)
if (!username.matches("[a-zA-Z0-9]+")) {
    throw new Exception("Invalid input");
}
✅ PART 3: Parameterized Queries (MAIN PART)

This is the most important mitigation

🔷 Example (Java JDBC)
String query = "SELECT * FROM users WHERE username = ? AND password = ?";
PreparedStatement stmt = conn.prepareStatement(query);

stmt.setString(1, username);
stmt.setString(2, password);

ResultSet rs = stmt.executeQuery();
🔷 Example (Python)
cursor.execute(
    "SELECT * FROM users WHERE username = %s AND password = %s",
    (username, password)
)
🔷 Example (C#)
SqlCommand cmd = new SqlCommand(
    "SELECT * FROM users WHERE username=@u AND password=@p", conn);

cmd.Parameters.AddWithValue("@u", username);
cmd.Parameters.AddWithValue("@p", password);
🧠 Why Parameterized Queries Work
Query structure is fixed
User input is treated as data, not SQL code
🔷 PART 4: Azure Context (Optional line for exam)

If using Azure SQL Database:

Injection prevention is handled at application layer
Database executes safe queries only
🔒 Additional Mitigation (Say for extra marks)
Use stored procedures
Apply least privilege access
Use ORM frameworks
Enable logging and monitoring
🧠 FINAL ANSWER (write this)

“SQL injection is mitigated using input validation and parameterized queries. Parameterized queries ensure user input is treated as data rather than executable SQL code, preventing malicious query manipulation.”

🎯 What examiner expects

✔ You showed vulnerable case
✔ You implemented parameterized query
✔ You explained why it works

