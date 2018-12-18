------------------------------------------------------------------------------------
--CREACION DE TABLAS DE LA BASE DE DATOS Prog04_Proj02--
------------------------------------------------------------------------------------
use Prog04_Proj02
go

------------------------------------------------------------------------------------
--CREACION DE TABLAS PARA MANEJO DE USUARIOS Y LOGIN--
------------------------------------------------------------------------------------
--CREACION TABLA PERFILES--
create table PERFILES
(
P_Id_Perfil tinyint primary key,
P_Nombre_Perfil nvarchar(15),
P_Descripcion_perfil nvarchar(30)
)
go

--CREACION TABLA USUARIOS--
create table USUARIOS
(
U_Correo nvarchar(80) primary key,
U_Nombre nvarchar(100) not null,
U_Identificacion nvarchar(9),
U_Direccion nvarchar(150),
U_Telefono nvarchar(15),
U_Perfil tinyint not null references PERFILES(P_Id_Perfil)
)
go

--CREACION TABLA LOGIN--
create table LOGIN
(
L_Correo nvarchar(80) primary key,
L_Nombre nvarchar(100) not null,
L_Password nvarchar(12) not null,
L_Estado bit not null,
L_Perfil tinyint not null references PERFILES(P_Id_Perfil)
)
go


------------------------------------------------------------------------------------
--CREACION DE TABLAS PARA MANEJO DE PRODUCTOS--
------------------------------------------------------------------------------------
--CREACION TABLA CATEGORIA--
CREATE TABLE CATEGORIA (
	idCategoriaProducto tinyint primary key not null,
	nombre nvarchar(50) not null,
	fechaModificacion datetime not null default(getdate())
)
go

--CREACION TABLA SUB_CATEGORIA--
CREATE TABLE SUB_CATEGORIA (
	idSubcategoriaProducto tinyint primary key not null,
	nombre nvarchar(50) not null,
	idCategoriaProducto tinyint not null references CATEGORIA (idCategoriaProducto),
	fechaModificacion datetime not null default(getdate())
)
go

--CREACION TABLA PRODUCTO--
CREATE TABLE PRODUCTO(
	idProducto int primary key,
	nombre nvarchar(100) not null,
	precioUnitario decimal(10,2) not null default(0),
	descripcion nvarchar (150),
	idSubcategoriaProducto tinyint not null references SUB_CATEGORIA (idSubcategoriaProducto)
)
go

--CREACION TABLA PROVEEDOR--
CREATE TABLE PROVEEDOR(
	idProveedor tinyint primary key,
	nombre nvarchar(100) not null,
	direccion nvarchar(150) not null,
	telefono nvarchar(15) not null,
	email nvarchar(80) not null
)
go


--CREACION TABLA INVENTARIO--
CREATE TABLE INVENTARIO(
	idProveedor tinyint not null references PROVEEDOR (idProveedor),
	idProducto int not null references PRODUCTO (idProducto),
	cantidadDisponible smallint, --aguanta hasta 99999
	fechaModificacion  datetime not null default(getdate()),
)
go

--CREACION TABLA ORDEN_COMPRA--
CREATE TABLE ORDEN_COMPRA(
	idOrdenCompra int primary key not null,
	idCliente nvarchar(80) not null references USUARIOS (U_Correo),
	idproducto int not null references Producto (idProducto),
	cantidadProducto tinyint not null,
)
go

--CREACION TABLA FACTURA--
CREATE TABLE FACTURA (
	idFactura int primary key not null,
	idCliente nvarchar(80) not null references USUARIOS (U_Correo),
	fechaCreacion datetime not null default(getdate()),
)
go

--CREACION TABLA DETALLE_FACTURA--
CREATE TABLE DETALLE_FACTURA(
	idFactura int not null references FACTURA (idFactura),
	idOrdenCompra int not null references ORDEN_COMPRA (idOrdenCompra),
	detalleFactura nvarchar(50)
)
go