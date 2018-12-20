use Prog04_Proj02
go

------------------------------------------------------------------------------------
--CREACION DE LOS STORE PROCEDURES PARA TABLA FACTURA--
------------------------------------------------------------------------------------

--CREACION STORE PROCEDURE PARA INSERTAR DATOS EN TABLA FACTURA--
create procedure SP_Insert_Data_FACTURA
	@idFactura int,
	@idCliente nvarchar(80),
	@fechaCreacion  datetime
as
begin transaction 
begin try
	insert into FACTURA (idFactura, idCliente, fechaCreacion)
	values (@idFactura, @idCliente, @fechaCreacion)
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ELIMINAR DATOS EN TABLA FACTURA--
create procedure SP_Delete_Data_FACTURA
	@idFactura int
as
begin transaction 
begin try
	delete from FACTURA where idFactura = @idFactura
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ACTUALIZAR DATOS EN TABLA FACTURA--
create procedure SP_Update_Data_FACTURA
	@idFactura int,
	@idCliente nvarchar(80),
	@fechaCreacion  datetime
as
begin transaction 
begin try
	update FACTURA set idCliente = @idCliente, fechaCreacion = @fechaCreacion
	where idFactura = @idFactura
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA VISUALIZAR DATOS EN TABLA FACTURA--
create procedure SP_VIEW_ALL_Data_FACTURA
as
begin transaction 
begin try
	select idFactura, idCliente, fechaCreacion from FACTURA
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_IDBILL_Data_FACTURA
	@idFactura int
as
begin transaction 
begin try
	select idFactura, idCliente, fechaCreacion 
	from FACTURA
	where idFactura = @idFactura
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_DATE_Data_FACTURA
	@startDate datetime,
	@endDate datetime
as
begin transaction 
begin try
	select idFactura, idCliente, fechaCreacion 
	from FACTURA
	where fechaCreacion BETWEEN @startDate AND @endDate
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

exec [dbo].[SP_Insert_Data_FACTURA] 1,'carlos@hotmail.com', '2018-11-29'
exec [dbo].[SP_Insert_Data_FACTURA] 2,'carlos@hotmail.com', '2018-11-29'
exec [dbo].[SP_Update_Data_FACTURA] 2,'carlos@hotmail.com', '2018-12-29'
exec [dbo].[SP_Delete_Data_FACTURA] 1

exec [dbo].[SP_VIEW_ALL_Data_FACTURA]
exec [dbo].[SP_VIEW_DATE_Data_FACTURA] '2018-01-29', '2018-12-29'
exec [dbo].[SP_VIEW_IDBILL_Data_FACTURA] 2
exec [dbo].[SP_VIEW_IDCLIENT_Data_FACTURA] 'carlos@hotmail.com'