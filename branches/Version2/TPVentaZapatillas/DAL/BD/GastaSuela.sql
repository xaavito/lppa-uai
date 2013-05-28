USE [master]
GO
/****** Object:  Database [DBGastaSuela]    Script Date: 04/21/2013 22:09:48 ******/
CREATE DATABASE [DBGastaSuela] ON  PRIMARY 
( NAME = N'gastasuela', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\gastasuela.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'gastasuela_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\gastasuela_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBGastaSuela] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBGastaSuela].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBGastaSuela] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DBGastaSuela] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DBGastaSuela] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DBGastaSuela] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DBGastaSuela] SET ARITHABORT OFF
GO
ALTER DATABASE [DBGastaSuela] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DBGastaSuela] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DBGastaSuela] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DBGastaSuela] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DBGastaSuela] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DBGastaSuela] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DBGastaSuela] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DBGastaSuela] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DBGastaSuela] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DBGastaSuela] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DBGastaSuela] SET  DISABLE_BROKER
GO
ALTER DATABASE [DBGastaSuela] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DBGastaSuela] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DBGastaSuela] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DBGastaSuela] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DBGastaSuela] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DBGastaSuela] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DBGastaSuela] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DBGastaSuela] SET  READ_WRITE
GO
ALTER DATABASE [DBGastaSuela] SET RECOVERY FULL
GO
ALTER DATABASE [DBGastaSuela] SET  MULTI_USER
GO
ALTER DATABASE [DBGastaSuela] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DBGastaSuela] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBGastaSuela', N'ON'
GO
USE [DBGastaSuela]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 04/21/2013 22:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[PK_tipoID] [int] NOT NULL,
	[tipoDescripcion] [varchar](50) NOT NULL,
	[tipoDVH] [bigint] NOT NULL,
	[tipoEstado] [bit] NOT NULL,
 CONSTRAINT [PK_Tipo] PRIMARY KEY CLUSTERED 
(
	[PK_tipoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 04/21/2013 22:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[PK_pctoID] [int] NOT NULL,
	[pctoNombre] [nvarchar](20) NOT NULL,
	[pctoPrecioUnit] [money] NOT NULL,
	[pctoStock] [int] NOT NULL,
	[pctoDVH] [bigint] NOT NULL,
	[pctoEstado] [bit] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[PK_pctoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DigitoVerfVertical]    Script Date: 04/21/2013 22:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DigitoVerfVertical](
	[PK_dvhId] [int] NOT NULL,
	[dvhDescripcion] [varchar](50) NOT NULL,
	[dvhTotal] [bigint] NOT NULL,
	[dvhEstado] [bit] NOT NULL,
 CONSTRAINT [PK_DigitoVerfVertical] PRIMARY KEY CLUSTERED 
(
	[PK_dvhId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 04/21/2013 22:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[PK_usrioID] [int] IDENTITY(1,1) NOT NULL,
	[FK_usrioTipo] [int] NOT NULL,
	[usurioNombre] [varchar](50) NOT NULL,
	[usurioContraseña] [varchar](50) NOT NULL,
	[usurioNombreCompleto] [varchar](50) NOT NULL,
	[usurioApellido] [varchar](50) NOT NULL,
	[usurioMail] [varchar](50) NOT NULL,
	[usurioDVH] [bigint] NOT NULL,
	[usurioEstado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[PK_usrioID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 04/21/2013 22:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bitacora](
	[PK_bcraID] [int] NOT NULL,
	[FK_bcoraUsuario] [int] NOT NULL,
	[bcoraDescripcion] [varchar](200) NOT NULL,
	[bcoraFecha] [date] NOT NULL,
	[bcoraDVH] [bigint] NOT NULL,
	[bcoraEstado] [bit] NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[PK_bcraID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 04/21/2013 22:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[PK_vntaID] [int] NOT NULL,
	[FK_vntaUsuario] [int] NOT NULL,
	[vntaFecha] [date] NOT NULL,
	[vntaTotal] [money] NOT NULL,
	[vntaDVH] [bigint] NOT NULL,
	[vntaEstado] [bit] NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[PK_vntaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 04/21/2013 22:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[PK_detalleID] [int] NOT NULL,
	[FK_detalleProducto] [int] NOT NULL,
	[FK_detalleVenta] [int] NOT NULL,
	[detalleCantidad] [int] NOT NULL,
	[detalleDVH] [bigint] NOT NULL,
	[detalleEstado] [bit] NOT NULL,
 CONSTRAINT [PK_Detalle] PRIMARY KEY CLUSTERED 
(
	[PK_detalleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Usuario_Tipo]    Script Date: 04/21/2013 22:09:51 ******/
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Tipo] FOREIGN KEY([FK_usrioTipo])
REFERENCES [dbo].[TipoUsuario] ([PK_tipoID])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Tipo]
GO
/****** Object:  ForeignKey [FK_Bitacora_Usuario]    Script Date: 04/21/2013 22:09:51 ******/
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Usuario] FOREIGN KEY([FK_bcoraUsuario])
REFERENCES [dbo].[Usuario] ([PK_usrioID])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Usuario]
GO
/****** Object:  ForeignKey [FK_Venta_Usuario]    Script Date: 04/21/2013 22:09:51 ******/
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Usuario] FOREIGN KEY([FK_vntaUsuario])
REFERENCES [dbo].[Usuario] ([PK_usrioID])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Usuario]
GO
/****** Object:  ForeignKey [FK_DetalleVenta_Producto]    Script Date: 04/21/2013 22:09:51 ******/
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Producto] FOREIGN KEY([FK_detalleProducto])
REFERENCES [dbo].[Producto] ([PK_pctoID])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Producto]
GO
/****** Object:  ForeignKey [FK_DetalleVenta_Venta]    Script Date: 04/21/2013 22:09:51 ******/
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Venta] FOREIGN KEY([FK_detalleVenta])
REFERENCES [dbo].[Venta] ([PK_vntaID])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Venta]
GO
