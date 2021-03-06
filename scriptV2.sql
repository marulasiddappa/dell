USE [master]
GO
/****** Object:  Database [ECommerce]    Script Date: 9/12/2015 8:48:43 PM ******/
CREATE DATABASE [ECommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ECommerce.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ECommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ECommerce_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ECommerce] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerce] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ECommerce] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ECommerce]
GO
/****** Object:  FullTextCatalog [customerFullTextIndex]    Script Date: 9/12/2015 8:48:43 PM ******/
CREATE FULLTEXT CATALOG [customerFullTextIndex]WITH ACCENT_SENSITIVITY = OFF

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 9/12/2015 8:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[PhoneNo] [varchar](50) NULL,
	[City] [varchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerDetail]    Script Date: 9/12/2015 8:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[MetaColumnID] [int] NOT NULL,
	[FieldValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_CustomerDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MetaColumn]    Script Date: 9/12/2015 8:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetaColumn](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MetaTableID] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_MetaColumn] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MetaTable]    Script Date: 9/12/2015 8:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetaTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](80) NULL,
 CONSTRAINT [PK_MetaTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [PhoneNo], [City]) VALUES (1, N'Siddu', N'Marula', N'marulasiddappa.s@gmail.com', N'9972733775', N'Bangalore')
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [PhoneNo], [City]) VALUES (2, N'Muthu', N'Kumar', N'rmkumar74@hotmail.com', N'1234567812', N'Chennai')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[CustomerDetail] ON 

INSERT [dbo].[CustomerDetail] ([ID], [CustomerID], [MetaColumnID], [FieldValue]) VALUES (1, 1, 1, N'#647')
INSERT [dbo].[CustomerDetail] ([ID], [CustomerID], [MetaColumnID], [FieldValue]) VALUES (3, 1, 3, N'Kathriguppe')
INSERT [dbo].[CustomerDetail] ([ID], [CustomerID], [MetaColumnID], [FieldValue]) VALUES (5, 1, 4, N'Karnataka')
INSERT [dbo].[CustomerDetail] ([ID], [CustomerID], [MetaColumnID], [FieldValue]) VALUES (6, 1, 5, N'Visa')
INSERT [dbo].[CustomerDetail] ([ID], [CustomerID], [MetaColumnID], [FieldValue]) VALUES (8, 1, 6, N'123456781234563')
INSERT [dbo].[CustomerDetail] ([ID], [CustomerID], [MetaColumnID], [FieldValue]) VALUES (9, 1, 7, N'654')
INSERT [dbo].[CustomerDetail] ([ID], [CustomerID], [MetaColumnID], [FieldValue]) VALUES (10, 1, 8, N'Marulasiddappa S')
INSERT [dbo].[CustomerDetail] ([ID], [CustomerID], [MetaColumnID], [FieldValue]) VALUES (11, 2, 1, N'Ishayara')
SET IDENTITY_INSERT [dbo].[CustomerDetail] OFF
SET IDENTITY_INSERT [dbo].[MetaColumn] ON 

INSERT [dbo].[MetaColumn] ([ID], [MetaTableID], [Name]) VALUES (1, 1, N'AddressLine1')
INSERT [dbo].[MetaColumn] ([ID], [MetaTableID], [Name]) VALUES (3, 1, N'AddressLine2')
INSERT [dbo].[MetaColumn] ([ID], [MetaTableID], [Name]) VALUES (4, 1, N'State')
INSERT [dbo].[MetaColumn] ([ID], [MetaTableID], [Name]) VALUES (5, 2, N'Type')
INSERT [dbo].[MetaColumn] ([ID], [MetaTableID], [Name]) VALUES (6, 2, N'CardNumber')
INSERT [dbo].[MetaColumn] ([ID], [MetaTableID], [Name]) VALUES (7, 2, N'CVV')
INSERT [dbo].[MetaColumn] ([ID], [MetaTableID], [Name]) VALUES (8, 2, N'CardHolderName')
SET IDENTITY_INSERT [dbo].[MetaColumn] OFF
SET IDENTITY_INSERT [dbo].[MetaTable] ON 

INSERT [dbo].[MetaTable] ([ID], [Name]) VALUES (1, N'Address')
INSERT [dbo].[MetaTable] ([ID], [Name]) VALUES (2, N'PaymentMode')
SET IDENTITY_INSERT [dbo].[MetaTable] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MetaTable]    Script Date: 9/12/2015 8:48:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_MetaTable] ON [dbo].[MetaTable]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerDetail]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDetail_CustomerDetail] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[CustomerDetail] CHECK CONSTRAINT [FK_CustomerDetail_CustomerDetail]
GO
ALTER TABLE [dbo].[CustomerDetail]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDetail_MetaColumn] FOREIGN KEY([MetaColumnID])
REFERENCES [dbo].[MetaColumn] ([ID])
GO
ALTER TABLE [dbo].[CustomerDetail] CHECK CONSTRAINT [FK_CustomerDetail_MetaColumn]
GO
ALTER TABLE [dbo].[MetaColumn]  WITH CHECK ADD  CONSTRAINT [FK_MetaColumn_MetaTable] FOREIGN KEY([MetaTableID])
REFERENCES [dbo].[MetaTable] ([ID])
GO
ALTER TABLE [dbo].[MetaColumn] CHECK CONSTRAINT [FK_MetaColumn_MetaTable]
GO
USE [master]
GO
ALTER DATABASE [ECommerce] SET  READ_WRITE 
GO
