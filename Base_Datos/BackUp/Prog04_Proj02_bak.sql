USE [master]
GO
/****** Object:  Database [Prog04_Proj02]    Script Date: 12/20/2018 10:33:10 PM ******/
CREATE DATABASE [Prog04_Proj02]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prog04_Proj02', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Prog04_Proj02.mdf' , SIZE = 8192KB , MAXSIZE = 20480KB , FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'Prog04_Proj02_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Log\Prog04_Proj02_log.ldf' , SIZE = 1024KB , MAXSIZE = 20480KB , FILEGROWTH = 5120KB )
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
ALTER DATABASE [Prog04_Proj02] SET  DISABLE_BROKER 
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
/****** Object:  User [UserProg04_Proj02]    Script Date: 12/20/2018 10:33:10 PM ******/
CREATE USER [UserProg04_Proj02] FOR LOGIN [UserProg04_Proj02] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [UserProg04_Proj02]
GO
ALTER ROLE [db_datareader] ADD MEMBER [UserProg04_Proj02]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [UserProg04_Proj02]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 12/20/2018 10:33:10 PM ******/
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
/****** Object:  Table [dbo].[DETALLE_VENTA]    Script Date: 12/20/2018 10:33:11 PM ******/
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
/****** Object:  Table [dbo].[LOGIN]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGIN](
	[L_Correo] [nvarchar](80) NOT NULL,
	[L_Nombre] [nvarchar](100) NOT NULL,
	[L_Password] [nvarchar](12) NOT NULL,
	[L_Estado] [bit] NOT NULL,
	[L_Perfil] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[L_Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERFILES]    Script Date: 12/20/2018 10:33:11 PM ******/
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
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 12/20/2018 10:33:11 PM ******/
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
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[U_Correo] [nvarchar](80) NOT NULL,
	[U_Nombre] [nvarchar](100) NOT NULL,
	[U_Identificacion] [nvarchar](9) NULL,
	[U_Direccion] [nvarchar](150) NULL,
	[U_Telefono] [nvarchar](15) NULL,
	[U_Perfil] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[U_Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 12/20/2018 10:33:11 PM ******/
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
INSERT [dbo].[CATEGORIA] ([codcategoria], [descategoria]) VALUES (N'1 ', N'Audifonos')
INSERT [dbo].[CATEGORIA] ([codcategoria], [descategoria]) VALUES (N'2 ', N'Camaras')
INSERT [dbo].[CATEGORIA] ([codcategoria], [descategoria]) VALUES (N'3 ', N'Celulares')
INSERT [dbo].[CATEGORIA] ([codcategoria], [descategoria]) VALUES (N'4 ', N'Laptops')
INSERT [dbo].[CATEGORIA] ([codcategoria], [descategoria]) VALUES (N'5 ', N'Tablets')
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [DV_Cantidad], [DV_Precio], [DV_SubTotal], [codproducto]) VALUES (N'0001      ', 1, CAST(2500.00 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), N'1   ')
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [DV_Cantidad], [DV_Precio], [DV_SubTotal], [codproducto]) VALUES (N'0003      ', 1, CAST(1500.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), N'3   ')
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [DV_Cantidad], [DV_Precio], [DV_SubTotal], [codproducto]) VALUES (N'0003      ', 1, CAST(4000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'4   ')
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [DV_Cantidad], [DV_Precio], [DV_SubTotal], [codproducto]) VALUES (N'0004      ', 1, CAST(4000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'4   ')
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [DV_Cantidad], [DV_Precio], [DV_SubTotal], [codproducto]) VALUES (N'0004      ', 1, CAST(1500.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), N'3   ')
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [DV_Cantidad], [DV_Precio], [DV_SubTotal], [codproducto]) VALUES (N'0008      ', 1, CAST(4000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'4   ')
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [DV_Cantidad], [DV_Precio], [DV_SubTotal], [codproducto]) VALUES (N'0009      ', 1, CAST(4000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'4   ')
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [DV_Cantidad], [DV_Precio], [DV_SubTotal], [codproducto]) VALUES (N'0001      ', 1, CAST(1500.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), N'3   ')
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [DV_Cantidad], [DV_Precio], [DV_SubTotal], [codproducto]) VALUES (N'0005      ', 2, CAST(4000.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)), N'4   ')
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [DV_Cantidad], [DV_Precio], [DV_SubTotal], [codproducto]) VALUES (N'0006      ', 2, CAST(4000.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)), N'4   ')
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [DV_Cantidad], [DV_Precio], [DV_SubTotal], [codproducto]) VALUES (N'0007      ', 1, CAST(4000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'4   ')
INSERT [dbo].[DETALLE_VENTA] ([VEN_Codigo], [DV_Cantidad], [DV_Precio], [DV_SubTotal], [codproducto]) VALUES (N'0010      ', 1, CAST(4000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'4   ')
INSERT [dbo].[LOGIN] ([L_Correo], [L_Nombre], [L_Password], [L_Estado], [L_Perfil]) VALUES (N'amazonface.mail@gmail.com', N'AmazonFake', N'AmazonFake', 1, 2)
INSERT [dbo].[LOGIN] ([L_Correo], [L_Nombre], [L_Password], [L_Estado], [L_Perfil]) VALUES (N'carlos@hotmail.com', N'Carlos Andres Mondragon', N'Carlos23', 1, 2)
INSERT [dbo].[LOGIN] ([L_Correo], [L_Nombre], [L_Password], [L_Estado], [L_Perfil]) VALUES (N'JulioCardenas@amazon.com', N'Julio Cardenas', N'JulioCard12', 1, 1)
INSERT [dbo].[LOGIN] ([L_Correo], [L_Nombre], [L_Password], [L_Estado], [L_Perfil]) VALUES (N'marcoarias@amazon.com', N'Marco Arias', N'MarcoA01', 1, 1)
INSERT [dbo].[LOGIN] ([L_Correo], [L_Nombre], [L_Password], [L_Estado], [L_Perfil]) VALUES (N'root@amazon.com', N'Root', N'RootPassword', 1, 0)
INSERT [dbo].[PERFILES] ([P_Id_Perfil], [P_Nombre_Perfil], [P_Descripcion_perfil]) VALUES (0, N'Root', N'Perfil con maximo privilegio')
INSERT [dbo].[PERFILES] ([P_Id_Perfil], [P_Nombre_Perfil], [P_Descripcion_perfil]) VALUES (1, N'Admin', N'Perfil Adminitrativo')
INSERT [dbo].[PERFILES] ([P_Id_Perfil], [P_Nombre_Perfil], [P_Descripcion_perfil]) VALUES (2, N'User', N'Perfil de Clientes')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'1   ', N'Audifono bluetooth Azul', N'1 ', CAST(10500.00 AS Decimal(18, 2)), 10, N'Audifono01.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'10  ', N'Celular Motorola', N'3 ', CAST(250000.00 AS Decimal(18, 2)), 10, N'Celular03.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'11  ', N'Celular samsung Galaxy 03', N'3 ', CAST(450000.00 AS Decimal(18, 2)), 10, N'Celular04.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'12  ', N'Laptop 14', N'4 ', CAST(250000.00 AS Decimal(18, 2)), 10, N'Laptop01.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'13  ', N'Laptop 14', N'4 ', CAST(350000.00 AS Decimal(18, 2)), 10, N'Laptop02.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'14  ', N'Laptop 14', N'4 ', CAST(250000.00 AS Decimal(18, 2)), 10, N'Laptop03.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'15  ', N'Laptop 14', N'4 ', CAST(450000.00 AS Decimal(18, 2)), 10, N'Laptop04.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'16  ', N'Laptop 14', N'4 ', CAST(450000.00 AS Decimal(18, 2)), 10, N'Laptop05.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'17  ', N'Laptop 14', N'4 ', CAST(550000.00 AS Decimal(18, 2)), 10, N'Laptop06.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'18  ', N'Tbablet 10', N'5 ', CAST(150000.00 AS Decimal(18, 2)), 10, N'Tablet01.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'19  ', N'Tbablet 12', N'5 ', CAST(200000.00 AS Decimal(18, 2)), 10, N'Tablet02.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'2   ', N'Audifono Negro', N'1 ', CAST(8500.00 AS Decimal(18, 2)), 10, N'Audifono03.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'20  ', N'Tbablet 14', N'5 ', CAST(250000.00 AS Decimal(18, 2)), 10, N'Tablet03.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'3   ', N'Audifono bluetooth Negro', N'1 ', CAST(10500.00 AS Decimal(18, 2)), 10, N'Audifono04.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'4   ', N'Audifono Verde', N'1 ', CAST(7000.00 AS Decimal(18, 2)), 10, N'Audifono05.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'5   ', N'Camara Digital 12x', N'2 ', CAST(15500.00 AS Decimal(18, 2)), 10, N'Camara01.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'6   ', N'Camara Digital 15x', N'2 ', CAST(28500.00 AS Decimal(18, 2)), 10, N'Camara02.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'7   ', N'Camara Digital 30x', N'2 ', CAST(50500.00 AS Decimal(18, 2)), 10, N'Camara03.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'8   ', N'Celular samsung Galaxy 01', N'3 ', CAST(250000.00 AS Decimal(18, 2)), 10, N'Celular01.jpg')
INSERT [dbo].[PRODUCTOS] ([codproducto], [desproducto], [codcategoria], [preproducto], [canproducto], [imagen]) VALUES (N'9   ', N'Celular samsung Galaxy 02', N'3 ', CAST(350000.00 AS Decimal(18, 2)), 10, N'Celular02.jpg')
INSERT [dbo].[USUARIOS] ([U_Correo], [U_Nombre], [U_Identificacion], [U_Direccion], [U_Telefono], [U_Perfil]) VALUES (N'amazonface.mail@gmail.com', N'AmazonFake', N'608760456', N'Puntaresnas, de la terminal de buses 100 mts este y 200 mts sur', N'+50688843255', 2)
INSERT [dbo].[USUARIOS] ([U_Correo], [U_Nombre], [U_Identificacion], [U_Direccion], [U_Telefono], [U_Perfil]) VALUES (N'carlos@hotmail.com', N'Carlos Andres Mondragon', N'207250253', N'San Jose, Costa Rica, 100 mts norte de a iglesia de San pedro frete al Supermercado', N'+50689843266', 2)
INSERT [dbo].[USUARIOS] ([U_Correo], [U_Nombre], [U_Identificacion], [U_Direccion], [U_Telefono], [U_Perfil]) VALUES (N'JulioCardenas@amazon.com', N'Julio Cardenas', N'206250234', N'San José, Costa Rica, Baririo El camrne, 150 mts este de la iglesia ', N'+50622705643', 1)
INSERT [dbo].[USUARIOS] ([U_Correo], [U_Nombre], [U_Identificacion], [U_Direccion], [U_Telefono], [U_Perfil]) VALUES (N'marcoarias@amazon.com', N'Marco Arias', N'204560876', N'Alajuela, Costa Rica, 100 mts del Coyol de Alajuela', N'+50622456543', 1)
INSERT [dbo].[USUARIOS] ([U_Correo], [U_Nombre], [U_Identificacion], [U_Direccion], [U_Telefono], [U_Perfil]) VALUES (N'root@amazon.com', N'Root', NULL, NULL, NULL, 0)
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [VEN_SuTotal], [VEN_IGV], [VEN_Total], [VEN_Cliente]) VALUES (N'0001      ', N'17/07/2014', CAST(3280.00 AS Decimal(10, 2)), CAST(720.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'ERIKA FLORES ORTIZ')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [VEN_SuTotal], [VEN_IGV], [VEN_Total], [VEN_Cliente]) VALUES (N'0002      ', N'12/20/2018', CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Carlos Andres Mondragon')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [VEN_SuTotal], [VEN_IGV], [VEN_Total], [VEN_Cliente]) VALUES (N'0003      ', N'12/20/2018', CAST(4510.00 AS Decimal(10, 2)), CAST(990.00 AS Decimal(10, 2)), CAST(5500.00 AS Decimal(10, 2)), N'AmazonFake test')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [VEN_SuTotal], [VEN_IGV], [VEN_Total], [VEN_Cliente]) VALUES (N'0004      ', N'12/20/2018', CAST(4510.00 AS Decimal(10, 2)), CAST(990.00 AS Decimal(10, 2)), CAST(5500.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [VEN_SuTotal], [VEN_IGV], [VEN_Total], [VEN_Cliente]) VALUES (N'0005      ', N'12/20/2018', CAST(6560.00 AS Decimal(10, 2)), CAST(1440.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [VEN_SuTotal], [VEN_IGV], [VEN_Total], [VEN_Cliente]) VALUES (N'0006      ', N'12/20/2018', CAST(6560.00 AS Decimal(10, 2)), CAST(1440.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)), N'AmazonFake test')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [VEN_SuTotal], [VEN_IGV], [VEN_Total], [VEN_Cliente]) VALUES (N'0007      ', N'12/20/2018', CAST(3280.00 AS Decimal(10, 2)), CAST(720.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'AmazonFake test')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [VEN_SuTotal], [VEN_IGV], [VEN_Total], [VEN_Cliente]) VALUES (N'0008      ', N'12/20/2018', CAST(3280.00 AS Decimal(10, 2)), CAST(720.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [VEN_SuTotal], [VEN_IGV], [VEN_Total], [VEN_Cliente]) VALUES (N'0009      ', N'12/20/2018', CAST(3280.00 AS Decimal(10, 2)), CAST(720.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'AmazonFake test')
INSERT [dbo].[VENTA] ([VEN_Codigo], [VEN_Fecha], [VEN_SuTotal], [VEN_IGV], [VEN_Total], [VEN_Cliente]) VALUES (N'0010      ', N'12/20/2018', CAST(3280.00 AS Decimal(10, 2)), CAST(720.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), N'AmazonFake')
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
ALTER TABLE [dbo].[LOGIN]  WITH CHECK ADD FOREIGN KEY([L_Perfil])
REFERENCES [dbo].[PERFILES] ([P_Id_Perfil])
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([codcategoria])
REFERENCES [dbo].[CATEGORIA] ([codcategoria])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD FOREIGN KEY([U_Perfil])
REFERENCES [dbo].[PERFILES] ([P_Id_Perfil])
GO
/****** Object:  StoredProcedure [dbo].[SP_Change_Password]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Change_Password]
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
/****** Object:  StoredProcedure [dbo].[SP_Count_Ventas]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Count_Ventas]
as
begin transaction 
begin try
	select count(VEN_Codigo),max (VEN_Codigo) from VENTA
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Create_Employee_Account]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Create_Employee_Account]
	@Correo nvarchar(80),
	@Nombre nvarchar(100),
	@Identificacion nvarchar(9),
	@Direccion nvarchar(150),
	@Telefono nvarchar(15),
	@Password nvarchar(12)
as 
begin transaction 
	begin try
		insert into  USUARIOS (U_Correo, U_Nombre, U_Identificacion, U_Direccion, U_Telefono, U_Perfil)
		values (@Correo, @Nombre, @Identificacion, @Direccion, @Telefono, 1)

		insert into  LOGIN (L_Correo, L_Nombre, L_Password, L_Estado, L_Perfil)
		values (@Correo, @Nombre, @Password, 1, 1)

		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Create_User_Account]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Create_User_Account]
	@Correo nvarchar(80),
	@Nombre nvarchar(100),
	@Password nvarchar(12)
as 
begin transaction 
	begin try
		insert into  USUARIOS (U_Correo, U_Nombre, U_Perfil)
		values (@Correo, @Nombre, 2)

		insert into  LOGIN (L_Correo, L_Nombre, L_Password, L_Estado, L_Perfil)
		values (@Correo,@Nombre, @Password, 1, 2)

		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_Productos]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Delete_Productos]
	@desproducto varchar(40)
as
begin transaction 
begin try
	delete from PRODUCTOS where desproducto = @desproducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Delete_User_Account]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Delete_User_Account]
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
/****** Object:  StoredProcedure [dbo].[SP_Delete_User_Account_Por_Admin]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Delete_User_Account_Por_Admin]
	@Correo nvarchar(80)
as 
begin transaction 
	begin try
		delete from USUARIOS where U_Correo = @Correo
		delete from LOGIN where L_Correo = @Correo
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Detalle_Ventas]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Detalle_Ventas]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Productos]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Insert_Productos]
	@codproducto char(2),
	@desproducto varchar(40),
	@codcategoria char(2),
	@preproducto decimal(18,2),
	@canproducto int,
	@Imagen varchar(40)
as
begin transaction 
begin try
	insert into PRODUCTOS(codproducto,desproducto,codcategoria,preproducto,canproducto,imagen)
	values (@codproducto,@desproducto,@codcategoria,@preproducto,@canproducto, @Imagen)
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_Ventas]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Insert_Ventas]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_ListasTodos_Categorias]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ListasTodos_Categorias]
as
begin transaction 
begin try
	select codcategoria, descategoria from Categorias
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Lock_User_Account]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Lock_User_Account]
	@Correo nvarchar(80),
	@Estado bit
as 
begin transaction 
	begin try
		update LOGIN set L_Estado = @Estado
		where L_Correo = @Correo
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Login]
	@Correo nvarchar(80),
	@Password nvarchar(12)
as 
begin transaction 
	begin try
		select L_Correo, L_Nombre, L_Password, L_Estado, L_Perfil
		from LOGIN 
		where L_Correo = @Correo and L_Password = @Password
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_Password_Restore]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Password_Restore]
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
/****** Object:  StoredProcedure [dbo].[SP_Update_User_Account]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Update_User_Account]
	@Correo nvarchar(80),
	@Nombre nvarchar(100),
	@Identificacion nvarchar(9),
	@Direccion nvarchar(150),
	@Telefono nvarchar(15)
as 
begin transaction 
	begin try
		update USUARIOS set U_Nombre = @Nombre,  U_Identificacion = @Identificacion, 
		U_Direccion = @Direccion, U_Telefono = @Telefono
		where U_Correo = @Correo

		update LOGIN set L_Nombre = @Nombre  
		where L_Correo = @Correo

		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_All_Admins]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_View_All_Admins]
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 1
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_All_Users]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_View_All_Users]
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
/****** Object:  StoredProcedure [dbo].[SP_View_Categorias]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_View_Categorias]
	@codcategoria char(2)
as
begin transaction 
begin try
	select codproducto,desproducto,codcategoria,preproducto,canproducto,imagen 
	from PRODUCTOS 
	where codcategoria = @codcategoria
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_CodigoProducto]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_View_CodigoProducto]
	@codproducto char(4)
as
begin transaction 
begin try
	select codproducto,desproducto,codcategoria,preproducto,canproducto,imagen 
	from PRODUCTOS 
	where codproducto = @codproducto
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_Detalle_Ventas]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[SP_View_Detalle_Ventas]
as
begin transaction 
begin try
	SELECT [VEN_Codigo],[DV_Cantidad],[DV_Precio],[DV_SubTotal],[codproducto]
	FROM [dbo].[DETALLE_VENTA]
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_Email_Admins]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_View_Email_Admins]
	@Correo nvarchar(80)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 1 and U.U_Correo like '%' + @Correo + '%'
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_Email_Users]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_View_Email_Users]
	@Correo nvarchar(80)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 2 and U.U_Correo like '%' + @Correo + '%'
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_ID_Admins]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_View_ID_Admins]
	@Identificacion nvarchar(9)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 1 and U.U_Identificacion like '%' + @Identificacion + '%'
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_ID_Users]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_View_ID_Users]
	@Identificacion nvarchar(9)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 2 and U.U_Identificacion like '%' + @Identificacion + '%'
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_Name_Admins]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_View_Name_Admins]
	@Nombre nvarchar(100)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 1 and U.U_Nombre like '%' + @Nombre + '%'
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_Name_Users]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_View_Name_Users]
	@Nombre nvarchar(100)
as 
begin transaction 
	begin try
		select U.U_Correo, U.U_Nombre, U.U_Identificacion, 
		U.U_Direccion, U.U_Telefono, P.P_Nombre_Perfil
		from USUARIOS U inner join PERFILES P on U_Perfil = P_Id_Perfil
		where P_Id_Perfil = 2 and U.U_Nombre like '%' + @Nombre + '%'
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_NombreProducto]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_View_NombreProducto]
	@desproducto varchar(40)
as
begin transaction 
begin try
	select codproducto,desproducto,codcategoria,preproducto,canproducto,imagen 
	from PRODUCTOS 
	where desproducto like '%' + @desproducto + '%'
	commit transaction
end try
begin catch
	rollback transaction
end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_Productos]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_View_Productos]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_View_User_Status]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_View_User_Status]
	@Correo nvarchar(80)
as 
begin transaction 
	begin try
		select L_Estado from LOGIN where L_Correo = @Correo;
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
GO
/****** Object:  StoredProcedure [dbo].[SP_View_Ventas]    Script Date: 12/20/2018 10:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_View_Ventas]
as
begin transaction 
begin try
	SELECT [VEN_Codigo],[VEN_Fecha],[VEN_SuTotal],[VEN_IGV],[VEN_Total],[VEN_Cliente]
	FROM [dbo].[VENTA]
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
