USE [master]
GO
/****** Object:  Database [Coffee2]    Script Date: 6/2/2020 5:12:36 PM ******/
CREATE DATABASE [Coffee2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Coffee2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Coffee2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Coffee2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Coffee2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Coffee2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Coffee2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Coffee2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Coffee2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Coffee2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Coffee2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Coffee2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Coffee2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Coffee2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Coffee2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Coffee2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Coffee2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Coffee2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Coffee2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Coffee2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Coffee2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Coffee2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Coffee2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Coffee2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Coffee2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Coffee2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Coffee2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Coffee2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Coffee2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Coffee2] SET RECOVERY FULL 
GO
ALTER DATABASE [Coffee2] SET  MULTI_USER 
GO
ALTER DATABASE [Coffee2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Coffee2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Coffee2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Coffee2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Coffee2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Coffee2', N'ON'
GO
ALTER DATABASE [Coffee2] SET QUERY_STORE = OFF
GO
USE [Coffee2]
GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price] [decimal](15, 0) NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [decimal](15, 0) NOT NULL,
	[BillsId] [int] NOT NULL,
	[ProductsId] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[deleted_at] [datetime] NULL,
	[deleted_by] [nvarchar](100) NULL,
	[created_at] [datetime] NULL,
	[created_by] [nvarchar](100) NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [nvarchar](100) NULL,
 CONSTRAINT [PK_BillDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[time_payment] [datetime] NULL,
	[total_money] [decimal](15, 0) NULL,
	[isDeleted] [bit] NOT NULL,
	[deleted_at] [datetime] NULL,
	[deleted_by] [nvarchar](100) NULL,
	[created_at] [datetime] NULL,
	[created_by] [nvarchar](100) NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [nvarchar](100) NULL,
	[note] [nvarchar](255) NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cataloges]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cataloges](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[deleted_at] [datetime] NULL,
	[deleted_by] [nvarchar](100) NULL,
	[created_at] [datetime] NULL,
	[created_by] [nvarchar](100) NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [nvarchar](100) NULL,
 CONSTRAINT [PK_Cataloges] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[images] [nvarchar](255) NULL,
	[price] [decimal](15, 0) NOT NULL,
	[unit] [nvarchar](100) NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[deleted_at] [datetime] NULL,
	[deleted_by] [nvarchar](100) NULL,
	[created_at] [datetime] NULL,
	[created_by] [nvarchar](100) NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [nvarchar](100) NULL,
	[CatalogesId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BillDetails] ON 

INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (123, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 33, 77, 0, NULL, NULL, CAST(N'2020-05-19T14:23:56.163' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (124, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 33, 78, 0, NULL, NULL, CAST(N'2020-05-19T14:23:56.163' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (125, CAST(59000 AS Decimal(15, 0)), 1, CAST(59000 AS Decimal(15, 0)), 34, 74, 0, NULL, NULL, CAST(N'2020-05-20T14:24:57.050' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (126, CAST(49000 AS Decimal(15, 0)), 1, CAST(49000 AS Decimal(15, 0)), 34, 76, 0, NULL, NULL, CAST(N'2020-05-20T14:24:57.050' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (127, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 34, 66, 0, NULL, NULL, CAST(N'2020-05-20T14:24:57.050' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (128, CAST(50000 AS Decimal(15, 0)), 3, CAST(150000 AS Decimal(15, 0)), 35, 52, 0, NULL, NULL, CAST(N'2020-05-22T14:25:48.150' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (129, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 35, 78, 0, NULL, NULL, CAST(N'2020-05-22T14:25:48.150' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (130, CAST(59000 AS Decimal(15, 0)), 1, CAST(59000 AS Decimal(15, 0)), 36, 74, 0, NULL, NULL, CAST(N'2020-05-23T14:26:21.120' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (131, CAST(59000 AS Decimal(15, 0)), 1, CAST(59000 AS Decimal(15, 0)), 36, 75, 0, NULL, NULL, CAST(N'2020-05-23T14:26:21.123' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (132, CAST(45000 AS Decimal(15, 0)), 2, CAST(90000 AS Decimal(15, 0)), 36, 67, 0, NULL, NULL, CAST(N'2020-05-23T14:26:21.123' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (133, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 37, 53, 0, NULL, NULL, CAST(N'2020-05-25T15:26:44.470' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (134, CAST(50000 AS Decimal(15, 0)), 1, CAST(50000 AS Decimal(15, 0)), 37, 54, 0, NULL, NULL, CAST(N'2020-05-25T15:26:44.470' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (135, CAST(50000 AS Decimal(15, 0)), 1, CAST(50000 AS Decimal(15, 0)), 37, 60, 0, NULL, NULL, CAST(N'2020-05-25T15:26:44.470' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (136, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 38, 66, 0, NULL, NULL, CAST(N'2020-05-27T15:27:54.530' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (137, CAST(59000 AS Decimal(15, 0)), 2, CAST(118000 AS Decimal(15, 0)), 38, 65, 0, NULL, NULL, CAST(N'2020-05-27T15:27:54.530' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (138, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 39, 78, 0, NULL, NULL, CAST(N'2020-05-28T15:28:27.750' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (139, CAST(29000 AS Decimal(15, 0)), 3, CAST(87000 AS Decimal(15, 0)), 39, 79, 0, NULL, NULL, CAST(N'2020-05-28T15:28:27.750' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (140, CAST(50000 AS Decimal(15, 0)), 1, CAST(50000 AS Decimal(15, 0)), 39, 52, 0, NULL, NULL, CAST(N'2020-05-29T15:28:27.750' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (141, CAST(45000 AS Decimal(15, 0)), 3, CAST(135000 AS Decimal(15, 0)), 39, 59, 0, NULL, NULL, CAST(N'2020-05-28T15:28:27.750' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (142, CAST(45000 AS Decimal(15, 0)), 2, CAST(90000 AS Decimal(15, 0)), 40, 66, 0, NULL, NULL, CAST(N'2020-05-29T15:29:59.653' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (143, CAST(45000 AS Decimal(15, 0)), 4, CAST(180000 AS Decimal(15, 0)), 40, 67, 0, NULL, NULL, CAST(N'2020-05-29T15:29:59.653' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (144, CAST(42000 AS Decimal(15, 0)), 1, CAST(42000 AS Decimal(15, 0)), 40, 64, 0, NULL, NULL, CAST(N'2020-05-29T15:29:59.653' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (145, CAST(59000 AS Decimal(15, 0)), 1, CAST(59000 AS Decimal(15, 0)), 40, 65, 0, NULL, NULL, CAST(N'2020-05-29T15:29:59.657' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (146, CAST(50000 AS Decimal(15, 0)), 5, CAST(250000 AS Decimal(15, 0)), 41, 52, 0, NULL, NULL, CAST(N'2020-05-31T15:31:03.283' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (147, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 42, 61, 0, NULL, NULL, CAST(N'2020-06-02T15:31:36.510' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (148, CAST(50000 AS Decimal(15, 0)), 1, CAST(50000 AS Decimal(15, 0)), 42, 55, 0, NULL, NULL, CAST(N'2020-06-02T15:31:36.510' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (149, CAST(50000 AS Decimal(15, 0)), 4, CAST(200000 AS Decimal(15, 0)), 42, 54, 0, NULL, NULL, CAST(N'2020-06-02T15:31:36.510' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (150, CAST(50000 AS Decimal(15, 0)), 1, CAST(50000 AS Decimal(15, 0)), 42, 60, 0, NULL, NULL, CAST(N'2020-06-02T15:31:36.510' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (151, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 42, 59, 0, NULL, NULL, CAST(N'2020-06-02T15:31:36.510' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (152, CAST(29000 AS Decimal(15, 0)), 9, CAST(261000 AS Decimal(15, 0)), 43, 77, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (153, CAST(29000 AS Decimal(15, 0)), 7, CAST(203000 AS Decimal(15, 0)), 43, 78, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (154, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 43, 79, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (155, CAST(39000 AS Decimal(15, 0)), 4, CAST(156000 AS Decimal(15, 0)), 43, 80, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (156, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 43, 81, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (157, CAST(32000 AS Decimal(15, 0)), 3, CAST(96000 AS Decimal(15, 0)), 43, 82, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (158, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 43, 84, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (159, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 43, 83, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (160, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 43, 26, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (161, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 43, 51, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (162, CAST(50000 AS Decimal(15, 0)), 2, CAST(100000 AS Decimal(15, 0)), 43, 52, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (163, CAST(45000 AS Decimal(15, 0)), 2, CAST(90000 AS Decimal(15, 0)), 43, 53, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (164, CAST(50000 AS Decimal(15, 0)), 2, CAST(100000 AS Decimal(15, 0)), 43, 54, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (165, CAST(50000 AS Decimal(15, 0)), 2, CAST(100000 AS Decimal(15, 0)), 43, 55, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (166, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 43, 61, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (167, CAST(50000 AS Decimal(15, 0)), 1, CAST(50000 AS Decimal(15, 0)), 43, 60, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (168, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 43, 59, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (169, CAST(39000 AS Decimal(15, 0)), 1, CAST(39000 AS Decimal(15, 0)), 43, 58, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (170, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 43, 57, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (171, CAST(35000 AS Decimal(15, 0)), 2, CAST(70000 AS Decimal(15, 0)), 43, 56, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (172, CAST(49000 AS Decimal(15, 0)), 3, CAST(147000 AS Decimal(15, 0)), 43, 71, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (173, CAST(59000 AS Decimal(15, 0)), 3, CAST(177000 AS Decimal(15, 0)), 43, 73, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (174, CAST(59000 AS Decimal(15, 0)), 2, CAST(118000 AS Decimal(15, 0)), 43, 72, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (175, CAST(59000 AS Decimal(15, 0)), 2, CAST(118000 AS Decimal(15, 0)), 43, 74, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (176, CAST(59000 AS Decimal(15, 0)), 3, CAST(177000 AS Decimal(15, 0)), 43, 75, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (177, CAST(49000 AS Decimal(15, 0)), 3, CAST(147000 AS Decimal(15, 0)), 43, 76, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (178, CAST(45000 AS Decimal(15, 0)), 2, CAST(90000 AS Decimal(15, 0)), 43, 67, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (179, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 43, 66, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (180, CAST(59000 AS Decimal(15, 0)), 2, CAST(118000 AS Decimal(15, 0)), 43, 65, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (181, CAST(55000 AS Decimal(15, 0)), 1, CAST(55000 AS Decimal(15, 0)), 43, 70, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (182, CAST(42000 AS Decimal(15, 0)), 2, CAST(84000 AS Decimal(15, 0)), 43, 64, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (183, CAST(45000 AS Decimal(15, 0)), 2, CAST(90000 AS Decimal(15, 0)), 43, 63, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (184, CAST(49000 AS Decimal(15, 0)), 1, CAST(49000 AS Decimal(15, 0)), 43, 69, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (185, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 43, 68, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (186, CAST(55000 AS Decimal(15, 0)), 1, CAST(55000 AS Decimal(15, 0)), 43, 62, 0, NULL, NULL, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (187, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 44, 77, 0, NULL, NULL, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (188, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 44, 78, 0, NULL, NULL, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (189, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 44, 84, 0, NULL, NULL, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (190, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 44, 79, 0, NULL, NULL, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (191, CAST(39000 AS Decimal(15, 0)), 1, CAST(39000 AS Decimal(15, 0)), 44, 80, 0, NULL, NULL, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (192, CAST(50000 AS Decimal(15, 0)), 4, CAST(200000 AS Decimal(15, 0)), 44, 52, 0, NULL, NULL, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (193, CAST(45000 AS Decimal(15, 0)), 2, CAST(90000 AS Decimal(15, 0)), 44, 59, 0, NULL, NULL, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (194, CAST(50000 AS Decimal(15, 0)), 2, CAST(100000 AS Decimal(15, 0)), 44, 54, 0, NULL, NULL, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (195, CAST(59000 AS Decimal(15, 0)), 8, CAST(472000 AS Decimal(15, 0)), 44, 74, 0, NULL, NULL, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (196, CAST(45000 AS Decimal(15, 0)), 11, CAST(495000 AS Decimal(15, 0)), 44, 66, 0, NULL, NULL, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (197, CAST(29000 AS Decimal(15, 0)), 28, CAST(812000 AS Decimal(15, 0)), 44, 57, 0, NULL, NULL, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (198, CAST(29000 AS Decimal(15, 0)), 5, CAST(145000 AS Decimal(15, 0)), 45, 84, 0, NULL, NULL, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (199, CAST(50000 AS Decimal(15, 0)), 3, CAST(150000 AS Decimal(15, 0)), 45, 52, 0, NULL, NULL, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (200, CAST(45000 AS Decimal(15, 0)), 2, CAST(90000 AS Decimal(15, 0)), 45, 53, 0, NULL, NULL, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (201, CAST(45000 AS Decimal(15, 0)), 3, CAST(135000 AS Decimal(15, 0)), 45, 59, 0, NULL, NULL, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (202, CAST(59000 AS Decimal(15, 0)), 3, CAST(177000 AS Decimal(15, 0)), 45, 74, 0, NULL, NULL, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (203, CAST(59000 AS Decimal(15, 0)), 2, CAST(118000 AS Decimal(15, 0)), 45, 75, 0, NULL, NULL, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (204, CAST(49000 AS Decimal(15, 0)), 3, CAST(147000 AS Decimal(15, 0)), 45, 76, 0, NULL, NULL, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (205, CAST(59000 AS Decimal(15, 0)), 3, CAST(177000 AS Decimal(15, 0)), 45, 65, 0, NULL, NULL, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (206, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 45, 63, 0, NULL, NULL, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (207, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 45, 68, 0, NULL, NULL, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (208, CAST(55000 AS Decimal(15, 0)), 1, CAST(55000 AS Decimal(15, 0)), 45, 62, 0, NULL, NULL, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (209, CAST(29000 AS Decimal(15, 0)), 6, CAST(174000 AS Decimal(15, 0)), 45, 78, 0, NULL, NULL, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (210, CAST(29000 AS Decimal(15, 0)), 3, CAST(87000 AS Decimal(15, 0)), 45, 79, 0, NULL, NULL, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (211, CAST(45000 AS Decimal(15, 0)), 5, CAST(225000 AS Decimal(15, 0)), 46, 66, 0, NULL, NULL, CAST(N'2019-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (212, CAST(59000 AS Decimal(15, 0)), 3, CAST(177000 AS Decimal(15, 0)), 46, 65, 0, NULL, NULL, CAST(N'2019-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (213, CAST(45000 AS Decimal(15, 0)), 3, CAST(135000 AS Decimal(15, 0)), 46, 67, 0, NULL, NULL, CAST(N'2019-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (214, CAST(50000 AS Decimal(15, 0)), 3, CAST(150000 AS Decimal(15, 0)), 46, 52, 0, NULL, NULL, CAST(N'2019-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (215, CAST(39000 AS Decimal(15, 0)), 2, CAST(78000 AS Decimal(15, 0)), 46, 58, 0, NULL, NULL, CAST(N'2019-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (216, CAST(45000 AS Decimal(15, 0)), 3, CAST(135000 AS Decimal(15, 0)), 46, 59, 0, NULL, NULL, CAST(N'2019-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (217, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 46, 79, 0, NULL, NULL, CAST(N'2019-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (218, CAST(39000 AS Decimal(15, 0)), 1, CAST(39000 AS Decimal(15, 0)), 46, 80, 0, NULL, NULL, CAST(N'2019-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (219, CAST(29000 AS Decimal(15, 0)), 6, CAST(174000 AS Decimal(15, 0)), 46, 81, 0, NULL, NULL, CAST(N'2019-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (220, CAST(32000 AS Decimal(15, 0)), 9, CAST(288000 AS Decimal(15, 0)), 46, 82, 0, NULL, NULL, CAST(N'2019-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (221, CAST(29000 AS Decimal(15, 0)), 3, CAST(87000 AS Decimal(15, 0)), 47, 84, 0, NULL, NULL, CAST(N'2019-05-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
GO
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (222, CAST(45000 AS Decimal(15, 0)), 4, CAST(180000 AS Decimal(15, 0)), 47, 66, 0, NULL, NULL, CAST(N'2019-05-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (223, CAST(59000 AS Decimal(15, 0)), 1, CAST(59000 AS Decimal(15, 0)), 47, 65, 0, NULL, NULL, CAST(N'2019-05-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (224, CAST(55000 AS Decimal(15, 0)), 1, CAST(55000 AS Decimal(15, 0)), 47, 70, 0, NULL, NULL, CAST(N'2019-05-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (225, CAST(49000 AS Decimal(15, 0)), 1, CAST(49000 AS Decimal(15, 0)), 47, 69, 0, NULL, NULL, CAST(N'2019-05-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (226, CAST(55000 AS Decimal(15, 0)), 5, CAST(275000 AS Decimal(15, 0)), 48, 70, 0, NULL, NULL, CAST(N'2019-06-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (227, CAST(45000 AS Decimal(15, 0)), 7, CAST(315000 AS Decimal(15, 0)), 48, 67, 0, NULL, NULL, CAST(N'2019-06-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (228, CAST(45000 AS Decimal(15, 0)), 7, CAST(315000 AS Decimal(15, 0)), 48, 66, 0, NULL, NULL, CAST(N'2019-06-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (229, CAST(59000 AS Decimal(15, 0)), 5, CAST(295000 AS Decimal(15, 0)), 48, 65, 0, NULL, NULL, CAST(N'2019-06-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (230, CAST(42000 AS Decimal(15, 0)), 3, CAST(126000 AS Decimal(15, 0)), 48, 64, 0, NULL, NULL, CAST(N'2019-06-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (231, CAST(49000 AS Decimal(15, 0)), 1, CAST(49000 AS Decimal(15, 0)), 48, 69, 0, NULL, NULL, CAST(N'2019-06-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (232, CAST(55000 AS Decimal(15, 0)), 3, CAST(165000 AS Decimal(15, 0)), 49, 70, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (233, CAST(49000 AS Decimal(15, 0)), 2, CAST(98000 AS Decimal(15, 0)), 49, 69, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (234, CAST(45000 AS Decimal(15, 0)), 3, CAST(135000 AS Decimal(15, 0)), 49, 63, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (235, CAST(55000 AS Decimal(15, 0)), 1, CAST(55000 AS Decimal(15, 0)), 49, 62, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (236, CAST(45000 AS Decimal(15, 0)), 3, CAST(135000 AS Decimal(15, 0)), 49, 66, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (237, CAST(45000 AS Decimal(15, 0)), 3, CAST(135000 AS Decimal(15, 0)), 49, 67, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (238, CAST(59000 AS Decimal(15, 0)), 1, CAST(59000 AS Decimal(15, 0)), 49, 65, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (239, CAST(59000 AS Decimal(15, 0)), 3, CAST(177000 AS Decimal(15, 0)), 49, 74, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (240, CAST(49000 AS Decimal(15, 0)), 1, CAST(49000 AS Decimal(15, 0)), 49, 71, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (241, CAST(59000 AS Decimal(15, 0)), 1, CAST(59000 AS Decimal(15, 0)), 49, 73, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (242, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 49, 83, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (243, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 49, 78, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (244, CAST(29000 AS Decimal(15, 0)), 3, CAST(87000 AS Decimal(15, 0)), 49, 79, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (245, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 49, 81, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (246, CAST(32000 AS Decimal(15, 0)), 2, CAST(64000 AS Decimal(15, 0)), 49, 82, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (247, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 49, 77, 0, NULL, NULL, CAST(N'2019-07-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (248, CAST(45000 AS Decimal(15, 0)), 2, CAST(90000 AS Decimal(15, 0)), 50, 66, 0, NULL, NULL, CAST(N'2020-06-02T16:14:06.190' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (249, CAST(59000 AS Decimal(15, 0)), 3, CAST(177000 AS Decimal(15, 0)), 50, 65, 0, NULL, NULL, CAST(N'2019-08-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (250, CAST(42000 AS Decimal(15, 0)), 2, CAST(84000 AS Decimal(15, 0)), 50, 64, 0, NULL, NULL, CAST(N'2019-08-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (251, CAST(55000 AS Decimal(15, 0)), 3, CAST(165000 AS Decimal(15, 0)), 50, 70, 0, NULL, NULL, CAST(N'2019-08-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (252, CAST(49000 AS Decimal(15, 0)), 1, CAST(49000 AS Decimal(15, 0)), 50, 69, 0, NULL, NULL, CAST(N'2019-08-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (253, CAST(45000 AS Decimal(15, 0)), 2, CAST(90000 AS Decimal(15, 0)), 50, 67, 0, NULL, NULL, CAST(N'2019-08-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (254, CAST(55000 AS Decimal(15, 0)), 1, CAST(55000 AS Decimal(15, 0)), 50, 62, 0, NULL, NULL, CAST(N'2019-08-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (255, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 50, 68, 0, NULL, NULL, CAST(N'2019-08-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (256, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 50, 63, 0, NULL, NULL, CAST(N'2019-08-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (257, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 50, 78, 0, NULL, NULL, CAST(N'2019-08-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (258, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 50, 79, 0, NULL, NULL, CAST(N'2019-08-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (259, CAST(39000 AS Decimal(15, 0)), 1, CAST(39000 AS Decimal(15, 0)), 50, 80, 0, NULL, NULL, CAST(N'2019-08-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (260, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 50, 81, 0, NULL, NULL, CAST(N'2019-08-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (261, CAST(32000 AS Decimal(15, 0)), 1, CAST(32000 AS Decimal(15, 0)), 50, 82, 0, NULL, NULL, CAST(N'2019-08-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (262, CAST(29000 AS Decimal(15, 0)), 3, CAST(87000 AS Decimal(15, 0)), 51, 84, 0, NULL, NULL, CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (263, CAST(50000 AS Decimal(15, 0)), 2, CAST(100000 AS Decimal(15, 0)), 51, 52, 0, NULL, NULL, CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (264, CAST(45000 AS Decimal(15, 0)), 3, CAST(135000 AS Decimal(15, 0)), 51, 59, 0, NULL, NULL, CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (265, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 51, 53, 0, NULL, NULL, CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (266, CAST(59000 AS Decimal(15, 0)), 2, CAST(118000 AS Decimal(15, 0)), 51, 74, 0, NULL, NULL, CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (267, CAST(59000 AS Decimal(15, 0)), 2, CAST(118000 AS Decimal(15, 0)), 51, 72, 0, NULL, NULL, CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (268, CAST(49000 AS Decimal(15, 0)), 1, CAST(49000 AS Decimal(15, 0)), 51, 76, 0, NULL, NULL, CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (269, CAST(49000 AS Decimal(15, 0)), 2, CAST(98000 AS Decimal(15, 0)), 51, 71, 0, NULL, NULL, CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (270, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 51, 78, 0, NULL, NULL, CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (271, CAST(59000 AS Decimal(15, 0)), 3, CAST(177000 AS Decimal(15, 0)), 51, 65, 0, NULL, NULL, CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (272, CAST(42000 AS Decimal(15, 0)), 2, CAST(84000 AS Decimal(15, 0)), 51, 64, 0, NULL, NULL, CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (273, CAST(55000 AS Decimal(15, 0)), 1, CAST(55000 AS Decimal(15, 0)), 51, 70, 0, NULL, NULL, CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (274, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 51, 66, 0, NULL, NULL, CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (275, CAST(45000 AS Decimal(15, 0)), 2, CAST(90000 AS Decimal(15, 0)), 51, 67, 0, NULL, NULL, CAST(N'2019-09-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (276, CAST(55000 AS Decimal(15, 0)), 1, CAST(55000 AS Decimal(15, 0)), 52, 70, 0, NULL, NULL, CAST(N'2019-10-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (277, CAST(42000 AS Decimal(15, 0)), 1, CAST(42000 AS Decimal(15, 0)), 52, 64, 0, NULL, NULL, CAST(N'2019-10-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (278, CAST(49000 AS Decimal(15, 0)), 1, CAST(49000 AS Decimal(15, 0)), 52, 69, 0, NULL, NULL, CAST(N'2019-10-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (279, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 53, 84, 0, NULL, NULL, CAST(N'2019-11-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (280, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 54, 84, 0, NULL, NULL, CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (281, CAST(50000 AS Decimal(15, 0)), 3, CAST(150000 AS Decimal(15, 0)), 54, 52, 0, NULL, NULL, CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (282, CAST(39000 AS Decimal(15, 0)), 1, CAST(39000 AS Decimal(15, 0)), 54, 58, 0, NULL, NULL, CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (283, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 54, 53, 0, NULL, NULL, CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (284, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 54, 59, 0, NULL, NULL, CAST(N'2019-12-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (285, CAST(35000 AS Decimal(15, 0)), 5, CAST(175000 AS Decimal(15, 0)), 55, 56, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (286, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 55, 57, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (287, CAST(29000 AS Decimal(15, 0)), 3, CAST(87000 AS Decimal(15, 0)), 55, 26, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (288, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 55, 51, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (289, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 55, 78, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (290, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 55, 77, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (291, CAST(32000 AS Decimal(15, 0)), 1, CAST(32000 AS Decimal(15, 0)), 55, 82, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (292, CAST(39000 AS Decimal(15, 0)), 2, CAST(78000 AS Decimal(15, 0)), 55, 80, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (293, CAST(59000 AS Decimal(15, 0)), 4, CAST(236000 AS Decimal(15, 0)), 55, 73, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (294, CAST(59000 AS Decimal(15, 0)), 2, CAST(118000 AS Decimal(15, 0)), 55, 74, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (295, CAST(49000 AS Decimal(15, 0)), 2, CAST(98000 AS Decimal(15, 0)), 55, 76, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (296, CAST(59000 AS Decimal(15, 0)), 3, CAST(177000 AS Decimal(15, 0)), 55, 72, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (297, CAST(59000 AS Decimal(15, 0)), 3, CAST(177000 AS Decimal(15, 0)), 55, 65, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (298, CAST(45000 AS Decimal(15, 0)), 3, CAST(135000 AS Decimal(15, 0)), 55, 68, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (299, CAST(55000 AS Decimal(15, 0)), 2, CAST(110000 AS Decimal(15, 0)), 55, 62, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (300, CAST(49000 AS Decimal(15, 0)), 2, CAST(98000 AS Decimal(15, 0)), 55, 69, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (301, CAST(55000 AS Decimal(15, 0)), 2, CAST(110000 AS Decimal(15, 0)), 55, 70, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (302, CAST(42000 AS Decimal(15, 0)), 1, CAST(42000 AS Decimal(15, 0)), 55, 64, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (303, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 55, 63, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (304, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 55, 66, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (305, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 55, 67, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (306, CAST(59000 AS Decimal(15, 0)), 1, CAST(59000 AS Decimal(15, 0)), 55, 75, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (307, CAST(49000 AS Decimal(15, 0)), 1, CAST(49000 AS Decimal(15, 0)), 55, 71, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (308, CAST(50000 AS Decimal(15, 0)), 1, CAST(50000 AS Decimal(15, 0)), 55, 52, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (309, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 55, 53, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (310, CAST(50000 AS Decimal(15, 0)), 1, CAST(50000 AS Decimal(15, 0)), 55, 55, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (311, CAST(50000 AS Decimal(15, 0)), 1, CAST(50000 AS Decimal(15, 0)), 55, 54, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (312, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 55, 84, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (313, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 55, 81, 0, NULL, NULL, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (314, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 56, 84, 0, NULL, NULL, CAST(N'2020-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (315, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 56, 83, 0, NULL, NULL, CAST(N'2020-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (316, CAST(29000 AS Decimal(15, 0)), 2, CAST(58000 AS Decimal(15, 0)), 56, 78, 0, NULL, NULL, CAST(N'2020-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (317, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 56, 79, 0, NULL, NULL, CAST(N'2020-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (318, CAST(50000 AS Decimal(15, 0)), 1, CAST(50000 AS Decimal(15, 0)), 56, 52, 0, NULL, NULL, CAST(N'2020-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (319, CAST(50000 AS Decimal(15, 0)), 1, CAST(50000 AS Decimal(15, 0)), 56, 54, 0, NULL, NULL, CAST(N'2020-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (320, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 56, 59, 0, NULL, NULL, CAST(N'2020-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (321, CAST(50000 AS Decimal(15, 0)), 1, CAST(50000 AS Decimal(15, 0)), 56, 60, 0, NULL, NULL, CAST(N'2020-02-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
GO
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (322, CAST(39000 AS Decimal(15, 0)), 1, CAST(39000 AS Decimal(15, 0)), 57, 58, 0, NULL, NULL, CAST(N'2020-03-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (323, CAST(45000 AS Decimal(15, 0)), 3, CAST(135000 AS Decimal(15, 0)), 57, 59, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (324, CAST(39000 AS Decimal(15, 0)), 1, CAST(39000 AS Decimal(15, 0)), 58, 58, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (325, CAST(29000 AS Decimal(15, 0)), 3, CAST(87000 AS Decimal(15, 0)), 58, 79, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (326, CAST(39000 AS Decimal(15, 0)), 1, CAST(39000 AS Decimal(15, 0)), 58, 80, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (327, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 58, 81, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (328, CAST(32000 AS Decimal(15, 0)), 2, CAST(64000 AS Decimal(15, 0)), 58, 82, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (329, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 58, 84, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (330, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 58, 78, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (331, CAST(29000 AS Decimal(15, 0)), 1, CAST(29000 AS Decimal(15, 0)), 58, 83, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (332, CAST(59000 AS Decimal(15, 0)), 1, CAST(59000 AS Decimal(15, 0)), 58, 72, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (333, CAST(59000 AS Decimal(15, 0)), 2, CAST(118000 AS Decimal(15, 0)), 58, 74, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (334, CAST(59000 AS Decimal(15, 0)), 1, CAST(59000 AS Decimal(15, 0)), 58, 75, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (335, CAST(49000 AS Decimal(15, 0)), 4, CAST(196000 AS Decimal(15, 0)), 58, 76, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (336, CAST(49000 AS Decimal(15, 0)), 1, CAST(49000 AS Decimal(15, 0)), 58, 71, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (337, CAST(59000 AS Decimal(15, 0)), 1, CAST(59000 AS Decimal(15, 0)), 58, 65, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (338, CAST(42000 AS Decimal(15, 0)), 1, CAST(42000 AS Decimal(15, 0)), 58, 64, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (339, CAST(45000 AS Decimal(15, 0)), 1, CAST(45000 AS Decimal(15, 0)), 58, 63, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (340, CAST(55000 AS Decimal(15, 0)), 1, CAST(55000 AS Decimal(15, 0)), 58, 70, 0, NULL, NULL, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'dan', NULL, NULL)
SET IDENTITY_INSERT [dbo].[BillDetails] OFF
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (33, CAST(N'2020-05-19T14:23:56.140' AS DateTime), CAST(58000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T14:23:56.140' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (34, CAST(N'2020-05-20T14:24:57.043' AS DateTime), CAST(153000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T14:24:57.043' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (35, CAST(N'2020-05-22T14:25:48.147' AS DateTime), CAST(179000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T14:25:48.147' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (36, CAST(N'2020-05-23T14:26:21.113' AS DateTime), CAST(208000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T14:26:21.113' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (37, CAST(N'2020-05-25T15:26:44.447' AS DateTime), CAST(145000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T15:26:44.447' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (38, CAST(N'2020-05-27T15:27:54.523' AS DateTime), CAST(163000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T15:27:54.523' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (39, CAST(N'2020-05-28T15:28:27.743' AS DateTime), CAST(301000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T15:28:27.743' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (40, CAST(N'2020-05-29T15:29:59.647' AS DateTime), CAST(371000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T15:29:59.647' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (41, CAST(N'2020-05-31T15:31:03.280' AS DateTime), CAST(250000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T15:31:03.280' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (42, CAST(N'2020-06-02T15:31:36.510' AS DateTime), CAST(390000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T15:31:36.510' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (43, CAST(N'2019-01-01T00:00:00.000' AS DateTime), CAST(3218000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T15:55:39.033' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (44, CAST(N'2019-02-01T15:58:53.790' AS DateTime), CAST(2411000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T15:58:53.790' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (45, CAST(N'2019-03-01T00:00:00.000' AS DateTime), CAST(1545000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T16:07:35.713' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (46, CAST(N'2019-04-01T00:00:00.000' AS DateTime), CAST(1459000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T16:08:48.150' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (47, CAST(N'2019-05-01T00:00:00.000' AS DateTime), CAST(430000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T16:10:13.787' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (48, CAST(N'2019-06-01T00:00:00.000' AS DateTime), CAST(1375000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T16:12:19.933' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (49, CAST(N'2019-07-01T00:00:00.000' AS DateTime), CAST(1421000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T16:13:05.897' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (50, CAST(N'2019-08-01T00:00:00.000' AS DateTime), CAST(958000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T16:14:06.187' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (51, CAST(N'2019-09-01T00:00:00.000' AS DateTime), CAST(1259000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T16:15:02.190' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (52, CAST(N'2019-10-01T00:00:00.000' AS DateTime), CAST(146000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T16:15:38.810' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (53, CAST(N'2019-11-01T00:00:00.000' AS DateTime), CAST(29000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T16:16:06.790' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (54, CAST(N'2019-12-01T00:00:00.000' AS DateTime), CAST(308000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T16:16:33.287' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (55, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(2401000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T16:17:27.343' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (56, CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(398000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T16:18:09.463' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (57, CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(174000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T16:18:46.207' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (58, CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(1027000 AS Decimal(15, 0)), 0, NULL, NULL, CAST(N'2020-06-02T16:19:25.887' AS DateTime), N'dan', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Bills] OFF
SET IDENTITY_INSERT [dbo].[Cataloges] ON 

INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (2, N'Cà Phê', 0, CAST(N'2020-05-19T16:08:46.570' AS DateTime), N'dan', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (4, N'Trà - Macchiato', 0, CAST(N'2020-05-19T16:32:07.447' AS DateTime), N'dan', NULL, NULL, CAST(N'2020-05-20T14:41:47.477' AS DateTime), N'dan')
INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (13, N'Bánh - Snack', 0, NULL, NULL, CAST(N'2020-05-20T13:46:58.673' AS DateTime), N'dan', CAST(N'2020-05-20T15:03:33.400' AS DateTime), N'dan')
INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (14, N'Đá Xay - Sinh Tố', 0, NULL, NULL, CAST(N'2020-05-20T14:56:38.040' AS DateTime), N'dan', CAST(N'2020-05-20T14:57:13.740' AS DateTime), N'dan')
INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (15, N'a12', 1, CAST(N'2020-06-01T11:56:14.250' AS DateTime), N'dan', CAST(N'2020-06-01T11:38:15.650' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (16, N'12345235', 1, CAST(N'2020-06-01T13:44:36.460' AS DateTime), N'dan', CAST(N'2020-06-01T11:38:34.127' AS DateTime), N'dan', CAST(N'2020-06-01T13:44:24.880' AS DateTime), N'dan')
INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (17, N'a111', 1, CAST(N'2020-06-01T13:44:40.743' AS DateTime), N'dan', CAST(N'2020-06-01T13:44:33.297' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (18, N'a111', 1, CAST(N'2020-06-01T13:44:58.240' AS DateTime), N'dan', CAST(N'2020-06-01T13:44:50.700' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (19, N'a111', 1, CAST(N'2020-06-01T13:45:21.633' AS DateTime), N'dan', CAST(N'2020-06-01T13:45:09.617' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (20, N'a1aa1', 1, CAST(N'2020-06-01T13:45:23.100' AS DateTime), N'dan', CAST(N'2020-06-01T13:45:13.117' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (21, N'sd f11000000000', 1, CAST(N'2020-06-01T15:12:49.497' AS DateTime), N'dan', CAST(N'2020-06-01T15:12:34.223' AS DateTime), N'dan', CAST(N'2020-06-01T15:12:46.177' AS DateTime), N'dan')
INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (22, N'shut', 1, CAST(N'2020-06-02T14:38:25.947' AS DateTime), N'dan', CAST(N'2020-06-02T14:38:15.257' AS DateTime), N'dan', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Cataloges] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (26, N'Cà phê đen', N'3fbbeb34-a3c4-4762-b601-75bd46ca2916_resize_vnesecoffee.jpg', CAST(29000 AS Decimal(15, 0)), N'ly', 0, CAST(N'2020-05-18T14:29:13.883' AS DateTime), N'dan', CAST(N'2020-05-18T10:12:32.927' AS DateTime), N'dan', CAST(N'2020-05-20T13:52:21.820' AS DateTime), N'dan', 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (51, N'Cà phê sữa', N'3b7e5baa-1953-49a9-afa9-3f30b5aa8ab3_resize_adsd.jpg', CAST(29000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:20:59.573' AS DateTime), N'dan', NULL, NULL, 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (52, N'Caramel Macchiato', N'f2a94df8-d8f2-4cf4-a67e-36bd6bf6c04b_resize_caramelmacchiatob6f694f469794e12b04a91845f5fce2dmaster.jpg', CAST(50000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:22:53.287' AS DateTime), N'dan', CAST(N'2020-05-20T14:23:50.257' AS DateTime), N'dan', 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (53, N'Cappucinno', N'1f17248b-44f1-4725-8847-51b255f495c4_resize_cappuccinomaster.jpg', CAST(45000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:24:57.303' AS DateTime), N'dan', NULL, NULL, 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (54, N'Cold Brew Sữa Tươi Macchiato', N'44b3e65a-5a12-49ca-9539-010408325a2a_resize_coldbrewmacchiatoaf7dc44ed71b4856bfe48a756ed939e6master.jpg', CAST(50000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:25:52.060' AS DateTime), N'dan', NULL, NULL, 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (55, N'Cold Brew Sữa Tươi', N'08321b66-3b92-4195-9ed9-fa83e19d55e8_resize_coldbrewmilk09db086189ce43d5bb78172613af57dcmaster.jpg', CAST(50000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:32:42.833' AS DateTime), N'dan', NULL, NULL, 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (56, N'Espresso', N'2d05e17d-efeb-4e2a-91f7-a03a51563951_resize_espressomaster.jpg', CAST(35000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:33:14.680' AS DateTime), N'dan', NULL, NULL, 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (57, N'Bạc sỉu', N'eefdca8e-6e99-4dd7-9537-dd70a441a4e2_resize_whitevnesecoffee9968c1184d7f4634a9bb9fce7b5ff313master.jpg', CAST(29000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:33:56.563' AS DateTime), N'dan', CAST(N'2020-05-20T15:00:07.820' AS DateTime), N'dan', 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (58, N'Americano', N'6c1ef0db-c25e-446b-a325-f9ba39ff9f65_resize_americanomaster.jpg', CAST(39000 AS Decimal(15, 0)), N'ly', 0, CAST(N'2020-05-29T08:17:36.643' AS DateTime), N'dan', CAST(N'2020-05-20T14:34:40.550' AS DateTime), N'dan', CAST(N'2020-05-29T09:55:04.977' AS DateTime), N'dan', 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (59, N'Cold Brew Cam Sả', N'f49fc298-6890-4276-8177-bce88ae8a955_resize_colbrewcamsac2a45ec3fea94e248fd1b4f71abebe09master.jpg', CAST(45000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:35:08.840' AS DateTime), N'dan', NULL, NULL, 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (60, N'Cold Brew Phúc Bồn Tử', N'a643cb5b-3bb2-4761-b3bb-13b327a85a4f_resize_caramelmacchiatob6f694f469794e12b04a91845f5fce2dmaster.jpg', CAST(50000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:35:59.300' AS DateTime), N'dan', CAST(N'2020-05-20T14:40:10.563' AS DateTime), N'dan', 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (61, N'Cold Brew Truyền Thống', N'70e3902c-b92c-4e3f-864a-bec5246ee376_resize_classic47aa187278184a4ea36a59cf279350c0master.jpg', CAST(45000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:40:01.307' AS DateTime), N'dan', NULL, NULL, 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (62, N'Trà  Cherry Macchiato', N'fd81c34a-b186-40a3-bfbc-afc2caace626_resize_cherrymac6a3403fdb832464da88de8c6e6ddf662master.jpg', CAST(55000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:44:34.980' AS DateTime), N'dan', NULL, NULL, 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (63, N'Trà Đào Cam Sả', N'6ebead8d-586d-4503-8ccb-6a6989ca5cc3_resize_tradaocamsaonbgmaster.jpg', CAST(45000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:45:23.990' AS DateTime), N'dan', NULL, NULL, 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (64, N'Trà Đen Macchiato', N'5e5e7b14-c4b0-4272-b05a-88faeb237ad2_resize_blackteamacchiatmaster.jpg', CAST(42000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:45:56.433' AS DateTime), N'dan', CAST(N'2020-05-20T15:00:41.513' AS DateTime), N'dan', 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (65, N'Trà Matcha Latte', N'8417951d-05a6-4d3c-bf0a-6b732a188685_resize_matchalattemaster.jpg', CAST(59000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:46:23.210' AS DateTime), N'dan', CAST(N'2020-05-20T14:52:54.603' AS DateTime), N'dan', 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (66, N'Trà Matcha Macchiato', N'b3029217-3542-4ffc-999d-b03e4654964d_resize_matchamacchiatomaster.jpg', CAST(45000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:47:03.027' AS DateTime), N'dan', NULL, NULL, 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (67, N'Trà Ô Long Sen An Nhiên', N'0c024d4d-10db-4344-aab4-5783761f4108_resize_trasen29e9b22739f941ff84671361ae53f3ddmaster.jpg', CAST(45000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:52:12.850' AS DateTime), N'dan', CAST(N'2020-05-20T15:01:10.430' AS DateTime), N'dan', 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (68, N'Trà Ô Long Vải Như Ý', N'd4c5bd04-cb3f-4197-9f8d-53333f5321a3_resize_travaimaster.jpg', CAST(45000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:52:42.400' AS DateTime), N'dan', CAST(N'2020-05-20T14:53:08.920' AS DateTime), N'dan', 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (69, N'Trà Phúc Bồn Tử', N'671aa493-0bb5-4de7-9456-c7c61857a8b4_resize_tearaspberryfda1ba90f506483eb6568f433690173amaster.png', CAST(49000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:53:35.870' AS DateTime), N'dan', NULL, NULL, 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (70, N'Trà Xoài Macchiato', N'e93b3538-32fc-4e56-b12b-80cf3eb64eb0_resize_xoainongmac7f000cdac75e458e9ea5cdc3cb990419master.jpg', CAST(55000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:54:11.887' AS DateTime), N'dan', NULL, NULL, 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (71, N'Chanh Sả Đá Xay', N'4057e2ab-b3ee-499c-ab56-ff338e7551ce_resize_chanhsadaxay45d1c4971e4f4251a2858aa3970fed80master.jpg', CAST(49000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:58:05.980' AS DateTime), N'dan', NULL, NULL, 14)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (72, N'Chocolate Đá Xay', N'd6b783ad-7144-40b9-83d2-c220d4191761_resize_chocolateiceblended45497439e5ea4aa980b8c63078608a2dmaster.jpg', CAST(59000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:58:36.023' AS DateTime), N'dan', NULL, NULL, 14)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (73, N'Cookies Đá Xay', N'e079206c-dcf6-4a33-868e-466cde64f17e_resize_cookiedaxay947815b346254a48bf76f6222101e5d5master.jpg', CAST(59000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:59:06.100' AS DateTime), N'dan', NULL, NULL, 14)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (74, N'MatCha Đá Xay', N'bc13793b-be3d-4339-9f7d-9d667e79007a_resize_matchadaxay5d6b255ccee94330b847b6ed3fece40cmaster.jpg', CAST(59000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:59:34.910' AS DateTime), N'dan', NULL, NULL, 14)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (75, N'Phúc Bồn Tử Cam Đá Xay', N'eee03492-8778-4175-bda3-6e536b8aeb3d_resize_campbtdaxay27dc80ef2efb4828885c2be429aa42famaster.jpg', CAST(59000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T15:00:00.567' AS DateTime), N'dan', NULL, NULL, 14)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (76, N'Sinh Tố Cam Xoài', N'd4aca074-3f6d-43e9-b56f-9363724f8ce9_resize_sinhtocamxoaic3cfa1beec0d4e49b0b229104cbfe412master.jpg', CAST(49000 AS Decimal(15, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T15:03:06.723' AS DateTime), N'dan', NULL, NULL, 14)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (77, N'Bánh Bông Lan Trứng Muối', N'2c81fe9f-74a1-4fd6-a072-8b7c5b635c5a_resize_trungmui19abf7c43946b44e9948dbac1eff95e40master.jpg', CAST(29000 AS Decimal(15, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:04:12.150' AS DateTime), N'dan', CAST(N'2020-05-20T15:09:31.060' AS DateTime), N'dan', 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (78, N'Bánh Chocolate', N'117574c7-2f38-4f9c-80d8-8ddf707e2a64_resize_choco1x14faf8c80e6604cad88ce30528e2bd409master.jpg', CAST(29000 AS Decimal(15, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:04:50.333' AS DateTime), N'dan', CAST(N'2020-05-20T15:09:35.337' AS DateTime), N'dan', 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (79, N'Bánh Croissant Bơ Tỏi', N'32875d0b-6a06-468d-85a2-eafef5a3f35d_resize_sungtrau1x10e9a3e2590794cb9a6ff7ad9d9562c25master.jpg', CAST(29000 AS Decimal(15, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:07:31.867' AS DateTime), N'dan', CAST(N'2020-05-20T15:09:39.093' AS DateTime), N'dan', 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (80, N'Bánh Gấu Chocolate', N'c25fe4f0-a0fa-4e8d-9caa-d32ce9ed2927_resize_gau1x18b308db3a67a47688ff0d69a8c5615bfmaster.jpg', CAST(39000 AS Decimal(15, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:08:56.193' AS DateTime), N'dan', CAST(N'2020-05-20T15:09:44.110' AS DateTime), N'dan', 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (81, N'Bánh Matcha', N'dc2ac751-8acb-4227-b3dd-f4a606bab67b_resize_matcha178bdeeb1f9b47ea9f782048eb145f49master.jpg', CAST(29000 AS Decimal(15, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:10:09.153' AS DateTime), N'dan', NULL, NULL, 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (82, N'Bánh Mì Chà Bông Phô Mai', N'4f91e196-3e26-41fc-b673-ac0fbd0be040_resize_phomaichabong1x1e86c140c8a084458afcace64a93d2fd1master.jpg', CAST(32000 AS Decimal(15, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:10:36.727' AS DateTime), N'dan', NULL, NULL, 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (83, N'Bánh Passion Cheese', N'd40c77a7-37df-47ac-82d1-d52b46b9f352_resize_chanhday1x1da85397059a149e1b886237434f7ce48master.jpg', CAST(29000 AS Decimal(15, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:11:12.670' AS DateTime), N'dan', NULL, NULL, 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (84, N'Bánh Tiramisu', N'869a748e-95e5-4467-87e2-04d32962bc19_resize_tira1x1eb865751a24e4520be32a56129dd7a2dmaster.jpg', CAST(29000 AS Decimal(15, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:11:50.710' AS DateTime), N'dan', NULL, NULL, 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (86, N'0a123123', N'd6adc1cf-6b39-497f-a2e6-73b9414e8466_resize_caramelmacchiatob6f694f469794e12b04a91845f5fce2dmaster.jpg', CAST(110 AS Decimal(15, 0)), N'dĩa', 1, CAST(N'2020-06-01T10:41:52.777' AS DateTime), N'dan', CAST(N'2020-06-01T10:39:07.907' AS DateTime), N'dan', CAST(N'2020-06-01T10:39:20.370' AS DateTime), N'dan', 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (87, N'0fdgdfg', N'default.PNG', CAST(0 AS Decimal(15, 0)), N'ly', 1, CAST(N'2020-06-01T10:41:55.460' AS DateTime), N'dan', CAST(N'2020-06-01T10:39:26.987' AS DateTime), N'dan', NULL, NULL, 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (88, N'Giày', N'd71c595b-5211-49a4-9c25-34d82c5b1153_resize_1590742473107giay-gucci-rhyton-new-york-yankees-1-1.jpg', CAST(1000 AS Decimal(15, 0)), N'ly', 1, CAST(N'2020-06-02T14:39:48.320' AS DateTime), N'dan', CAST(N'2020-06-02T14:39:18.500' AS DateTime), N'dan', NULL, NULL, 13)
SET IDENTITY_INSERT [dbo].[Products] OFF
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillDetails_Bills] FOREIGN KEY([BillsId])
REFERENCES [dbo].[Bills] ([id])
GO
ALTER TABLE [dbo].[BillDetails] CHECK CONSTRAINT [FK_BillDetails_Bills]
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillDetails_Products] FOREIGN KEY([ProductsId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[BillDetails] CHECK CONSTRAINT [FK_BillDetails_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Cataloges] FOREIGN KEY([CatalogesId])
REFERENCES [dbo].[Cataloges] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Cataloges]
GO
/****** Object:  StoredProcedure [dbo].[AddBill]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddBill]
  @created_by nvarchar(100),
  @note nvarchar(100)
AS
BEGIN
    SET NOCOUNT ON;
	INSERT INTO [dbo].[Bills]
           ([time_payment],[isDeleted],[created_at],[created_by],[note])
     VALUES
           (GETDATE(),0, GETDATE(),@created_by,@note)
		   Declare @new_identity int;
		SET @new_identity = SCOPE_IDENTITY();
	SELECT @new_identity as id	
END
GO
/****** Object:  StoredProcedure [dbo].[AddBillDetail]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddBillDetail]
  @total decimal(8,0),
  @created_by nvarchar(100),
  @price decimal(8,0),
  @quantity int,
  @BillsId int,
  @ProductsId int
AS
BEGIN
    SET NOCOUNT ON;
	INSERT INTO [dbo].[BillDetails]
           ([price],[quantity],[total],[BillsId],[ProductsId],[isDeleted],[created_at],[created_by])
     VALUES
           (@price,@quantity,@total,@BillsId,@ProductsId,0,GETDATE(),@created_by)			
END
GO
/****** Object:  StoredProcedure [dbo].[AddCataloges]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCataloges]
  @name nvarchar(100),
  @created_by nvarchar(100)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @ms nvarchar(100);
	IF EXISTS(Select [name] FROM [Cataloges] WHERE [isDeleted] = 0 AND [name] = @name)
		BEGIN
				SET @ms = 'found'
				SELECT @ms as ms
		END
	ELSE
		BEGIN
			    INSERT [dbo].[Cataloges] ([name], [isDeleted], [created_at], [created_by])
	VALUES (@name, 0, GETDATE(), @created_by)  
		END
END
GO
/****** Object:  StoredProcedure [dbo].[addImage]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addImage]
@images nvarchar(255),
@id int
AS
BEGIN
	SET NOCOUNT ON;
    UPDATE [Products] SET [images] = @images WHERE [id] = @id AND [isDeleted] = 0
END
GO
/****** Object:  StoredProcedure [dbo].[AddProducts]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProducts]
  @name nvarchar(100),
  @images nvarchar(255),
  @price decimal(8,0),
  @unit nvarchar(100),
  @created_by nvarchar(100),
  @CatalogesId int
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @ms nvarchar(100);
	IF EXISTS(Select [name] FROM [Products] WHERE [isDeleted] = 0 AND [name] = @name AND [CatalogesId] = @CatalogesId)
		BEGIN
				SET @ms = 'found'
				SELECT @ms as ms
		END
	ELSE
		BEGIN
			    INSERT INTO [Products] ([name], [images], [price], [unit], [isDeleted], [created_at], [created_by], [CatalogesId])
				VALUES (@name, @images, @price, @unit, 0, GETDATE(), @created_by, @CatalogesId)
				Declare @new_identity int;
						SET @new_identity = SCOPE_IDENTITY()
				SELECT @new_identity as id
		END
						
END
GO
/****** Object:  StoredProcedure [dbo].[EditBill]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditBill]
  @total_money decimal(8,0),
  @id int
AS
BEGIN
    SET NOCOUNT ON;
		UPDATE [dbo].[Bills]
		   SET [total_money] = @total_money
		 WHERE [id] = @id AND [isDeleted] = 0
END
GO
/****** Object:  StoredProcedure [dbo].[EditCataloges]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditCataloges]
  @name nvarchar(100),
  @updated_by nvarchar(100),
  @id int
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @ms nvarchar(100);
	IF EXISTS(Select [name] FROM [Cataloges] WHERE [isDeleted] = 0 AND [name] = @name AND [id] <> @id)
		BEGIN
				SET @ms = 'found'
				SELECT @ms as ms
		END
	ELSE
		BEGIN
			    UPDATE [Cataloges]
				SET [name] = @name, [updated_at] = GETDATE(), [updated_by] = @updated_by
				WHERE [id] = @id AND [isDeleted] = 0
		END
END
GO
/****** Object:  StoredProcedure [dbo].[EditProducts]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditProducts]
  @name nvarchar(100),
  @images nvarchar(255),
  @price decimal(8,0),
  @unit nvarchar(100),
  @updated_by nvarchar(100),
  @CatalogesId int,
  @id int
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @ms nvarchar(100);
	IF EXISTS(Select [name] FROM [Products] WHERE [isDeleted] = 0 AND [id] <> @id AND [name] = @name AND [CatalogesId] = @CatalogesId)
		BEGIN
				SET @ms = 'found'
				SELECT @ms as ms
		END
	ELSE
		BEGIN
			    UPDATE [Products]
				SET [name] = @name, [images] = @images, [price] = @price, [unit] = @unit, [updated_at] = GETDATE(), [updated_by] = @updated_by, [CatalogesId] = @CatalogesId
				WHERE [id] = @id AND [isDeleted] = 0
		END
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllBills]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllBills]
AS
BEGIN
    SELECT [id], [created_by], [note], [time_payment], [total_money]
	FROM [Bills]  WHERE [isDeleted] = 0
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllBillsByDate]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllBillsByDate]
@StartDate nvarchar(100),
@EndDate nvarchar(100)
AS
BEGIN
   SELECT [id], [created_by], [note], [time_payment], [total_money]
	FROM [Bills]  WHERE [isDeleted] = 0 AND CAST(time_payment as DATE) BETWEEN @StartDate AND @EndDate
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllCataloges]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCataloges]
AS
BEGIN
    SELECT
        [id], [name]
    FROM
        [Cataloges]
   WHERE [isDeleted] = 0 
   ORDER BY [name];
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProducts]
AS
BEGIN
    SELECT p.[id], p.[name], p.[images], p.[price], p.[unit], p.[CatalogesId], c.[name] AS CatalogesName
		FROM [Products] p JOIN [Cataloges] c ON p.[CatalogesId] = c.[id]
		WHERE p.[isDeleted] = 0 AND c.[isDeleted] = 0
		ORDER BY [CatalogesId];
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsByCataloges]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProductsByCataloges]
@CatalogesId int
AS
BEGIN
    SELECT
        [id], [name], [images], [price], [unit], [CatalogesId]
    FROM
        [Products]
   WHERE [isDeleted] = 0 AND [CatalogesId] = @CatalogesId
   ORDER BY [CatalogesId];
END;
GO
/****** Object:  StoredProcedure [dbo].[GetBillDetailsByBill]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBillDetailsByBill]
@BillsId int
AS
BEGIN
    SELECT b.id, b.price, b.quantity, b.total, p.name AS productName, p.unit
  FROM BillDetails b
  JOIN Products p ON b.ProductsId = p.id WHERE b.isDeleted = 0 AND p.isDeleted = 0 AND b.BillsId = @BillsId
END;
GO
/****** Object:  StoredProcedure [dbo].[GetChart7_14Day]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetChart7_14Day]
AS
BEGIN
			DECLARE @14DaysAgo DATE = CAST(DATEADD(DD,-13,GETDATE()) as DATE)
			DECLARE @7DaysAgo DATE = CAST(DATEADD(DD,-7,GETDATE()) as DATE);

    							WITH DateTable
			AS
			(
				SELECT @14DaysAgo AS [DATE]
				UNION ALL
				SELECT DATEADD(dd, 1, [DATE])
				FROM DateTable
				WHERE DATEADD(dd, 1, [DATE]) <= @7DaysAgo
			)
			SELECT ISNULL(b.total_money, 0) as total_money
			FROM [DateTable] dt
			left JOIN (SELECT CAST(time_payment as DATE) as time_payment, SUM(total_money) as total_money FROM Bills
			WHERE CAST(time_payment as DATE) BETWEEN @14DaysAgo AND @7DaysAgo AND isDeleted = 0
			GROUP BY CAST(time_payment AS DATE)) b
			ON CAST(b.time_payment AS Date) = dt.[DATE]
END
GO
/****** Object:  StoredProcedure [dbo].[GetChart7Day]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetChart7Day]
AS
BEGIN
			DECLARE @7DaysAgo DATE = CAST(DATEADD(DD,-6,GETDATE()) as DATE)
			DECLARE @now DATE = CAST(GETDATE() as DATE);

    							WITH DateTable
			AS
			(
				SELECT @7DaysAgo AS [DATE]
				UNION ALL
				SELECT DATEADD(dd, 1, [DATE])
				FROM DateTable
				WHERE DATEADD(dd, 1, [DATE]) <= @now
			)
			SELECT ISNULL(b.total_money, 0) as total_money
			FROM [DateTable] dt
			left JOIN (SELECT CAST(time_payment as DATE) as time_payment, SUM(total_money) as total_money FROM Bills
			WHERE CAST(time_payment as DATE) BETWEEN @7DaysAgo AND @now AND isDeleted = 0
			GROUP BY CAST(time_payment AS DATE)) b
			ON CAST(b.time_payment AS Date) = dt.[DATE]
END
GO
/****** Object:  StoredProcedure [dbo].[GetTopCataloges]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTopCataloges]
AS
BEGIN
					  SELECT c.name, SUM(b.quantity) as quantity FROM BillDetails b
			JOIN Products p ON b.ProductsId = p.id
			JOIN Cataloges c ON c.id = p.CatalogesId
			WHERE b.isDeleted = 0 AND p.isDeleted = 0 AND c.isDeleted = 0
			GROUP BY c.name
			ORDER by quantity desc
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTopCataloges7Days]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTopCataloges7Days]
AS
BEGIN
					SELECT c.name, SUM(b.quantity) as quantity FROM BillDetails b
			JOIN Products p ON b.ProductsId = p.id
			JOIN Cataloges c ON c.id = p.CatalogesId
			WHERE b.isDeleted = 0 AND p.isDeleted = 0 AND c.isDeleted = 0 AND CAST(b.created_at as DATE) BETWEEN CAST(DATEADD(DD,-6,GETDATE()) as DATE) AND CAST(GETDATE() as DATE)
			GROUP BY c.name
			ORDER by quantity desc
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTopCatalogesByDate]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTopCatalogesByDate]
@StartDate nvarchar(100),
@EndDate nvarchar(100)
AS
BEGIN
					SELECT c.name, SUM(b.quantity) as quantity FROM BillDetails b
			JOIN Products p ON b.ProductsId = p.id
			JOIN Cataloges c ON c.id = p.CatalogesId
			WHERE b.isDeleted = 0 AND p.isDeleted = 0 AND c.isDeleted = 0 AND CAST(b.created_at as DATE) BETWEEN @StartDate AND @EndDate
			GROUP BY c.name
			ORDER by quantity desc
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTopProducts]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTopProducts]
AS
BEGIN
		   SELECT p.name, p.price, SUM(b.quantity) as quantity, (SUM(b.quantity) * p.price) AS total FROM BillDetails b
		JOIN Products p ON b.ProductsId = p.id
		WHERE b.isDeleted = 0 AND p.isDeleted = 0
		GROUP BY p.name, p.price
		ORDER by quantity desc
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTopProductsByDate]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTopProductsByDate]
@StartDate nvarchar(100),
@EndDate nvarchar(100)
AS
BEGIN
		   SELECT p.name, p.price, SUM(b.quantity) as quantity, (SUM(b.quantity) * p.price) AS total FROM BillDetails b
		JOIN Products p ON b.ProductsId = p.id
		WHERE b.isDeleted = 0 AND p.isDeleted = 0 AND CAST(b.created_at as DATE) BETWEEN @StartDate AND @EndDate
		GROUP BY p.name, p.price
		ORDER by quantity desc
END;
GO
/****** Object:  StoredProcedure [dbo].[RemoveCataloges]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveCataloges]
  @username nvarchar(100),
  @id int
AS
BEGIN
    SET NOCOUNT ON;
		BEGIN
			    UPDATE [Cataloges]
				SET [isDeleted] = 1, [deleted_at] = GETDATE(), [deleted_by] = @username
				WHERE [id] = @id AND [isDeleted] = 0
		END
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveProducts]    Script Date: 6/2/2020 5:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveProducts]
  @username nvarchar(100),
  @id int
AS
BEGIN
    SET NOCOUNT ON;
		BEGIN
			    UPDATE [Products]
				SET [isDeleted] = 1, [deleted_at] = GETDATE(), [deleted_by] = @username
				WHERE [id] = @id AND [isDeleted] = 0
		END
END
GO
USE [master]
GO
ALTER DATABASE [Coffee2] SET  READ_WRITE 
GO
