/*
 * Data Validation ETL Framework
 * Project #73 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SSIS
 * Created: 2013
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'ValidationETL')
BEGIN
    ALTER DATABASE ValidationETL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ValidationETL;
END
GO

CREATE DATABASE ValidationETL
ON PRIMARY
(
    NAME = 'ValidationETL_Data',
    FILENAME = 'C:\SQLData\ValidationETL_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'ValidationETL_Log',
    FILENAME = 'C:\SQLData\ValidationETL_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE ValidationETL SET RECOVERY SIMPLE;
ALTER DATABASE ValidationETL SET AUTO_UPDATE_STATISTICS ON;
GO

USE ValidationETL;
GO

PRINT 'Database ValidationETL created successfully';
PRINT 'Project: Data Validation ETL Framework';
PRINT 'Description: Business rules enforcement';
GO
