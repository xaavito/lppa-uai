USE [GastaSuela]
GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USUARIO', N'COLUMN',N'usuIDPERFIL'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USUARIO', @level2type=N'COLUMN',@level2name=N'usuIDPERFIL'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USUARIO', N'COLUMN',N'usuCLAVE'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USUARIO', @level2type=N'COLUMN',@level2name=N'usuCLAVE'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USUARIO', N'COLUMN',N'usuNICK'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USUARIO', @level2type=N'COLUMN',@level2name=N'usuNICK'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USUARIO', N'COLUMN',N'usuID'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USUARIO', @level2type=N'COLUMN',@level2name=N'usuID'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RESTORE', N'COLUMN',N'rtESTADO'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtESTADO'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RESTORE', N'COLUMN',N'rtRUTA'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtRUTA'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RESTORE', N'COLUMN',N'rtFECHA'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtFECHA'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RESTORE', N'COLUMN',N'rtIDUSUARIO'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtIDUSUARIO'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RESTORE', N'COLUMN',N'rtID'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtID'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERMISO', N'COLUMN',N'pmPERMITIDO'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERMISO', @level2type=N'COLUMN',@level2name=N'pmPERMITIDO'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERMISO', N'COLUMN',N'pmIDMODULOACCION'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERMISO', @level2type=N'COLUMN',@level2name=N'pmIDMODULOACCION'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERMISO', N'COLUMN',N'pmIDPERFIL'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERMISO', @level2type=N'COLUMN',@level2name=N'pmIDPERFIL'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERMISO', N'COLUMN',N'pmID'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERMISO', @level2type=N'COLUMN',@level2name=N'pmID'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERFIL', N'COLUMN',N'perFECHABAJA'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERFIL', @level2type=N'COLUMN',@level2name=N'perFECHABAJA'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERFIL', N'COLUMN',N'perFECHAALTA'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERFIL', @level2type=N'COLUMN',@level2name=N'perFECHAALTA'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERFIL', N'COLUMN',N'perNOMBRE'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERFIL', @level2type=N'COLUMN',@level2name=N'perNOMBRE'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERFIL', N'COLUMN',N'perID'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERFIL', @level2type=N'COLUMN',@level2name=N'perID'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MODULO_ACCION', N'COLUMN',N'maACCION'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO_ACCION', @level2type=N'COLUMN',@level2name=N'maACCION'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MODULO_ACCION', N'COLUMN',N'maIDMODULO'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO_ACCION', @level2type=N'COLUMN',@level2name=N'maIDMODULO'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MODULO_ACCION', N'COLUMN',N'maID'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO_ACCION', @level2type=N'COLUMN',@level2name=N'maID'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MODULO', N'COLUMN',N'modIDPADRE'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO', @level2type=N'COLUMN',@level2name=N'modIDPADRE'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MODULO', N'COLUMN',N'modNOMBRE'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO', @level2type=N'COLUMN',@level2name=N'modNOMBRE'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MODULO', N'COLUMN',N'modCODIGO'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO', @level2type=N'COLUMN',@level2name=N'modCODIGO'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MODULO', N'COLUMN',N'modID'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO', @level2type=N'COLUMN',@level2name=N'modID'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BITACORA', N'COLUMN',N'bitDESCRIPCION'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitDESCRIPCION'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BITACORA', N'COLUMN',N'bitMODULO'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitMODULO'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BITACORA', N'COLUMN',N'bitFECHA'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitFECHA'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BITACORA', N'COLUMN',N'bitIDUSUARIO'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitIDUSUARIO'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BITACORA', N'COLUMN',N'bitID'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitID'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BACKUP', N'COLUMN',N'bkESTADO'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkESTADO'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BACKUP', N'COLUMN',N'bkRUTA'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkRUTA'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BACKUP', N'COLUMN',N'bkFECHA'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkFECHA'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BACKUP', N'COLUMN',N'bkIDUSUARIO'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkIDUSUARIO'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BACKUP', N'COLUMN',N'bkID'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkID'

GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USUARIO_PERFIL]') AND parent_object_id = OBJECT_ID(N'[dbo].[USUARIO]'))
ALTER TABLE [dbo].[USUARIO] DROP CONSTRAINT [FK_USUARIO_PERFIL]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RESTORE_USUARIO]') AND parent_object_id = OBJECT_ID(N'[dbo].[RESTORE]'))
ALTER TABLE [dbo].[RESTORE] DROP CONSTRAINT [FK_RESTORE_USUARIO]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PERMISO_PERFIL]') AND parent_object_id = OBJECT_ID(N'[dbo].[PERMISO]'))
ALTER TABLE [dbo].[PERMISO] DROP CONSTRAINT [FK_PERMISO_PERFIL]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PERMISO_MODULO_ACCION]') AND parent_object_id = OBJECT_ID(N'[dbo].[PERMISO]'))
ALTER TABLE [dbo].[PERMISO] DROP CONSTRAINT [FK_PERMISO_MODULO_ACCION]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PERMISO_MODULO]') AND parent_object_id = OBJECT_ID(N'[dbo].[PERMISO]'))
ALTER TABLE [dbo].[PERMISO] DROP CONSTRAINT [FK_PERMISO_MODULO]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MODULO_ACCION_MODULO]') AND parent_object_id = OBJECT_ID(N'[dbo].[MODULO_ACCION]'))
ALTER TABLE [dbo].[MODULO_ACCION] DROP CONSTRAINT [FK_MODULO_ACCION_MODULO]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MODULO_MODULO]') AND parent_object_id = OBJECT_ID(N'[dbo].[MODULO]'))
ALTER TABLE [dbo].[MODULO] DROP CONSTRAINT [FK_MODULO_MODULO]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BACKUP_USUARIO]') AND parent_object_id = OBJECT_ID(N'[dbo].[BACKUP]'))
ALTER TABLE [dbo].[BACKUP] DROP CONSTRAINT [FK_BACKUP_USUARIO]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_USUARIO_usuFECHAALTA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USUARIO] DROP CONSTRAINT [DF_USUARIO_usuFECHAALTA]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_RESTORE_rtESTADO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RESTORE] DROP CONSTRAINT [DF_RESTORE_rtESTADO]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_RESTORE_rtFECHA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RESTORE] DROP CONSTRAINT [DF_RESTORE_rtFECHA]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PERMISO_pmPERMITIDO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERMISO] DROP CONSTRAINT [DF_PERMISO_pmPERMITIDO]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PERFIL_perFECHAALTA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFIL] DROP CONSTRAINT [DF_PERFIL_perFECHAALTA]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_BITACORA_bitFECHA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BITACORA] DROP CONSTRAINT [DF_BITACORA_bitFECHA]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_BACKUP_bkESTADO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BACKUP] DROP CONSTRAINT [DF_BACKUP_bkESTADO]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_BACKUP_bkFECHA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BACKUP] DROP CONSTRAINT [DF_BACKUP_bkFECHA]
END

GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIO]') AND type in (N'U'))
DROP TABLE [dbo].[USUARIO]
GO
/****** Object:  Table [dbo].[RESTORE]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTORE]') AND type in (N'U'))
DROP TABLE [dbo].[RESTORE]
GO
/****** Object:  Table [dbo].[PERMISO]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERMISO]') AND type in (N'U'))
DROP TABLE [dbo].[PERMISO]
GO
/****** Object:  Table [dbo].[PERFIL]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFIL]') AND type in (N'U'))
DROP TABLE [dbo].[PERFIL]
GO
/****** Object:  Table [dbo].[MODULO_ACCION]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MODULO_ACCION]') AND type in (N'U'))
DROP TABLE [dbo].[MODULO_ACCION]
GO
/****** Object:  Table [dbo].[MODULO]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MODULO]') AND type in (N'U'))
DROP TABLE [dbo].[MODULO]
GO
/****** Object:  Table [dbo].[BITACORA]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BITACORA]') AND type in (N'U'))
DROP TABLE [dbo].[BITACORA]
GO
/****** Object:  Table [dbo].[BACKUP]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BACKUP]') AND type in (N'U'))
DROP TABLE [dbo].[BACKUP]
GO
/****** Object:  StoredProcedure [dbo].[USUARIOS_SP]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIOS_SP]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USUARIOS_SP]
GO
/****** Object:  StoredProcedure [dbo].[USUARIOS_PROC]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIOS_PROC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USUARIOS_PROC]
GO
/****** Object:  StoredProcedure [dbo].[PERMISOS_SP]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERMISOS_SP]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PERMISOS_SP]
GO
/****** Object:  StoredProcedure [dbo].[PERFILES_PROC]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFILES_PROC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PERFILES_PROC]
GO
/****** Object:  StoredProcedure [dbo].[MODULOS_SP]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MODULOS_SP]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MODULOS_SP]
GO
/****** Object:  StoredProcedure [dbo].[LOGIN_PROC]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOGIN_PROC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[LOGIN_PROC]
GO
/****** Object:  StoredProcedure [dbo].[DICCIONARIO]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DICCIONARIO]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DICCIONARIO]
GO
/****** Object:  StoredProcedure [dbo].[BITACORAS_PROC]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BITACORAS_PROC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[BITACORAS_PROC]
GO
USE [master]
GO
/****** Object:  Database [GastaSuela]    Script Date: 27/06/2013 3:04:31 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'GastaSuela')
DROP DATABASE [GastaSuela]
GO
/****** Object:  Database [GastaSuela]    Script Date: 27/06/2013 3:04:31 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'GastaSuela')
BEGIN
CREATE DATABASE [GastaSuela] ON  PRIMARY 
( NAME = N'GastaSuela', FILENAME = N'D:\MSSQLSERVER\MSSQL\DATA\GastaSuela.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GastaSuela_log', FILENAME = N'D:\MSSQLSERVER\MSSQL\DATA\GastaSuela_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

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
/****** Object:  StoredProcedure [dbo].[BITACORAS_PROC]    Script Date: 27/06/2013 3:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BITACORAS_PROC]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--exec BITACORAS_PROC ''4'', null, null
CREATE PROCEDURE [dbo].[BITACORAS_PROC]
@ACCION VARCHAR(20) = NULL,
@ID INT = NULL,
@IDUSUARIO INT = NULL,
@MODULO VARCHAR(50) = NULL,
@DESCRIPCION VARCHAR(500) = NULL,
@ARGUMENTOS VARCHAR(500) = NULL,
@FECHADESDE DATE = NULL,
@FECHAHASTA DATE = NULL
AS
BEGIN
	SET NOCOUNT ON;

IF @ID = 0 BEGIN
	SET @ID = NULL
END
IF @IDUSUARIO = 0 BEGIN
	SET @IDUSUARIO = NULL
END

--ALTA
IF @ACCION = ''1'' BEGIN
	
	INSERT INTO BITACORA(bitIDUSUARIO, bitFECHA, bitMODULO, bitDESCRIPCION, bitARGUMENTOS)
	VALUES (@IDUSUARIO, GETDATE(), @MODULO, @DESCRIPCION, @ARGUMENTOS)
	
END



--CONSULTA
IF @ACCION = ''4'' BEGIN
	
	SELECT	*
	FROM BITACORA AS B
	LEFT JOIN USUARIO AS U
	ON U.usuID= B.bitIDUSUARIO
	WHERE (@ID IS NULL OR B.bitID = @ID)
	AND (@FECHADESDE IS NULL OR B.bitFECHA >= @FECHADESDE)
	AND (@FECHAHASTA IS NULL OR B.bitFECHA <= @FECHAHASTA)
	AND (@IDUSUARIO IS NULL OR B.bitIDUSUARIO = @IDUSUARIO)
	ORDER BY B.bitFECHA DESC
END

END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[DICCIONARIO]    Script Date: 27/06/2013 3:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DICCIONARIO]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DICCIONARIO]

AS
select 
	--d.object_id,
	a.name Tabla, 
	--schema_name(a.schema_id) schema_name, 
	--a.create_date,
	b.name Columna, 
	ep.value [Descripcion],	
	CASE	
		WHEN c.name = ''numeric'' OR  c.name = ''decimal'' OR c.name = ''float'' OR c.name = ''int'' OR c.name = ''bigint''  THEN ''Numérico''
		WHEN c.name = ''varchar'' OR  c.name = ''text''  THEN ''Texto''
		WHEN c.name = ''date'' OR  c.name = ''datetime''  THEN ''Fecha''
		WHEN c.name = ''bit'' THEN ''Lógico''
		ELSE c.name
	END Tipo, 		
	b.max_length Tamaño, 	
	CASE	
		WHEN c.name = ''numeric'' OR  c.name = ''decimal'' OR c.name = ''float'' OR c.name = ''int'' OR c.name = ''bigint''  THEN ''0-9''
		WHEN c.name = ''varchar'' OR  c.name = ''text''  THEN ''A-Z, a-z, 0-9''
		WHEN c.name = ''date'' OR  c.name = ''datetime''  THEN ''0-9, -''
		WHEN c.name = ''bit'' THEN ''Sí - No''
		ELSE ''''
	END Dominio,	
	CASE 
		WHEN b.is_nullable = 0 THEN ''NO''
		ELSE ''SI''
	END [Permite Nulls],
	CASE 
		WHEN b.is_identity = 0 THEN ''NO''
		ELSE ''SI''
	END [Es Autonumerico],	
	CASE	
		WHEN c.name = ''numeric'' OR  c.name = ''decimal'' OR c.name = ''float''  THEN b.precision
		ELSE null
	END [Precision], 	
	c.name [type], 
	f.ForeignKey,
	f.ReferenceTableName,
	f.ReferenceColumnName
from sys.tables a 
	inner join sys.columns b on a.object_id= b.object_id 
	inner join sys.systypes c on b.system_type_id= c.xtype 
	inner join sys.objects d on a.object_id= d.object_id 
	LEFT JOIN sys.extended_properties ep ON d.object_id = ep.major_id AND b.column_Id = ep.minor_id
	LEFT JOIN (SELECT 
				f.name AS ForeignKey,
				OBJECT_NAME(f.parent_object_id) AS TableName,
				COL_NAME(fc.parent_object_id,fc.parent_column_id) AS ColumnName,
				OBJECT_NAME (f.referenced_object_id) AS ReferenceTableName,
				COL_NAME(fc.referenced_object_id,fc.referenced_column_id) AS ReferenceColumnName
				FROM sys.foreign_keys AS f
				INNER JOIN sys.foreign_key_columns AS fc ON f.OBJECT_ID = fc.constraint_object_id) 	f ON f.TableName =a.name AND f.ColumnName =b.name
WHERE a.name <> ''sysdiagrams'' 
ORDER BY a.name,b.column_Id
' 
END
GO
/****** Object:  StoredProcedure [dbo].[LOGIN_PROC]    Script Date: 27/06/2013 3:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOGIN_PROC]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[LOGIN_PROC]
@USER VARCHAR(20) = NULL,
@PASS VARCHAR(250) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT	COUNT(*) AS USERS
	FROM USUARIO AS U
	WHERE U.usuNICK = @USER
	AND U.usuCLAVE = @PASS
	AND U.usuFECHABAJA IS NULL
	

END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[MODULOS_SP]    Script Date: 27/06/2013 3:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MODULOS_SP]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--EXEC DBO.MODULOS_SP ''MOD''
--EXEC DBO.MODULOS_SP ''ACC'',8
CREATE PROCEDURE [dbo].[MODULOS_SP]
@ACCION VARCHAR(20) = NULL,
@IDMODULO INT = NULL
AS

IF @ACCION = ''MOD'' BEGIN
	SELECT *
	FROM MODULO
END

IF @ACCION = ''ACC'' BEGIN
	SELECT *
	FROM MODULO
	INNER JOIN MODULO_ACCION
	ON maIDMODULO = modID 
	WHERE modID = @IDMODULO
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[PERFILES_PROC]    Script Date: 27/06/2013 3:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFILES_PROC]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--exec PERFILES_PROC ''byUSER'', null, ''hernan''
CREATE PROCEDURE [dbo].[PERFILES_PROC]
@ACCION VARCHAR(20) = NULL,
@ID INT = NULL,
@NOMBRE VARCHAR(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;

IF @ID = 0 BEGIN
	SET @ID = NULL
END
--ALTA
IF @ACCION = ''1'' BEGIN
	
	INSERT INTO PERFIL(perNOMBRE)
	VALUES (@NOMBRE)
	
END

--UPDATE
IF @ACCION = ''2'' BEGIN
	
	UPDATE PERFIL
	SET perNOMBRE = @NOMBRE
	WHERE perID = @ID
	
END

--DELETE
IF @ACCION = ''3'' BEGIN
	
	UPDATE PERFIL
	SET perFECHABAJA = GETDATE()
	WHERE perID = @ID
	
END


--CONSULTA
IF @ACCION = ''4'' BEGIN
	
	SELECT	*
	FROM PERFIL AS P
	WHERE (@ID IS NULL OR P.perID = @ID)
	AND (@NOMBRE IS NULL OR @NOMBRE = P.perNOMBRE)
	and P.perFECHABAJA IS NULL
	
END

--POR USUARIO
IF @ACCION = ''byUSER'' BEGIN
	
	SELECT	P.*
	FROM PERFIL AS P
	INNER JOIN USUARIO AS U
	ON U.usuNICK = @NOMBRE 
	AND U.usuIDPERFIL = P.perID
	
END

END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[PERMISOS_SP]    Script Date: 27/06/2013 3:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERMISOS_SP]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--EXEC DBO.PERMISOS_SP ''MOD'', 1
--EXEC DBO.PERMISOS_SP ''ACC'',1,8
CREATE PROCEDURE [dbo].[PERMISOS_SP]

@ACCION VARCHAR(20) = NULL,
@IDPERFIL INT = NULL,
@IDMODULO INT = NULL,
@IDMODULOACCION INT = NULL,
@PERMITIDO BIT = NULL

AS
BEGIN

	SET NOCOUNT ON;
IF @ACCION = ''1'' BEGIN

	UPDATE PERMISO SET
	pmPERMITIDO = @PERMITIDO
	WHERE pmIDMODULO = @IDMODULO
	AND (@IDMODULOACCION IS NULL OR pmIDMODULOACCION = @IDMODULOACCION)
	AND pmIDPERFIL = @IDPERFIL
	
	IF @@ROWCOUNT = 0 BEGIN
		INSERT INTO PERMISO (pmIDMODULO, pmIDMODULOACCION, pmIDPERFIL, pmPERMITIDO)
		VALUES (@IDMODULO, @IDMODULOACCION, @IDPERFIL, @PERMITIDO)
	END

END	
	
IF @ACCION = ''GET'' BEGIN
	SELECT 
		P.pmID,
		P.pmIDMODULO,
		P.pmIDMODULOACCION,
		P.pmPERMITIDO,
		M.modID,
		M.modNOMBRE,
		M.modCODIGO,
		MA.maID,
		MA.maACCION
	FROM PERMISO AS P
	INNER JOIN MODULO AS M
	ON M.modID = P.pmIDMODULO
	LEFT JOIN MODULO_ACCION AS MA
	ON MA.maID = P.pmIDMODULOACCION
	AND MA.maIDMODULO = M.modID
	WHERE P.pmIDPERFIL = @IDPERFIL
	ORDER BY P.pmIDMODULO, P.pmIDMODULOACCION
END
IF @ACCION = ''MOD'' BEGIN

	SELECT 
		P.pmID,
		P.pmIDMODULO,
		P.pmIDMODULOACCION,
		ISNULL(P.pmPERMITIDO,0) AS pmPERMITIDO,
		M.modID,
		M.modNOMBRE,
		M.modCODIGO,
		MA.maID,
		MA.maACCION,
		MA.maIDMODULO
	FROM MODULO AS M
	LEFT JOIN MODULO_ACCION AS MA
	ON MA.maIDMODULO = M.modID
	OR MA.maID = 0
	LEFT JOIN PERMISO AS P
	ON 
	(
	(M.modID = P.pmIDMODULO AND P.pmIDMODULOACCION IS NULL AND MA.maIDMODULO IS NULL)
	OR
	(M.modID = P.pmIDMODULO AND MA.maID = P.pmIDMODULOACCION)
	)
	AND P.pmIDPERFIL = @IDPERFIL
	ORDER BY M.modID, MA.maACCION
	
/*
	SELECT
		P.pmID,
		ISNULL(P.pmPERMITIDO,0) AS pmPERMITIDO,
		M.modID,
		M.modNOMBRE,
		M.modCODIGO	
	FROM MODULO AS M
	LEFT JOIN PERMISO AS P
	ON pmIDMODULO = modID
	AND pmIDMODULOACCION IS NULL
	AND pmIDPERFIL = @IDPERFIL
	*/
END

IF @ACCION = ''ACC'' BEGIN
	SELECT 
		P.pmID,
		ISNULL(P.pmPERMITIDO,0) AS pmPERMITIDO,
		M.modID,
		M.modNOMBRE,
		M.modCODIGO,
		MA.maID,
		MA.maACCION		
	FROM MODULO AS M
	INNER JOIN MODULO_ACCION AS MA
	ON maIDMODULO = modID 
	LEFT JOIN PERMISO AS P
	ON pmIDMODULO = modID
	AND pmIDMODULOACCION  = maID
	AND pmIDPERFIL = @IDPERFIL	
	WHERE modID = @IDMODULO
END

END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[USUARIOS_PROC]    Script Date: 27/06/2013 3:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIOS_PROC]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--exec USUARIOS_PROC ''4'', null, ''29906396''
CREATE PROCEDURE [dbo].[USUARIOS_PROC]
@ACCION VARCHAR(20) = NULL,
@ID INT = NULL,
@NOMBRE VARCHAR(100) = NULL,
@APELLIDO VARCHAR(100) = NULL,
@EMAIL VARCHAR(100) = NULL,
@NICK VARCHAR(20) = NULL,
@CLAVE VARCHAR(250) = NULL,
@IDPERFIL INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

IF @ID = 0 BEGIN
	SET @ID = NULL
END
--ALTA
IF @ACCION = ''1'' BEGIN
	
	INSERT INTO USUARIO(usuNOMBRE,usuAPELLIDO, usuEMAIL,usuNICK,usuCLAVE, usuIDPERFIL)
	VALUES (@NOMBRE,@APELLIDO,@EMAIL,@NICK,@CLAVE,@IDPERFIL)
		
END

--UPDATE
IF @ACCION = ''2'' BEGIN
	
	UPDATE USUARIO
	SET usuCLAVE = @CLAVE,
	usuIDPERFIL = @IDPERFIL,
	usuNOMBRE = @NOMBRE,
	usuAPELLIDO = @APELLIDO,
	usuEMAIL = @EMAIL
	FROM USUARIO AS U
	WHERE U.usuID = @ID
	
END

--DELETE
IF @ACCION = ''3'' BEGIN
	
	UPDATE USUARIO
	SET usuFECHABAJA = GETDATE()
	FROM USUARIO AS U
	WHERE U.usuID = @ID
	
END



END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[USUARIOS_SP]    Script Date: 27/06/2013 3:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIOS_SP]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USUARIOS_SP]
@ACCION VARCHAR(20) = NULL,
@ID INT = NULL,
@NICK VARCHAR(20) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
IF @ACCION = ''byNICK'' BEGIN
	SELECT	*
	FROM USUARIO AS U
	WHERE (@NICK is null OR U.usuNICK = @NICK)
	AND U.usuFECHABAJA IS NULL
END
	

END
' 
END
GO
/****** Object:  Table [dbo].[BACKUP]    Script Date: 27/06/2013 3:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BACKUP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BACKUP](
	[bkID] [int] IDENTITY(1,1) NOT NULL,
	[bkIDUSUARIO] [int] NOT NULL,
	[bkFECHA] [datetime] NOT NULL,
	[bkRUTA] [varchar](200) NOT NULL,
	[bkESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_BACKUP] PRIMARY KEY CLUSTERED 
(
	[bkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BITACORA]    Script Date: 27/06/2013 3:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BITACORA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BITACORA](
	[bitID] [int] IDENTITY(1,1) NOT NULL,
	[bitIDUSUARIO] [int] NULL,
	[bitFECHA] [datetime] NOT NULL,
	[bitMODULO] [varchar](50) NULL,
	[bitDESCRIPCION] [nvarchar](500) NULL,
	[bitARGUMENTOS] [varchar](500) NULL,
 CONSTRAINT [PK_BITACORA] PRIMARY KEY CLUSTERED 
(
	[bitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MODULO]    Script Date: 27/06/2013 3:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MODULO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MODULO](
	[modID] [int] IDENTITY(1,1) NOT NULL,
	[modCODIGO] [varchar](20) NOT NULL,
	[modNOMBRE] [varchar](100) NOT NULL,
	[modIDPADRE] [int] NULL,
 CONSTRAINT [PK_MODULO] PRIMARY KEY CLUSTERED 
(
	[modID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MODULO_ACCION]    Script Date: 27/06/2013 3:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MODULO_ACCION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MODULO_ACCION](
	[maID] [int] IDENTITY(1,1) NOT NULL,
	[maIDMODULO] [int] NULL,
	[maACCION] [varchar](100) NULL,
 CONSTRAINT [PK_MODULO_ACCION] PRIMARY KEY CLUSTERED 
(
	[maID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERFIL]    Script Date: 27/06/2013 3:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFIL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PERFIL](
	[perID] [int] IDENTITY(1,1) NOT NULL,
	[perNOMBRE] [varchar](100) NOT NULL,
	[perFECHAALTA] [datetime] NOT NULL,
	[perFECHABAJA] [datetime] NULL,
 CONSTRAINT [PK_PERFIL] PRIMARY KEY CLUSTERED 
(
	[perID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERMISO]    Script Date: 27/06/2013 3:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERMISO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PERMISO](
	[pmID] [int] IDENTITY(1,1) NOT NULL,
	[pmIDPERFIL] [int] NOT NULL,
	[pmIDMODULO] [int] NOT NULL,
	[pmIDMODULOACCION] [int] NULL,
	[pmPERMITIDO] [bit] NOT NULL,
 CONSTRAINT [PK_PERMISO] PRIMARY KEY CLUSTERED 
(
	[pmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RESTORE]    Script Date: 27/06/2013 3:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTORE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RESTORE](
	[rtID] [int] IDENTITY(1,1) NOT NULL,
	[rtIDUSUARIO] [int] NOT NULL,
	[rtFECHA] [datetime] NOT NULL,
	[rtRUTA] [varchar](200) NOT NULL,
	[rtESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_RESTORE] PRIMARY KEY CLUSTERED 
(
	[rtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 27/06/2013 3:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USUARIO](
	[usuID] [int] IDENTITY(1,1) NOT NULL,
	[usuNOMBRE] [varchar](100) NOT NULL,
	[usuAPELLIDO] [varchar](100) NOT NULL,
	[usuEMAIL] [varchar](100) NOT NULL,
	[usuNICK] [varchar](20) NOT NULL,
	[usuCLAVE] [varchar](250) NOT NULL,
	[usuIDPERFIL] [int] NOT NULL,
	[usuFECHAALTA] [datetime] NOT NULL,
	[usuFECHABAJA] [datetime] NULL,
 CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED 
(
	[usuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BITACORA] ON 

INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (1, 3, CAST(0x0000A1EA0021C1F7 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (2, 3, CAST(0x0000A1EA0021CAF0 AS DateTime), N'Login', N'Logout exitoso ({0})', N'jperez')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (3, 2, CAST(0x0000A1EA00226227 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (4, 2, CAST(0x0000A1EA00237EA8 AS DateTime), N'Login', N'Logout exitoso ({0})', N'hernan')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (5, 3, CAST(0x0000A1EA00244F6B AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (6, NULL, CAST(0x0000A1EA00255FCB AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU001;El usuario y/o password no es valido.')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (7, NULL, CAST(0x0000A1EA002562FF AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU001;El usuario y/o password no es valido.')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (8, NULL, CAST(0x0000A1EA002565F5 AS DateTime), N'', N'({0}) {1}', N'U05;Usuario bloqueado, intentelo mas tarde.')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (9, NULL, CAST(0x0000A1EA00256C7A AS DateTime), N'', N'({0}) {1}', N'U05;Usuario bloqueado, intentelo mas tarde.')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (10, NULL, CAST(0x0000A1EA0025755F AS DateTime), N'', N'({0}) {1}', N'U05;Usuario bloqueado, intentelo mas tarde.')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (11, NULL, CAST(0x0000A1EA00259BED AS DateTime), N'', N'({0}) {1}', N'U05;Usuario bloqueado, intentelo mas tarde.')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (12, NULL, CAST(0x0000A1EA0025E16A AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU001;El usuario y/o password no es valido.')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (13, 2, CAST(0x0000A1EA0025E971 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (14, 2, CAST(0x0000A1EA0027BC23 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (15, 2, CAST(0x0000A1EA0028C170 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (16, 2, CAST(0x0000A1EA002A4A17 AS DateTime), N'', N'({0}) {1}', N'ExDAO003;Ocurrió un error al generar el backup.')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (17, 2, CAST(0x0000A1EA002AC6F4 AS DateTime), N'Login', N'Logout exitoso ({0})', N'hernan')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (18, 2, CAST(0x0000A1EA002AE3A7 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (19, 2, CAST(0x0000A1EA002B2FFC AS DateTime), N'Login', N'Logout exitoso ({0})', N'hernan')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (20, 3, CAST(0x0000A1EA002B447E AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (21, 3, CAST(0x0000A1EA002B4674 AS DateTime), N'ModBitacora', N'({0}) {1}', N'ExB001;Ocurrió un error al obtener la bitacora')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (22, 3, CAST(0x0000A1EA002B49C2 AS DateTime), N'ModBitacora', N'({0}) {1}', N'ExB001;Ocurrió un error al obtener la bitacora')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (23, 3, CAST(0x0000A1EA002B6542 AS DateTime), N'ModBitacora', N'({0}) {1}', N'ExB001;Ocurrió un error al obtener la bitacora')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (24, 3, CAST(0x0000A1EA002B68D2 AS DateTime), N'ModBitacora', N'({0}) {1}', N'ExB001;Ocurrió un error al obtener la bitacora')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (25, 3, CAST(0x0000A1EA002BFAFD AS DateTime), N'ModBitacora', N'({0}) {1}', N'ExB001;Ocurrió un error al obtener la bitacora')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (26, 3, CAST(0x0000A1EA002DBEEE AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (27, 3, CAST(0x0000A1EA002F5926 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (28, 3, CAST(0x0000A1EA002F8C98 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (29, 3, CAST(0x0000A1EA0030FEB9 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (30, 3, CAST(0x0000A1EA0031CA83 AS DateTime), N'usuarios.aspx', N'({0}) {1}', N'ExPF001;No tiene acceso al módulo ingresado')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (31, 3, CAST(0x0000A1EA0031CC6C AS DateTime), N'usuarios.aspx', N'({0}) {1}', N'ExPF001;No tiene acceso al módulo ingresado')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (32, 3, CAST(0x0000A1EA0031CF59 AS DateTime), N'usuarios.aspx', N'({0}) {1}', N'ExPF001;No tiene acceso al módulo ingresado')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (33, 3, CAST(0x0000A1EA0031D306 AS DateTime), N'Login', N'Logout exitoso ({0})', N'jperez')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (34, 3, CAST(0x0000A1EA0031DEE1 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (35, 3, CAST(0x0000A1EA0031E0BA AS DateTime), N'usuarios.aspx', N'({0}) {1}', N'ExPF001;No tiene acceso al módulo ingresado')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (36, 3, CAST(0x0000A1EA0031FDFC AS DateTime), N'Login', N'Logout exitoso ({0})', N'jperez')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (37, 3, CAST(0x0000A1EA0032039B AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez')
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS]) VALUES (38, 3, CAST(0x0000A1EA00321311 AS DateTime), N'Login', N'Logout exitoso ({0})', N'jperez')
SET IDENTITY_INSERT [dbo].[BITACORA] OFF
SET IDENTITY_INSERT [dbo].[MODULO] ON 

INSERT [dbo].[MODULO] ([modID], [modCODIGO], [modNOMBRE], [modIDPADRE]) VALUES (1, N'Site.Master', N'Site Master', NULL)
INSERT [dbo].[MODULO] ([modID], [modCODIGO], [modNOMBRE], [modIDPADRE]) VALUES (3, N'usuarios.aspx', N'Usuarios', NULL)
INSERT [dbo].[MODULO] ([modID], [modCODIGO], [modNOMBRE], [modIDPADRE]) VALUES (4, N'bitacora.aspx', N'Bitacora', NULL)
INSERT [dbo].[MODULO] ([modID], [modCODIGO], [modNOMBRE], [modIDPADRE]) VALUES (5, N'backuprestore.aspx', N'BackupRestore', NULL)
INSERT [dbo].[MODULO] ([modID], [modCODIGO], [modNOMBRE], [modIDPADRE]) VALUES (6, N'admproductos.aspx', N'Administracion de Productos', NULL)
SET IDENTITY_INSERT [dbo].[MODULO] OFF
SET IDENTITY_INSERT [dbo].[MODULO_ACCION] ON 

INSERT [dbo].[MODULO_ACCION] ([maID], [maIDMODULO], [maACCION]) VALUES (0, NULL, NULL)
INSERT [dbo].[MODULO_ACCION] ([maID], [maIDMODULO], [maACCION]) VALUES (2, 1, N'lnkUsuarios')
INSERT [dbo].[MODULO_ACCION] ([maID], [maIDMODULO], [maACCION]) VALUES (3, 1, N'lnkProductos')
INSERT [dbo].[MODULO_ACCION] ([maID], [maIDMODULO], [maACCION]) VALUES (4, 1, N'lnkBitacora')
INSERT [dbo].[MODULO_ACCION] ([maID], [maIDMODULO], [maACCION]) VALUES (5, 1, N'lnkBackUp')
SET IDENTITY_INSERT [dbo].[MODULO_ACCION] OFF
SET IDENTITY_INSERT [dbo].[PERFIL] ON 

INSERT [dbo].[PERFIL] ([perID], [perNOMBRE], [perFECHAALTA], [perFECHABAJA]) VALUES (1, N'Administrador', CAST(0x0000A04901401D23 AS DateTime), NULL)
INSERT [dbo].[PERFIL] ([perID], [perNOMBRE], [perFECHAALTA], [perFECHABAJA]) VALUES (2, N'WebMaster', CAST(0x0000A0CE00D3A38B AS DateTime), NULL)
INSERT [dbo].[PERFIL] ([perID], [perNOMBRE], [perFECHAALTA], [perFECHABAJA]) VALUES (3, N'Cliente', CAST(0x0000A1E701880CD7 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PERFIL] OFF
SET IDENTITY_INSERT [dbo].[PERMISO] ON 

INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (63, 1, 1, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (65, 1, 1, 2, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (66, 1, 1, 3, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (67, 2, 1, 4, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (68, 1, 1, 5, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (71, 2, 1, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (72, 2, 1, 2, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (73, 2, 3, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (74, 2, 4, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (75, 1, 4, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (76, 1, 5, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (77, 2, 5, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (80, 1, 6, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (81, 2, 6, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (82, 3, 1, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (83, 3, 3, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (84, 3, 4, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (85, 3, 5, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (86, 3, 6, NULL, 0)
SET IDENTITY_INSERT [dbo].[PERMISO] OFF
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([usuID], [usuNOMBRE], [usuAPELLIDO], [usuEMAIL], [usuNICK], [usuCLAVE], [usuIDPERFIL], [usuFECHAALTA], [usuFECHABAJA]) VALUES (2, N'Hernan', N'Hegykozi', N'hernan@hegykozi.com.ar', N'hernan', N'123456', 1, CAST(0x0000A0CF01759F7F AS DateTime), NULL)
INSERT [dbo].[USUARIO] ([usuID], [usuNOMBRE], [usuAPELLIDO], [usuEMAIL], [usuNICK], [usuCLAVE], [usuIDPERFIL], [usuFECHAALTA], [usuFECHABAJA]) VALUES (3, N'Juan', N'Perez', N'jperez@hotmail.com', N'jperez', N'123456', 2, CAST(0x0000A0D00000A1E0 AS DateTime), NULL)
INSERT [dbo].[USUARIO] ([usuID], [usuNOMBRE], [usuAPELLIDO], [usuEMAIL], [usuNICK], [usuCLAVE], [usuIDPERFIL], [usuFECHAALTA], [usuFECHABAJA]) VALUES (4, N'Pablo', N'Lopez', N'plopez@gmail.com', N'plopez', N'123456', 3, CAST(0x0000A1E7018831F4 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_BACKUP_bkFECHA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BACKUP] ADD  CONSTRAINT [DF_BACKUP_bkFECHA]  DEFAULT (getdate()) FOR [bkFECHA]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_BACKUP_bkESTADO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BACKUP] ADD  CONSTRAINT [DF_BACKUP_bkESTADO]  DEFAULT ((0)) FOR [bkESTADO]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_BITACORA_bitFECHA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BITACORA] ADD  CONSTRAINT [DF_BITACORA_bitFECHA]  DEFAULT (getdate()) FOR [bitFECHA]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PERFIL_perFECHAALTA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFIL] ADD  CONSTRAINT [DF_PERFIL_perFECHAALTA]  DEFAULT (getdate()) FOR [perFECHAALTA]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_PERMISO_pmPERMITIDO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERMISO] ADD  CONSTRAINT [DF_PERMISO_pmPERMITIDO]  DEFAULT ((0)) FOR [pmPERMITIDO]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_RESTORE_rtFECHA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RESTORE] ADD  CONSTRAINT [DF_RESTORE_rtFECHA]  DEFAULT (getdate()) FOR [rtFECHA]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_RESTORE_rtESTADO]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RESTORE] ADD  CONSTRAINT [DF_RESTORE_rtESTADO]  DEFAULT ((0)) FOR [rtESTADO]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_USUARIO_usuFECHAALTA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USUARIO] ADD  CONSTRAINT [DF_USUARIO_usuFECHAALTA]  DEFAULT (getdate()) FOR [usuFECHAALTA]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BACKUP_USUARIO]') AND parent_object_id = OBJECT_ID(N'[dbo].[BACKUP]'))
ALTER TABLE [dbo].[BACKUP]  WITH CHECK ADD  CONSTRAINT [FK_BACKUP_USUARIO] FOREIGN KEY([bkIDUSUARIO])
REFERENCES [dbo].[USUARIO] ([usuID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BACKUP_USUARIO]') AND parent_object_id = OBJECT_ID(N'[dbo].[BACKUP]'))
ALTER TABLE [dbo].[BACKUP] CHECK CONSTRAINT [FK_BACKUP_USUARIO]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MODULO_MODULO]') AND parent_object_id = OBJECT_ID(N'[dbo].[MODULO]'))
ALTER TABLE [dbo].[MODULO]  WITH CHECK ADD  CONSTRAINT [FK_MODULO_MODULO] FOREIGN KEY([modIDPADRE])
REFERENCES [dbo].[MODULO] ([modID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MODULO_MODULO]') AND parent_object_id = OBJECT_ID(N'[dbo].[MODULO]'))
ALTER TABLE [dbo].[MODULO] CHECK CONSTRAINT [FK_MODULO_MODULO]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MODULO_ACCION_MODULO]') AND parent_object_id = OBJECT_ID(N'[dbo].[MODULO_ACCION]'))
ALTER TABLE [dbo].[MODULO_ACCION]  WITH CHECK ADD  CONSTRAINT [FK_MODULO_ACCION_MODULO] FOREIGN KEY([maIDMODULO])
REFERENCES [dbo].[MODULO] ([modID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MODULO_ACCION_MODULO]') AND parent_object_id = OBJECT_ID(N'[dbo].[MODULO_ACCION]'))
ALTER TABLE [dbo].[MODULO_ACCION] CHECK CONSTRAINT [FK_MODULO_ACCION_MODULO]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PERMISO_MODULO]') AND parent_object_id = OBJECT_ID(N'[dbo].[PERMISO]'))
ALTER TABLE [dbo].[PERMISO]  WITH CHECK ADD  CONSTRAINT [FK_PERMISO_MODULO] FOREIGN KEY([pmIDMODULO])
REFERENCES [dbo].[MODULO] ([modID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PERMISO_MODULO]') AND parent_object_id = OBJECT_ID(N'[dbo].[PERMISO]'))
ALTER TABLE [dbo].[PERMISO] CHECK CONSTRAINT [FK_PERMISO_MODULO]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PERMISO_MODULO_ACCION]') AND parent_object_id = OBJECT_ID(N'[dbo].[PERMISO]'))
ALTER TABLE [dbo].[PERMISO]  WITH CHECK ADD  CONSTRAINT [FK_PERMISO_MODULO_ACCION] FOREIGN KEY([pmIDMODULOACCION])
REFERENCES [dbo].[MODULO_ACCION] ([maID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PERMISO_MODULO_ACCION]') AND parent_object_id = OBJECT_ID(N'[dbo].[PERMISO]'))
ALTER TABLE [dbo].[PERMISO] CHECK CONSTRAINT [FK_PERMISO_MODULO_ACCION]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PERMISO_PERFIL]') AND parent_object_id = OBJECT_ID(N'[dbo].[PERMISO]'))
ALTER TABLE [dbo].[PERMISO]  WITH CHECK ADD  CONSTRAINT [FK_PERMISO_PERFIL] FOREIGN KEY([pmIDPERFIL])
REFERENCES [dbo].[PERFIL] ([perID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PERMISO_PERFIL]') AND parent_object_id = OBJECT_ID(N'[dbo].[PERMISO]'))
ALTER TABLE [dbo].[PERMISO] CHECK CONSTRAINT [FK_PERMISO_PERFIL]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RESTORE_USUARIO]') AND parent_object_id = OBJECT_ID(N'[dbo].[RESTORE]'))
ALTER TABLE [dbo].[RESTORE]  WITH CHECK ADD  CONSTRAINT [FK_RESTORE_USUARIO] FOREIGN KEY([rtIDUSUARIO])
REFERENCES [dbo].[USUARIO] ([usuID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RESTORE_USUARIO]') AND parent_object_id = OBJECT_ID(N'[dbo].[RESTORE]'))
ALTER TABLE [dbo].[RESTORE] CHECK CONSTRAINT [FK_RESTORE_USUARIO]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USUARIO_PERFIL]') AND parent_object_id = OBJECT_ID(N'[dbo].[USUARIO]'))
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_PERFIL] FOREIGN KEY([usuIDPERFIL])
REFERENCES [dbo].[PERFIL] ([perID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USUARIO_PERFIL]') AND parent_object_id = OBJECT_ID(N'[dbo].[USUARIO]'))
ALTER TABLE [dbo].[USUARIO] CHECK CONSTRAINT [FK_USUARIO_PERFIL]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BACKUP', N'COLUMN',N'bkID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del backup.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BACKUP', N'COLUMN',N'bkIDUSUARIO'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del usuario.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkIDUSUARIO'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BACKUP', N'COLUMN',N'bkFECHA'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de realizacion del backup' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkFECHA'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BACKUP', N'COLUMN',N'bkRUTA'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ruta del archivo generado.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkRUTA'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BACKUP', N'COLUMN',N'bkESTADO'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado de finalización del backup.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkESTADO'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BITACORA', N'COLUMN',N'bitID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador de la bitácora.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BITACORA', N'COLUMN',N'bitIDUSUARIO'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del usuario.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitIDUSUARIO'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BITACORA', N'COLUMN',N'bitFECHA'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que se generó la bitácora.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitFECHA'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BITACORA', N'COLUMN',N'bitMODULO'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador de la acción del módulo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitMODULO'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BITACORA', N'COLUMN',N'bitDESCRIPCION'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrición de la bitácora.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitDESCRIPCION'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MODULO', N'COLUMN',N'modID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del Módulo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO', @level2type=N'COLUMN',@level2name=N'modID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MODULO', N'COLUMN',N'modCODIGO'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de identificacion del módulo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO', @level2type=N'COLUMN',@level2name=N'modCODIGO'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MODULO', N'COLUMN',N'modNOMBRE'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del módulo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO', @level2type=N'COLUMN',@level2name=N'modNOMBRE'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MODULO', N'COLUMN',N'modIDPADRE'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del módulo padre.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO', @level2type=N'COLUMN',@level2name=N'modIDPADRE'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MODULO_ACCION', N'COLUMN',N'maID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador de la acción por módulo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO_ACCION', @level2type=N'COLUMN',@level2name=N'maID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MODULO_ACCION', N'COLUMN',N'maIDMODULO'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del módulo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO_ACCION', @level2type=N'COLUMN',@level2name=N'maIDMODULO'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'MODULO_ACCION', N'COLUMN',N'maACCION'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Desripción de la acción.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO_ACCION', @level2type=N'COLUMN',@level2name=N'maACCION'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERFIL', N'COLUMN',N'perID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del perfil.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERFIL', @level2type=N'COLUMN',@level2name=N'perID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERFIL', N'COLUMN',N'perNOMBRE'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del perfil.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERFIL', @level2type=N'COLUMN',@level2name=N'perNOMBRE'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERFIL', N'COLUMN',N'perFECHAALTA'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de creación del perfil.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERFIL', @level2type=N'COLUMN',@level2name=N'perFECHAALTA'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERFIL', N'COLUMN',N'perFECHABAJA'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de baja del perfil.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERFIL', @level2type=N'COLUMN',@level2name=N'perFECHABAJA'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERMISO', N'COLUMN',N'pmID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del permiso.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERMISO', @level2type=N'COLUMN',@level2name=N'pmID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERMISO', N'COLUMN',N'pmIDPERFIL'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del perfil.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERMISO', @level2type=N'COLUMN',@level2name=N'pmIDPERFIL'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERMISO', N'COLUMN',N'pmIDMODULOACCION'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador de la acción del módulo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERMISO', @level2type=N'COLUMN',@level2name=N'pmIDMODULOACCION'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PERMISO', N'COLUMN',N'pmPERMITIDO'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicador de permiso permitido.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERMISO', @level2type=N'COLUMN',@level2name=N'pmPERMITIDO'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RESTORE', N'COLUMN',N'rtID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del restore.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RESTORE', N'COLUMN',N'rtIDUSUARIO'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del usuario.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtIDUSUARIO'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RESTORE', N'COLUMN',N'rtFECHA'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de realizacion del restore.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtFECHA'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RESTORE', N'COLUMN',N'rtRUTA'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ruta del archivo restaurado.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtRUTA'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RESTORE', N'COLUMN',N'rtESTADO'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado de finalización del restore.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtESTADO'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USUARIO', N'COLUMN',N'usuID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del usuario.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USUARIO', @level2type=N'COLUMN',@level2name=N'usuID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USUARIO', N'COLUMN',N'usuNICK'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuario de inicio de sesión.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USUARIO', @level2type=N'COLUMN',@level2name=N'usuNICK'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USUARIO', N'COLUMN',N'usuCLAVE'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contraseña del Usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USUARIO', @level2type=N'COLUMN',@level2name=N'usuCLAVE'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'USUARIO', N'COLUMN',N'usuIDPERFIL'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del perfil.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USUARIO', @level2type=N'COLUMN',@level2name=N'usuIDPERFIL'
GO
USE [master]
GO
ALTER DATABASE [GastaSuela] SET  READ_WRITE 
GO
