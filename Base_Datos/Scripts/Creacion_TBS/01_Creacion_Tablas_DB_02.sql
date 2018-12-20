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
--CREACION DE TABLAS PARA CARRITO--
------------------------------------------------------------------------------------


------------------------------------------------------------------------------------
--CREACION TABLA CATEGORIA--
------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CATEGORIA](
	[codcategoria] [char](2) NOT NULL,
	[descategoria] [varchar](20) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[codcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
------------------------------------------------------------------------------------
--CREACION TABLA VENTA--
------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VENTA](
	[VEN_Codigo] [char](10) NOT NULL,
	[VEN_Fecha] [varchar](50) NULL,
	[VEN_SuTotal] [decimal](10, 2) NULL,
	[VEN_IGV] [decimal](10, 2) NULL,
	[VEN_Total] [decimal](10, 2) NULL,
	[VEN_Cliente] [varchar](50) NULL,
 CONSTRAINT [PK_VENTA_1] PRIMARY KEY CLUSTERED 
(
	[VEN_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

------------------------------------------------------------------------------------
--CREACION TABLA PRODUCTOS--
------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PRODUCTOS](
	[codproducto] [char](4) NOT NULL,
	[desproducto] [varchar](40) NULL,
	[codcategoria] [char](2) NULL,
	[preproducto] [decimal](18, 2) NULL,
	[canproducto] [int] NULL,
	[imagen] [varchar](40) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[codproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([codcategoria])
REFERENCES [dbo].[CATEGORIA] ([codcategoria])
GO

ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_Productos_Categorias]
GO

------------------------------------------------------------------------------------
--CREACION TABLA DETALLE_VENTA--
------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DETALLE_VENTA](
	[VEN_Codigo] [char](10) NOT NULL,
	[DV_Cantidad] [int] NULL,
	[DV_Precio] [decimal](10, 2) NULL,
	[DV_SubTotal] [decimal](10, 2) NULL,
	[codproducto] [char](4) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_VENTA_Productos] FOREIGN KEY([codproducto])
REFERENCES [dbo].[PRODUCTOS] ([codproducto])
GO

ALTER TABLE [dbo].[DETALLE_VENTA] CHECK CONSTRAINT [FK_DETALLE_VENTA_Productos]
GO

ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_VENTA_VENTA] FOREIGN KEY([VEN_Codigo])
REFERENCES [dbo].[VENTA] ([VEN_Codigo])
GO

ALTER TABLE [dbo].[DETALLE_VENTA] CHECK CONSTRAINT [FK_DETALLE_VENTA_VENTA]
GO


------------------------------------------------------------------------------------
--CREACION DE LOS STORE PROCEDURES PARA TABLA CATEGORIA--
------------------------------------------------------------------------------------
use Prog04_Proj02
go

--[dbo].[pa_Categorias_ListasTodos]--
create procedure SP_ListasTodos_Categorias
as
begin transaction 
begin try
	select codcategoria, descategoria from Categorias
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--[dbo].[pa_detalleventa]--
create procedure SP_Detalle_Ventas
	@codigo char(10),
	@cantidad int,
	@precio decimal(10,2),
	@subtotal decimal(10,2),
	@codproducto char(4)
as
begin transaction 
begin try
	insert into DETALLE_VENTA(VEN_Codigo, DV_Cantidad, DV_Precio, DV_SubTotal, codproducto)
	values (@codigo,@cantidad,@precio,@subtotal,@codproducto)
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--[dbo].[PA_Productos_Bucar_Por_Categorias]--
create procedure SP_View_Categorias
	@codcategoria char(2)
as
begin transaction 
begin try
	select codproducto,desproducto,codcategoria,preproducto,canproducto,imagen 
	from Productos 
	where codcategoria = @codcategoria
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--[dbo].[pa_Productos_insertar]--
create procedure SP_Insert_Productos
	@codproducto char(2),
	@desproducto varchar(40),
	@codcategoria char(2),
	@preproducto decimal(18,2),
	@canproducto int
as
begin transaction 
begin try
	insert into Productos(codproducto,desproducto,codcategoria,preproducto,canproducto)
	values (@codproducto,@desproducto,@codcategoria,@preproducto,@canproducto)
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--[dbo].[pa_productos_ListarTodos]--
create procedure SP_View_Productos
as
begin transaction 
begin try
	select codproducto,desproducto,codcategoria,preproducto,canproducto,imagen
	from Productos 
	commit transaction
end try
begin catch
	rollback transaction
end catch
go

--[dbo].[pa_ventas]--
create procedure SP_Insert_Ventas
	@codigo char(10),
	@fecha varchar(50),
	@subtotal decimal(10,2),
	@igv decimal(10,2),
	@total decimal(10,2),
	@cliente varchar(50)
as
begin transaction 
begin try
	insert into VENTA(VEN_Codigo, VEN_Fecha, VEN_SuTotal, VEN_IGV, VEN_Total, VEN_Cliente)
	values (@codigo,@fecha,@subtotal,@igv,@total,@cliente)
	commit transaction
end try
begin catch
	rollback transaction
end catch
go