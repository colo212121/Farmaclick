USE [FARMACLICK]
GO
/****** Object:  Table [dbo].[Doctores]    Script Date: 11/4/2025 10:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctores](
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[DNI] [varchar](50) NOT NULL,
	[Matricula] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[IdDoctor] [int] IDENTITY(1,1) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Doctores] PRIMARY KEY CLUSTERED 
(
	[IdDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Farmacias]    Script Date: 11/4/2025 10:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farmacias](
	[Nombre] [varchar](50) NOT NULL,
	[TituloPropiedad] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[IdFarmacia] [int] IDENTITY(1,1) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Farmacias] PRIMARY KEY CLUSTERED 
(
	[IdFarmacia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 11/4/2025 10:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[DNI] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 11/4/2025 10:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[IdPedido] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdFarmacia] [int] NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Fecha] [date] NOT NULL,
	[NombreProducto] [varchar](50) NOT NULL,
	[NombreFarmacia] [varchar](50) NOT NULL,
	[NombrePaciente] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 11/4/2025 10:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Precio] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[IdFarmacia] [int] NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Farmacias] FOREIGN KEY([IdFarmacia])
REFERENCES [dbo].[Farmacias] ([IdFarmacia])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Farmacias]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Pacientes] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Pacientes]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Productos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Farmacias] FOREIGN KEY([IdFarmacia])
REFERENCES [dbo].[Farmacias] ([IdFarmacia])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Farmacias]
GO
