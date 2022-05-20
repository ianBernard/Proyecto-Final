USE [master]
GO
/****** Object:  Database [SlimFit]    Script Date: 20/5/2022 11:13:30 ******/
CREATE DATABASE [SlimFit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SlimFit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SlimFit.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SlimFit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SlimFit_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SlimFit] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SlimFit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SlimFit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SlimFit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SlimFit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SlimFit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SlimFit] SET ARITHABORT OFF 
GO
ALTER DATABASE [SlimFit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SlimFit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SlimFit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SlimFit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SlimFit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SlimFit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SlimFit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SlimFit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SlimFit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SlimFit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SlimFit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SlimFit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SlimFit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SlimFit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SlimFit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SlimFit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SlimFit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SlimFit] SET RECOVERY FULL 
GO
ALTER DATABASE [SlimFit] SET  MULTI_USER 
GO
ALTER DATABASE [SlimFit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SlimFit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SlimFit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SlimFit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SlimFit] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SlimFit', N'ON'
GO
ALTER DATABASE [SlimFit] SET QUERY_STORE = OFF
GO
USE [SlimFit]
GO
/****** Object:  User [alumno]    Script Date: 20/5/2022 11:13:30 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ComentarioReceta]    Script Date: 20/5/2022 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComentarioReceta](
	[IdComentario] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Comentario] [text] NOT NULL,
	[Upvotes] [int] NOT NULL,
	[Downvotes] [int] NOT NULL,
 CONSTRAINT [PK_ComentarioReceta] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComentarioRutina]    Script Date: 20/5/2022 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComentarioRutina](
	[IdComentario] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Comentario] [text] NOT NULL,
	[Upvotes] [int] NOT NULL,
	[Downvotes] [int] NOT NULL,
 CONSTRAINT [PK_ComentarioRutina] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recetas]    Script Date: 20/5/2022 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recetas](
	[IdRutina] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Upvotes] [int] NOT NULL,
	[Downvotes] [int] NOT NULL,
	[Imagen] [text] NULL,
	[Color] [varchar](6) NULL,
	[Comentario] [text] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Dificultad] [nchar](10) NOT NULL,
	[CantidadCalorias] [int] NOT NULL,
	[Pasos] [text] NOT NULL,
	[Visitas] [int] NOT NULL,
 CONSTRAINT [PK_Rutinas] PRIMARY KEY CLUSTERED 
(
	[IdRutina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecetaXComentario]    Script Date: 20/5/2022 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetaXComentario](
	[IdRutinaxComentario] [int] IDENTITY(1,1) NOT NULL,
	[IdRutina] [int] NOT NULL,
	[IdComentario] [int] NOT NULL,
 CONSTRAINT [PK_RutinaXComentario] PRIMARY KEY CLUSTERED 
(
	[IdRutinaxComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rutinas]    Script Date: 20/5/2022 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutinas](
	[IdRutina] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Upvotes] [int] NOT NULL,
	[Downvotes] [int] NOT NULL,
	[Imagen] [text] NULL,
	[Color] [varchar](6) NULL,
	[Comentario] [text] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Musculos] [varchar](50) NOT NULL,
	[Repeticiones] [int] NOT NULL,
	[Pasos] [text] NOT NULL,
	[Visitas] [int] NOT NULL,
 CONSTRAINT [PK_Rutinas_1] PRIMARY KEY CLUSTERED 
(
	[IdRutina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RutinaXComentario]    Script Date: 20/5/2022 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RutinaXComentario](
	[IdRutinaXComentario] [int] IDENTITY(1,1) NOT NULL,
	[IdRutina] [int] NOT NULL,
	[IdComentario] [int] NOT NULL,
 CONSTRAINT [PK_RutinaXComentario_1] PRIMARY KEY CLUSTERED 
(
	[IdRutinaXComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 20/5/2022 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Password] [text] NOT NULL,
	[EMail] [text] NOT NULL,
	[Monedas] [int] NOT NULL,
	[FotoAnimada] [binary](1) NOT NULL,
	[TipoDetalleFoto] [binary](2) NOT NULL,
	[TipoColorNombre] [binary](2) NOT NULL,
	[InagenPerfil] [text] NULL,
	[ImagenBanner] [text] NULL,
	[ColorNombre] [varchar](6) NULL,
	[ColorDetalleFoto] [varchar](6) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComentarioReceta]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioReceta_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[ComentarioReceta] CHECK CONSTRAINT [FK_ComentarioReceta_Usuarios]
GO
ALTER TABLE [dbo].[ComentarioRutina]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioRutina_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[ComentarioRutina] CHECK CONSTRAINT [FK_ComentarioRutina_Usuarios]
GO
ALTER TABLE [dbo].[Recetas]  WITH CHECK ADD  CONSTRAINT [FK_Recetas_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Recetas] CHECK CONSTRAINT [FK_Recetas_Usuarios]
GO
ALTER TABLE [dbo].[RecetaXComentario]  WITH CHECK ADD  CONSTRAINT [FK_RecetaXComentario_ComentarioReceta] FOREIGN KEY([IdComentario])
REFERENCES [dbo].[ComentarioReceta] ([IdComentario])
GO
ALTER TABLE [dbo].[RecetaXComentario] CHECK CONSTRAINT [FK_RecetaXComentario_ComentarioReceta]
GO
ALTER TABLE [dbo].[RecetaXComentario]  WITH CHECK ADD  CONSTRAINT [FK_RecetaXComentario_Recetas] FOREIGN KEY([IdRutina])
REFERENCES [dbo].[Recetas] ([IdRutina])
GO
ALTER TABLE [dbo].[RecetaXComentario] CHECK CONSTRAINT [FK_RecetaXComentario_Recetas]
GO
ALTER TABLE [dbo].[Rutinas]  WITH CHECK ADD  CONSTRAINT [FK_Rutinas_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Rutinas] CHECK CONSTRAINT [FK_Rutinas_Usuarios]
GO
ALTER TABLE [dbo].[RutinaXComentario]  WITH CHECK ADD  CONSTRAINT [FK_RutinaXComentario_ComentarioRutina] FOREIGN KEY([IdRutinaXComentario])
REFERENCES [dbo].[ComentarioRutina] ([IdComentario])
GO
ALTER TABLE [dbo].[RutinaXComentario] CHECK CONSTRAINT [FK_RutinaXComentario_ComentarioRutina]
GO
ALTER TABLE [dbo].[RutinaXComentario]  WITH CHECK ADD  CONSTRAINT [FK_RutinaXComentario_Rutinas] FOREIGN KEY([IdRutina])
REFERENCES [dbo].[Rutinas] ([IdRutina])
GO
ALTER TABLE [dbo].[RutinaXComentario] CHECK CONSTRAINT [FK_RutinaXComentario_Rutinas]
GO
USE [master]
GO
ALTER DATABASE [SlimFit] SET  READ_WRITE 
GO
