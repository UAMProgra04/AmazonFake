--Tablas para Creacion de Cuenta y Login--
use Prog04_Proj02
go

--Creacion de la tabla PERFILES--
create table PERFILES
(
P_Id_Perfil tinyint primary key,
P_Nombre_Perfil nvarchar(15),
P_Descripcion_perfil nvarchar(30)
)
-- Fin Creacion de la tabla Perfiles--

--Creacion de la tabla USUARIOS--
create table USUARIOS
(
U_Correo nvarchar(20) primary key,
U_Nombre nvarchar(30) not null,
U_Identificacion int,
U_Direccion nvarchar(50),
U_Telefono nvarchar(15),
U_Perfil tinyint not null references PERFILES(P_Id_Perfil)
)
-- Fin Creacion de la tabla USUARIOS--

--Creacion de la tabla LOGIN--
create table LOGIN
(
L_Correo nvarchar(20) primary key,
L_Nombre nvarchar(30) not null,
L_Password nvarchar(12) not null,
L_Estado bit not null
)
-- Fin Creacion de la tabla LOGIN--


--drop table Informacion_Tarjeta
--(
--It_Correo nvarchar(20) primary key,
--It_Nombre_tarjeta nvarchar(30),
--It_Numero_tarjeta nvarchar(19),
--It_Fecha_Vencimiento nvarchar(5),
--It_Codigo_Seguridad nvarchar(4),
--)

--Store Procedures para Creacion de Cuenta y Login--
use Prog04_Proj02
go

--Crecion de los PERFILES de la tabla PERFILES--
begin transaction
begin try
	insert into PERFILES (P_Id_Perfil, P_Nombre_Perfil, P_Descripcion_perfil)
	values
	(0, 'Root', 'Perfil con maximo privilegio'),
	(1, 'Admin', 'Perfil Adminitrativo'),
	(2, 'User', 'Perfil de Clientes')
	commit transaction
end try
begin catch
	rollback transaction
end catch

--Creacion del Store Procedure para la creacion de las cuentas de usuario y su login--
alter procedure SP_Create_User_Account
	@Correo nvarchar(20),
	@Nombre nvarchar(30),
	@Password nvarchar(12)
as 
begin transaction 
	begin try
		insert into  USUARIOS (U_Correo, U_Nombre, U_Perfil)
		values (@Correo, @Nombre, 2)

		insert into  LOGIN (L_Correo, L_Nombre, L_Password, L_Estado)
		values (@Correo,@Nombre, @Password, 1)

		commit transaction
	end try
	begin catch
		rollback transaction
	end catch

--Creacion del Store Procedure para la elimiacion de las cuentas de usuario y su login--
alter procedure SP_Delete_User_Account
	@Correo nvarchar(20),
	@Password nvarchar(12)
as 
begin transaction 
	begin try
		delete from USUARIOS where U_Correo = @Correo
		delete from LOGIN where L_Correo = @Correo and L_Password = @Password
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch

--Creacion del Store Procedure para la actualizacion de las cuentas de usuario y su login--
alter procedure SP_Update_User_Account
	@Correo nvarchar(20),
	@Identificacion int,
	@Direccion nvarchar(50),
	@Telefono nvarchar(15)
as 
begin transaction 
	begin try
		update USUARIOS set U_Identificacion = @Identificacion, 
		U_Direccion = @Direccion, U_Telefono = @Telefono
		where U_Correo = @Correo
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch

--Creacion del Super Usuario--
begin transaction
	begin try
		insert into USUARIOS (U_Correo, U_Nombre, U_Perfil )
		values ('root@amazon.com', 'Root', 0 ) 
		insert into LOGIN (L_Correo, L_Nombre, L_Password, L_Estado )
		values ('root@amazon.com', 'Root', 'RootPassword', 1 )
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch

--Prueba de funcionalidad de los Store Procedures--
exec [dbo].[SP_Create_User_Account] 'carlos@hotmail.com', 'carlos', '12345678'
exec [dbo].[SP_Update_User_Account] 'carlos@hotmail.com', 207250253, 'San Jose, Costa Rica', '+50689843266'
exec [dbo].[SP_Delete_User_Account] 'carlos@hotmail.com', '12345678'
--Ver Informacion de las tablas afectadas--
select U_Correo, U_Nombre, U_Identificacion, U_Direccion, U_Telefono, U_Perfil from USUARIOS
select L_Correo, L_Nombre, L_Password, L_Estado from  LOGIN