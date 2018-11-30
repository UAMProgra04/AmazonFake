use Prog04_Proj02
go

------------------------------------------------------------------------------------
--CREACION DE LOS STORE PROCEDURES PARA TABLA ORDEN_COMPRA--
------------------------------------------------------------------------------------

--CREACION STORE PROCEDURE PARA INSERTAR DATOS EN TABLA ORDEN_COMPRA--
create procedure SP_Insert_Data_ORDEN_COMPRA
	@idOrdenCompra int,
	@idCliente nvarchar(80),
	@idproducto int,
	@cantidadProducto tinyint
as
begin transaction 
begin try
	insert into ORDEN_COMPRA (idOrdenCompra, idCliente, idproducto, cantidadProducto)
	values (@idOrdenCompra, @idCliente, @idproducto, @cantidadProducto)
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ELIMINAR DATOS EN TABLA ORDEN_COMPRA--
create procedure SP_Delete_Data_ORDEN_COMPRA
	@idOrdenCompra int
as
begin transaction 
begin try
	delete from ORDEN_COMPRA where idOrdenCompra = @idOrdenCompra
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ACTUALIZAR DATOS EN TABLA ORDEN_COMPRA--
create procedure SP_Update_Data_ORDEN_COMPRA
	@idOrdenCompra int,
	@idCliente nvarchar(80),
	@idproducto int,
	@cantidadProducto tinyint
as
begin transaction 
begin try
	update ORDEN_COMPRA set idCliente = @idCliente, idproducto = @idproducto, 
	cantidadProducto = @cantidadProducto
	where idOrdenCompra = @idOrdenCompra
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA VISUALIZAR DATOS EN TABLA ORDEN_COMPRA--
create procedure SP_VIEW_ALL_Data_ORDEN_COMPRA
as
begin transaction 
begin try
	select idOrdenCompra, idCliente, idproducto, cantidadProducto from ORDEN_COMPRA
	commit transaction
end try
begin catch
	rollback transaction
end catch
go


create procedure SP_VIEW_IDBUY_Data_ORDEN_COMPRA
	@idOrdenCompra int
as
begin transaction 
begin try
	select idOrdenCompra, idCliente, idproducto, cantidadProducto 
	from ORDEN_COMPRA
	where idOrdenCompra = @idOrdenCompra
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_IDCLIENT_Data_ORDEN_COMPRA
	@idCliente nvarchar(80)
as
begin transaction 
begin try
	select idOrdenCompra, idCliente, idproducto, cantidadProducto 
	from ORDEN_COMPRA
	where idCliente = @idCliente
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_IDPRODUCT_Data_ORDEN_COMPRA
	@idproducto int
as
begin transaction 
begin try
	select idOrdenCompra, idCliente, idproducto, cantidadProducto 
	from ORDEN_COMPRA
	where idproducto = @idproducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

exec [dbo].[SP_Insert_Data_ORDEN_COMPRA] 1,'carlos@hotmail.com', 1, 1
exec [dbo].[SP_Insert_Data_ORDEN_COMPRA] 2,'carlos@hotmail.com', 2, 5
exec [dbo].[SP_Delete_Data_ORDEN_COMPRA] 2
exec [dbo].[SP_Update_Data_ORDEN_COMPRA] 2,'carlos@hotmail.com', 2, 4
exec [dbo].[SP_VIEW_ALL_Data_ORDEN_COMPRA]
exec [dbo].[SP_VIEW_IDBUY_Data_ORDEN_COMPRA] 1
exec [dbo].[SP_VIEW_IDCLIENT_Data_ORDEN_COMPRA] 'carlos@hotmail.com'
exec [dbo].[SP_VIEW_IDPRODUCT_Data_ORDEN_COMPRA] 2