/* 创建大学教学管理数据库，数据库名为JXGL。*/
USE master;          --打开master数据库
GO
--验证数据库JXGL是否存在，如果存在则删除
IF DB_ID (N'JXGL') IS NOT NULL
     DROP DATABASE JXGL;
GO
--SQL Server默认数据文件的位置
DECLARE @data_path nvarchar (256) ;
SET @data_path = (SELECT SUBSTRING(physical_name, 1,
                                     CHARINDEX(N'master.mdf' , LOWER(physical_name)) - 1)
                                   FROM master.sys.master_files
                                   WHERE database_id = 1 AND file_id = 1);
--执行CREATE DATABASE语句创建JXGL数据库
EXECUTE
('CREATE DATABASE JXGL
ON
( NAME = JXGL_data, FILENAME =''' + @data_path +'JXGL.mdf'', SIZE= 5,
MAXSIZE = 200,FILEGROWTH= 5% )
LOG ON
( NAME = JXGL_log, FILENAME = '''+ @data_path +'JXGL.1df'',
SIZE = 5MB, MAXSIZE = 50MB,FILEGROWTH= 2MB )'
);
GO

