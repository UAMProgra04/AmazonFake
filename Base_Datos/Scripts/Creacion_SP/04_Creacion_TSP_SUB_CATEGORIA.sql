use Prog04_Proj02
go
------------------------------------------------------------------------------------
--CREACION DE LOS STORE PROCEDURES PARA TABLA SUB_CATEGORIA--
------------------------------------------------------------------------------------

--CREACION STORE PROCEDURE PARA INSERTAR DATOS EN TABLA SUB_CATEGORIA--
create procedure SP_Insert_Data_SUB_CATEGORIA
	@idSubcategoriaProducto tinyint,
	@nombre nvarchar(50),
	@idCategoriaProducto tinyint,
	@fechaModificacion datetime
as
begin transaction 
begin try
	insert into SUB_CATEGORIA (idSubcategoriaProducto, nombre, idCategoriaProducto, fechaModificacion)
	values (@idSubcategoriaProducto, @nombre, @idCategoriaProducto, @fechaModificacion)
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ELIMINAR DATOS EN TABLA SUB_CATEGORIA--
create procedure SP_Delete_Data_SUB_CATEGORIA
	@idSubcategoriaProducto tinyint
as
begin transaction 
begin try
	delete from SUB_CATEGORIA where idSubcategoriaProducto = @idSubcategoriaProducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA ACTUALIZAR DATOS EN TABLA CATEGORIA--
create procedure SP_Update_Data_SUB_CATEGORIA
	@idSubcategoriaProducto tinyint,
	@nombre nvarchar(50),
	@idCategoriaProducto tinyint,
	@fechaModificacion datetime
as
begin transaction 
begin try
	update SUB_CATEGORIA set nombre = @nombre, idCategoriaProducto = @idCategoriaProducto,
	fechaModificacion = @fechaModificacion
	where @idSubcategoriaProducto = @idSubcategoriaProducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--CREACION STORE PROCEDURE PARA VISUALIZAR DATOS EN TABLA SUB_CATEGORIA--
create procedure SP_VIEW_ALL_Data_SUB_CATEGORIA
as
begin transaction 
begin try
	select idSubcategoriaProducto, nombre, idCategoriaProducto, fechaModificacion from SUB_CATEGORIA
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_ID_Data_SUB_CATEGORIA
	@idSubcategoriaProducto tinyint
as
begin transaction 
begin try
	select idSubcategoriaProducto, nombre, idCategoriaProducto, fechaModificacion 
	from SUB_CATEGORIA
	WHERE idSubcategoriaProducto = @idSubcategoriaProducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_NAME_Data_SUB_CATEGORIA
	@nombre nvarchar(50)
as
begin transaction 
begin try
	select idSubcategoriaProducto, nombre, idCategoriaProducto, fechaModificacion 
	from SUB_CATEGORIA
	WHERE nombre like '%' + @nombre + '%'
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

create procedure SP_VIEW_DATE_Data_SUB_CATEGORIA
	@startDate datetime,
	@endDate datetime
as
begin transaction 
begin try
	select idSubcategoriaProducto, nombre, idCategoriaProducto, fechaModificacion 
	from SUB_CATEGORIA
	where fechaModificacion BETWEEN @startDate AND @endDate
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

exec [dbo].[SP_Insert_Data_SUB_CATEGORIA] 1, 'Entretenimiento', 1, '2018-12-29'
exec [dbo].[SP_Insert_Data_SUB_CATEGORIA] 2, 'Niños', 1, '2018-12-29'
exec [dbo].[SP_Update_Data_SUB_CATEGORIA] 2, 'Niños', 2, '2018-12-29'
exec [dbo].[SP_Delete_Data_SUB_CATEGORIA] 1
exec [dbo].[SP_VIEW_ALL_Data_SUB_CATEGORIA]
exec [dbo].[SP_VIEW_DATE_Data_SUB_CATEGORIA] '2018-11-29', '2019-12-29'
exec [dbo].[SP_VIEW_ID_Data_SUB_CATEGORIA] 1
exec [dbo].[SP_VIEW_NAME_Data_SUB_CATEGORIA] 'Niños'