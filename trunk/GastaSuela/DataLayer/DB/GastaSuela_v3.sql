USE [master]
GO
/****** Object:  Database [GastaSuela]    Script Date: 29/06/2013 17:06:11 ******/
CREATE DATABASE [GastaSuela] ON  PRIMARY 
( NAME = N'GastaSuela', FILENAME = N'D:\MSSQLSERVER\MSSQL\DATA\GastaSuela.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GastaSuela_log', FILENAME = N'D:\MSSQLSERVER\MSSQL\DATA\GastaSuela_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  StoredProcedure [dbo].[BITACORAS_PROC]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec BITACORAS_PROC '4', null, null
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
IF @ACCION = '1' BEGIN
	
	INSERT INTO BITACORA(bitIDUSUARIO, bitFECHA, bitMODULO, bitDESCRIPCION, bitARGUMENTOS)
	VALUES (@IDUSUARIO, GETDATE(), @MODULO, @DESCRIPCION, @ARGUMENTOS)
	
	SET @ID = SCOPE_IDENTITY()	
	EXEC DVH_UPDATE @ID, 'BITACORA'

END



--CONSULTA
IF @ACCION = '4' BEGIN
	
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

GO
/****** Object:  StoredProcedure [dbo].[DICCIONARIO]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DICCIONARIO]

AS
select 
	--d.object_id,
	a.name Tabla, 
	--schema_name(a.schema_id) schema_name, 
	--a.create_date,
	b.name Columna, 
	ep.value [Descripcion],	
	CASE	
		WHEN c.name = 'numeric' OR  c.name = 'decimal' OR c.name = 'float' OR c.name = 'int' OR c.name = 'bigint'  THEN 'Numérico'
		WHEN c.name = 'varchar' OR  c.name = 'text'  THEN 'Texto'
		WHEN c.name = 'date' OR  c.name = 'datetime'  THEN 'Fecha'
		WHEN c.name = 'bit' THEN 'Lógico'
		ELSE c.name
	END Tipo, 		
	b.max_length Tamaño, 	
	CASE	
		WHEN c.name = 'numeric' OR  c.name = 'decimal' OR c.name = 'float' OR c.name = 'int' OR c.name = 'bigint'  THEN '0-9'
		WHEN c.name = 'varchar' OR  c.name = 'text'  THEN 'A-Z, a-z, 0-9'
		WHEN c.name = 'date' OR  c.name = 'datetime'  THEN '0-9, -'
		WHEN c.name = 'bit' THEN 'Sí - No'
		ELSE ''
	END Dominio,	
	CASE 
		WHEN b.is_nullable = 0 THEN 'NO'
		ELSE 'SI'
	END [Permite Nulls],
	CASE 
		WHEN b.is_identity = 0 THEN 'NO'
		ELSE 'SI'
	END [Es Autonumerico],	
	CASE	
		WHEN c.name = 'numeric' OR  c.name = 'decimal' OR c.name = 'float'  THEN b.precision
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
WHERE a.name <> 'sysdiagrams' 
ORDER BY a.name,b.column_Id

GO
/****** Object:  StoredProcedure [dbo].[DVH_UPDATE]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DVH_UPDATE 1, 'USUARIO'

CREATE PROCEDURE [dbo].[DVH_UPDATE]
@ID VARCHAR(50) = NULL,
@TABLA VARCHAR(50) = NULL

AS
BEGIN

SET NOCOUNT ON

	DECLARE @SCRIPT NVARCHAR(MAX)
	DECLARE @CAMPOS VARCHAR(500)
	DECLARE @CAMPOID VARCHAR(50)
	DECLARE @DVV INT

	DECLARE @ParmDefinition nvarchar(500);

	IF @ID IS NULL BEGIN
		SET @ID = 'NULL'
	END

	DECLARE CURDIG CURSOR FOR
		
		SELECT TABLA, CAMPOS, CAMPOID
		FROM TABLAS_DVV
		WHERE @TABLA IS NULL OR TABLA = @TABLA 

	OPEN CURDIG
	FETCH NEXT FROM CURDIG
 
	INTO @TABLA, @CAMPOS, @CAMPOID


	while @@FETCH_STATUS = 0
	BEGIN 
	
		SET @SCRIPT = '	UPDATE ['+@TABLA+']
		SET DVH = BINARY_CHECKSUM('+@CAMPOS+')
		WHERE '+CAST(@ID AS VARCHAR)+' IS NULL OR '+@CAMPOID+' = ' + CAST(@ID AS VARCHAR)

		EXEC (@SCRIPT)

		SET @SCRIPT = 'SELECT @DVV_OUT=CHECKSUM_AGG(DVH) FROM ['+@TABLA+']'
		SET @ParmDefinition = '@DVV_OUT nvarchar(25) OUTPUT'
		exec sp_executesql @SCRIPT, @ParmDefinition, @DVV_OUT=@DVV output;

		EXEC DVV_UPDATE @TABLA, @DVV

		FETCH NEXT FROM CURDIG
		INTO @TABLA, @CAMPOS, @CAMPOID
	END    
	CLOSE CURDIG 
	DEALLOCATE CURDIG 


	
	


END

GO
/****** Object:  StoredProcedure [dbo].[DVV_UPDATE]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DVV_UPDATE]
@NOMBRE VARCHAR(50) = NULL,
@DVV INT = NULL
AS
BEGIN

SET NOCOUNT ON	
	
	UPDATE TABLAS_DVV
	SET DVV = @DVV
	WHERE @NOMBRE IS NULL OR TABLA = @NOMBRE

END 	
GO
/****** Object:  StoredProcedure [dbo].[LOGIN_PROC]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOGIN_PROC]
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

GO
/****** Object:  StoredProcedure [dbo].[MODULOS_SP]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC DBO.MODULOS_SP 'MOD'
--EXEC DBO.MODULOS_SP 'ACC',8
CREATE PROCEDURE [dbo].[MODULOS_SP]
@ACCION VARCHAR(20) = NULL,
@IDMODULO INT = NULL
AS

IF @ACCION = 'MOD' BEGIN
	SELECT *
	FROM MODULO
END

IF @ACCION = 'ACC' BEGIN
	SELECT *
	FROM MODULO
	INNER JOIN MODULO_ACCION
	ON maIDMODULO = modID 
	WHERE modID = @IDMODULO
END

GO
/****** Object:  StoredProcedure [dbo].[PERFILES_PROC]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec PERFILES_PROC 'byUSER', null, 'hernan'
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
IF @ACCION = '1' BEGIN
	
	INSERT INTO PERFIL(perNOMBRE)
	VALUES (@NOMBRE)
	
	SET @ID = SCOPE_IDENTITY()	
	EXEC DVH_UPDATE @ID, 'PERFIL'

END

--UPDATE
IF @ACCION = '2' BEGIN
	
	UPDATE PERFIL
	SET perNOMBRE = @NOMBRE
	WHERE perID = @ID
	
	EXEC DVH_UPDATE @ID, 'PERFIL'

END

--DELETE
IF @ACCION = '3' BEGIN
	
	UPDATE PERFIL
	SET perFECHABAJA = GETDATE()
	WHERE perID = @ID
	
	EXEC DVH_UPDATE @ID, 'PERFIL'

END


--CONSULTA
IF @ACCION = '4' BEGIN
	
	SELECT	*
	FROM PERFIL AS P
	WHERE (@ID IS NULL OR P.perID = @ID)
	AND (@NOMBRE IS NULL OR @NOMBRE = P.perNOMBRE)
	and P.perFECHABAJA IS NULL
	
END

--POR USUARIO
IF @ACCION = 'byUSER' BEGIN
	
	SELECT	P.*
	FROM PERFIL AS P
	INNER JOIN USUARIO AS U
	ON U.usuNICK = @NOMBRE 
	AND U.usuIDPERFIL = P.perID
	
END

END

GO
/****** Object:  StoredProcedure [dbo].[PERMISOS_SP]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC DBO.PERMISOS_SP 'MOD', 1
--EXEC DBO.PERMISOS_SP 'ACC',1,8
CREATE PROCEDURE [dbo].[PERMISOS_SP]

@ACCION VARCHAR(20) = NULL,
@IDPERFIL INT = NULL,
@IDMODULO INT = NULL,
@IDMODULOACCION INT = NULL,
@PERMITIDO BIT = NULL

AS
BEGIN

	SET NOCOUNT ON;
IF @ACCION = '1' BEGIN

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
	
IF @ACCION = 'GET' BEGIN
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
IF @ACCION = 'MOD' BEGIN

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

IF @ACCION = 'ACC' BEGIN
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

GO
/****** Object:  StoredProcedure [dbo].[PRODUCTOS_SP]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PRODUCTOS_SP]
@ID INT = NULL

AS
BEGIN
	SET NOCOUNT ON;
IF @ID = 0 
SET @ID = NULL	

	SELECT *
	FROM PRODUCTOS P
	WHERE (@ID IS NULL OR P.proID = @ID)
	

END

GO
/****** Object:  StoredProcedure [dbo].[USUARIOS_PROC]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec USUARIOS_PROC '4', null, '29906396'
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
IF @ACCION = '1' BEGIN
	
	INSERT INTO USUARIO(usuNOMBRE,usuAPELLIDO, usuEMAIL,usuNICK,usuCLAVE, usuIDPERFIL)
	VALUES (@NOMBRE,@APELLIDO,@EMAIL,@NICK,@CLAVE,@IDPERFIL)
	
	SET @ID = SCOPE_IDENTITY()	
	EXEC DVH_UPDATE @ID, 'USUARIO'

END

--UPDATE
IF @ACCION = '2' BEGIN
	
	UPDATE USUARIO
	SET usuCLAVE = @CLAVE,
	usuIDPERFIL = @IDPERFIL,
	usuNOMBRE = @NOMBRE,
	usuAPELLIDO = @APELLIDO,
	usuEMAIL = @EMAIL
	FROM USUARIO AS U
	WHERE U.usuID = @ID

	EXEC DVH_UPDATE @ID, 'USUARIO'
	
END

--DELETE
IF @ACCION = '3' BEGIN
	
	UPDATE USUARIO
	SET usuFECHABAJA = GETDATE()
	FROM USUARIO AS U
	WHERE U.usuID = @ID

	EXEC DVH_UPDATE @ID, 'USUARIO'
	
END



END

GO
/****** Object:  StoredProcedure [dbo].[USUARIOS_SP]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USUARIOS_SP]
@ACCION VARCHAR(20) = NULL,
@ID INT = NULL,
@NICK VARCHAR(20) = NULL

AS
BEGIN
	SET NOCOUNT ON;
	
IF @ACCION = 'byNICK' BEGIN
	SELECT	*
	FROM USUARIO AS U
	WHERE (@NICK is null OR U.usuNICK = @NICK)
	AND U.usuFECHABAJA IS NULL
END
	

END

GO
/****** Object:  StoredProcedure [dbo].[VERIFICA_DIGITOS]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VERIFICA_DIGITOS]
AS
BEGIN

	SET NOCOUNT ON;

	CREATE TABLE #ERRORES (TABLA VARCHAR(50), REGISTRO INT)


	DECLARE @SCRIPT NVARCHAR(MAX)
	DECLARE @TABLA VARCHAR(50)
	DECLARE @CAMPOS VARCHAR(500)
	DECLARE @CAMPOID VARCHAR(50)
	DECLARE @DVV INT

	DECLARE @ParmDefinition nvarchar(500);

	DECLARE CURDIG CURSOR FOR
		
		SELECT TABLA, CAMPOS, CAMPOID
		FROM TABLAS_DVV

	OPEN CURDIG
	FETCH NEXT FROM CURDIG
 
	INTO @TABLA, @CAMPOS, @CAMPOID


	while @@FETCH_STATUS = 0
	BEGIN 

		SET @SCRIPT = 'SELECT 
		'''+@TABLA+''' AS TABLA,
		'+@CAMPOID+' AS REGISTRO
		FROM ['+@TABLA+']
		WHERE DVH <> BINARY_CHECKSUM('+@CAMPOS+')'	


		INSERT INTO #ERRORES (TABLA, REGISTRO)
		EXEC (@SCRIPT)


		FETCH NEXT FROM CURDIG
		INTO @TABLA, @CAMPOS, @CAMPOID
	END    
	CLOSE CURDIG 
	DEALLOCATE CURDIG 


	SELECT * FROM #ERRORES


END

GO
/****** Object:  Table [dbo].[BACKUP]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BACKUP](
	[bkID] [int] IDENTITY(1,1) NOT NULL,
	[bkIDUSUARIO] [int] NOT NULL,
	[bkFECHA] [datetime] NOT NULL,
	[bkRUTA] [varchar](200) NOT NULL,
	[bkESTADO] [bit] NOT NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_BACKUP] PRIMARY KEY CLUSTERED 
(
	[bkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BITACORA]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BITACORA](
	[bitID] [int] IDENTITY(1,1) NOT NULL,
	[bitIDUSUARIO] [int] NULL,
	[bitFECHA] [datetime] NOT NULL,
	[bitMODULO] [varchar](50) NULL,
	[bitDESCRIPCION] [nvarchar](500) NULL,
	[bitARGUMENTOS] [varchar](500) NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_BITACORA] PRIMARY KEY CLUSTERED 
(
	[bitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MODULO]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MODULO](
	[modID] [int] IDENTITY(1,1) NOT NULL,
	[modCODIGO] [varchar](50) NOT NULL,
	[modNOMBRE] [varchar](100) NOT NULL,
	[modIDPADRE] [int] NULL,
 CONSTRAINT [PK_MODULO] PRIMARY KEY CLUSTERED 
(
	[modID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MODULO_ACCION]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MODULO_ACCION](
	[maID] [int] IDENTITY(1,1) NOT NULL,
	[maIDMODULO] [int] NULL,
	[maACCION] [varchar](100) NULL,
 CONSTRAINT [PK_MODULO_ACCION] PRIMARY KEY CLUSTERED 
(
	[maID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERFIL]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERFIL](
	[perID] [int] IDENTITY(1,1) NOT NULL,
	[perNOMBRE] [varchar](100) NOT NULL,
	[perFECHAALTA] [datetime] NOT NULL,
	[perFECHABAJA] [datetime] NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_PERFIL] PRIMARY KEY CLUSTERED 
(
	[perID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERMISO]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[proID] [int] IDENTITY(1,1) NOT NULL,
	[proNombre] [nvarchar](20) NOT NULL,
	[proPrecioUnit] [money] NOT NULL,
	[proStock] [int] NOT NULL,
	[proEstado] [bit] NOT NULL,
	[proFoto] [varchar](200) NULL,
	[FECHA_INSERT] [datetime] NOT NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RESTORE]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RESTORE](
	[rtID] [int] IDENTITY(1,1) NOT NULL,
	[rtIDUSUARIO] [int] NOT NULL,
	[rtFECHA] [datetime] NOT NULL,
	[rtRUTA] [varchar](200) NOT NULL,
	[rtESTADO] [bit] NOT NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_RESTORE] PRIMARY KEY CLUSTERED 
(
	[rtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TABLAS_DVV]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TABLAS_DVV](
	[TABLA] [varchar](50) NOT NULL,
	[DVV] [bigint] NULL,
	[CAMPOS] [varchar](500) NULL,
	[CAMPOID] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 29/06/2013 17:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
	[DVH] [int] NULL,
 CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED 
(
	[usuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BITACORA] ON 

INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (1, 3, CAST(0x0000A1EA0021C1F7 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', 1591281422)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (2, 3, CAST(0x0000A1EA0021CAF0 AS DateTime), N'Login', N'Logout exitoso ({0})', N'jperez', -295078209)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (3, 2, CAST(0x0000A1EA00226227 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', 1691446106)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (4, 2, CAST(0x0000A1EA00237EA8 AS DateTime), N'Login', N'Logout exitoso ({0})', N'hernan', -988177685)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (5, 3, CAST(0x0000A1EA00244F6B AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', 103859982)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (6, NULL, CAST(0x0000A1EA00255FCB AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU001;El usuario y/o password no es valido.', 2030489822)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (7, NULL, CAST(0x0000A1EA002562FF AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU001;El usuario y/o password no es valido.', 2060816606)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (8, NULL, CAST(0x0000A1EA002565F5 AS DateTime), N'', N'({0}) {1}', N'U05;Usuario bloqueado, intentelo mas tarde.', -233293886)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (9, NULL, CAST(0x0000A1EA00256C7A AS DateTime), N'', N'({0}) {1}', N'U05;Usuario bloqueado, intentelo mas tarde.', -226441278)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (10, NULL, CAST(0x0000A1EA0025755F AS DateTime), N'', N'({0}) {1}', N'U05;Usuario bloqueado, intentelo mas tarde.', -216885310)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (11, NULL, CAST(0x0000A1EA00259BED AS DateTime), N'', N'({0}) {1}', N'U05;Usuario bloqueado, intentelo mas tarde.', -33966142)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (12, NULL, CAST(0x0000A1EA0025E16A AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU001;El usuario y/o password no es valido.', 1928118494)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (13, 2, CAST(0x0000A1EA0025E971 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', 476318554)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (14, 2, CAST(0x0000A1EA0027BC23 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', 959523674)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (15, 2, CAST(0x0000A1EA0028C170 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', -823911590)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (16, 2, CAST(0x0000A1EA002A4A17 AS DateTime), N'', N'({0}) {1}', N'ExDAO003;Ocurrió un error al generar el backup.', -490106120)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (17, 2, CAST(0x0000A1EA002AC6F4 AS DateTime), N'Login', N'Logout exitoso ({0})', N'hernan', 1587305195)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (18, 2, CAST(0x0000A1EA002AE3A7 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', -322344102)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (19, 2, CAST(0x0000A1EA002B2FFC AS DateTime), N'Login', N'Logout exitoso ({0})', N'hernan', 1074584299)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (20, 3, CAST(0x0000A1EA002B447E AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', -159279346)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (21, 3, CAST(0x0000A1EA002B4674 AS DateTime), N'ModBitacora', N'({0}) {1}', N'ExB001;Ocurrió un error al obtener la bitacora', -403672230)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (22, 3, CAST(0x0000A1EA002B49C2 AS DateTime), N'ModBitacora', N'({0}) {1}', N'ExB001;Ocurrió un error al obtener la bitacora', -418704550)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (23, 3, CAST(0x0000A1EA002B6542 AS DateTime), N'ModBitacora', N'({0}) {1}', N'ExB001;Ocurrió un error al obtener la bitacora', -440200358)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (24, 3, CAST(0x0000A1EA002B68D2 AS DateTime), N'ModBitacora', N'({0}) {1}', N'ExB001;Ocurrió un error al obtener la bitacora', -451275942)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (25, 3, CAST(0x0000A1EA002BFAFD AS DateTime), N'ModBitacora', N'({0}) {1}', N'ExB001;Ocurrió un error al obtener la bitacora', -331816102)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (26, 3, CAST(0x0000A1EA002DBEEE AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', -1725393138)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (27, 3, CAST(0x0000A1EA002F5926 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', -1219225842)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (28, 3, CAST(0x0000A1EA002F8C98 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', -1173358834)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (29, 3, CAST(0x0000A1EA0030FEB9 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', 1294853903)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (30, 3, CAST(0x0000A1EA0031CA83 AS DateTime), N'usuarios.aspx', N'({0}) {1}', N'ExPF001;No tiene acceso al módulo ingresado', -1996708100)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (31, 3, CAST(0x0000A1EA0031CC6C AS DateTime), N'usuarios.aspx', N'({0}) {1}', N'ExPF001;No tiene acceso al módulo ingresado', -2003675396)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (32, 3, CAST(0x0000A1EA0031CF59 AS DateTime), N'usuarios.aspx', N'({0}) {1}', N'ExPF001;No tiene acceso al módulo ingresado', -2002712836)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (33, 3, CAST(0x0000A1EA0031D306 AS DateTime), N'Login', N'Logout exitoso ({0})', N'jperez', -269084994)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (34, 3, CAST(0x0000A1EA0031DEE1 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', 1596483343)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (35, 3, CAST(0x0000A1EA0031E0BA AS DateTime), N'usuarios.aspx', N'({0}) {1}', N'ExPF001;No tiene acceso al módulo ingresado', -1973471492)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (36, 3, CAST(0x0000A1EA0031FDFC AS DateTime), N'Login', N'Logout exitoso ({0})', N'jperez', -317081922)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (37, 3, CAST(0x0000A1EA0032039B AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', 1660929807)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (38, 3, CAST(0x0000A1EA00321311 AS DateTime), N'Login', N'Logout exitoso ({0})', N'jperez', -738761026)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (39, 2, CAST(0x0000A1EA003383D8 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', 2060360539)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (40, 2, CAST(0x0000A1EA00342609 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', 9669467)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (41, 2, CAST(0x0000A1EA0035D435 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', 531647323)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (42, 2, CAST(0x0000A1EA0035E7A9 AS DateTime), N'', N'({0}) {1}', N'ExDAO003;Ocurrió un error al generar el backup.', 403862265)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (43, 2, CAST(0x0000A1EA0037411F AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', 920841051)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (44, 2, CAST(0x0000A1EA014A4405 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', -424457396)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (45, 2, CAST(0x0000A1EA014A4A28 AS DateTime), N'Login', N'Logout exitoso ({0})', N'hernan', 1448188669)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (46, 3, CAST(0x0000A1EA014B8151 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', -86808808)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (47, 2, CAST(0x0000A1EA014CEF4D AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', -1945646260)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (48, 2, CAST(0x0000A1EA014CF91F AS DateTime), N'Login', N'Logout exitoso ({0})', N'hernan', 1029892861)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (49, 3, CAST(0x0000A1EA014CFFA9 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', -1925388520)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (50, 2, CAST(0x0000A1EA014EE934 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', -1402971316)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (51, 2, CAST(0x0000A1EA014EEC6C AS DateTime), N'Login', N'Logout exitoso ({0})', N'hernan', 473291517)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (52, 3, CAST(0x0000A1EA014EF4E5 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', -1383586024)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (53, 2, CAST(0x0000A1EA0150D02F AS DateTime), N'Login8', N'Logueo exitoso ({0})', N'hernan', -1400910519)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (54, 2, CAST(0x0000A1EA0150D61B AS DateTime), N'Login', N'Logout exitoso ({0})', N'hernan', -7165188)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (55, NULL, CAST(0x0000A1EA0150F2A6 AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU001;El usuario y/o password no es valido.', 600834249)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (56, NULL, CAST(0x0000A1EA01517C13 AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU001;El usuario y/o password no es valido.', 993743049)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (57, 3, CAST(0x0000A1EA01518D6C AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', 1511044889)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (58, NULL, CAST(0x0000A1EA0151EE87 AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU001;El usuario y/o password no es valido.', 840044745)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (59, 2, CAST(0x0000A1EA0151F424 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', 1571904333)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (60, 2, CAST(0x0000A1EA0151FD76 AS DateTime), N'digitoverificador.aspx', N'({0}) {1}', N'ExPF001;No tiene acceso al módulo ingresado', -1982796482)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (61, 3, CAST(0x0000A1EA01536B64 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', 1953511193)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (62, NULL, CAST(0x0000A1EA0154B0C5 AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU002;Ocurrió un error al obtener el usuario.', -385555037)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (63, NULL, CAST(0x0000A1EA0154B270 AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU001;El usuario y/o password no es valido.', 1742561481)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (64, NULL, CAST(0x0000A1EA0154B286 AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU001;El usuario y/o password no es valido.', 1741816009)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (65, NULL, CAST(0x0000A1EA0154C80A AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU001;El usuario y/o password no es valido.', 1618657481)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (66, 3, CAST(0x0000A1EA0154CDC8 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', 236648217)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (67, 3, CAST(0x0000A1EA0155D369 AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU002;Ocurrió un error al obtener el usuario.', 12737116)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (68, NULL, CAST(0x0000A1EA0156435F AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU002;Ocurrió un error al obtener el usuario.', -969063005)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (69, 3, CAST(0x0000A1EA015668D8 AS DateTime), N'ModUsuario8', N'({0}) {1}', N'ExU002;Ocurrió un error al obtener el usuario.', 1310545258)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (70, 3, CAST(0x0000A1EA01566AD0 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', 611022617)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (71, NULL, CAST(0x0000A1EA0156C6D0 AS DateTime), N'ModUsuario', N'({0}) {1}', N'ExU001;El usuario y/o password no es valido.', 1083662537)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (72, 3, CAST(0x0000A1EA01576512 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', 882333465)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (73, NULL, CAST(0x0000A1EA01654BD1 AS DateTime), N'ModPerfil', N'({0}) {1}', N'ExPF004;Ocurrió un error al obtener el perfil.', 168881860)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (74, NULL, CAST(0x0000A1EA01664A3A AS DateTime), N'ModProducto', N'({0}) {1}', N'ExPP004;Ocurrió un error al obtener el producto.', -1414365732)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (75, NULL, CAST(0x0000A1EA0166ECE1 AS DateTime), N'ModProducto', N'({0}) {1}', N'ExPP004;Ocurrió un error al obtener el producto.', -1579168292)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (76, 3, CAST(0x0000A1EA0167B372 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', 972117786)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (77, 4, CAST(0x0000A1EA0180ECA7 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'plopez', 1303880980)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (78, 4, CAST(0x0000A1EA0182A008 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'plopez', 1769821460)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (79, 4, CAST(0x0000A1EA01852A92 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'plopez', 299169044)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (80, 4, CAST(0x0000A1EA0185A781 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'plopez', 419808532)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (81, 4, CAST(0x0000A1EA018A71A4 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'plopez', -462973676)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (82, 4, CAST(0x0000A1EB0000FD66 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'plopez', 1286317324)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (83, 4, CAST(0x0000A1EB0002FAC9 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'plopez', 1825658124)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (84, 4, CAST(0x0000A1EB0003641F AS DateTime), N'Login', N'Logueo exitoso ({0})', N'plopez', 1966880012)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (85, 4, CAST(0x0000A1EB0003C03C AS DateTime), N'Login', N'Logueo exitoso ({0})', N'plopez', 2138965260)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (86, 4, CAST(0x0000A1EB000428B2 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'plopez', 32957708)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (87, 4, CAST(0x0000A1EB00049715 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'plopez', 168596748)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (88, 4, CAST(0x0000A1EB0004AE0B AS DateTime), N'ModProducto', N'({0}) {1}', N'ExPP004;Ocurrió un error al obtener el producto.', 2047476277)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (89, 4, CAST(0x0000A1EB000520A9 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'plopez', 293033228)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (90, 4, CAST(0x0000A1EB0006199D AS DateTime), N'Login5', N'Logout exitoso ({0})', N'plopez', 1902788537)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (91, 3, CAST(0x0000A1EB00064CDE AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', 638289676)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (92, NULL, CAST(0x0000A1EC00F4292C AS DateTime), N'ModUsuarioy', N'({0}) {1}', N'ExU001;El usuario y/o password no es valido.', 453811941)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (93, 3, CAST(0x0000A1EC00F437B2 AS DateTime), N'Login5', N'Logueo exitoso ({0})', N'jperez', -499966969)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (94, 3, CAST(0x0000A1EC00F45694 AS DateTime), N'Login', N'Logout exitoso ({0})', N'jperez', -1213245774)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (95, 2, CAST(0x0000A1EC00F5A1C4 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', 418331479)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (96, 2, CAST(0x0000A1EC00FDEBE4 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', -1672660137)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (97, 2, CAST(0x0000A1EC00FE6327 AS DateTime), N'Login', N'Logout exitoso ({0})', N'hernan', 348195558)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (98, 4, CAST(0x0000A1EC010E5345 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'plopezA', -678755881)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (99, 3, CAST(0x0000A1EC011544F1 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', 378079005)
GO
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (100, 3, CAST(0x0000A1EC01160ABE AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', 577632029)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (101, 3, CAST(0x0000A1EC01165F26 AS DateTime), N'Loginy', N'Logueo exitoso ({0})', N'jperez', -994439143)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (102, 2, CAST(0x0000A1EC011926D6 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'hernan', -794944695)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (103, 2, CAST(0x0000A1EC01192CDB AS DateTime), N'Login', N'Logout exitoso ({0})', N'hernan', 1614727928)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (104, 3, CAST(0x0000A1EC011936A4 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', -777234659)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (105, 3, CAST(0x0000A1EC0119474D AS DateTime), N'Login', N'Logout exitoso ({0})', N'jperez', 1722992300)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (106, 3, CAST(0x0000A1EC01197A70 AS DateTime), N'Login', N'Logueo exitoso ({0})', N'jperez', -715057379)
INSERT [dbo].[BITACORA] ([bitID], [bitIDUSUARIO], [bitFECHA], [bitMODULO], [bitDESCRIPCION], [bitARGUMENTOS], [DVH]) VALUES (107, 3, CAST(0x0000A1EC0119820B AS DateTime), N'Login', N'Logout exitoso ({0})', N'jperez', 1793500844)
SET IDENTITY_INSERT [dbo].[BITACORA] OFF
SET IDENTITY_INSERT [dbo].[MODULO] ON 

INSERT [dbo].[MODULO] ([modID], [modCODIGO], [modNOMBRE], [modIDPADRE]) VALUES (1, N'Site.Master', N'Site Master', NULL)
INSERT [dbo].[MODULO] ([modID], [modCODIGO], [modNOMBRE], [modIDPADRE]) VALUES (3, N'usuarios.aspx', N'Usuarios', NULL)
INSERT [dbo].[MODULO] ([modID], [modCODIGO], [modNOMBRE], [modIDPADRE]) VALUES (4, N'bitacora.aspx', N'Bitacora', NULL)
INSERT [dbo].[MODULO] ([modID], [modCODIGO], [modNOMBRE], [modIDPADRE]) VALUES (5, N'backuprestore.aspx', N'BackupRestore', NULL)
INSERT [dbo].[MODULO] ([modID], [modCODIGO], [modNOMBRE], [modIDPADRE]) VALUES (6, N'admproductos.aspx', N'Administracion de Productos', NULL)
INSERT [dbo].[MODULO] ([modID], [modCODIGO], [modNOMBRE], [modIDPADRE]) VALUES (7, N'permisos.aspx', N'Permisos', NULL)
INSERT [dbo].[MODULO] ([modID], [modCODIGO], [modNOMBRE], [modIDPADRE]) VALUES (8, N'digitoverificador.aspx', N'Digito Verificador', NULL)
SET IDENTITY_INSERT [dbo].[MODULO] OFF
SET IDENTITY_INSERT [dbo].[MODULO_ACCION] ON 

INSERT [dbo].[MODULO_ACCION] ([maID], [maIDMODULO], [maACCION]) VALUES (0, NULL, NULL)
INSERT [dbo].[MODULO_ACCION] ([maID], [maIDMODULO], [maACCION]) VALUES (2, 1, N'lnkUsuarios')
INSERT [dbo].[MODULO_ACCION] ([maID], [maIDMODULO], [maACCION]) VALUES (3, 1, N'lnkProductos')
INSERT [dbo].[MODULO_ACCION] ([maID], [maIDMODULO], [maACCION]) VALUES (4, 1, N'lnkBitacora')
INSERT [dbo].[MODULO_ACCION] ([maID], [maIDMODULO], [maACCION]) VALUES (5, 1, N'lnkBackUp')
INSERT [dbo].[MODULO_ACCION] ([maID], [maIDMODULO], [maACCION]) VALUES (6, 1, N'lnkPermisos')
INSERT [dbo].[MODULO_ACCION] ([maID], [maIDMODULO], [maACCION]) VALUES (7, 1, N'lnkDigitoVerificador')
SET IDENTITY_INSERT [dbo].[MODULO_ACCION] OFF
SET IDENTITY_INSERT [dbo].[PERFIL] ON 

INSERT [dbo].[PERFIL] ([perID], [perNOMBRE], [perFECHAALTA], [perFECHABAJA], [DVH]) VALUES (1, N'Administrador', CAST(0x0000A04901401D23 AS DateTime), NULL, 414012347)
INSERT [dbo].[PERFIL] ([perID], [perNOMBRE], [perFECHAALTA], [perFECHABAJA], [DVH]) VALUES (2, N'WebMaster', CAST(0x0000A0CE00D3A38B AS DateTime), NULL, -997345127)
INSERT [dbo].[PERFIL] ([perID], [perNOMBRE], [perFECHAALTA], [perFECHABAJA], [DVH]) VALUES (3, N'Cliente', CAST(0x0000A1E701880CD7 AS DateTime), NULL, -934540870)
SET IDENTITY_INSERT [dbo].[PERFIL] OFF
SET IDENTITY_INSERT [dbo].[PERMISO] ON 

INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (63, 1, 1, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (67, 2, 1, 4, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (71, 2, 1, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (72, 2, 1, 2, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (73, 2, 3, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (74, 2, 4, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (75, 1, 4, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (76, 1, 5, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (77, 2, 5, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (80, 1, 6, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (81, 2, 6, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (82, 3, 1, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (83, 3, 3, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (84, 3, 4, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (85, 3, 5, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (86, 3, 6, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (89, 2, 1, 5, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (90, 1, 1, 3, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (92, 2, 1, 6, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (93, 2, 7, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (94, 1, 7, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (95, 3, 7, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (96, 1, 8, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (97, 3, 8, NULL, 0)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (98, 2, 8, NULL, 1)
INSERT [dbo].[PERMISO] ([pmID], [pmIDPERFIL], [pmIDMODULO], [pmIDMODULOACCION], [pmPERMITIDO]) VALUES (99, 2, 1, 7, 1)
SET IDENTITY_INSERT [dbo].[PERMISO] OFF
SET IDENTITY_INSERT [dbo].[PRODUCTOS] ON 

INSERT [dbo].[PRODUCTOS] ([proID], [proNombre], [proPrecioUnit], [proStock], [proEstado], [proFoto], [FECHA_INSERT], [DVH]) VALUES (1, N'Zapatilla 1', 250.0000, 10, 1, N'/images/productos/zapa1.jpg', CAST(0x0000A1EA0159ECAA AS DateTime), -1786386853)
INSERT [dbo].[PRODUCTOS] ([proID], [proNombre], [proPrecioUnit], [proStock], [proEstado], [proFoto], [FECHA_INSERT], [DVH]) VALUES (2, N'Zapatilla 2', 320.0000, 22, 1, N'/images/productos/zapa2.jpg', CAST(0x0000A1EA0159FDE0 AS DateTime), 1680094983)
INSERT [dbo].[PRODUCTOS] ([proID], [proNombre], [proPrecioUnit], [proStock], [proEstado], [proFoto], [FECHA_INSERT], [DVH]) VALUES (3, N'Zapatilla 3', 440.0000, 56, 1, N'/images/productos/zapa3.jpg', CAST(0x0000A1EA015A257E AS DateTime), -1817899030)
SET IDENTITY_INSERT [dbo].[PRODUCTOS] OFF
INSERT [dbo].[TABLAS_DVV] ([TABLA], [DVV], [CAMPOS], [CAMPOID]) VALUES (N'USUARIO', -1205639566, N'usuNOMBRE, usuAPELLIDO, usuEMAIL, usuNICK, usuCLAVE, usuIDPERFIL, usuFECHABAJA', N'usuID')
INSERT [dbo].[TABLAS_DVV] ([TABLA], [DVV], [CAMPOS], [CAMPOID]) VALUES (N'BITACORA', -271513796, N'bitIDUSUARIO, bitFECHA, bitMODULO, bitDESCRIPCION, bitARGUMENTOS', N'bitID')
INSERT [dbo].[TABLAS_DVV] ([TABLA], [DVV], [CAMPOS], [CAMPOID]) VALUES (N'BACKUP', NULL, N'bkIDUSUARIO, bkFECHA, bkRUTA, bkESTADO', N'bkID')
INSERT [dbo].[TABLAS_DVV] ([TABLA], [DVV], [CAMPOS], [CAMPOID]) VALUES (N'RESTORE', NULL, N'rtIDUSUARIO, rtFECHA, rtRUTA, rtESTADO', N'rtID')
INSERT [dbo].[TABLAS_DVV] ([TABLA], [DVV], [CAMPOS], [CAMPOID]) VALUES (N'PRODUCTOS', 1644486326, N'proNombre, proPrecioUnit, proStock, proEstado, proFoto, FECHA_INSERT', N'proID')
INSERT [dbo].[TABLAS_DVV] ([TABLA], [DVV], [CAMPOS], [CAMPOID]) VALUES (N'PERFIL', 342680216, N'perNOMBRE, perFECHAALTA, perFECHABAJA', N'perID')
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([usuID], [usuNOMBRE], [usuAPELLIDO], [usuEMAIL], [usuNICK], [usuCLAVE], [usuIDPERFIL], [usuFECHAALTA], [usuFECHABAJA], [DVH]) VALUES (2, N'Hernan', N'Hegykozi', N'hernan@hegykozi.com.ar', N'hernan', N'123456', 1, CAST(0x0000A0CF01759F7F AS DateTime), NULL, -986612804)
INSERT [dbo].[USUARIO] ([usuID], [usuNOMBRE], [usuAPELLIDO], [usuEMAIL], [usuNICK], [usuCLAVE], [usuIDPERFIL], [usuFECHAALTA], [usuFECHABAJA], [DVH]) VALUES (3, N'Juan', N'Perez', N'jperez@hotmail.com', N'jperez', N'123456', 2, CAST(0x0000A0D00000A1E0 AS DateTime), NULL, -304895024)
INSERT [dbo].[USUARIO] ([usuID], [usuNOMBRE], [usuAPELLIDO], [usuEMAIL], [usuNICK], [usuCLAVE], [usuIDPERFIL], [usuFECHAALTA], [usuFECHABAJA], [DVH]) VALUES (4, N'Pablo', N'Lopez', N'plopez@gmail.com', N'plopez', N'123456', 3, CAST(0x0000A1E7018831F4 AS DateTime), NULL, -1866353122)
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
ALTER TABLE [dbo].[BACKUP] ADD  CONSTRAINT [DF_BACKUP_bkFECHA]  DEFAULT (getdate()) FOR [bkFECHA]
GO
ALTER TABLE [dbo].[BACKUP] ADD  CONSTRAINT [DF_BACKUP_bkESTADO]  DEFAULT ((0)) FOR [bkESTADO]
GO
ALTER TABLE [dbo].[BITACORA] ADD  CONSTRAINT [DF_BITACORA_bitFECHA]  DEFAULT (getdate()) FOR [bitFECHA]
GO
ALTER TABLE [dbo].[PERFIL] ADD  CONSTRAINT [DF_PERFIL_perFECHAALTA]  DEFAULT (getdate()) FOR [perFECHAALTA]
GO
ALTER TABLE [dbo].[PERMISO] ADD  CONSTRAINT [DF_PERMISO_pmPERMITIDO]  DEFAULT ((0)) FOR [pmPERMITIDO]
GO
ALTER TABLE [dbo].[PRODUCTOS] ADD  CONSTRAINT [DF_PRODUCTOS_proStock]  DEFAULT ((0)) FOR [proStock]
GO
ALTER TABLE [dbo].[PRODUCTOS] ADD  CONSTRAINT [DF_PRODUCTOS_proEstado]  DEFAULT ((1)) FOR [proEstado]
GO
ALTER TABLE [dbo].[PRODUCTOS] ADD  CONSTRAINT [DF_PRODUCTOS_FECHA_INSERT]  DEFAULT (getdate()) FOR [FECHA_INSERT]
GO
ALTER TABLE [dbo].[RESTORE] ADD  CONSTRAINT [DF_RESTORE_rtFECHA]  DEFAULT (getdate()) FOR [rtFECHA]
GO
ALTER TABLE [dbo].[RESTORE] ADD  CONSTRAINT [DF_RESTORE_rtESTADO]  DEFAULT ((0)) FOR [rtESTADO]
GO
ALTER TABLE [dbo].[USUARIO] ADD  CONSTRAINT [DF_USUARIO_usuFECHAALTA]  DEFAULT (getdate()) FOR [usuFECHAALTA]
GO
ALTER TABLE [dbo].[BACKUP]  WITH CHECK ADD  CONSTRAINT [FK_BACKUP_USUARIO] FOREIGN KEY([bkIDUSUARIO])
REFERENCES [dbo].[USUARIO] ([usuID])
GO
ALTER TABLE [dbo].[BACKUP] CHECK CONSTRAINT [FK_BACKUP_USUARIO]
GO
ALTER TABLE [dbo].[MODULO]  WITH CHECK ADD  CONSTRAINT [FK_MODULO_MODULO] FOREIGN KEY([modIDPADRE])
REFERENCES [dbo].[MODULO] ([modID])
GO
ALTER TABLE [dbo].[MODULO] CHECK CONSTRAINT [FK_MODULO_MODULO]
GO
ALTER TABLE [dbo].[MODULO_ACCION]  WITH CHECK ADD  CONSTRAINT [FK_MODULO_ACCION_MODULO] FOREIGN KEY([maIDMODULO])
REFERENCES [dbo].[MODULO] ([modID])
GO
ALTER TABLE [dbo].[MODULO_ACCION] CHECK CONSTRAINT [FK_MODULO_ACCION_MODULO]
GO
ALTER TABLE [dbo].[PERMISO]  WITH CHECK ADD  CONSTRAINT [FK_PERMISO_MODULO] FOREIGN KEY([pmIDMODULO])
REFERENCES [dbo].[MODULO] ([modID])
GO
ALTER TABLE [dbo].[PERMISO] CHECK CONSTRAINT [FK_PERMISO_MODULO]
GO
ALTER TABLE [dbo].[PERMISO]  WITH CHECK ADD  CONSTRAINT [FK_PERMISO_MODULO_ACCION] FOREIGN KEY([pmIDMODULOACCION])
REFERENCES [dbo].[MODULO_ACCION] ([maID])
GO
ALTER TABLE [dbo].[PERMISO] CHECK CONSTRAINT [FK_PERMISO_MODULO_ACCION]
GO
ALTER TABLE [dbo].[PERMISO]  WITH CHECK ADD  CONSTRAINT [FK_PERMISO_PERFIL] FOREIGN KEY([pmIDPERFIL])
REFERENCES [dbo].[PERFIL] ([perID])
GO
ALTER TABLE [dbo].[PERMISO] CHECK CONSTRAINT [FK_PERMISO_PERFIL]
GO
ALTER TABLE [dbo].[RESTORE]  WITH CHECK ADD  CONSTRAINT [FK_RESTORE_USUARIO] FOREIGN KEY([rtIDUSUARIO])
REFERENCES [dbo].[USUARIO] ([usuID])
GO
ALTER TABLE [dbo].[RESTORE] CHECK CONSTRAINT [FK_RESTORE_USUARIO]
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_PERFIL] FOREIGN KEY([usuIDPERFIL])
REFERENCES [dbo].[PERFIL] ([perID])
GO
ALTER TABLE [dbo].[USUARIO] CHECK CONSTRAINT [FK_USUARIO_PERFIL]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del backup.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del usuario.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkIDUSUARIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de realizacion del backup' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkFECHA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ruta del archivo generado.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkRUTA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado de finalización del backup.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BACKUP', @level2type=N'COLUMN',@level2name=N'bkESTADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador de la bitácora.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del usuario.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitIDUSUARIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que se generó la bitácora.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitFECHA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador de la acción del módulo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitMODULO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrición de la bitácora.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BITACORA', @level2type=N'COLUMN',@level2name=N'bitDESCRIPCION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del Módulo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO', @level2type=N'COLUMN',@level2name=N'modID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de identificacion del módulo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO', @level2type=N'COLUMN',@level2name=N'modCODIGO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del módulo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO', @level2type=N'COLUMN',@level2name=N'modNOMBRE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del módulo padre.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO', @level2type=N'COLUMN',@level2name=N'modIDPADRE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador de la acción por módulo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO_ACCION', @level2type=N'COLUMN',@level2name=N'maID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del módulo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO_ACCION', @level2type=N'COLUMN',@level2name=N'maIDMODULO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Desripción de la acción.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MODULO_ACCION', @level2type=N'COLUMN',@level2name=N'maACCION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del perfil.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERFIL', @level2type=N'COLUMN',@level2name=N'perID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del perfil.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERFIL', @level2type=N'COLUMN',@level2name=N'perNOMBRE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de creación del perfil.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERFIL', @level2type=N'COLUMN',@level2name=N'perFECHAALTA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de baja del perfil.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERFIL', @level2type=N'COLUMN',@level2name=N'perFECHABAJA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del permiso.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERMISO', @level2type=N'COLUMN',@level2name=N'pmID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del perfil.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERMISO', @level2type=N'COLUMN',@level2name=N'pmIDPERFIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador de la acción del módulo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERMISO', @level2type=N'COLUMN',@level2name=N'pmIDMODULOACCION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicador de permiso permitido.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PERMISO', @level2type=N'COLUMN',@level2name=N'pmPERMITIDO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del restore.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del usuario.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtIDUSUARIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de realizacion del restore.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtFECHA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ruta del archivo restaurado.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtRUTA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado de finalización del restore.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RESTORE', @level2type=N'COLUMN',@level2name=N'rtESTADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del usuario.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USUARIO', @level2type=N'COLUMN',@level2name=N'usuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuario de inicio de sesión.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USUARIO', @level2type=N'COLUMN',@level2name=N'usuNICK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contraseña del Usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USUARIO', @level2type=N'COLUMN',@level2name=N'usuCLAVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código identificador del perfil.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USUARIO', @level2type=N'COLUMN',@level2name=N'usuIDPERFIL'
GO
USE [master]
GO
ALTER DATABASE [GastaSuela] SET  READ_WRITE 
GO
