use Prog04_Proj02
go
--drop table Informacion_Tarjeta
--(
--It_Correo nvarchar(20) primary key,
--It_Nombre_tarjeta nvarchar(30),
--It_Numero_tarjeta nvarchar(19),
--It_Fecha_Vencimiento nvarchar(5),
--It_Codigo_Seguridad nvarchar(4),
--)

------------------------------------------------------------------------------------
--STORE PROCEDURES--
------------------------------------------------------------------------------------
use Prog04_Proj02
go
--CREACION STORE PROCEDURE PARA BOQUEO DE USUARIO--
create procedure SP_Lock_User_Account
	@Correo nvarchar(80),
	@Estado bit
as 
begin transaction 
	begin try
		update LOGIN set L_Estado = @Estado
		where L_Correo = @Correo
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

--CREACION STORE PROCEDURE PARA VER ESTADO DE USUARIOS--
create procedure SP_View_User_Status
	@Correo nvarchar(80)
as 
begin transaction 
	begin try
		select L_Estado from LOGIN where L_Correo = @Correo;
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

--CREACION STORE PROCEDURE PARA CREACION DE USUARIO (Empleado) Y LOGIN--
create procedure SP_Create_Employee_Account
	@Correo nvarchar(80),
	@Nombre nvarchar(100),
	@Identificacion nvarchar(9),
	@Direccion nvarchar(150),
	@Telefono nvarchar(15),
	@Password nvarchar(12)
as 
begin transaction 
	begin try
		insert into  USUARIOS (U_Correo, U_Nombre, U_Identificacion, U_Direccion, U_Telefono, U_Perfil)
		values (@Correo, @Nombre, @Identificacion, @Direccion, @Telefono, 1)

		insert into  LOGIN (L_Correo, L_Nombre, L_Password, L_Estado, L_Perfil)
		values (@Correo, @Nombre, @Password, 1, 1)

		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

--CREACION STORE PROCEDURE PARA CREACION DE USUARIO (Cliente) Y LOGIN--
create procedure SP_Create_User_Account
	@Correo nvarchar(80),
	@Nombre nvarchar(100),
	@Password nvarchar(12)
as 
begin transaction 
	begin try
		insert into  USUARIOS (U_Correo, U_Nombre, U_Perfil)
		values (@Correo, @Nombre, 2)

		insert into  LOGIN (L_Correo, L_Nombre, L_Password, L_Estado, L_Perfil)
		values (@Correo,@Nombre, @Password, 1, 2)

		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

--CREACION STORE PROCEDURE PARA ELIMINAR CUENTA DE USUARIO Y LOGIN--
create procedure SP_Delete_User_Account
	@Correo nvarchar(80),
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
go

--CREACION STORE PROCEDURE PARA ELIMINAR CUENTA DE USUARIO Y LOGIN POR ADMIN--
create procedure SP_Delete_User_Account_Por_Admin
	@Correo nvarchar(80)
as 
begin transaction 
	begin try
		delete from USUARIOS where U_Correo = @Correo
		delete from LOGIN where L_Correo = @Correo
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

--CREACION STORE PROCEDURE PARA ACTUALIZAR LA CUENTA DE USUARIO--
alter procedure SP_Update_User_Account
	@Correo nvarchar(80),
	@Nombre nvarchar(100),
	@Identificacion nvarchar(9),
	@Direccion nvarchar(150),
	@Telefono nvarchar(15)
as 
begin transaction 
	begin try
		update USUARIOS set U_Nombre = @Nombre,  U_Identificacion = @Identificacion, 
		U_Direccion = @Direccion, U_Telefono = @Telefono
		where U_Correo = @Correo

		update LOGIN set L_Nombre = @Nombre  
		where L_Correo = @Correo

		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--CREACION STORE PROCEDURE PARA VISUALIZAR TODOS LOS USUARIOS--
create procedure SP_View_All_Admins
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 1
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

--CREACION STORE PROCEDURE PARA VISUALIZAR USUARIOS POR EMAIL--
create procedure SP_View_Email_Admins
	@Correo nvarchar(80)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 1 and U.U_Correo like '%' + @Correo + '%'
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

--CREACION STORE PROCEDURE PARA VISUALIZAR USUARIOS POR NOMBRE--
create procedure SP_View_Name_Admins
	@Nombre nvarchar(100)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 1 and U.U_Nombre like '%' + @Nombre + '%'
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

--CREACION STORE PROCEDURE PARA VISUALIZAR USUARIOS POR IDENTIFICACION--
create procedure SP_View_ID_Admins
	@Identificacion nvarchar(9)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 1 and U.U_Identificacion like '%' + @Identificacion + '%'
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--CREACION STORE PROCEDURE PARA VISUALIZAR TODOS LOS CLIENTES--
create procedure SP_View_All_Users
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 2
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

--CREACION STORE PROCEDURE PARA VISUALIZAR CLIENTES POR EMAIL--
create procedure SP_View_Email_Users
	@Correo nvarchar(80)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 2 and U.U_Correo like '%' + @Correo + '%'
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

--CREACION STORE PROCEDURE PARA VISUALIZAR CLIENTES POR NOMBRE--
create procedure SP_View_Name_Users
	@Nombre nvarchar(100)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 2 and U.U_Nombre like '%' + @Nombre + '%'
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

--CREACION STORE PROCEDURE PARA VISUALIZAR CLIENTES POR IDENTIFICACION--
create procedure SP_View_ID_Users
	@Identificacion nvarchar(9)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 2 and U.U_Identificacion like '%' + @Identificacion + '%'
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--CREACION STORE PROCEDURE PARA RECUPERACION DE PASSWORD--
create procedure SP_Password_Restore
	@Correo nvarchar(80)
as 
begin transaction 
	begin try
		select L_Password from LOGIN where L_Correo = @Correo
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

--CREACION STORE PROCEDURE PARA LOGIN--
create procedure SP_Login
	@Correo nvarchar(80),
	@Password nvarchar(12)
as 
begin transaction 
	begin try
		select L_Correo, L_Nombre, L_Password, L_Estado, L_Perfil
		from LOGIN 
		where L_Correo = @Correo and L_Password = @Password
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

--CREACION STORE PROCEDURE PARA CAMBIO DE PASSWORD--
create procedure SP_Change_Password
	@Correo nvarchar(80),
	@Password nvarchar(12)
as 
begin transaction 
	begin try
		update LOGIN set L_Password = @Password	where L_Correo = @Correo 
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go

------------------------------------------------------------------------------------
--CREACION DE PERFILES PARA TABLA PERFILES--
------------------------------------------------------------------------------------
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
go

------------------------------------------------------------------------------------
--CREACION DEL USUARIO ROOT--
------------------------------------------------------------------------------------
begin transaction
	begin try
		insert into USUARIOS (U_Correo, U_Nombre, U_Perfil )
		values ('root@amazon.com', 'Root', 0 ) 
		insert into LOGIN (L_Correo, L_Nombre, L_Password, L_Estado, L_Perfil)
		values ('root@amazon.com', 'Root', 'RootPassword', 1, 0)
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
go
------------------------------------------------------------------------------------
--PRUEBA DE FUNCIONALIDAD DE STORE PROCEDURES--
------------------------------------------------------------------------------------
exec [dbo].[SP_View_All_Users]
exec [dbo].[SP_View_Email_Users] 'carlos@hotmail.com'
exec [dbo].[SP_View_ID_Users] 207250253
exec [dbo].[SP_View_Name_Users] 'carlos'

exec [dbo].[SP_View_All_Admins]
exec [dbo].[SP_View_Email_Admins] 'marcoarias@amazon.com'
exec [dbo].[SP_View_ID_Admins] 608970345
exec [dbo].[SP_View_Name_Admins] 'Marco Arias'

exec [dbo].[SP_Create_User_Account] 'carlos@hotmail.com', 'carlos', '12345678'
exec [dbo].[SP_Update_User_Account] 'carlos@hotmail.com', 'Carlos A', '207250253', 'San Jose, Costa Rica', '+50689843266'
exec [dbo].[SP_Password_Restore] 'carlos@hotmail.com'
exec [dbo].[SP_Login] 'carlos@hotmail.com', '12345678'
exec [dbo].[SP_Change_Password] 'carlos@hotmail.com', 'Carlos23'
exec [dbo].[SP_Delete_User_Account] 'carlos@hotmail.com', '12345678'

exec [dbo].[SP_Create_Employee_Account] 'marcoarias@amazon.com', 'Marco Arias', '204560876', 'Alajuela, Costa Rica, 100 mts del Coyol de Alajuela', '+50622456543', 'MarcoA01'
exec [dbo].[SP_Lock_User_Account] 'marcoarias@amazon.com', 'true'
exec [dbo].[SP_View_User_Status] 'marcoarias@amazon.com'
--VER INFORMACION DE TABLAS AFECTADAS--
select U_Correo, U_Nombre, U_Identificacion, U_Direccion, U_Telefono, U_Perfil from USUARIOS
select L_Correo, L_Nombre, L_Password, L_Estado, L_Perfil from  LOGIN
