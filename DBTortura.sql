USE [master]
GO
CREATE DATABASE [DBTortura]
GO
USE [DBTortura]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/05/2014 17:05:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[correoElectronico] [varchar](50) NOT NULL,
	[telefono] [varchar](15) NOT NULL,
	[fechaNacimiento] [datetime] NOT NULL,
	[tipo] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lugar]    Script Date: 11/05/2014 17:05:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lugar]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lugar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](200) NOT NULL,
	[telefono] [varchar](15) NOT NULL,
	[ciudad] [varchar](20) NOT NULL,
	[estado] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Lugar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 11/05/2014 17:05:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Evento]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Evento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fechaHora] [datetime] NOT NULL,
	[idLugar] [int] NOT NULL,
	[imagen] [varchar](100) NOT NULL,
	[edadMinima] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[patrocinadores] [varchar](300) NOT NULL,
	[tipo] [int] NOT NULL,
 CONSTRAINT [PK_Evento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Seccion]    Script Date: 11/05/2014 17:05:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Seccion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Seccion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio] [decimal](4, 0) NOT NULL,
	[capacidad] [int] NOT NULL,
	[idEvento] [int] NOT NULL,
	[clave] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Seccion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Boleto]    Script Date: 11/05/2014 17:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Boleto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Boleto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[folio] [varchar](10) NOT NULL,
	[nombreAsistente] [varchar](100) NOT NULL,
	[fechaVenta] [datetime] NOT NULL,
	[idSeccion] [int] NOT NULL,
 CONSTRAINT [PK_Boleto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Boleto_Seccion]    Script Date: 11/05/2014 17:05:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Seccion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Seccion] FOREIGN KEY([idSeccion])
REFERENCES [dbo].[Seccion] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Seccion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Seccion]
GO
/****** Object:  ForeignKey [FK_Evento_Lugar]    Script Date: 11/05/2014 17:05:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Evento_Lugar]') AND parent_object_id = OBJECT_ID(N'[dbo].[Evento]'))
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Lugar] FOREIGN KEY([idLugar])
REFERENCES [dbo].[Lugar] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Evento_Lugar]') AND parent_object_id = OBJECT_ID(N'[dbo].[Evento]'))
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Lugar]
GO
/****** Object:  ForeignKey [FK_Evento_Usuario]    Script Date: 11/05/2014 17:05:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Evento_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Evento]'))
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Evento_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Evento]'))
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Usuario]
GO
/****** Object:  ForeignKey [FK_Seccion_Evento]    Script Date: 11/05/2014 17:05:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Seccion_Evento]') AND parent_object_id = OBJECT_ID(N'[dbo].[Seccion]'))
ALTER TABLE [dbo].[Seccion]  WITH CHECK ADD  CONSTRAINT [FK_Seccion_Evento] FOREIGN KEY([idEvento])
REFERENCES [dbo].[Evento] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Seccion_Evento]') AND parent_object_id = OBJECT_ID(N'[dbo].[Seccion]'))
ALTER TABLE [dbo].[Seccion] CHECK CONSTRAINT [FK_Seccion_Evento]
GO
