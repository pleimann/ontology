USE [master]
GO
/****** Object:  Database [at21-ontology]    Script Date: 12/18/2016 12:37:22 PM ******/
CREATE DATABASE [at21-ontology]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'at21-ontology', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\at21-ontology.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'at21-ontology_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\at21-ontology_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [at21-ontology] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [at21-ontology].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [at21-ontology] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [at21-ontology] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [at21-ontology] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [at21-ontology] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [at21-ontology] SET ARITHABORT OFF 
GO
ALTER DATABASE [at21-ontology] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [at21-ontology] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [at21-ontology] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [at21-ontology] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [at21-ontology] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [at21-ontology] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [at21-ontology] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [at21-ontology] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [at21-ontology] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [at21-ontology] SET  DISABLE_BROKER 
GO
ALTER DATABASE [at21-ontology] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [at21-ontology] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [at21-ontology] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [at21-ontology] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [at21-ontology] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [at21-ontology] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [at21-ontology] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [at21-ontology] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [at21-ontology] SET  MULTI_USER 
GO
ALTER DATABASE [at21-ontology] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [at21-ontology] SET DB_CHAINING OFF 
GO
ALTER DATABASE [at21-ontology] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [at21-ontology] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [at21-ontology] SET DELAYED_DURABILITY = DISABLED 
GO
USE [at21-ontology]
GO
/****** Object:  User [at21-user]    Script Date: 12/18/2016 12:37:22 PM ******/
CREATE USER [at21-user] FOR LOGIN [at21-user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[INSTANCES]    Script Date: 12/18/2016 12:37:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSTANCES](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_INSTANCES_ID]  DEFAULT (newid()),
	[NAME] [nvarchar](50) NOT NULL,
	[TYPE] [uniqueidentifier] NULL,
	[TRANSLATION] [nvarchar](256) NULL,
	[DESCRIPTION] [nvarchar](max) NULL,
 CONSTRAINT [PK_INSTANCES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MODEL_CLASSES]    Script Date: 12/18/2016 12:37:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MODEL_CLASSES](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_CLASSES_ID]  DEFAULT (newid()),
	[NAME] [nvarchar](50) NOT NULL,
	[SUPER] [uniqueidentifier] NULL,
	[ABSTRACT] [bit] NOT NULL,
	[DESCRIPTION] [nvarchar](max) NULL,
 CONSTRAINT [PK_CLASSES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[MODEL_CLASSES] SET (LOCK_ESCALATION = AUTO)
GO
/****** Object:  Table [dbo].[MODEL_PREDICATES]    Script Date: 12/18/2016 12:37:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MODEL_PREDICATES](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_MODEL_PREDICATES_ID]  DEFAULT (newid()),
	[NAME] [nvarchar](50) NOT NULL,
	[REVERSE] [nvarchar](50) NULL,
	[DOMAIN_TYPE] [uniqueidentifier] NULL,
	[RANGE_TYPE] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PREDICATES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RELATIONSHIPS]    Script Date: 12/18/2016 12:37:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RELATIONSHIPS](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_RELATIONSHIPS_ID]  DEFAULT (newid()),
	[DOMAIN] [uniqueidentifier] NOT NULL,
	[PREDICATE] [uniqueidentifier] NOT NULL,
	[RANGE] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RELATIONSHIPS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[INSTANCES_VIEW]    Script Date: 12/18/2016 12:37:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[INSTANCES_VIEW]
AS
SELECT        dbo.INSTANCES.ID, dbo.INSTANCES.NAME, dbo.MODEL_CLASSES.NAME AS TYPE_NAME, dbo.INSTANCES.TRANSLATION, dbo.INSTANCES.DESCRIPTION
FROM            dbo.INSTANCES LEFT OUTER JOIN
                         dbo.MODEL_CLASSES ON dbo.INSTANCES.TYPE = dbo.MODEL_CLASSES.ID

GO
/****** Object:  View [dbo].[RELATIONSHIPS_VIEW]    Script Date: 12/18/2016 12:37:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RELATIONSHIPS_VIEW]
AS
SELECT        dbo.RELATIONSHIPS.ID, INSTANCES_DOMAIN.NAME AS DOMAIN_NAME, dbo.MODEL_PREDICATES.NAME, INSTANCES_RANGE.NAME AS RANGE_NAME, 
                         dbo.MODEL_PREDICATES.REVERSE
FROM            dbo.RELATIONSHIPS INNER JOIN
                         dbo.MODEL_PREDICATES ON dbo.RELATIONSHIPS.PREDICATE = dbo.MODEL_PREDICATES.ID LEFT OUTER JOIN
                         dbo.INSTANCES AS INSTANCES_DOMAIN ON dbo.RELATIONSHIPS.DOMAIN = INSTANCES_DOMAIN.ID LEFT OUTER JOIN
                         dbo.INSTANCES AS INSTANCES_RANGE ON dbo.RELATIONSHIPS.RANGE = INSTANCES_RANGE.ID

GO
ALTER TABLE [dbo].[MODEL_CLASSES]  WITH CHECK ADD  CONSTRAINT [FK_CLASSES_SUPER] FOREIGN KEY([SUPER])
REFERENCES [dbo].[MODEL_CLASSES] ([ID])
GO
ALTER TABLE [dbo].[MODEL_CLASSES] CHECK CONSTRAINT [FK_CLASSES_SUPER]
GO
ALTER TABLE [dbo].[MODEL_PREDICATES]  WITH CHECK ADD  CONSTRAINT [FK_PREDICATES_DOMAIN] FOREIGN KEY([DOMAIN_TYPE])
REFERENCES [dbo].[MODEL_CLASSES] ([ID])
GO
ALTER TABLE [dbo].[MODEL_PREDICATES] CHECK CONSTRAINT [FK_PREDICATES_DOMAIN]
GO
ALTER TABLE [dbo].[MODEL_PREDICATES]  WITH CHECK ADD  CONSTRAINT [FK_PREDICATES_RANGE] FOREIGN KEY([RANGE_TYPE])
REFERENCES [dbo].[MODEL_CLASSES] ([ID])
GO
ALTER TABLE [dbo].[MODEL_PREDICATES] CHECK CONSTRAINT [FK_PREDICATES_RANGE]
GO
ALTER TABLE [dbo].[RELATIONSHIPS]  WITH CHECK ADD  CONSTRAINT [FK_RELATIONSHIPS_DOMAIN] FOREIGN KEY([DOMAIN])
REFERENCES [dbo].[INSTANCES] ([ID])
GO
ALTER TABLE [dbo].[RELATIONSHIPS] CHECK CONSTRAINT [FK_RELATIONSHIPS_DOMAIN]
GO
ALTER TABLE [dbo].[RELATIONSHIPS]  WITH CHECK ADD  CONSTRAINT [FK_RELATIONSHIPS_PREDICATE] FOREIGN KEY([PREDICATE])
REFERENCES [dbo].[MODEL_PREDICATES] ([ID])
GO
ALTER TABLE [dbo].[RELATIONSHIPS] CHECK CONSTRAINT [FK_RELATIONSHIPS_PREDICATE]
GO
ALTER TABLE [dbo].[RELATIONSHIPS]  WITH CHECK ADD  CONSTRAINT [FK_RELATIONSHIPS_RANGE] FOREIGN KEY([RANGE])
REFERENCES [dbo].[INSTANCES] ([ID])
GO
ALTER TABLE [dbo].[RELATIONSHIPS] CHECK CONSTRAINT [FK_RELATIONSHIPS_RANGE]
GO
USE [master]
GO
ALTER DATABASE [at21-ontology] SET  READ_WRITE 
GO