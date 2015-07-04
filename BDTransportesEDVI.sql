USE [master]
GO
/****** Object:  Database [DBSoftEDVI]    Script Date: 09/07/2014 18:03:52 ******/
CREATE DATABASE [DBSoftEDVI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBSoftEDVI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DBSoftEDVI.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBSoftEDVI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DBSoftEDVI_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBSoftEDVI] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBSoftEDVI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBSoftEDVI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DBSoftEDVI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBSoftEDVI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBSoftEDVI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBSoftEDVI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBSoftEDVI] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DBSoftEDVI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET RECOVERY FULL 
GO
ALTER DATABASE [DBSoftEDVI] SET  MULTI_USER 
GO
ALTER DATABASE [DBSoftEDVI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBSoftEDVI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBSoftEDVI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBSoftEDVI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBSoftEDVI', N'ON'
GO
USE [DBSoftEDVI]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Boleta]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boleta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[NroBoleta] [nvarchar](7) NOT NULL,
	[Serie] [nvarchar](3) NOT NULL,
	[Estado] [nvarchar](1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdContrato] [int] NOT NULL,
	[Cliente_Id] [int] NULL,
	[Contrato_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Boleta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RazonSocial] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](10) NULL,
	[Direccion] [nvarchar](150) NOT NULL,
	[ruc] [nvarchar](11) NOT NULL,
 CONSTRAINT [PK_dbo.Clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contrato]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contrato](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechIniContrato] [datetime] NOT NULL,
	[FechFinContrato] [datetime] NOT NULL,
	[Direccion] [nvarchar](120) NOT NULL,
	[Estado] [nvarchar](1) NOT NULL,
	[Numero] [nvarchar](6) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[MontoXTonelada] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.Contrato] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleBoletas]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleBoletas](
	[idBoletas] [int] NOT NULL,
	[IdServicio] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Monto] [decimal](9, 2) NOT NULL,
	[PrecioUnitario] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_dbo.DetalleBoletas] PRIMARY KEY CLUSTERED 
(
	[idBoletas] ASC,
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleContrato]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleContrato](
	[rutaId] [int] NOT NULL,
	[ContratoId] [int] NOT NULL,
	[MontoXTonelada] [decimal](9, 2) NOT NULL,
	[Total] [decimal](9, 2) NOT NULL,
	[Cliente_Id] [int] NULL,
 CONSTRAINT [PK_dbo.DetalleContrato] PRIMARY KEY CLUSTERED 
(
	[rutaId] ASC,
	[ContratoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleFacturas]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFacturas](
	[IdFactura] [int] NOT NULL,
	[IdServicio] [int] NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
	[precioUnitario] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_dbo.DetalleFacturas] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC,
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleGastMant]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleGastMant](
	[IdGastosMantenimiento] [int] NOT NULL,
	[IdVehiculo] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Total] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_dbo.DetalleGastMant] PRIMARY KEY CLUSTERED 
(
	[IdGastosMantenimiento] ASC,
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalleGastosServicio]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleGastosServicio](
	[IdGastosServicio] [int] NOT NULL,
	[IdServicio] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Costo] [decimal](9, 2) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Observaciones] [nvarchar](250) NULL,
 CONSTRAINT [PK_dbo.detalleGastosServicio] PRIMARY KEY CLUSTERED 
(
	[IdGastosServicio] ASC,
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleGuiaRemision]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleGuiaRemision](
	[IdGuiaRemision] [int] NOT NULL,
	[Item] [int] NOT NULL,
	[Peso] [decimal](9, 2) NOT NULL,
	[GuiaRemitente] [nvarchar](11) NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
	[CantidadBultos] [int] NOT NULL,
	[IdContrato] [int] NOT NULL,
	[IdRuta] [int] NOT NULL,
 CONSTRAINT [PK_dbo.DetalleGuiaRemision] PRIMARY KEY CLUSTERED 
(
	[IdGuiaRemision] ASC,
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](80) NULL,
	[ApPaterno] [nvarchar](80) NULL,
	[ApMaterno] [nvarchar](80) NULL,
	[Direccion] [nvarchar](150) NULL,
	[Telefono] [nvarchar](10) NULL,
	[DNI] [nvarchar](8) NULL,
	[Categoria] [nvarchar](20) NULL,
	[Sueldo] [decimal](9, 2) NOT NULL,
	[NrCarnet] [nvarchar](7) NULL,
	[Licencia] [nvarchar](10) NULL,
	[Estado] [nvarchar](3) NULL,
	[GuiaRemisionId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Empleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[NroFactura] [nvarchar](7) NOT NULL,
	[Serie] [nvarchar](3) NOT NULL,
	[Estado] [nvarchar](3) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdContrato] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Facturas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GastosDeServicios]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GastosDeServicios](
	[Id] [int] NOT NULL,
	[Precio] [decimal](9, 2) NOT NULL,
	[Descripcion] [nvarchar](max) NULL,
	[IdGuiaRemision] [int] NOT NULL,
 CONSTRAINT [PK_dbo.GastosDeServicios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GastosMantenimento]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GastosMantenimento](
	[Id] [int] NOT NULL,
	[ConstoEngrace] [decimal](9, 2) NOT NULL,
	[CostoLubricacion] [decimal](9, 2) NOT NULL,
	[CostoNeumaticos] [decimal](9, 2) NOT NULL,
	[CostoSuspencion] [decimal](9, 2) NOT NULL,
	[CostoMotor] [decimal](9, 2) NOT NULL,
	[CostoCarreta] [decimal](9, 2) NOT NULL,
	[CostoSistemaElectrico] [decimal](9, 2) NOT NULL,
	[OtrosGastos] [decimal](9, 2) NOT NULL,
	[Total] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_dbo.GastosMantenimento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GuiaRemision]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuiaRemision](
	[Id] [int] NOT NULL,
	[NroGuias] [nvarchar](10) NOT NULL,
	[PesoTotal] [decimal](9, 2) NOT NULL,
	[Estado] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_dbo.GuiaRemision] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rutas]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
	[Distancia] [nvarchar](10) NOT NULL,
	[Origen] [nvarchar](20) NOT NULL,
	[Destino] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.Rutas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaEmision] [datetime] NOT NULL,
	[FechaTraslado] [datetime] NOT NULL,
	[Descripcion] [nvarchar](150) NULL,
	[Estado] [nvarchar](3) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdVehiculo] [int] NULL,
	[IdGuiaRemision] [int] NULL,
	[TotalGastosServicio] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_dbo.Servicio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 09/07/2014 18:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlacaVehiculo] [nvarchar](8) NOT NULL,
	[Marca] [nvarchar](100) NOT NULL,
	[PlacaCarreta] [nvarchar](8) NOT NULL,
	[Modelo] [nvarchar](100) NOT NULL,
	[CestidicadoIncripcion] [nvarchar](100) NOT NULL,
	[ConfiguracionVehicular] [nvarchar](50) NOT NULL,
	[Soat] [datetime] NOT NULL,
	[RevicionTecnica] [datetime] NOT NULL,
	[CargaBruta] [decimal](18, 2) NOT NULL,
	[Estado] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_dbo.Vehiculo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_Cliente_Id]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_Cliente_Id] ON [dbo].[Boleta]
(
	[Cliente_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Contrato_Id]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_Contrato_Id] ON [dbo].[Boleta]
(
	[Contrato_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdCliente]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdCliente] ON [dbo].[Contrato]
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_idBoletas]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_idBoletas] ON [dbo].[DetalleBoletas]
(
	[idBoletas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdServicio]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdServicio] ON [dbo].[DetalleBoletas]
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cliente_Id]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_Cliente_Id] ON [dbo].[DetalleContrato]
(
	[Cliente_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ContratoId]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_ContratoId] ON [dbo].[DetalleContrato]
(
	[ContratoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_rutaId]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_rutaId] ON [dbo].[DetalleContrato]
(
	[rutaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdFactura]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdFactura] ON [dbo].[DetalleFacturas]
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdServicio]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdServicio] ON [dbo].[DetalleFacturas]
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdGastosMantenimiento]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdGastosMantenimiento] ON [dbo].[DetalleGastMant]
(
	[IdGastosMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdVehiculo]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdVehiculo] ON [dbo].[DetalleGastMant]
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdGastosServicio]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdGastosServicio] ON [dbo].[detalleGastosServicio]
(
	[IdGastosServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdServicio]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdServicio] ON [dbo].[detalleGastosServicio]
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdGuiaRemision]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdGuiaRemision] ON [dbo].[DetalleGuiaRemision]
(
	[IdGuiaRemision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdRuta_IdContrato]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdRuta_IdContrato] ON [dbo].[DetalleGuiaRemision]
(
	[IdRuta] ASC,
	[IdContrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdCliente]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdCliente] ON [dbo].[Facturas]
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdContrato]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdContrato] ON [dbo].[Facturas]
(
	[IdContrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdGuiaRemision]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdGuiaRemision] ON [dbo].[GastosDeServicios]
(
	[IdGuiaRemision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdEmpleado]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdEmpleado] ON [dbo].[Servicio]
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdGuiaRemision]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdGuiaRemision] ON [dbo].[Servicio]
(
	[IdGuiaRemision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdVehiculo]    Script Date: 09/07/2014 18:03:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdVehiculo] ON [dbo].[Servicio]
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Boleta]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Boleta_dbo.Clientes_Cliente_Id] FOREIGN KEY([Cliente_Id])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Boleta] CHECK CONSTRAINT [FK_dbo.Boleta_dbo.Clientes_Cliente_Id]
GO
ALTER TABLE [dbo].[Boleta]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Boleta_dbo.Contrato_Contrato_Id] FOREIGN KEY([Contrato_Id])
REFERENCES [dbo].[Contrato] ([Id])
GO
ALTER TABLE [dbo].[Boleta] CHECK CONSTRAINT [FK_dbo.Boleta_dbo.Contrato_Contrato_Id]
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Contrato_dbo.Clientes_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [FK_dbo.Contrato_dbo.Clientes_IdCliente]
GO
ALTER TABLE [dbo].[DetalleBoletas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetalleBoletas_dbo.Boleta_idBoletas] FOREIGN KEY([idBoletas])
REFERENCES [dbo].[Boleta] ([Id])
GO
ALTER TABLE [dbo].[DetalleBoletas] CHECK CONSTRAINT [FK_dbo.DetalleBoletas_dbo.Boleta_idBoletas]
GO
ALTER TABLE [dbo].[DetalleBoletas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetalleBoletas_dbo.Servicio_IdServicio] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicio] ([Id])
GO
ALTER TABLE [dbo].[DetalleBoletas] CHECK CONSTRAINT [FK_dbo.DetalleBoletas_dbo.Servicio_IdServicio]
GO
ALTER TABLE [dbo].[DetalleContrato]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetalleContrato_dbo.Clientes_Cliente_Id] FOREIGN KEY([Cliente_Id])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[DetalleContrato] CHECK CONSTRAINT [FK_dbo.DetalleContrato_dbo.Clientes_Cliente_Id]
GO
ALTER TABLE [dbo].[DetalleContrato]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetalleContrato_dbo.Contrato_ContratoId] FOREIGN KEY([ContratoId])
REFERENCES [dbo].[Contrato] ([Id])
GO
ALTER TABLE [dbo].[DetalleContrato] CHECK CONSTRAINT [FK_dbo.DetalleContrato_dbo.Contrato_ContratoId]
GO
ALTER TABLE [dbo].[DetalleContrato]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetalleContrato_dbo.Rutas_rutaId] FOREIGN KEY([rutaId])
REFERENCES [dbo].[Rutas] ([Id])
GO
ALTER TABLE [dbo].[DetalleContrato] CHECK CONSTRAINT [FK_dbo.DetalleContrato_dbo.Rutas_rutaId]
GO
ALTER TABLE [dbo].[DetalleFacturas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetalleFacturas_dbo.Facturas_IdFactura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Facturas] ([Id])
GO
ALTER TABLE [dbo].[DetalleFacturas] CHECK CONSTRAINT [FK_dbo.DetalleFacturas_dbo.Facturas_IdFactura]
GO
ALTER TABLE [dbo].[DetalleFacturas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetalleFacturas_dbo.Servicio_IdServicio] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicio] ([Id])
GO
ALTER TABLE [dbo].[DetalleFacturas] CHECK CONSTRAINT [FK_dbo.DetalleFacturas_dbo.Servicio_IdServicio]
GO
ALTER TABLE [dbo].[DetalleGastMant]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetalleGastMant_dbo.GastosMantenimento_IdGastosMantenimiento] FOREIGN KEY([IdGastosMantenimiento])
REFERENCES [dbo].[GastosMantenimento] ([Id])
GO
ALTER TABLE [dbo].[DetalleGastMant] CHECK CONSTRAINT [FK_dbo.DetalleGastMant_dbo.GastosMantenimento_IdGastosMantenimiento]
GO
ALTER TABLE [dbo].[DetalleGastMant]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetalleGastMant_dbo.Vehiculo_IdVehiculo] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculo] ([Id])
GO
ALTER TABLE [dbo].[DetalleGastMant] CHECK CONSTRAINT [FK_dbo.DetalleGastMant_dbo.Vehiculo_IdVehiculo]
GO
ALTER TABLE [dbo].[detalleGastosServicio]  WITH CHECK ADD  CONSTRAINT [FK_dbo.detalleGastosServicio_dbo.GastosDeServicios_IdGastosServicio] FOREIGN KEY([IdGastosServicio])
REFERENCES [dbo].[GastosDeServicios] ([Id])
GO
ALTER TABLE [dbo].[detalleGastosServicio] CHECK CONSTRAINT [FK_dbo.detalleGastosServicio_dbo.GastosDeServicios_IdGastosServicio]
GO
ALTER TABLE [dbo].[detalleGastosServicio]  WITH CHECK ADD  CONSTRAINT [FK_dbo.detalleGastosServicio_dbo.Servicio_IdServicio] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicio] ([Id])
GO
ALTER TABLE [dbo].[detalleGastosServicio] CHECK CONSTRAINT [FK_dbo.detalleGastosServicio_dbo.Servicio_IdServicio]
GO
ALTER TABLE [dbo].[DetalleGuiaRemision]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetalleGuiaRemision_dbo.DetalleContrato_IdRuta_IdContrato] FOREIGN KEY([IdRuta], [IdContrato])
REFERENCES [dbo].[DetalleContrato] ([rutaId], [ContratoId])
GO
ALTER TABLE [dbo].[DetalleGuiaRemision] CHECK CONSTRAINT [FK_dbo.DetalleGuiaRemision_dbo.DetalleContrato_IdRuta_IdContrato]
GO
ALTER TABLE [dbo].[DetalleGuiaRemision]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetalleGuiaRemision_dbo.GuiaRemision_IdGuiaRemision] FOREIGN KEY([IdGuiaRemision])
REFERENCES [dbo].[GuiaRemision] ([Id])
GO
ALTER TABLE [dbo].[DetalleGuiaRemision] CHECK CONSTRAINT [FK_dbo.DetalleGuiaRemision_dbo.GuiaRemision_IdGuiaRemision]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Facturas_dbo.Clientes_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_dbo.Facturas_dbo.Clientes_IdCliente]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Facturas_dbo.Contrato_IdContrato] FOREIGN KEY([IdContrato])
REFERENCES [dbo].[Contrato] ([Id])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_dbo.Facturas_dbo.Contrato_IdContrato]
GO
ALTER TABLE [dbo].[GastosDeServicios]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GastosDeServicios_dbo.GuiaRemision_IdGuiaRemision] FOREIGN KEY([IdGuiaRemision])
REFERENCES [dbo].[GuiaRemision] ([Id])
GO
ALTER TABLE [dbo].[GastosDeServicios] CHECK CONSTRAINT [FK_dbo.GastosDeServicios_dbo.GuiaRemision_IdGuiaRemision]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Servicio_dbo.Empleado_IdEmpleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([Id])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_dbo.Servicio_dbo.Empleado_IdEmpleado]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Servicio_dbo.GuiaRemision_IdGuiaRemision] FOREIGN KEY([IdGuiaRemision])
REFERENCES [dbo].[GuiaRemision] ([Id])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_dbo.Servicio_dbo.GuiaRemision_IdGuiaRemision]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Servicio_dbo.Vehiculo_IdVehiculo] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculo] ([Id])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_dbo.Servicio_dbo.Vehiculo_IdVehiculo]
GO
USE [master]
GO
ALTER DATABASE [DBSoftEDVI] SET  READ_WRITE 
GO
