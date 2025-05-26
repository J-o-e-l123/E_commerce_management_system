-- Create Login and User for Customer Role
CREATE LOGIN customer_user WITH PASSWORD = 'SecurePass123!';
CREATE USER customer_user FOR LOGIN customer_user;

-- Assign Read Access Only
EXEC sp_addrolemember 'db_datareader', 'customer_user';
EXEC sp_droprolemember 'db_datawriter', 'customer_user';

-- Create Admin User
CREATE LOGIN admin_user WITH PASSWORD = 'AdminPass123!';
CREATE USER admin_user FOR LOGIN admin_user;

-- Assign Full Access
EXEC sp_addrolemember 'db_owner', 'admin_user';