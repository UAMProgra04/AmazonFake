use Prog04_Proj02
go

------------------------------------------------------------------------------------
--CREACION DE LOS STORE PROCEDURES PARA TABLA CATEGORIA--
------------------------------------------------------------------------------------

--CREACION STORE PROCEDURE PARA INSERTAR DATOS EN TABLA CATEGORIA--
create procedure SP_Insert_Data_CATEGORIA
	@idCategoriaProducto tinyint,
	@nombre nvarchar(50),
	@fechaModificacion datetime
as
begin transaction 
begin try
	insert into CATEGORIA (idCategoriaProducto, nombre, fechaModificacion)
	values (@idCategoriaProducto, @nombre,@fechaModificacion)
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ELIMINAR DATOS EN TABLA CATEGORIA--
create procedure SP_Delete_Data_CATEGORIA
	@idCategoriaProducto tinyint
as
begin transaction 
begin try
	delete from CATEGORIA where idCategoriaProducto = @idCategoriaProducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ACTUALIZAR DATOS EN TABLA CATEGORIA--
create procedure SP_Update_Data_CATEGORIA
	@idCategoriaProducto tinyint,
	@nombre nvarchar(50),
	@fechaModificacion datetime
as
begin transaction 
begin try
	update CATEGORIA set nombre = @nombre, fechaModificacion = @fechaModificacion
	where idCategoriaProducto = @idCategoriaProducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA VISUALIZAR DATOS EN TABLA CATEGORIA--
create procedure SP_VIEW_ALL_Data_CATEGORIA
as
begin transaction 
begin try
	select idCategoriaProducto, nombre, fechaModificacion from CATEGORIA
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_ID_Data_CATEGORIA
	@idCategoriaProducto tinyint
as
begin transaction 
begin try
	select idCategoriaProducto, nombre, fechaModificacion 
	from CATEGORIA
	WHERE idCategoriaProducto = @idCategoriaProducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_NAME_Data_CATEGORIA
	@nombre nvarchar(50)
as
begin transaction 
begin try
	select idCategoriaProducto, nombre, fechaModificacion 
	from CATEGORIA
	WHERE nombre like '%' + @nombre + '%'
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_DATE_Data_CATEGORIA
	@startDate datetime,
	@endDate datetime
as
begin transaction 
begin try
	select idCategoriaProducto, nombre, fechaModificacion 
	from CATEGORIA
	where fechaModificacion BETWEEN @startDate AND @endDate
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

exec [dbo].[SP_Insert_Data_CATEGORIA] 1, 'Tecnologia', '11-29-2018'
exec [dbo].[SP_Insert_Data_CATEGORIA] 2, 'Niños', '11-29-2018'
exec [dbo].[SP_Update_Data_CATEGORIA] 2, 'Ropa', '11-29-2019'
exec [dbo].[SP_Delete_Data_CATEGORIA] 2
exec [dbo].[SP_VIEW_ALL_Data_CATEGORIA]
exec [dbo].[SP_VIEW_ID_Data_CATEGORIA] 1
exec [dbo].[SP_VIEW_NAME_Data_CATEGORIA] 'Ropa'
exec [dbo].[SP_VIEW_DATE_Data_CATEGORIA] '2018-11-29', '2019-12-29'
