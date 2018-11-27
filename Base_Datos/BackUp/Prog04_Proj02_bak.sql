USE [master]
GO
/****** Object:  Database [Prog04_Proj02]    Script Date: 11/26/2018 9:58:52 PM ******/
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
/****** Object:  User [UserProg04_Proj02]    Script Date: 11/26/2018 9:58:53 PM ******/
CREATE USER [UserProg04_Proj02] FOR LOGIN [UserProg04_Proj02] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [UserProg04_Proj02]
GO
ALTER ROLE [db_datareader] ADD MEMBER [UserProg04_Proj02]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [UserProg04_Proj02]
GO
/****** Object:  Table [dbo].[LOGIN]    Script Date: 11/26/2018 9:58:53 PM ******/
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
/****** Object:  Table [dbo].[PERFILES]    Script Date: 11/26/2018 9:58:53 PM ******/
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
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 11/26/2018 9:58:54 PM ******/
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
INSERT [dbo].[LOGIN] ([L_Correo], [L_Nombre], [L_Password], [L_Estado]) VALUES (N'root@amazon.com', N'Root', N'RootPassword', 1)
INSERT [dbo].[PERFILES] ([P_Id_Perfil], [P_Nombre_Perfil], [P_Descripcion_perfil]) VALUES (0, N'Root', N'Perfil con maximo privilegio')
INSERT [dbo].[PERFILES] ([P_Id_Perfil], [P_Nombre_Perfil], [P_Descripcion_perfil]) VALUES (1, N'Admin', N'Perfil Adminitrativo')
INSERT [dbo].[PERFILES] ([P_Id_Perfil], [P_Nombre_Perfil], [P_Descripcion_perfil]) VALUES (2, N'User', N'Perfil de Clientes')
INSERT [dbo].[USUARIOS] ([U_Correo], [U_Nombre], [U_Identificacion], [U_Direccion], [U_Telefono], [U_Perfil]) VALUES (N'root@amazon.com', N'Root', NULL, NULL, NULL, 0)
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD FOREIGN KEY([U_Perfil])
REFERENCES [dbo].[PERFILES] ([P_Id_Perfil])
GO
/****** Object:  StoredProcedure [dbo].[SP_Change_Password]    Script Date: 11/26/2018 9:58:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Create_User_Account]    Script Date: 11/26/2018 9:58:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Delete_User_Account]    Script Date: 11/26/2018 9:58:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 11/26/2018 9:58:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Password_Restore]    Script Date: 11/26/2018 9:58:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Update_User_Account]    Script Date: 11/26/2018 9:58:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_View_All_Users]    Script Date: 11/26/2018 9:58:54 PM ******/
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
