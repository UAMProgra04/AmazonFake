use Prog04_Proj02
go

idFactura int primary key not null,
	idCliente nvarchar(80) not null references USUARIOS (U_Correo),
	fechaCreacion datetime not null default(getdate())
------------------------------------------------------------------------------------
--CREACION DE LOS STORE PROCEDURES PARA TABLA DETALLE_FACTURA--
------------------------------------------------------------------------------------

--CREACION STORE PROCEDURE PARA INSERTAR DATOS EN TABLA DETALLE_FACTURA--

--CREACION STORE PROCEDURE PARA ELIMINAR DATOS EN TABLA DETALLE_FACTURA--

--CREACION STORE PROCEDURE PARA ACTUALIZAR DATOS EN TABLA DETALLE_FACTURA--

--CREACION STORE PROCEDURE PARA VISUALIZAR DATOS EN TABLA DETALLE_FACTURA--
create procedure SP_VIEW_ALL_Data_DETALLE_FACTURA
as
begin transaction 
begin try
	select idFactura, idOrdenCompra from DETALLE_FACTURA
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--por factura
--por ordencompra