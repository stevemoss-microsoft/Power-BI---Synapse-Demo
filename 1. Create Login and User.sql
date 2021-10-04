/*
Scripts to create loading user with necessary permissions/resource level
*/

-- **** Replace password with a strong password
-- Run the next 2 lines IN Master Database
CREATE LOGIN LoaderRC20 WITH PASSWORD = 'a123STRONGpassword!0190';
CREATE USER LoaderRC20 FOR LOGIN LoaderRC20;

-- Run In User database after changing name to your database name
CREATE USER LoaderRC20 FOR LOGIN LoaderRC20;
--CHANGE Database name to your database
GRANT CONTROL ON DATABASE::[dedpoolmoss] to LoaderRC20;
EXEC sp_addrolemember 'staticrc20', 'LoaderRC20';

--then login as this user and run below scripts
