use Master;
go
create database Prog04_Proj02
on
(
	name = 'Prog04_Proj02',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Prog04_Proj02.mdf',
	size = 1MB,
	maxsize = 20MB, 
	filegrowth = 5
)
log on
(
	name = 'Prog04_Proj02_log',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Log\Prog04_Proj02_log.ldf',
	size = 1MB,
	maxsize = 20MB, 
	filegrowth = 5
)
go