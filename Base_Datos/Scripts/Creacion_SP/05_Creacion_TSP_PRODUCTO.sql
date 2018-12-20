use Prog04_Proj02
go

------------------------------------------------------------------------------------
--CREACION DE LOS STORE PROCEDURES PARA TABLA PRODUCTO--
------------------------------------------------------------------------------------

--CREACION STORE PROCEDURE PARA INSERTAR DATOS EN TABLA PRODUCTO--
create procedure SP_Insert_Data_PRODUCTO
	@idProducto int,
	@nombre nvarchar(100),
	@precioUnitario decimal(10,2),
	@descripcion nvarchar (150),
	@idSubcategoriaProducto tinyint
as
begin transaction 
begin try
	insert into PRODUCTO (idProducto, nombre, precioUnitario, descripcion, idSubcategoriaProducto)
	values (@idProducto, @nombre, @precioUnitario, @descripcion, @idSubcategoriaProducto)
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ELIMINAR DATOS EN TABLA PRODUCTO--
create procedure SP_Delete_Data_PRODUCTO
	@idProducto int
as
begin transaction 
begin try
	delete from PRODUCTO where idProducto = @idProducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ACTUALIZAR DATOS EN TABLA PRODUCTO--
create procedure SP_Update_Data_PRODUCTO
	@idProducto int,
	@nombre nvarchar(100),
	@precioUnitario decimal(10,2),
	@descripcion nvarchar (150),
	@idSubcategoriaProducto tinyint
as
begin transaction 
begin try
	update PRODUCTO set nombre = @nombre, precioUnitario = @precioUnitario, 
	descripcion = @descripcion, idSubcategoriaProducto = @idSubcategoriaProducto
	where idProducto = @idProducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA VISUALIZAR DATOS EN TABLA PRODUCTO--
create procedure SP_VIEW_ALL_Data_PRODUCTO
as
begin transaction 
begin try
	select idProducto, nombre, precioUnitario, descripcion, idSubcategoriaProducto from PRODUCTO
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_ID_Data_PRODUCTO
	@idProducto int
as
begin transaction 
begin try
	select idProducto, nombre, precioUnitario, descripcion, idSubcategoriaProducto 
	from PRODUCTO
	where idProducto = @idProducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_NAME_Data_PRODUCTO
	@nombre nvarchar(100)
as
begin transaction 
begin try
	select idProducto, nombre, precioUnitario, descripcion, idSubcategoriaProducto 
	from PRODUCTO
	where nombre like '%' + @nombre + '%'
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_PRICE_Data_PRODUCTO
	@precioUnitario decimal(10,2)
as
begin transaction 
begin try
	select idProducto, nombre, precioUnitario, descripcion, idSubcategoriaProducto 
	from PRODUCTO
	where precioUnitario = @precioUnitario
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

exec [dbo].[SP_Insert_Data_PRODUCTO] 1, 'Pantalla', 980500.00, 'Pantalla Sony 50\"', 1
exec [dbo].[SP_Insert_Data_PRODUCTO] 2, 'Camiseta niño', 980500.00, 'Camiseta talla "S" de Sonic', 2
exec [dbo].[SP_Update_Data_PRODUCTO] 2, 'Camiseta niño', 5600.00, 'Camiseta talla "S" de Sonic', 2
exec [dbo].[SP_Delete_Data_PRODUCTO] 2

exec [dbo].[SP_VIEW_ALL_Data_PRODUCTO]
exec [dbo].[SP_VIEW_ID_Data_PRODUCTO] 1
exec [dbo].[SP_VIEW_NAME_Data_PRODUCTO] 'Camiseta niño'
exec [dbo].[SP_VIEW_PRICE_Data_PRODUCTO] 980500.00

