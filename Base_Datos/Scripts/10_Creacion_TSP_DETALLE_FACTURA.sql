use Prog04_Proj02
go

------------------------------------------------------------------------------------
--CREACION DE LOS STORE PROCEDURES PARA TABLA DETALLE_FACTURA--
------------------------------------------------------------------------------------

--CREACION STORE PROCEDURE PARA INSERTAR DATOS EN TABLA DETALLE_FACTURA--
alter procedure SP_Insert_Data_DETALLE_FACTURA
	@idFactura int,
	@idOrdenCompra int,
	@detalleFactura nvarchar(50)
as
begin transaction 
begin try
	insert into DETALLE_FACTURA (idFactura, idOrdenCompra, detalleFactura)
	values (@idFactura, @idOrdenCompra, @detalleFactura)
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ELIMINAR DATOS EN TABLA DETALLE_FACTURA--
create procedure SP_Delete_Data_DETALLE_FACTURA
	@idFactura int
as
begin transaction 
begin try
	delete from DETALLE_FACTURA where idFactura = @idFactura
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ACTUALIZAR DATOS EN TABLA DETALLE_FACTURA--
create procedure SP_Update_Data_DETALLE_FACTURA
	@idFactura int,
	@idOrdenCompra int,
	@detalleFactura nvarchar(50)
as
begin transaction 
begin try
	update DETALLE_FACTURA set idOrdenCompra = @idOrdenCompra, detalleFactura = @detalleFactura
	where idFactura = @idFactura
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA VISUALIZAR DATOS EN TABLA DETALLE_FACTURA--
create procedure SP_VIEW_ALL_Data_DETALLE_FACTURA
as
begin transaction 
begin try
	select idFactura, idOrdenCompra, detalleFactura from DETALLE_FACTURA
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_BILL_Data_DETALLE_FACTURA
	@idFactura int
as
begin transaction 
begin try
	select idFactura, idOrdenCompra, detalleFactura
	from DETALLE_FACTURA
	where idFactura = @idFactura
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_BUY_Data_DETALLE_FACTURA
	@idOrdenCompra int
as
begin transaction 
begin try
	select idFactura, idOrdenCompra, detalleFactura 
	from DETALLE_FACTURA
	where idOrdenCompra = @idOrdenCompra
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

exec [dbo].[SP_Insert_Data_DETALLE_FACTURA] 1, 2, 'Compra Pantalla'
exec [dbo].[SP_Insert_Data_DETALLE_FACTURA] 2, 2, 'Compra Camisas de niños'
exec [dbo].[SP_Update_Data_DETALLE_FACTURA] 1, 1, 'Compra Pantalla'
exec [dbo].[SP_Delete_Data_DETALLE_FACTURA] 1

exec [dbo].[SP_VIEW_ALL_Data_DETALLE_FACTURA]
exec [dbo].[SP_VIEW_BILL_Data_DETALLE_FACTURA] 1
exec [dbo].[SP_VIEW_BUY_Data_DETALLE_FACTURA] 2