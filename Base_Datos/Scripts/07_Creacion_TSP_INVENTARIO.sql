use Prog04_Proj02
go


idProveedor tinyint not null references PROVEEDOR (idProveedor),
	idProducto int not null references PRODUCTO (idProducto),
	cantidadDisponible smallint, --aguanta hasta 99999
	fechaModificacion  datetime not null default(getdate()),
------------------------------------------------------------------------------------
--CREACION DE LOS STORE PROCEDURES PARA TABLA INVENTARIO--
------------------------------------------------------------------------------------

--CREACION STORE PROCEDURE PARA INSERTAR DATOS EN TABLA INVENTARIO--

--CREACION STORE PROCEDURE PARA ELIMINAR DATOS EN TABLA PRODUCTO--

--CREACION STORE PROCEDURE PARA ACTUALIZAR DATOS EN TABLA PRODUCTO--

--CREACION STORE PROCEDURE PARA VISUALIZAR DATOS EN TABLA PRODUCTO--
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
--por id
--por fecha