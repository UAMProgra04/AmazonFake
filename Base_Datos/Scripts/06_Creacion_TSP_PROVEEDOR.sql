use Prog04_Proj02
go

------------------------------------------------------------------------------------
--CREACION DE LOS STORE PROCEDURES PARA TABLA PROVEEDOR--
------------------------------------------------------------------------------------

--CREACION STORE PROCEDURE PARA INSERTAR DATOS EN TABLA PROVEEDOR--
create procedure SP_Insert_Data_PROVEEDOR
	@idProveedor tinyint,
	@nombre nvarchar(100),
	@direccion nvarchar(150),
	@telefono nvarchar(15),
	@email nvarchar(80)
as
begin transaction 
begin try
	insert into PROVEEDOR (idProveedor, nombre, direccion, telefono, email)
	values (@idProveedor, @nombre, @direccion, @telefono, @email)
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ELIMINAR DATOS EN TABLA PROVEEDOR--
create procedure SP_Delete_Data_PROVEEDOR
	@idProveedor tinyint
as
begin transaction 
begin try
	delete from PROVEEDOR where idProveedor = @idProveedor
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ACTUALIZAR DATOS EN TABLA PROVEEDOR--
create procedure SP_Update_Data_PROVEEDOR
	@idProveedor tinyint,
	@nombre nvarchar(100),
	@direccion nvarchar(150),
	@telefono nvarchar(15),
	@email nvarchar(80)
as
begin transaction 
begin try
	update PROVEEDOR set  nombre = @nombre, direccion = @direccion, 
	telefono = @telefono, email = @email
	where idProveedor = @idProveedor
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA VISUALIZAR DATOS EN TABLA PROVEEDOR--
create procedure SP_VIEW_ALL_Data_PROVEEDOR
as
begin transaction 
begin try
	select idProveedor, nombre, direccion, telefono, email from PROVEEDOR
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_ID_Data_PROVEEDOR
	@idProveedor tinyint
as
begin transaction 
begin try
	select idProveedor, nombre, direccion, telefono, email 
	from PROVEEDOR
	where idProveedor = @idProveedor
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_NAME_Data_PROVEEDOR
	@nombre nvarchar(100)
as
begin transaction 
begin try
	select idProveedor, nombre, direccion, telefono, email 
	from PROVEEDOR
	where nombre like '%' + @nombre + '%'
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_EMAIL_Data_PROVEEDOR
	@email nvarchar(80)
as
begin transaction 
begin try
	select idProveedor, nombre, direccion, telefono, email 
	from PROVEEDOR
	where email like '%' + @email + '%'
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

[dbo].[SP_Insert_Data_PROVEEDOR] 1, 'CEMACO', 'San Jose Costa Rica, 100 metros este de Torre Mercedes, Paseo Colon', '+50622408987', 'cemaco_ventas@cemaco.com'
[dbo].[SP_Insert_Data_PROVEEDOR] 2, 'CEMACO', 'Heredia Costa Rica, 100 metros norte del Hospital Central', '+50622408987', 'alis_ventas@alis.com'
[dbo].[SP_Delete_Data_PROVEEDOR] 1
[dbo].[SP_Update_Data_PROVEEDOR] 2, 'ALIS', 'Heredia Costa Rica, 100 metros norte del Hospital Central', '+50622702587', 'alis_ventas@alis.com'

[dbo].[SP_VIEW_ALL_Data_PROVEEDOR] 
[dbo].[SP_VIEW_EMAIL_Data_PROVEEDOR] 'alis_ventas@alis.com' 
[dbo].[SP_VIEW_ID_Data_PROVEEDOR] 1
[dbo].[SP_VIEW_NAME_Data_PROVEEDOR]	'ALIS'