use Prog04_Proj02
go
create table usuarios
(
	CodUsuario int identity primary key,
	Cedula int not null,
	NomUsuario nvarchar(50) not null,
	activo bit not null default(1)
)
go

select name from sysobjects where type='U'

insert into usuarios values (202020202, 'Calrlos', 1)

select CodUsuario, Cedula, NomUsuario, activo from usuarios

update usuarios set Cedula=101010 where activo=1

delete from usuarios where NomUsuario = 'Calrlos'

drop table usuarios