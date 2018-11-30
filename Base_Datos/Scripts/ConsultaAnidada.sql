use Prog04_Proj02
go


select
P.nombre as [Producto], 
P.precioUnitario as [Precio], 
P.descripcion as [Detalle],
SC.nombre as [Sub Categoria], 
C.nombre as [Categoria]
from PRODUCTO P inner join SUB_CATEGORIA SC 
on P.idSubcategoriaProducto = SC.idSubcategoriaProducto
inner join CATEGORIA C on SC.idCategoriaProducto = C.idCategoriaProducto


select 
OC.idOrdenCompra,
OC.cantidadProducto,
P.nombre,
U.U_Nombre,
DF.detalleFactura, 
F.fechaCreacion
from ORDEN_COMPRA OC inner join PRODUCTO P on OC.idproducto = P.idProducto
inner join USUARIOS U on OC.idCliente = U.U_Correo
inner join DETALLE_FACTURA DF on OC.idOrdenCompra = DF.idOrdenCompra
inner join FACTURA F on F.idCliente = U.U_Correo
