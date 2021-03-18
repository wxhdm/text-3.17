/* ������ѧ��ѧ�������ݿ⣬���ݿ���ΪJXGL��*/
USE master;          --��master���ݿ�
GO
--��֤���ݿ�JXGL�Ƿ���ڣ����������ɾ��
IF DB_ID (N'JXGL') IS NOT NULL
     DROP DATABASE JXGL;
GO
--SQL ServerĬ�������ļ���λ��
DECLARE @data_path nvarchar (256) ;
SET @data_path = (SELECT SUBSTRING(physical_name, 1,
                                     CHARINDEX(N'master.mdf' , LOWER(physical_name)) - 1)
                                   FROM master.sys.master_files
                                   WHERE database_id = 1 AND file_id = 1);
--ִ��CREATE DATABASE��䴴��JXGL���ݿ�
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

