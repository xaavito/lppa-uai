USE [DBGastaSuela]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 05/19/2013 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoUsuario]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 05/19/2013 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[DigitoVerfVertical]    Script Date: 05/19/2013 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DigitoVerfVertical]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 05/19/2013 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Usuario](
	[PK_usrioID] [int] IDENTITY(1,1) NOT NULL,
	[FK_usrioTipo] [int] NOT NULL,
	[usurioNombre] [varchar](50) NOT NULL,
	[usurioClave] [varchar](50) NOT NULL,
	[usurioApellido] [varchar](50) NOT NULL,
	[usurioMail] [varchar](50) NOT NULL,
	[usurioDVH] [bigint] NOT NULL,
	[usurioEstado] [bit] NOT NULL,
	[FECHA_INSERT] [datetime] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[PK_usrioID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 05/19/2013 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bitacora]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bitacora](
	[PK_bcraID] [int] NOT NULL,
	[FK_bcoraUsuario] [int] NOT NULL,
	[bcoraModulo] [varchar](50) NOT NULL,
	[bcoraDescripcion] [varchar](200) NOT NULL,
	[bcoraFecha] [date] NOT NULL,
	[bcoraDVH] [bigint] NOT NULL,
	[bcoraEstado] [bit] NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[PK_bcraID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 05/19/2013 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venta]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 05/19/2013 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DetalleVenta]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Default [DF_Producto_FECHA_INSERT]    Script Date: 05/19/2013 12:49:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Producto_FECHA_INSERT]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Producto_FECHA_INSERT]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF_Producto_FECHA_INSERT]  DEFAULT (getdate()) FOR [FECHA_INSERT]
END


End
GO
/****** Object:  Default [DF_Usuario_FECHA_INSERT]    Script Date: 05/19/2013 12:49:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Usuario_FECHA_INSERT]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Usuario_FECHA_INSERT]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_FECHA_INSERT]  DEFAULT (getdate()) FOR [FECHA_INSERT]
END


End
GO
/****** Object:  Default [DF_Bitacora_bcoraFecha]    Script Date: 05/19/2013 12:49:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Bitacora_bcoraFecha]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bitacora]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Bitacora_bcoraFecha]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bitacora] ADD  CONSTRAINT [DF_Bitacora_bcoraFecha]  DEFAULT (getdate()) FOR [bcoraFecha]
END


End
GO
/****** Object:  Default [DF_Venta_vntaFecha]    Script Date: 05/19/2013 12:49:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Venta_vntaFecha]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Venta_vntaFecha]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Venta] ADD  CONSTRAINT [DF_Venta_vntaFecha]  DEFAULT (getdate()) FOR [vntaFecha]
END


End
GO
/****** Object:  Default [DF_DetalleVenta_FECHA_INSERT]    Script Date: 05/19/2013 12:49:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_DetalleVenta_FECHA_INSERT]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleVenta]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DetalleVenta_FECHA_INSERT]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DetalleVenta] ADD  CONSTRAINT [DF_DetalleVenta_FECHA_INSERT]  DEFAULT (getdate()) FOR [FECHA_INSERT]
END


End
GO
/****** Object:  ForeignKey [FK_Usuario_Tipo]    Script Date: 05/19/2013 12:49:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_Tipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario]'))
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Tipo] FOREIGN KEY([FK_usrioTipo])
REFERENCES [dbo].[TipoUsuario] ([PK_tipoID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_Tipo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario]'))
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Tipo]
GO
/****** Object:  ForeignKey [FK_Bitacora_Usuario]    Script Date: 05/19/2013 12:49:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bitacora_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bitacora]'))
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Usuario] FOREIGN KEY([FK_bcoraUsuario])
REFERENCES [dbo].[Usuario] ([PK_usrioID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bitacora_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bitacora]'))
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Usuario]
GO
/****** Object:  ForeignKey [FK_Venta_Usuario]    Script Date: 05/19/2013 12:49:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Usuario] FOREIGN KEY([FK_vntaUsuario])
REFERENCES [dbo].[Usuario] ([PK_usrioID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Usuario]
GO
/****** Object:  ForeignKey [FK_DetalleVenta_Producto]    Script Date: 05/19/2013 12:49:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetalleVenta_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleVenta]'))
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Producto] FOREIGN KEY([FK_detalleProducto])
REFERENCES [dbo].[Producto] ([PK_pctoID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetalleVenta_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleVenta]'))
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Producto]
GO
/****** Object:  ForeignKey [FK_DetalleVenta_Venta]    Script Date: 05/19/2013 12:49:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetalleVenta_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleVenta]'))
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Venta] FOREIGN KEY([FK_detalleVenta])
REFERENCES [dbo].[Venta] ([PK_vntaID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetalleVenta_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleVenta]'))
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Venta]
GO
