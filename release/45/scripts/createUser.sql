USE [master]
GO
CREATE LOGIN [subuser] WITH PASSWORD=N'DFFEEFDDBECFB', DEFAULT_DATABASE=[Subsidy], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
USE [Subsidy]
GO
CREATE USER [subuser] FOR LOGIN [subuser]
GO
USE [Subsidy]
GO
ALTER USER [subuser] WITH DEFAULT_SCHEMA=[subuser]
GO
USE [Subsidy]
GO
CREATE SCHEMA [subuser] AUTHORIZATION [subuser]
GO
USE [Subsidy]
GO
EXEC sp_addrolemember N'sa', N'subuser'
GO
