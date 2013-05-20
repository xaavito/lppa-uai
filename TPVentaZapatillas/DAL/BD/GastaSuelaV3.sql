USE [master]
GO
/****** Object:  Database [GastaSuela]    Script Date: 05/19/2013 21:43:48 ******/
CREATE DATABASE [GastaSuela] ON  PRIMARY 
( NAME = N'GastaSuela', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\GastaSuela.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GastaSuela_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\GastaSuela_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GastaSuela] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GastaSuela].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GastaSuela] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [GastaSuela] SET ANSI_NULLS OFF
GO
ALTER DATABASE [GastaSuela] SET ANSI_PADDING OFF
GO
ALTER DATABASE [GastaSuela] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [GastaSuela] SET ARITHABORT OFF
GO
ALTER DATABASE [GastaSuela] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [GastaSuela] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [GastaSuela] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [GastaSuela] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [GastaSuela] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [GastaSuela] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [GastaSuela] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [GastaSuela] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [GastaSuela] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [GastaSuela] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [GastaSuela] SET  DISABLE_BROKER
GO
ALTER DATABASE [GastaSuela] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [GastaSuela] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [GastaSuela] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [GastaSuela] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [GastaSuela] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [GastaSuela] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [GastaSuela] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [GastaSuela] SET  READ_WRITE
GO
ALTER DATABASE [GastaSuela] SET RECOVERY FULL
GO
ALTER DATABASE [GastaSuela] SET  MULTI_USER
GO
ALTER DATABASE [GastaSuela] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [GastaSuela] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'GastaSuela', N'ON'
GO
USE [GastaSuela]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 05/19/2013 21:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Apellido] [varchar](100) NULL,
	[Usuario] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IdPerfil] [int] NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [Apellido], [Usuario], [Password], [IdPerfil], [DVH]) VALUES (1, N'Adrian', N'Scarinci', N'adriansc33', N'-1152142086', 1, 3)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [Apellido], [Usuario], [Password], [IdPerfil], [DVH]) VALUES (2, N'Gonzalo', N'Dominguez', N'gonza', N'-1152142086', 2, 4)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [Apellido], [Usuario], [Password], [IdPerfil], [DVH]) VALUES (5, N'Nuevo', N'Usuario', N'admin', N'1156371652', 1, 10)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
/****** Object:  Table [dbo].[Permisos]    Script Date: 05/19/2013 21:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permisos](
	[IdPermiso] [int] IDENTITY(1,1) NOT NULL,
	[NombrePermiso] [varchar](50) NULL,
	[LinkPermiso] [varchar](50) NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[IdPermiso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Permisos] ON
INSERT [dbo].[Permisos] ([IdPermiso], [NombrePermiso], [LinkPermiso], [DVH]) VALUES (1, N'Administracion', N'divLnkAdmUsuarios', 7)
INSERT [dbo].[Permisos] ([IdPermiso], [NombrePermiso], [LinkPermiso], [DVH]) VALUES (2, N'Administracion Productos', N'divLnkAdmProductos', 2)
INSERT [dbo].[Permisos] ([IdPermiso], [NombrePermiso], [LinkPermiso], [DVH]) VALUES (3, N'Venta Productos', N'divLnkProductos', 10)
INSERT [dbo].[Permisos] ([IdPermiso], [NombrePermiso], [LinkPermiso], [DVH]) VALUES (4, N'Permisos', N'divLinkPermisos', 0)
INSERT [dbo].[Permisos] ([IdPermiso], [NombrePermiso], [LinkPermiso], [DVH]) VALUES (5, N'Bitacora', N'divLinkBitacora', 0)
INSERT [dbo].[Permisos] ([IdPermiso], [NombrePermiso], [LinkPermiso], [DVH]) VALUES (6, N'BackupRestored', N'divBackupRestored', 9)
INSERT [dbo].[Permisos] ([IdPermiso], [NombrePermiso], [LinkPermiso], [DVH]) VALUES (7, N'Usuarios', N'divLinkUsuarios', 8)
SET IDENTITY_INSERT [dbo].[Permisos] OFF
/****** Object:  Table [dbo].[PerfilPermisos]    Script Date: 05/19/2013 21:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilPermisos](
	[IdPerfil] [int] NOT NULL,
	[IdPermiso] [int] NOT NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_PerfilPermisos] PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC,
	[IdPermiso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PerfilPermisos] ([IdPerfil], [IdPermiso], [DVH]) VALUES (1, 1, 8)
INSERT [dbo].[PerfilPermisos] ([IdPerfil], [IdPermiso], [DVH]) VALUES (1, 2, 6)
INSERT [dbo].[PerfilPermisos] ([IdPerfil], [IdPermiso], [DVH]) VALUES (1, 3, 4)
INSERT [dbo].[PerfilPermisos] ([IdPerfil], [IdPermiso], [DVH]) VALUES (1, 4, 2)
INSERT [dbo].[PerfilPermisos] ([IdPerfil], [IdPermiso], [DVH]) VALUES (1, 5, 0)
INSERT [dbo].[PerfilPermisos] ([IdPerfil], [IdPermiso], [DVH]) VALUES (1, 6, 9)
INSERT [dbo].[PerfilPermisos] ([IdPerfil], [IdPermiso], [DVH]) VALUES (1, 7, 7)
INSERT [dbo].[PerfilPermisos] ([IdPerfil], [IdPermiso], [DVH]) VALUES (2, 1, 5)
INSERT [dbo].[PerfilPermisos] ([IdPerfil], [IdPermiso], [DVH]) VALUES (2, 4, 10)
INSERT [dbo].[PerfilPermisos] ([IdPerfil], [IdPermiso], [DVH]) VALUES (2, 5, 8)
/****** Object:  Table [dbo].[Perfiles]    Script Date: 05/19/2013 21:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfiles](
	[IdPerfil] [int] IDENTITY(1,1) NOT NULL,
	[NombrePerfil] [varchar](50) NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Perfiles] ON
INSERT [dbo].[Perfiles] ([IdPerfil], [NombrePerfil], [DVH]) VALUES (1, N'Administrador', 4)
INSERT [dbo].[Perfiles] ([IdPerfil], [NombrePerfil], [DVH]) VALUES (2, N'Operador', 6)
INSERT [dbo].[Perfiles] ([IdPerfil], [NombrePerfil], [DVH]) VALUES (3, N'Invitado', 1)
SET IDENTITY_INSERT [dbo].[Perfiles] OFF
/****** Object:  StoredProcedure [dbo].[pa_Dv_ActualizarDVH]    Script Date: 05/19/2013 21:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-------------------------------------------------------------------------------------------------
Nombre:	 pa_Dv_ActualizarDVH
Autor:   Adrian
Fecha: 	 18/05/2013
-------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[pa_Dv_ActualizarDVH]
              @DVH int,@NombreIdTabla varchar(50),@IdTabla int,@NombreTabla varchar(50)

AS
BEGIN
  DECLARE @cmdIdtabla as varchar(50)
  DECLARE @cmdDVH as char(2)
  
  SET @NombreTabla = RTRIM(@NombreTabla)
  SET @NombreIdTabla = RTRIM(@NombreIdTabla)
  SET @cmdIdtabla = RTRIM(CAST(@IdTabla as varchar(50)))
  SET @cmdDVH = RTRIM(CAST(@DVH AS CHAR(2)))
  
  DECLARE @cmd AS NVARCHAR(max)
  SET @cmd = N'UPDATE ' + @NombreTabla + ' SET DVH =' + @cmdDVH + 'WHERE ' + @NombreIdTabla + '=' + @cmdIdtabla
  EXEC sp_executesql @cmd 
END
GO
/****** Object:  Table [dbo].[DVV]    Script Date: 05/19/2013 21:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DVV](
	[Tabla] [varchar](50) NOT NULL,
	[DVV] [int] NULL,
 CONSTRAINT [PK_DVV] PRIMARY KEY CLUSTERED 
(
	[Tabla] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DVV] ([Tabla], [DVV]) VALUES (N'Perfiles', 11)
INSERT [dbo].[DVV] ([Tabla], [DVV]) VALUES (N'PerfilPermisos', 59)
INSERT [dbo].[DVV] ([Tabla], [DVV]) VALUES (N'Permisos', 36)
INSERT [dbo].[DVV] ([Tabla], [DVV]) VALUES (N'Usuarios', 17)
/****** Object:  StoredProcedure [dbo].[pa_Dv_Getrecords]    Script Date: 05/19/2013 21:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-------------------------------------------------------------------------------------------------
Nombre:	 pa_Dv_Getrecords
Autor:   Adrian
Fecha: 	 18/05/2013
-------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[pa_Dv_Getrecords]
       @NombreTabla varchar(50)
AS
BEGIN
  SET @NombreTabla = RTRIM(@NombreTabla)
  DECLARE @cmd AS NVARCHAR(max)
  SET @cmd = N'SELECT * FROM ' + @NombreTabla
  EXEC sp_executesql @cmd 
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Dv_TotalizarDVH]    Script Date: 05/19/2013 21:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-------------------------------------------------------------------------------------------------
Nombre:	 pa_Dv_TotalizarDVH
Autor:   Adrian
Fecha: 	 18/05/2012
-------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[pa_Dv_TotalizarDVH]
                @NombreTabla varchar(50)
AS
BEGIN
  SET @NombreTabla = RTRIM(@NombreTabla)
  DECLARE @cmd AS NVARCHAR(max)
  SET @cmd = N'SELECT ISNULL(SUM(DVH),0) FROM ' + @NombreTabla 
  EXEC sp_executesql @cmd 
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Dv_GetTables]    Script Date: 05/19/2013 21:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-------------------------------------------------------------------------------------------------
Nombre:	 pa_Dv_GetTables
Autor:   Adrian
Fecha: 	 09/09/2012
-------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[pa_Dv_GetTables]
AS
BEGIN
  SELECT Tabla NombreTabla, DVV
  FROM DVV
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Dv_ActualizarDVV]    Script Date: 05/19/2013 21:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-------------------------------------------------------------------------------------------------
Nombre:	 pa_Dv_ActualizarDVV
Autor:   Adrian
Fecha: 	 18/05/2013
-------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[pa_Dv_ActualizarDVV]
   @NombreTabla varchar(50),@DVV int  
AS
BEGIN
     UPDATE dbo.DVV
     SET  DVV = @DVV
     WHERE  Tabla =  @NombreTabla
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Usuarios_Save]    Script Date: 05/19/2013 21:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-------------------------------------------------------------------------------------------------
Nombre:	 pa_Usuarios_Save
Autor:   Adrian
Fecha: 	 30/09/2012
-------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[pa_Usuarios_Save]
                 @IdUsuario int,@Nombre varchar(100), @Apellido varchar(100),@Usuario varchar(50),
                 @Password varchar(50),@IdPerfil varchar(50),
                 @ParamSalidaId int output
                 
AS
BEGIN
  IF @IdUsuario = 0
  BEGIN  -- Es Nuevo
     INSERT INTO dbo.Usuarios
     (Nombre,Apellido,Usuario,[Password],IdPerfil)
     VALUES
     (@Nombre,@Apellido,@Usuario,@Password ,@IdPerfil)
      SET @ParamSalidaId = SCOPE_IDENTITY(); 
  END
  ELSE
  BEGIN
     UPDATE dbo.Usuarios
     SET  Nombre = @Nombre,
     Apellido = @Apellido,
     IdPerfil = @IdPerfil 
     WHERE IdUsuario =  @IdUsuario 
  END
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Usuarios_Get]    Script Date: 05/19/2013 21:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-------------------------------------------------------------------------------------------------
Nombre:	 pa_Usuarios_Get
Autor:   Gonzalo
Fecha: 	 19/05/2013
-------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[pa_Usuarios_Get]
                 @Usuario varchar(50)=NULL , @Password varchar(50)=NULL
                 
AS
BEGIN
  SELECT IdUsuario,Nombre,Apellido,IdPerfil
  FROM dbo.Usuarios
  WHERE (@Usuario IS NULL OR @Usuario = Usuario)
  AND (@Password IS NULL OR @Password = [Password])
  ORDER BY Nombre
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Usuarios_Delete]    Script Date: 05/19/2013 21:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-------------------------------------------------------------------------------------------------
Nombre:	 pa_Usuarios_Delete
Autor:   Adrian
Fecha: 	 18/05/2013
-------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[pa_Usuarios_Delete]
                 @IdUsuario int,@IdPerfil int 
                 
AS
BEGIN
  IF @IdUsuario > 0
  BEGIN  -- Es Nuevo
     DELETE FROM Usuarios where IdUsuario = @IdUsuario
  END
  
  IF @IdPerfil > 0
  BEGIN  -- Es Nuevo
     DELETE FROM PerfilPermisos WHERE IdPerfil =  @IdPerfil
  END
 
END
GO
/****** Object:  StoredProcedure [dbo].[pa_PerfilPermisos_Save]    Script Date: 05/19/2013 21:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-------------------------------------------------------------------------------------------------
Nombre:	 pa_PerfilPermisos_Save
Autor:   Adrian
Fecha: 	 18/05/2013
-------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[pa_PerfilPermisos_Save]
                @IdPerfil int,@IdPermiso int,@DVH int=NULL
AS
BEGIN
      INSERT INTO PerfilPermisos
     (IdPerfil,IdPermiso,DVH)
     VALUES
     (@IdPerfil,@IdPermiso,@DVH)
END
GO
/****** Object:  StoredProcedure [dbo].[pa_PerfilPermisos_Get]    Script Date: 05/19/2013 21:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-------------------------------------------------------------------------------------------------
Nombre:	 pa_PerfilPermisos_Get
Autor:   Gonzalo
Fecha: 	 07/09/2012
-------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[pa_PerfilPermisos_Get]
                 @IdPerfil int=0
                 
AS
BEGIN
  SELECT PP.IdPerfil,  PP.IdPermiso,P.NombrePermiso,P.LinkPermiso
  FROM dbo.Permisos P
  JOIN dbo.PerfilPermisos  PP ON PP.IdPermiso = P.IdPermiso
  WHERE (@IdPerfil = 0 OR @IdPerfil  = PP.IdPerfil)
  ORDER BY P.IdPermiso,P.NombrePermiso
END
GO
/****** Object:  StoredProcedure [dbo].[pa_PerfilPermisos_Delete]    Script Date: 05/19/2013 21:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-------------------------------------------------------------------------------------------------
Nombre:	 pa_PerfilPermisos_Delete
Autor:   Adrian
Fecha: 	 18/05/2013
-------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[pa_PerfilPermisos_Delete]
                 @IdPerfil int
                 
AS
BEGIN
   DELETE 
   FROM dbo.PerfilPermisos
   WHERE IdPerfil  = @IdPerfil
END
GO
