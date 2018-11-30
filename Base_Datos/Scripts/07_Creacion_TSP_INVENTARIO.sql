use Prog04_Proj02
go

------------------------------------------------------------------------------------
--CREACION DE LOS STORE PROCEDURES PARA TABLA INVENTARIO--
------------------------------------------------------------------------------------

--CREACION STORE PROCEDURE PARA INSERTAR DATOS EN TABLA INVENTARIO--
create procedure SP_Insert_Data_INVENTARIO
	@idProveedor tinyint,
	@idProducto int,
	@cantidadDisponible smallint,
	@fechaModificacion  datetime
as
begin transaction 
begin try
	insert into INVENTARIO (idProveedor, idProducto, cantidadDisponible, fechaModificacion)
	values (@idProveedor, @idProducto, @cantidadDisponible, @fechaModificacion)
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ELIMINAR DATOS EN TABLA INVENTARIO--
create procedure SP_Delete_Data_INVENTARIO
	@idProveedor tinyint
as
begin transaction 
begin try
	delete from INVENTARIO where idProveedor = @idProveedor
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ACTUALIZAR DATOS EN TABLA INVENTARIO--
create procedure SP_Update_Data_INVENTARIO
	@idProveedor tinyint,
	@idProducto int,
	@cantidadDisponible smallint,
	@fechaModificacion  datetime
as
begin transaction 
begin try
	update INVENTARIO set idProducto = @idProducto, cantidadDisponible = @cantidadDisponible, 
	fechaModificacion = @fechaModificacion
	where idProveedor = @idProveedor
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA VISUALIZAR DATOS EN TABLA INVENTARIO--
create procedure SP_VIEW_ALL_Data_INVENTARIO
as
begin transaction 
begin try
	select idProveedor, idProducto, cantidadDisponible, fechaModificacion from INVENTARIO
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_PROVIDER_Data_INVENTARIO
	@idProveedor tinyint
as
begin transaction 
begin try
	select idProveedor, idProducto, cantidadDisponible, fechaModificacion 
	from INVENTARIO
	where idProveedor = @idProveedor
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_PRODUCT_Data_INVENTARIO
	@idProducto int
as
begin transaction 
begin try
	select idProveedor, idProducto, cantidadDisponible, fechaModificacion 
	from INVENTARIO
	where idProducto = @idProducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_QUANTITY_Data_INVENTARIO
	@cantidadDisponible smallint
as
begin transaction 
begin try
	select idProveedor, idProducto, cantidadDisponible, fechaModificacion 
	from INVENTARIO
	where cantidadDisponible = @cantidadDisponible
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_DATE_Data_INVENTARIO
	@startDate datetime,
	@endDate datetime
as
begin transaction 
begin try
	select idProveedor, idProducto, cantidadDisponible, fechaModificacion 
	from INVENTARIO
	where fechaModificacion BETWEEN @startDate AND @endDate
	commit transaction
end try
begin catch
	rollback transaction
end catch
go


exec [dbo].[SP_Insert_Data_INVENTARIO] 1, 1, 23, '2018-11-29'
exec [dbo].[SP_Insert_Data_INVENTARIO] 2, 2, 100, '2018-11-29'
exec [dbo].[SP_Delete_Data_INVENTARIO] 2
exec [dbo].[SP_Update_Data_INVENTARIO] 2, 2, 150, '2018-11-29'

exec [dbo].[SP_VIEW_ALL_Data_INVENTARIO]
exec [dbo].[SP_VIEW_PROVIDER_Data_INVENTARIO] 1
exec [dbo].[SP_VIEW_DATE_Data_INVENTARIO] '2018-11-29', '2019-12-29'
exec [dbo].[SP_VIEW_QUANTITY_Data_INVENTARIO] 23
exec [dbo].[SP_VIEW_PRODUCT_Data_INVENTARIO] 2