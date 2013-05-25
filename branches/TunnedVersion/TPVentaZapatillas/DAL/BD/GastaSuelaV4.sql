USE [GastaSuela]
GO
/****** Object:  StoredProcedure [dbo].[pa_PerfilPermisos_Delete]    Script Date: 05/24/2013 00:48:01 ******/
DROP PROCEDURE [dbo].[pa_PerfilPermisos_Delete]
GO
/****** Object:  StoredProcedure [dbo].[pa_PerfilPermisos_Get]    Script Date: 05/24/2013 00:48:01 ******/
DROP PROCEDURE [dbo].[pa_PerfilPermisos_Get]
GO
/****** Object:  StoredProcedure [dbo].[pa_PerfilPermisos_Save]    Script Date: 05/24/2013 00:48:01 ******/
DROP PROCEDURE [dbo].[pa_PerfilPermisos_Save]
GO
/****** Object:  StoredProcedure [dbo].[pa_Usuarios_Delete]    Script Date: 05/24/2013 00:48:01 ******/
DROP PROCEDURE [dbo].[pa_Usuarios_Delete]
GO
/****** Object:  StoredProcedure [dbo].[pa_Usuarios_Get]    Script Date: 05/24/2013 00:48:01 ******/
DROP PROCEDURE [dbo].[pa_Usuarios_Get]
GO
/****** Object:  StoredProcedure [dbo].[pa_Usuarios_Save]    Script Date: 05/24/2013 00:48:01 ******/
DROP PROCEDURE [dbo].[pa_Usuarios_Save]
GO
/****** Object:  StoredProcedure [dbo].[pa_Bitacora_Get]    Script Date: 05/24/2013 00:48:01 ******/
DROP PROCEDURE [dbo].[pa_Bitacora_Get]
GO
/****** Object:  StoredProcedure [dbo].[pa_Bitacora_Save]    Script Date: 05/24/2013 00:48:01 ******/
DROP PROCEDURE [dbo].[pa_Bitacora_Save]
GO
/****** Object:  StoredProcedure [dbo].[pa_Dv_ActualizarDVV]    Script Date: 05/24/2013 00:48:01 ******/
DROP PROCEDURE [dbo].[pa_Dv_ActualizarDVV]
GO
/****** Object:  StoredProcedure [dbo].[pa_Dv_GetTables]    Script Date: 05/24/2013 00:48:01 ******/
DROP PROCEDURE [dbo].[pa_Dv_GetTables]
GO
/****** Object:  StoredProcedure [dbo].[pa_Dv_TotalizarDVH]    Script Date: 05/24/2013 00:48:01 ******/
DROP PROCEDURE [dbo].[pa_Dv_TotalizarDVH]
GO
/****** Object:  StoredProcedure [dbo].[pa_Dv_Getrecords]    Script Date: 05/24/2013 00:48:01 ******/
DROP PROCEDURE [dbo].[pa_Dv_Getrecords]
GO
/****** Object:  StoredProcedure [dbo].[pa_Dv_ActualizarDVH]    Script Date: 05/24/2013 00:48:01 ******/
DROP PROCEDURE [dbo].[pa_Dv_ActualizarDVH]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 05/24/2013 00:48:00 ******/
DROP TABLE [dbo].[Bitacora]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 05/24/2013 00:48:00 ******/
DROP TABLE [dbo].[DetalleVenta]
GO
/****** Object:  Table [dbo].[DVV]    Script Date: 05/24/2013 00:48:00 ******/
DROP TABLE [dbo].[DVV]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 05/24/2013 00:48:00 ******/
DROP TABLE [dbo].[Perfiles]
GO
/****** Object:  Table [dbo].[PerfilPermisos]    Script Date: 05/24/2013 00:47:59 ******/
DROP TABLE [dbo].[PerfilPermisos]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 05/24/2013 00:47:59 ******/
DROP TABLE [dbo].[Permisos]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 05/24/2013 00:47:59 ******/
DROP TABLE [dbo].[Producto]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 05/24/2013 00:47:59 ******/
DROP TABLE [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 05/24/2013 00:47:59 ******/
DROP TABLE [dbo].[Venta]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 05/24/2013 00:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[PK_vntaID] [int] NOT NULL,
	[FK_vntaUsuario] [int] NOT NULL,
	[vntaFecha] [date] NOT NULL,
	[vntaDVH] [bigint] NOT NULL,
	[vntaEstado] [bit] NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[PK_vntaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 05/24/2013 00:47:59 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 05/24/2013 00:47:59 ******/
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
	[FECHA_INSERT] [datetime] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[PK_pctoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 05/24/2013 00:47:59 ******/
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
/****** Object:  Table [dbo].[PerfilPermisos]    Script Date: 05/24/2013 00:47:59 ******/
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
/****** Object:  Table [dbo].[Perfiles]    Script Date: 05/24/2013 00:48:00 ******/
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
/****** Object:  Table [dbo].[DVV]    Script Date: 05/24/2013 00:48:00 ******/
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
INSERT [dbo].[DVV] ([Tabla], [DVV]) VALUES (N'Bitacora', 0)
INSERT [dbo].[DVV] ([Tabla], [DVV]) VALUES (N'Perfiles', 11)
INSERT [dbo].[DVV] ([Tabla], [DVV]) VALUES (N'PerfilPermisos', 59)
INSERT [dbo].[DVV] ([Tabla], [DVV]) VALUES (N'Permisos', 36)
INSERT [dbo].[DVV] ([Tabla], [DVV]) VALUES (N'Usuarios', 17)
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 05/24/2013 00:48:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[PK_detalleID] [int] NOT NULL,
	[FK_detalleProducto] [int] NOT NULL,
	[FK_detalleVenta] [int] NOT NULL,
	[detalleCantidad] [int] NOT NULL,
	[detallePrecioUnit] [money] NOT NULL,
	[detalleDVH] [bigint] NOT NULL,
	[detalleEstado] [bit] NOT NULL,
	[FECHA_INSERT] [datetime] NOT NULL,
 CONSTRAINT [PK_Detalle] PRIMARY KEY CLUSTERED 
(
	[PK_detalleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 05/24/2013 00:48:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bitacora](
	[PK_bcraID] [int] IDENTITY(1,1) NOT NULL,
	[FK_bcoraUsuario] [int] NULL,
	[bcoraModulo] [varchar](50) NULL,
	[bcoraDescripcion] [varchar](200) NULL,
	[bcoraFecha] [date] NULL,
	[DVH] [int] NULL,
	[bcoraEstado] [bit] NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[PK_bcraID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Bitacora] ON
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (1, 5, NULL, N'Logueo Exitoso', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (2, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (3, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (4, 5, NULL, N'Logueo Exitoso', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (5, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (6, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (7, NULL, NULL, N'Logueo Fallido de Usuario coco pass coco', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (8, 5, NULL, N'Logueo Exitoso', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (9, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (10, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (11, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (12, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (13, 5, NULL, N'Logueo Exitoso', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (14, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (15, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (16, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (17, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (18, 5, NULL, N'Logueo Exitoso', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (19, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (20, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (21, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (22, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (23, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (24, NULL, NULL, N'Logueo Fallido de Usuario coco pass coco', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (25, 5, NULL, N'Logueo Exitoso', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (26, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (27, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (28, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (29, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
INSERT [dbo].[Bitacora] ([PK_bcraID], [FK_bcoraUsuario], [bcoraModulo], [bcoraDescripcion], [bcoraFecha], [DVH], [bcoraEstado]) VALUES (30, 5, NULL, N'Se cargaron los siguientes Permisos: divLnkAdmUsuarios|divLnkAdmProductos|divLnkProductos|divLinkPer', CAST(0x23370B00 AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
/****** Object:  StoredProcedure [dbo].[pa_Dv_ActualizarDVH]    Script Date: 05/24/2013 00:48:01 ******/
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
/****** Object:  StoredProcedure [dbo].[pa_Dv_Getrecords]    Script Date: 05/24/2013 00:48:01 ******/
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
/****** Object:  StoredProcedure [dbo].[pa_Dv_TotalizarDVH]    Script Date: 05/24/2013 00:48:01 ******/
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
/****** Object:  StoredProcedure [dbo].[pa_Dv_GetTables]    Script Date: 05/24/2013 00:48:01 ******/
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
/****** Object:  StoredProcedure [dbo].[pa_Dv_ActualizarDVV]    Script Date: 05/24/2013 00:48:01 ******/
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
/****** Object:  StoredProcedure [dbo].[pa_Bitacora_Save]    Script Date: 05/24/2013 00:48:01 ******/
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
CREATE PROCEDURE [dbo].[pa_Bitacora_Save]
                 @IdUsuario int=NULL,
                 @Mensaje varchar(100),
                 @ParamSalidaId int output
                 
AS
BEGIN
     
     INSERT INTO dbo.Bitacora
     (FK_bcoraUsuario,bcoraDescripcion,bcoraFecha)
     VALUES
     (@IdUsuario,@Mensaje,CURRENT_TIMESTAMP);
      SET @ParamSalidaId = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Bitacora_Get]    Script Date: 05/24/2013 00:48:01 ******/
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
CREATE PROCEDURE [dbo].[pa_Bitacora_Get]
                 
AS
BEGIN
  SELECT PK_bcraID,Nombre + ', '+ Apellido usuario,bcoraDescripcion,bcoraFecha
  FROM dbo.Bitacora
  Left join Usuarios ON (FK_bcoraUsuario = IdUsuario)
  ORDER BY bcoraFecha desc
END
GO
/****** Object:  StoredProcedure [dbo].[pa_Usuarios_Save]    Script Date: 05/24/2013 00:48:01 ******/
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
/****** Object:  StoredProcedure [dbo].[pa_Usuarios_Get]    Script Date: 05/24/2013 00:48:01 ******/
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
/****** Object:  StoredProcedure [dbo].[pa_Usuarios_Delete]    Script Date: 05/24/2013 00:48:01 ******/
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
/****** Object:  StoredProcedure [dbo].[pa_PerfilPermisos_Save]    Script Date: 05/24/2013 00:48:01 ******/
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
/****** Object:  StoredProcedure [dbo].[pa_PerfilPermisos_Get]    Script Date: 05/24/2013 00:48:01 ******/
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
/****** Object:  StoredProcedure [dbo].[pa_PerfilPermisos_Delete]    Script Date: 05/24/2013 00:48:01 ******/
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
