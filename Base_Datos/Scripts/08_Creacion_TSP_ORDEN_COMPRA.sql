use Prog04_Proj02
go


idOrdenCompra int primary key not null,
	idCliente nvarchar(80) not null references USUARIOS (U_Correo),
	idproducto int not null references Producto (idProducto),
	cantidadProducto tinyint not null,
------------------------------------------------------------------------------------
--CREACION DE LOS STORE PROCEDURES PARA TABLA ORDEN_COMPRA--
------------------------------------------------------------------------------------

--CREACION STORE PROCEDURE PARA INSERTAR DATOS EN TABLA ORDEN_COMPRA--

--CREACION STORE PROCEDURE PARA ELIMINAR DATOS EN TABLA ORDEN_COMPRA--

--CREACION STORE PROCEDURE PARA ACTUALIZAR DATOS EN TABLA ORDEN_COMPRA--

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

--por id
--por idcliente
--por idproducto
