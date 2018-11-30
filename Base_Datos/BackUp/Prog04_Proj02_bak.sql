USE [master]
GO
/****** Object:  Database [Prog04_Proj02]    Script Date: 11/29/2018 8:02:21 PM ******/
CREATE DATABASE [Prog04_Proj02]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prog04_Proj02', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Prog04_Proj02.mdf' , SIZE = 8192KB , MAXSIZE = 20480KB , FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'Prog04_Proj02_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Log\Prog04_Proj02_log.ldf' , SIZE = 6144KB , MAXSIZE = 20480KB , FILEGROWTH = 5120KB )
GO
ALTER DATABASE [Prog04_Proj02] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prog04_Proj02].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prog04_Proj02] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prog04_Proj02] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prog04_Proj02] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Prog04_Proj02] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prog04_Proj02] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET RECOVERY FULL 
GO
ALTER DATABASE [Prog04_Proj02] SET  MULTI_USER 
GO
ALTER DATABASE [Prog04_Proj02] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prog04_Proj02] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prog04_Proj02] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prog04_Proj02] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prog04_Proj02] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Prog04_Proj02', N'ON'
GO
ALTER DATABASE [Prog04_Proj02] SET QUERY_STORE = OFF
GO
USE [Prog04_Proj02]
GO
/****** Object:  User [UserProg04_Proj02]    Script Date: 11/29/2018 8:02:22 PM ******/
CREATE USER [UserProg04_Proj02] FOR LOGIN [UserProg04_Proj02] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [UserProg04_Proj02]
GO
ALTER ROLE [db_datareader] ADD MEMBER [UserProg04_Proj02]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [UserProg04_Proj02]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 11/29/2018 8:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[idCategoriaProducto] [tinyint] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[fechaModificacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoriaProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_FACTURA]    Script Date: 11/29/2018 8:02:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_FACTURA](
	[idFactura] [int] NOT NULL,
	[idOrdenCompra] [int] NOT NULL,
	[detalleFactura] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTURA]    Script Date: 11/29/2018 8:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTURA](
	[idFactura] [int] NOT NULL,
	[idCliente] [nvarchar](80) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INVENTARIO]    Script Date: 11/29/2018 8:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INVENTARIO](
	[idProveedor] [tinyint] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidadDisponible] [smallint] NULL,
	[fechaModificacion] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGIN]    Script Date: 11/29/2018 8:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGIN](
	[L_Correo] [nvarchar](80) NOT NULL,
	[L_Nombre] [nvarchar](100) NOT NULL,
	[L_Password] [nvarchar](12) NOT NULL,
	[L_Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[L_Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDEN_COMPRA]    Script Date: 11/29/2018 8:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDEN_COMPRA](
	[idOrdenCompra] [int] NOT NULL,
	[idCliente] [nvarchar](80) NOT NULL,
	[idproducto] [int] NOT NULL,
	[cantidadProducto] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idOrdenCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERFILES]    Script Date: 11/29/2018 8:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERFILES](
	[P_Id_Perfil] [tinyint] NOT NULL,
	[P_Nombre_Perfil] [nvarchar](15) NULL,
	[P_Descripcion_perfil] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Id_Perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 11/29/2018 8:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[idProducto] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[precioUnitario] [decimal](10, 2) NOT NULL,
	[descripcion] [nvarchar](150) NULL,
	[idSubcategoriaProducto] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 11/29/2018 8:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDOR](
	[idProveedor] [tinyint] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[direccion] [nvarchar](150) NOT NULL,
	[telefono] [nvarchar](15) NOT NULL,
	[email] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUB_CATEGORIA]    Script Date: 11/29/2018 8:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUB_CATEGORIA](
	[idSubcategoriaProducto] [tinyint] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[idCategoriaProducto] [tinyint] NOT NULL,
	[fechaModificacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSubcategoriaProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 11/29/2018 8:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[U_Correo] [nvarchar](80) NOT NULL,
	[U_Nombre] [nvarchar](100) NOT NULL,
	[U_Identificacion] [int] NULL,
	[U_Direccion] [nvarchar](150) NULL,
	[U_Telefono] [nvarchar](15) NULL,
	[U_Perfil] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[U_Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CATEGORIA] ([idCategoriaProducto], [nombre], [fechaModificacion]) VALUES (1, N'Tecnologia', CAST(N'2018-11-29T10:11:22.363' AS DateTime))
INSERT [dbo].[CATEGORIA] ([idCategoriaProducto], [nombre], [fechaModificacion]) VALUES (2, N'Ropa', CAST(N'2019-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[DETALLE_FACTURA] ([idFactura], [idOrdenCompra], [detalleFactura]) VALUES (1, 1, N'Compra Pantalla')
INSERT [dbo].[DETALLE_FACTURA] ([idFactura], [idOrdenCompra], [detalleFactura]) VALUES (2, 2, N'Compra Camisas de niños')
INSERT [dbo].[FACTURA] ([idFactura], [idCliente], [fechaCreacion]) VALUES (1, N'carlos@hotmail.com', CAST(N'2018-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[FACTURA] ([idFactura], [idCliente], [fechaCreacion]) VALUES (2, N'carlos@hotmail.com', CAST(N'2018-12-29T00:00:00.000' AS DateTime))
INSERT [dbo].[INVENTARIO] ([idProveedor], [idProducto], [cantidadDisponible], [fechaModificacion]) VALUES (2, 2, 100, CAST(N'2018-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[INVENTARIO] ([idProveedor], [idProducto], [cantidadDisponible], [fechaModificacion]) VALUES (1, 1, 23, CAST(N'2018-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[LOGIN] ([L_Correo], [L_Nombre], [L_Password], [L_Estado]) VALUES (N'carlos@hotmail.com', N'carlos', N'12345678', 1)
INSERT [dbo].[LOGIN] ([L_Correo], [L_Nombre], [L_Password], [L_Estado]) VALUES (N'root@amazon.com', N'Root', N'RootPassword', 1)
INSERT [dbo].[ORDEN_COMPRA] ([idOrdenCompra], [idCliente], [idproducto], [cantidadProducto]) VALUES (1, N'carlos@hotmail.com', 1, 1)
INSERT [dbo].[ORDEN_COMPRA] ([idOrdenCompra], [idCliente], [idproducto], [cantidadProducto]) VALUES (2, N'carlos@hotmail.com', 2, 4)
INSERT [dbo].[PERFILES] ([P_Id_Perfil], [P_Nombre_Perfil], [P_Descripcion_perfil]) VALUES (0, N'Root', N'Perfil con maximo privilegio')
INSERT [dbo].[PERFILES] ([P_Id_Perfil], [P_Nombre_Perfil], [P_Descripcion_perfil]) VALUES (1, N'Admin', N'Perfil Adminitrativo')
INSERT [dbo].[PERFILES] ([P_Id_Perfil], [P_Nombre_Perfil], [P_Descripcion_perfil]) VALUES (2, N'User', N'Perfil de Clientes')
INSERT [dbo].[PRODUCTO] ([idProducto], [nombre], [precioUnitario], [descripcion], [idSubcategoriaProducto]) VALUES (1, N'Pantalla', CAST(980500.00 AS Decimal(10, 2)), N'Pantalla Sony 50"', 1)
INSERT [dbo].[PRODUCTO] ([idProducto], [nombre], [precioUnitario], [descripcion], [idSubcategoriaProducto]) VALUES (2, N'Camiseta niño', CAST(5600.00 AS Decimal(10, 2)), N'Camiseta talla "S" de Sonic', 2)
INSERT [dbo].[PROVEEDOR] ([idProveedor], [nombre], [direccion], [telefono], [email]) VALUES (1, N'CEMACO', N'San Jose Costa Rica, 100 metros este de Torre Mercedes, Paseo Colon', N'+50622408987', N'cemaco_ventas@cemaco.com')
INSERT [dbo].[PROVEEDOR] ([idProveedor], [nombre], [direccion], [telefono], [email]) VALUES (2, N'ALIS', N'Heredia Costa Rica, 100 metros norte del Hospital Central', N'+50622702587', N'alis_ventas@alis.com')
INSERT [dbo].[SUB_CATEGORIA] ([idSubcategoriaProducto], [nombre], [idCategoriaProducto], [fechaModificacion]) VALUES (1, N'Entretenimiento', 1, CAST(N'2018-12-29T00:00:00.000' AS DateTime))
INSERT [dbo].[SUB_CATEGORIA] ([idSubcategoriaProducto], [nombre], [idCategoriaProducto], [fechaModificacion]) VALUES (2, N'Niños', 2, CAST(N'2018-12-29T00:00:00.000' AS DateTime))
INSERT [dbo].[USUARIOS] ([U_Correo], [U_Nombre], [U_Identificacion], [U_Direccion], [U_Telefono], [U_Perfil]) VALUES (N'carlos@hotmail.com', N'carlos', 207250253, N'San Jose, Costa Rica', N'+50689843266', 2)
INSERT [dbo].[USUARIOS] ([U_Correo], [U_Nombre], [U_Identificacion], [U_Direccion], [U_Telefono], [U_Perfil]) VALUES (N'root@amazon.com', N'Root', 0, NULL, NULL, 0)
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [fechaModificacion]
GO
ALTER TABLE [dbo].[FACTURA] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[INVENTARIO] ADD  DEFAULT (getdate()) FOR [fechaModificacion]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((0)) FOR [precioUnitario]
GO
ALTER TABLE [dbo].[SUB_CATEGORIA] ADD  DEFAULT (getdate()) FOR [fechaModificacion]
GO
ALTER TABLE [dbo].[DETALLE_FACTURA]  WITH CHECK ADD FOREIGN KEY([idFactura])
REFERENCES [dbo].[FACTURA] ([idFactura])
GO
ALTER TABLE [dbo].[DETALLE_FACTURA]  WITH CHECK ADD FOREIGN KEY([idOrdenCompra])
REFERENCES [dbo].[ORDEN_COMPRA] ([idOrdenCompra])
GO
ALTER TABLE [dbo].[FACTURA]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[USUARIOS] ([U_Correo])
GO
ALTER TABLE [dbo].[INVENTARIO]  WITH CHECK ADD FOREIGN KEY([idProveedor])
REFERENCES [dbo].[PROVEEDOR] ([idProveedor])
GO
ALTER TABLE [dbo].[INVENTARIO]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[PRODUCTO] ([idProducto])
GO
ALTER TABLE [dbo].[ORDEN_COMPRA]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[USUARIOS] ([U_Correo])
GO
ALTER TABLE [dbo].[ORDEN_COMPRA]  WITH CHECK ADD FOREIGN KEY([idproducto])
REFERENCES [dbo].[PRODUCTO] ([idProducto])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([idSubcategoriaProducto])
REFERENCES [dbo].[SUB_CATEGORIA] ([idSubcategoriaProducto])
GO
ALTER TABLE [dbo].[SUB_CATEGORIA]  WITH CHECK ADD FOREIGN KEY([idCategoriaProducto])
REFERENCES [dbo].[CATEGORIA] ([idCategoriaProducto])
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD FOREIGN KEY([U_Perfil])
REFERENCES [dbo].[PERFILES] ([P_Id_Perfil])
GO
/****** Object:  StoredProcedure [dbo].[SP_Change_Password]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Change_Password]
	@Correo nvarchar(80),
	@Password nvarchar(12)
as 
begin transaction 
	begin try
		update LOGIN set L_Password = @Password	where L_Correo = @Correo 
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Create_User_Account]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Create_User_Account]
	@Correo nvarchar(80),
	@Nombre nvarchar(100),
	@Password nvarchar(12)
as 
begin transaction 
	begin try
		insert into  USUARIOS (U_Correo, U_Nombre, U_Perfil)
		values (@Correo, @Nombre, 2)

		insert into  LOGIN (L_Correo, L_Nombre, L_Password, L_Estado)
		values (@Correo,@Nombre, @Password, 1)

		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Data_CATEGORIA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Delete_Data_CATEGORIA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Data_DETALLE_FACTURA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Delete_Data_DETALLE_FACTURA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Data_FACTURA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Delete_Data_FACTURA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Data_INVENTARIO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Delete_Data_INVENTARIO]
	@idProveedor tinyint
as
begin transaction 
begin try
	delete from INVENTARIO where idProveedor = @idProveedor
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Data_ORDEN_COMPRA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Delete_Data_ORDEN_COMPRA]
	@idOrdenCompra int
as
begin transaction 
begin try
	delete from ORDEN_COMPRA where idOrdenCompra = @idOrdenCompra
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Data_PRODUCTO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Delete_Data_PRODUCTO]
	@idProducto int
as
begin transaction 
begin try
	delete from PRODUCTO where idProducto = @idProducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Data_PROVEEDOR]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Delete_Data_PROVEEDOR]
	@idProveedor tinyint
as
begin transaction 
begin try
	delete from PROVEEDOR where idProveedor = @idProveedor
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Data_SUB_CATEGORIA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Delete_Data_SUB_CATEGORIA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_User_Account]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Delete_User_Account]
	@Correo nvarchar(80),
	@Password nvarchar(12)
as 
begin transaction 
	begin try
		delete from USUARIOS where U_Correo = @Correo
		delete from LOGIN where L_Correo = @Correo and L_Password = @Password
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Data_CATEGORIA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Insert_Data_CATEGORIA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Data_DETALLE_FACTURA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Insert_Data_DETALLE_FACTURA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Data_FACTURA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Insert_Data_FACTURA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Data_INVENTARIO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Insert_Data_INVENTARIO]
	@idProveedor tinyint,
	@idProducto int,
	@cantidadDisponible smallint,
	@fechaModificacion  datetime
as
begin transaction 
begin try
	insert into INVENTARIO (idProveedor, idProducto, cantidadDisponible, fechaModificacion)
	values (@idProveedor, @idProducto, @cantidadDisponible, @fechaModificacion)
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Data_ORDEN_COMPRA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Insert_Data_ORDEN_COMPRA]
	@idOrdenCompra int,
	@idCliente nvarchar(80),
	@idproducto int,
	@cantidadProducto tinyint
as
begin transaction 
begin try
	insert into ORDEN_COMPRA (idOrdenCompra, idCliente, idproducto, cantidadProducto)
	values (@idOrdenCompra, @idCliente, @idproducto, @cantidadProducto)
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Data_PRODUCTO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Insert_Data_PRODUCTO]
	@idProducto int,
	@nombre nvarchar(100),
	@precioUnitario decimal(10,2),
	@descripcion nvarchar (150),
	@idSubcategoriaProducto tinyint
as
begin transaction 
begin try
	insert into PRODUCTO (idProducto, nombre, precioUnitario, descripcion, idSubcategoriaProducto)
	values (@idProducto, @nombre, @precioUnitario, @descripcion, @idSubcategoriaProducto)
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Data_PROVEEDOR]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Insert_Data_PROVEEDOR]
	@idProveedor tinyint,
	@nombre nvarchar(100),
	@direccion nvarchar(150),
	@telefono nvarchar(15),
	@email nvarchar(80)
as
begin transaction 
begin try
	insert into PROVEEDOR (idProveedor, nombre, direccion, telefono, email)
	values (@idProveedor, @nombre, @direccion, @telefono, @email)
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Data_SUB_CATEGORIA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Insert_Data_SUB_CATEGORIA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Login]
	@Correo nvarchar(80),
	@Password nvarchar(12)
as 
begin transaction 
	begin try
		select L_Correo, L_Nombre, L_Password, L_Estado
		from LOGIN 
		where L_Correo = @Correo and L_Password = @Password
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Password_Restore]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Password_Restore]
	@Correo nvarchar(80)
as 
begin transaction 
	begin try
		select L_Password from LOGIN where L_Correo = @Correo
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Data_CATEGORIA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Update_Data_CATEGORIA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Data_DETALLE_FACTURA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Update_Data_DETALLE_FACTURA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Data_FACTURA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Update_Data_FACTURA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Data_INVENTARIO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Update_Data_INVENTARIO]
	@idProveedor tinyint,
	@idProducto int,
	@cantidadDisponible smallint,
	@fechaModificacion  datetime
as
begin transaction 
begin try
	update INVENTARIO set idProducto = @idProducto, cantidadDisponible = @cantidadDisponible, 
	fechaModificacion = @fechaModificacion
	where idProveedor = @idProveedor
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Data_ORDEN_COMPRA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Update_Data_ORDEN_COMPRA]
	@idOrdenCompra int,
	@idCliente nvarchar(80),
	@idproducto int,
	@cantidadProducto tinyint
as
begin transaction 
begin try
	update ORDEN_COMPRA set idCliente = @idCliente, idproducto = @idproducto, 
	cantidadProducto = @cantidadProducto
	where idOrdenCompra = @idOrdenCompra
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Data_PRODUCTO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Update_Data_PRODUCTO]
	@idProducto int,
	@nombre nvarchar(100),
	@precioUnitario decimal(10,2),
	@descripcion nvarchar (150),
	@idSubcategoriaProducto tinyint
as
begin transaction 
begin try
	update PRODUCTO set nombre = @nombre, precioUnitario = @precioUnitario, 
	descripcion = @descripcion, idSubcategoriaProducto = @idSubcategoriaProducto
	where idProducto = @idProducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Data_PROVEEDOR]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Update_Data_PROVEEDOR]
	@idProveedor tinyint,
	@nombre nvarchar(100),
	@direccion nvarchar(150),
	@telefono nvarchar(15),
	@email nvarchar(80)
as
begin transaction 
begin try
	update PROVEEDOR set  nombre = @nombre, direccion = @direccion, 
	telefono = @telefono, email = @email
	where idProveedor = @idProveedor
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Data_SUB_CATEGORIA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Update_Data_SUB_CATEGORIA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_User_Account]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Update_User_Account]
	@Correo nvarchar(80),
	@Identificacion int,
	@Direccion nvarchar(150),
	@Telefono nvarchar(15)
as 
begin transaction 
	begin try
		update USUARIOS set U_Identificacion = @Identificacion, 
		U_Direccion = @Direccion, U_Telefono = @Telefono
		where U_Correo = @Correo
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_All_Admins]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_View_All_Admins]
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 0 or P_Id_Perfil = 1
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_ALL_Data_CATEGORIA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_ALL_Data_CATEGORIA]
as
begin transaction 
begin try
	select idCategoriaProducto, nombre, fechaModificacion from CATEGORIA
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_ALL_Data_DETALLE_FACTURA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_VIEW_ALL_Data_DETALLE_FACTURA]
as
begin transaction 
begin try
	select idFactura, idOrdenCompra, detalleFactura from DETALLE_FACTURA
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_ALL_Data_FACTURA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_ALL_Data_FACTURA]
as
begin transaction 
begin try
	select idFactura, idCliente, fechaCreacion from FACTURA
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_ALL_Data_INVENTARIO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_ALL_Data_INVENTARIO]
as
begin transaction 
begin try
	select idProveedor, idProducto, cantidadDisponible, fechaModificacion from INVENTARIO
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_ALL_Data_ORDEN_COMPRA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_ALL_Data_ORDEN_COMPRA]
as
begin transaction 
begin try
	select idOrdenCompra, idCliente, idproducto, cantidadProducto from ORDEN_COMPRA
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_ALL_Data_PRODUCTO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_ALL_Data_PRODUCTO]
as
begin transaction 
begin try
	select idProducto, nombre, precioUnitario, descripcion, idSubcategoriaProducto from PRODUCTO
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_ALL_Data_PROVEEDOR]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_ALL_Data_PROVEEDOR]
as
begin transaction 
begin try
	select idProveedor, nombre, direccion, telefono, email from PROVEEDOR
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_ALL_Data_SUB_CATEGORIA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_ALL_Data_SUB_CATEGORIA]
as
begin transaction 
begin try
	select idSubcategoriaProducto, nombre, idCategoriaProducto, fechaModificacion from SUB_CATEGORIA
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_All_Users]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_View_All_Users]
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 2
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_BILL_Data_DETALLE_FACTURA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_VIEW_BILL_Data_DETALLE_FACTURA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_BUY_Data_DETALLE_FACTURA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_VIEW_BUY_Data_DETALLE_FACTURA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_DATE_Data_CATEGORIA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_VIEW_DATE_Data_CATEGORIA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_DATE_Data_FACTURA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_DATE_Data_FACTURA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_DATE_Data_INVENTARIO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_DATE_Data_INVENTARIO]
	@startDate datetime,
	@endDate datetime
as
begin transaction 
begin try
	select idProveedor, idProducto, cantidadDisponible, fechaModificacion 
	from INVENTARIO
	where fechaModificacion BETWEEN @startDate AND @endDate
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_DATE_Data_SUB_CATEGORIA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_DATE_Data_SUB_CATEGORIA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_View_Email_Admins]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_View_Email_Admins]
	@Correo nvarchar(80)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 0 or P_Id_Perfil = 1 and U.U_Correo = @Correo
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_EMAIL_Data_PROVEEDOR]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_EMAIL_Data_PROVEEDOR]
	@email nvarchar(80)
as
begin transaction 
begin try
	select idProveedor, nombre, direccion, telefono, email 
	from PROVEEDOR
	where email = @email
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_Email_Users]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_View_Email_Users]
	@Correo nvarchar(80)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 2 and U.U_Correo = @Correo
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_ID_Admins]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_View_ID_Admins]
	@Identificacion int
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 0 or P_Id_Perfil = 1 and U.U_Identificacion = @Identificacion
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_ID_Data_CATEGORIA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_ID_Data_CATEGORIA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_ID_Data_PRODUCTO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_ID_Data_PRODUCTO]
	@idProducto int
as
begin transaction 
begin try
	select idProducto, nombre, precioUnitario, descripcion, idSubcategoriaProducto 
	from PRODUCTO
	where idProducto = @idProducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_ID_Data_PROVEEDOR]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_ID_Data_PROVEEDOR]
	@idProveedor tinyint
as
begin transaction 
begin try
	select idProveedor, nombre, direccion, telefono, email 
	from PROVEEDOR
	where idProveedor = @idProveedor
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_ID_Data_SUB_CATEGORIA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_ID_Data_SUB_CATEGORIA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_View_ID_Users]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_View_ID_Users]
	@Identificacion int
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 2 and U.U_Identificacion = @Identificacion
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_IDBILL_Data_FACTURA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_IDBILL_Data_FACTURA]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_IDBUY_Data_ORDEN_COMPRA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_IDBUY_Data_ORDEN_COMPRA]
	@idOrdenCompra int
as
begin transaction 
begin try
	select idOrdenCompra, idCliente, idproducto, cantidadProducto 
	from ORDEN_COMPRA
	where idOrdenCompra = @idOrdenCompra
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_IDCLIENT_Data_FACTURA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_IDCLIENT_Data_FACTURA]
	@idCliente nvarchar(80)
as
begin transaction 
begin try
	select idFactura, idCliente, fechaCreacion 
	from FACTURA
	where idCliente = @idCliente
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_IDCLIENT_Data_ORDEN_COMPRA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_IDCLIENT_Data_ORDEN_COMPRA]
	@idCliente nvarchar(80)
as
begin transaction 
begin try
	select idOrdenCompra, idCliente, idproducto, cantidadProducto 
	from ORDEN_COMPRA
	where idCliente = @idCliente
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_IDPRODUCT_Data_ORDEN_COMPRA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_IDPRODUCT_Data_ORDEN_COMPRA]
	@idproducto int
as
begin transaction 
begin try
	select idOrdenCompra, idCliente, idproducto, cantidadProducto 
	from ORDEN_COMPRA
	where idproducto = @idproducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_Name_Admins]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_View_Name_Admins]
	@Nombre nvarchar(100)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 0 or P_Id_Perfil = 1 and U.U_Nombre = @Nombre
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_NAME_Data_CATEGORIA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_VIEW_NAME_Data_CATEGORIA]
	@nombre nvarchar(50)
as
begin transaction 
begin try
	select idCategoriaProducto, nombre, fechaModificacion 
	from CATEGORIA
	WHERE nombre = @nombre
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_NAME_Data_PRODUCTO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_NAME_Data_PRODUCTO]
	@nombre nvarchar(100)
as
begin transaction 
begin try
	select idProducto, nombre, precioUnitario, descripcion, idSubcategoriaProducto 
	from PRODUCTO
	where nombre = @nombre
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_NAME_Data_PROVEEDOR]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_NAME_Data_PROVEEDOR]
	@nombre nvarchar(100)
as
begin transaction 
begin try
	select idProveedor, nombre, direccion, telefono, email 
	from PROVEEDOR
	where nombre = @nombre
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_NAME_Data_SUB_CATEGORIA]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_NAME_Data_SUB_CATEGORIA]
	@nombre nvarchar(50)
as
begin transaction 
begin try
	select idSubcategoriaProducto, nombre, idCategoriaProducto, fechaModificacion 
	from SUB_CATEGORIA
	WHERE nombre = @nombre
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_Name_Users]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_View_Name_Users]
	@Nombre nvarchar(100)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 2 and U.U_Nombre = @Nombre
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_PRICE_Data_PRODUCTO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_PRICE_Data_PRODUCTO]
	@precioUnitario decimal(10,2)
as
begin transaction 
begin try
	select idProducto, nombre, precioUnitario, descripcion, idSubcategoriaProducto 
	from PRODUCTO
	where precioUnitario = @precioUnitario
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_PRODUCT_Data_INVENTARIO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_PRODUCT_Data_INVENTARIO]
	@idProducto int
as
begin transaction 
begin try
	select idProveedor, idProducto, cantidadDisponible, fechaModificacion 
	from INVENTARIO
	where idProducto = @idProducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_PROVIDER_Data_INVENTARIO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_PROVIDER_Data_INVENTARIO]
	@idProveedor tinyint
as
begin transaction 
begin try
	select idProveedor, idProducto, cantidadDisponible, fechaModificacion 
	from INVENTARIO
	where idProveedor = @idProveedor
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_VIEW_QUANTITY_Data_INVENTARIO]    Script Date: 11/29/2018 8:02:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_VIEW_QUANTITY_Data_INVENTARIO]
	@cantidadDisponible smallint
as
begin transaction 
begin try
	select idProveedor, idProducto, cantidadDisponible, fechaModificacion 
	from INVENTARIO
	where cantidadDisponible = @cantidadDisponible
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
USE [master]
GO
ALTER DATABASE [Prog04_Proj02] SET  READ_WRITE 
GO
