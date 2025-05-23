USE [FARMACLICK]
GO
/****** Object:  Table [dbo].[Doctores]    Script Date: 30/4/2025 10:08:37 ******/
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
/****** Object:  Table [dbo].[Farmacias]    Script Date: 30/4/2025 10:08:37 ******/
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
/****** Object:  Table [dbo].[NotificacionesDoctores]    Script Date: 30/4/2025 10:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificacionesDoctores](
	[IdNotificacion] [int] IDENTITY(1,1) NOT NULL,
	[IdDoctor] [int] NOT NULL,
	[Contenido] [varchar](150) NOT NULL,
	[IdPaciente] [int] NULL,
 CONSTRAINT [PK_NotificacionesDoctores] PRIMARY KEY CLUSTERED 
(
	[IdNotificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificacionesFarmacias]    Script Date: 30/4/2025 10:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificacionesFarmacias](
	[IdNotificacion] [int] IDENTITY(1,1) NOT NULL,
	[IdFarmacia] [int] NOT NULL,
	[Contenido] [varchar](150) NOT NULL,
	[IdPaciente] [int] NULL,
 CONSTRAINT [PK_NotificacionesFarmacias] PRIMARY KEY CLUSTERED 
(
	[IdNotificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificacionesPacientes]    Script Date: 30/4/2025 10:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificacionesPacientes](
	[IdNotificacion] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[Contenido] [varchar](150) NOT NULL,
	[IdDoctor] [int] NULL,
 CONSTRAINT [PK_NotificacionesPacientes] PRIMARY KEY CLUSTERED 
(
	[IdNotificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 30/4/2025 10:08:37 ******/
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
/****** Object:  Table [dbo].[PacientesDoctor]    Script Date: 30/4/2025 10:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PacientesDoctor](
	[IdPaciente] [int] NOT NULL,
	[IdDoctor] [int] NOT NULL,
	[IdPacienteDoctor] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PacientesDoctor] PRIMARY KEY CLUSTERED 
(
	[IdPacienteDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 30/4/2025 10:08:37 ******/
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
/****** Object:  Table [dbo].[Productos]    Script Date: 30/4/2025 10:08:37 ******/
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
/****** Object:  Table [dbo].[Recetas]    Script Date: 30/4/2025 10:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recetas](
	[IdPaciente] [int] NOT NULL,
	[IdDoctor] [int] NOT NULL,
	[IdReceta] [int] IDENTITY(1,1) NOT NULL,
	[Contenido] [varchar](500) NOT NULL,
	[Fecha] [varchar](50) NOT NULL,
	[Producto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Recetas_1] PRIMARY KEY CLUSTERED 
(
	[IdReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doctores] ON 

INSERT [dbo].[Doctores] ([Nombre], [Apellido], [DNI], [Matricula], [Email], [Telefono], [IdDoctor], [Contraseña]) VALUES (N'Pepe', N'Gomez', N'12345678', N'dfhsdkjfhds', N'pepe@gmail.com', N'124524533', 1, N'Doctor1212!')
SET IDENTITY_INSERT [dbo].[Doctores] OFF
GO
SET IDENTITY_INSERT [dbo].[Farmacias] ON 

INSERT [dbo].[Farmacias] ([Nombre], [TituloPropiedad], [Direccion], [Email], [Telefono], [IdFarmacia], [Contraseña]) VALUES (N'Farmacity', N'dfkjflksdjflksd', N'santa fe 1221', N'farmacity@gmail.com', N'123458765', 1, N'Farmacia1212!')
SET IDENTITY_INSERT [dbo].[Farmacias] OFF
GO
SET IDENTITY_INSERT [dbo].[Pacientes] ON 

INSERT [dbo].[Pacientes] ([Nombre], [Apellido], [DNI], [Email], [Telefono], [IdPaciente], [Contraseña]) VALUES (N'Juan', N'Perez', N'1242323', N'juan@gmail.com', N'1234565432', 1, N'Paciente1212!')
SET IDENTITY_INSERT [dbo].[Pacientes] OFF
GO
SET IDENTITY_INSERT [dbo].[PacientesDoctor] ON 

INSERT [dbo].[PacientesDoctor] ([IdPaciente], [IdDoctor], [IdPacienteDoctor]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[PacientesDoctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Recetas] ON 

INSERT [dbo].[Recetas] ([IdPaciente], [IdDoctor], [IdReceta], [Contenido], [Fecha], [Producto]) VALUES (1, 1, 1, N'tomar uno cada un dia', N'2025-04-25', N'Ibupirac')
SET IDENTITY_INSERT [dbo].[Recetas] OFF
GO
ALTER TABLE [dbo].[NotificacionesDoctores]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionesDoctores_Doctores] FOREIGN KEY([IdDoctor])
REFERENCES [dbo].[Doctores] ([IdDoctor])
GO
ALTER TABLE [dbo].[NotificacionesDoctores] CHECK CONSTRAINT [FK_NotificacionesDoctores_Doctores]
GO
ALTER TABLE [dbo].[NotificacionesDoctores]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionesDoctores_Pacientes] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[NotificacionesDoctores] CHECK CONSTRAINT [FK_NotificacionesDoctores_Pacientes]
GO
ALTER TABLE [dbo].[NotificacionesFarmacias]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionesFarmacias_Farmacias] FOREIGN KEY([IdFarmacia])
REFERENCES [dbo].[Farmacias] ([IdFarmacia])
GO
ALTER TABLE [dbo].[NotificacionesFarmacias] CHECK CONSTRAINT [FK_NotificacionesFarmacias_Farmacias]
GO
ALTER TABLE [dbo].[NotificacionesFarmacias]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionesFarmacias_Pacientes] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[NotificacionesFarmacias] CHECK CONSTRAINT [FK_NotificacionesFarmacias_Pacientes]
GO
ALTER TABLE [dbo].[NotificacionesPacientes]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionesPacientes_Doctores] FOREIGN KEY([IdDoctor])
REFERENCES [dbo].[Doctores] ([IdDoctor])
GO
ALTER TABLE [dbo].[NotificacionesPacientes] CHECK CONSTRAINT [FK_NotificacionesPacientes_Doctores]
GO
ALTER TABLE [dbo].[NotificacionesPacientes]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionesPacientes_Pacientes] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[NotificacionesPacientes] CHECK CONSTRAINT [FK_NotificacionesPacientes_Pacientes]
GO
ALTER TABLE [dbo].[PacientesDoctor]  WITH CHECK ADD  CONSTRAINT [FK_PacientesDoctor_Doctores] FOREIGN KEY([IdDoctor])
REFERENCES [dbo].[Doctores] ([IdDoctor])
GO
ALTER TABLE [dbo].[PacientesDoctor] CHECK CONSTRAINT [FK_PacientesDoctor_Doctores]
GO
ALTER TABLE [dbo].[PacientesDoctor]  WITH CHECK ADD  CONSTRAINT [FK_PacientesDoctor_Pacientes] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[PacientesDoctor] CHECK CONSTRAINT [FK_PacientesDoctor_Pacientes]
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
ALTER TABLE [dbo].[Recetas]  WITH CHECK ADD  CONSTRAINT [FK_Recetas_Doctores1] FOREIGN KEY([IdDoctor])
REFERENCES [dbo].[Doctores] ([IdDoctor])
GO
ALTER TABLE [dbo].[Recetas] CHECK CONSTRAINT [FK_Recetas_Doctores1]
GO
ALTER TABLE [dbo].[Recetas]  WITH CHECK ADD  CONSTRAINT [FK_Recetas_Pacientes1] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[Recetas] CHECK CONSTRAINT [FK_Recetas_Pacientes1]
GO
