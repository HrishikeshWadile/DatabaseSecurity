🔷 STEP 1: Create Users
CREATE USER student1 WITH PASSWORD = 'Student@123';
CREATE USER teacher1 WITH PASSWORD = 'Teacher@123';
🔷 STEP 2: Assign Roles
-- Student: Read only
ALTER ROLE db_datareader ADD MEMBER student1;

-- Teacher: Read + Write
ALTER ROLE db_datareader ADD MEMBER teacher1;
ALTER ROLE db_datawriter ADD MEMBER teacher1;
🔷 STEP 3: (Optional Advanced – for extra marks)

Create custom role:

CREATE ROLE custom_role;

GRANT SELECT ON OBJECT::users TO custom_role;

ALTER ROLE custom_role ADD MEMBER student1;
🔷 STEP 4: Verify Roles
SELECT 
    dp.name AS UserName, 
    dr.name AS RoleName
FROM sys.database_role_members drm
JOIN sys.database_principals dr ON drm.role_principal_id = dr.principal_id
JOIN sys.database_principals dp ON drm.member_principal_id = dp.principal_id;
🧠 What to say in exam

“Role-Based Access Control is implemented by assigning database roles to users, ensuring controlled access based on user responsibilities.”

🔥 If examiner asks about Azure RBAC

Say this smartly:

“Azure RBAC at resource group level controls management access, while database RBAC controls data-level permissions. For this practical, database RBAC is used.”

🎯 Final Answer (write this)

“Implemented RBAC by creating users and assigning predefined and custom roles to control access permissions within the database.”