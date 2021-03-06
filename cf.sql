USE [master]
GO
/****** Object:  Database [Coffee]    Script Date: 5/26/2020 5:07:14 PM ******/
CREATE DATABASE [Coffee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Coffee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Coffee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Coffee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Coffee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Coffee] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Coffee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Coffee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Coffee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Coffee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Coffee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Coffee] SET ARITHABORT OFF 
GO
ALTER DATABASE [Coffee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Coffee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Coffee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Coffee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Coffee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Coffee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Coffee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Coffee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Coffee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Coffee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Coffee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Coffee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Coffee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Coffee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Coffee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Coffee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Coffee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Coffee] SET RECOVERY FULL 
GO
ALTER DATABASE [Coffee] SET  MULTI_USER 
GO
ALTER DATABASE [Coffee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Coffee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Coffee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Coffee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Coffee] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Coffee', N'ON'
GO
ALTER DATABASE [Coffee] SET QUERY_STORE = OFF
GO
USE [Coffee]
GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 5/26/2020 5:07:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price] [decimal](8, 0) NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [decimal](8, 0) NOT NULL,
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
/****** Object:  Table [dbo].[Bills]    Script Date: 5/26/2020 5:07:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[time_payment] [datetime] NULL,
	[total_money] [decimal](8, 0) NULL,
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
/****** Object:  Table [dbo].[Cataloges]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 5/26/2020 5:07:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[images] [nvarchar](255) NULL,
	[price] [decimal](8, 0) NOT NULL,
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

INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (65, CAST(29000 AS Decimal(8, 0)), 2, CAST(58000 AS Decimal(8, 0)), 42, 77, 0, NULL, NULL, CAST(N'2020-05-22T11:01:16.447' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (66, CAST(29000 AS Decimal(8, 0)), 2, CAST(58000 AS Decimal(8, 0)), 42, 78, 0, NULL, NULL, CAST(N'2020-05-22T11:01:16.447' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (67, CAST(29000 AS Decimal(8, 0)), 3, CAST(87000 AS Decimal(8, 0)), 42, 79, 0, NULL, NULL, CAST(N'2020-05-22T11:01:16.447' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (68, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 42, 81, 0, NULL, NULL, CAST(N'2020-05-22T11:01:16.447' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (69, CAST(32000 AS Decimal(8, 0)), 15, CAST(480000 AS Decimal(8, 0)), 43, 82, 0, NULL, NULL, CAST(N'2020-05-22T11:01:26.000' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (70, CAST(29000 AS Decimal(8, 0)), 4, CAST(116000 AS Decimal(8, 0)), 44, 81, 0, NULL, NULL, CAST(N'2020-05-22T11:01:30.843' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (71, CAST(39000 AS Decimal(8, 0)), 3, CAST(117000 AS Decimal(8, 0)), 44, 80, 0, NULL, NULL, CAST(N'2020-05-22T11:01:30.843' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (72, CAST(32000 AS Decimal(8, 0)), 3, CAST(96000 AS Decimal(8, 0)), 44, 82, 0, NULL, NULL, CAST(N'2020-05-22T11:01:30.843' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (73, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 45, 83, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.503' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (74, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 45, 84, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.503' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (75, CAST(50000 AS Decimal(8, 0)), 1, CAST(50000 AS Decimal(8, 0)), 45, 52, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.503' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (76, CAST(39000 AS Decimal(8, 0)), 1, CAST(39000 AS Decimal(8, 0)), 45, 58, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.503' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (77, CAST(50000 AS Decimal(8, 0)), 1, CAST(50000 AS Decimal(8, 0)), 45, 60, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.503' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (78, CAST(59000 AS Decimal(8, 0)), 2, CAST(118000 AS Decimal(8, 0)), 45, 74, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.507' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (79, CAST(59000 AS Decimal(8, 0)), 2, CAST(118000 AS Decimal(8, 0)), 45, 72, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.507' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (80, CAST(59000 AS Decimal(8, 0)), 1, CAST(59000 AS Decimal(8, 0)), 45, 75, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.507' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (81, CAST(45000 AS Decimal(8, 0)), 1, CAST(45000 AS Decimal(8, 0)), 45, 63, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.507' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (82, CAST(45000 AS Decimal(8, 0)), 2, CAST(90000 AS Decimal(8, 0)), 45, 66, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.507' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (83, CAST(49000 AS Decimal(8, 0)), 1, CAST(49000 AS Decimal(8, 0)), 45, 69, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.507' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (84, CAST(45000 AS Decimal(8, 0)), 1, CAST(45000 AS Decimal(8, 0)), 45, 68, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.507' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (85, CAST(55000 AS Decimal(8, 0)), 1, CAST(55000 AS Decimal(8, 0)), 45, 70, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.507' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (86, CAST(45000 AS Decimal(8, 0)), 1, CAST(45000 AS Decimal(8, 0)), 45, 67, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.507' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (87, CAST(59000 AS Decimal(8, 0)), 1, CAST(59000 AS Decimal(8, 0)), 45, 65, 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.507' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (88, CAST(50000 AS Decimal(8, 0)), 1, CAST(50000 AS Decimal(8, 0)), 46, 52, 0, NULL, NULL, CAST(N'2020-05-22T14:18:19.813' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (89, CAST(45000 AS Decimal(8, 0)), 1, CAST(45000 AS Decimal(8, 0)), 46, 53, 0, NULL, NULL, CAST(N'2020-05-22T14:18:19.813' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (90, CAST(45000 AS Decimal(8, 0)), 2, CAST(90000 AS Decimal(8, 0)), 46, 66, 0, NULL, NULL, CAST(N'2020-05-22T14:18:19.817' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (91, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 47, 83, 0, NULL, NULL, CAST(N'2020-05-22T14:18:23.770' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (92, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 47, 84, 0, NULL, NULL, CAST(N'2020-05-22T14:18:23.773' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (93, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 47, 78, 0, NULL, NULL, CAST(N'2020-05-22T14:18:23.773' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (94, CAST(32000 AS Decimal(8, 0)), 1, CAST(32000 AS Decimal(8, 0)), 47, 82, 0, NULL, NULL, CAST(N'2020-05-22T14:18:23.773' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (95, CAST(45000 AS Decimal(8, 0)), 1, CAST(45000 AS Decimal(8, 0)), 48, 59, 0, NULL, NULL, CAST(N'2020-05-22T14:18:27.503' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (96, CAST(39000 AS Decimal(8, 0)), 1, CAST(39000 AS Decimal(8, 0)), 48, 58, 0, NULL, NULL, CAST(N'2020-05-22T14:18:27.503' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (97, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 48, 57, 0, NULL, NULL, CAST(N'2020-05-22T14:18:27.507' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (98, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 48, 51, 0, NULL, NULL, CAST(N'2020-05-22T14:18:27.507' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (99, CAST(45000 AS Decimal(8, 0)), 1, CAST(45000 AS Decimal(8, 0)), 48, 53, 0, NULL, NULL, CAST(N'2020-05-22T14:18:27.507' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (100, CAST(45000 AS Decimal(8, 0)), 1, CAST(45000 AS Decimal(8, 0)), 49, 67, 0, NULL, NULL, CAST(N'2020-05-22T14:18:31.120' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (101, CAST(42000 AS Decimal(8, 0)), 1, CAST(42000 AS Decimal(8, 0)), 49, 64, 0, NULL, NULL, CAST(N'2020-05-22T14:18:31.120' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (102, CAST(49000 AS Decimal(8, 0)), 1, CAST(49000 AS Decimal(8, 0)), 49, 69, 0, NULL, NULL, CAST(N'2020-05-22T14:18:31.120' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (103, CAST(55000 AS Decimal(8, 0)), 1, CAST(55000 AS Decimal(8, 0)), 49, 70, 0, NULL, NULL, CAST(N'2020-05-22T14:18:31.120' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (104, CAST(59000 AS Decimal(8, 0)), 1, CAST(59000 AS Decimal(8, 0)), 49, 65, 0, NULL, NULL, CAST(N'2020-05-22T14:18:31.120' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (105, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 50, 26, 0, NULL, NULL, CAST(N'2020-05-22T14:18:36.377' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (106, CAST(45000 AS Decimal(8, 0)), 1, CAST(45000 AS Decimal(8, 0)), 50, 59, 0, NULL, NULL, CAST(N'2020-05-22T14:18:36.377' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (107, CAST(50000 AS Decimal(8, 0)), 1, CAST(50000 AS Decimal(8, 0)), 50, 60, 0, NULL, NULL, CAST(N'2020-05-22T14:18:36.377' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (108, CAST(50000 AS Decimal(8, 0)), 1, CAST(50000 AS Decimal(8, 0)), 50, 54, 0, NULL, NULL, CAST(N'2020-05-22T14:18:36.377' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (109, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 50, 57, 0, NULL, NULL, CAST(N'2020-05-22T14:18:36.377' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (110, CAST(45000 AS Decimal(8, 0)), 1, CAST(45000 AS Decimal(8, 0)), 50, 61, 0, NULL, NULL, CAST(N'2020-05-22T14:18:36.380' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (111, CAST(50000 AS Decimal(8, 0)), 1, CAST(50000 AS Decimal(8, 0)), 50, 55, 0, NULL, NULL, CAST(N'2020-05-22T14:18:36.380' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (112, CAST(49000 AS Decimal(8, 0)), 1, CAST(49000 AS Decimal(8, 0)), 51, 71, 0, NULL, NULL, CAST(N'2020-05-22T14:18:40.560' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (113, CAST(59000 AS Decimal(8, 0)), 1, CAST(59000 AS Decimal(8, 0)), 51, 72, 0, NULL, NULL, CAST(N'2020-05-22T14:18:40.560' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (114, CAST(59000 AS Decimal(8, 0)), 2, CAST(118000 AS Decimal(8, 0)), 51, 73, 0, NULL, NULL, CAST(N'2020-05-22T14:18:40.560' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (115, CAST(59000 AS Decimal(8, 0)), 1, CAST(59000 AS Decimal(8, 0)), 51, 74, 0, NULL, NULL, CAST(N'2020-05-22T14:18:40.560' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (116, CAST(59000 AS Decimal(8, 0)), 1, CAST(59000 AS Decimal(8, 0)), 51, 75, 0, NULL, NULL, CAST(N'2020-05-22T14:18:40.560' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (117, CAST(42000 AS Decimal(8, 0)), 2, CAST(84000 AS Decimal(8, 0)), 52, 64, 0, NULL, NULL, CAST(N'2020-05-22T14:18:45.200' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (118, CAST(45000 AS Decimal(8, 0)), 1, CAST(45000 AS Decimal(8, 0)), 52, 63, 0, NULL, NULL, CAST(N'2020-05-22T14:18:45.200' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (119, CAST(49000 AS Decimal(8, 0)), 2, CAST(98000 AS Decimal(8, 0)), 52, 69, 0, NULL, NULL, CAST(N'2020-05-22T14:18:45.200' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (120, CAST(55000 AS Decimal(8, 0)), 1, CAST(55000 AS Decimal(8, 0)), 52, 70, 0, NULL, NULL, CAST(N'2020-05-22T14:18:45.203' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (121, CAST(45000 AS Decimal(8, 0)), 1, CAST(45000 AS Decimal(8, 0)), 52, 66, 0, NULL, NULL, CAST(N'2020-05-22T14:18:45.203' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (122, CAST(45000 AS Decimal(8, 0)), 1, CAST(45000 AS Decimal(8, 0)), 52, 67, 0, NULL, NULL, CAST(N'2020-05-22T14:18:45.203' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (123, CAST(55000 AS Decimal(8, 0)), 1, CAST(55000 AS Decimal(8, 0)), 52, 62, 0, NULL, NULL, CAST(N'2020-05-22T14:18:45.203' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (124, CAST(45000 AS Decimal(8, 0)), 1, CAST(45000 AS Decimal(8, 0)), 52, 68, 0, NULL, NULL, CAST(N'2020-05-22T14:18:45.203' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (125, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 53, 51, 0, NULL, NULL, CAST(N'2020-05-22T14:18:51.537' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (126, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 53, 57, 0, NULL, NULL, CAST(N'2020-05-22T14:18:51.537' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (127, CAST(50000 AS Decimal(8, 0)), 1, CAST(50000 AS Decimal(8, 0)), 53, 52, 0, NULL, NULL, CAST(N'2020-05-22T14:18:51.537' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (128, CAST(29000 AS Decimal(8, 0)), 2, CAST(58000 AS Decimal(8, 0)), 53, 78, 0, NULL, NULL, CAST(N'2020-05-22T14:18:51.537' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (129, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 53, 79, 0, NULL, NULL, CAST(N'2020-05-22T14:18:51.540' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (130, CAST(39000 AS Decimal(8, 0)), 2, CAST(78000 AS Decimal(8, 0)), 53, 80, 0, NULL, NULL, CAST(N'2020-05-22T14:18:51.540' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (131, CAST(59000 AS Decimal(8, 0)), 2, CAST(118000 AS Decimal(8, 0)), 53, 74, 0, NULL, NULL, CAST(N'2020-05-22T14:18:51.540' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (132, CAST(59000 AS Decimal(8, 0)), 2, CAST(118000 AS Decimal(8, 0)), 53, 75, 0, NULL, NULL, CAST(N'2020-05-22T14:18:51.540' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (133, CAST(49000 AS Decimal(8, 0)), 1, CAST(49000 AS Decimal(8, 0)), 53, 76, 0, NULL, NULL, CAST(N'2020-05-22T14:18:51.540' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (134, CAST(39000 AS Decimal(8, 0)), 1, CAST(39000 AS Decimal(8, 0)), 54, 80, 0, NULL, NULL, CAST(N'2020-05-22T14:51:02.913' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (135, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 55, 84, 0, NULL, NULL, CAST(N'2020-05-22T14:51:05.103' AS DateTime), N'dan', NULL, NULL)
INSERT [dbo].[BillDetails] ([id], [price], [quantity], [total], [BillsId], [ProductsId], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (136, CAST(29000 AS Decimal(8, 0)), 1, CAST(29000 AS Decimal(8, 0)), 55, 78, 0, NULL, NULL, CAST(N'2020-05-22T14:51:05.107' AS DateTime), N'dan', NULL, NULL)
SET IDENTITY_INSERT [dbo].[BillDetails] OFF
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (42, CAST(N'2020-05-11T00:00:16.420' AS DateTime), CAST(232000 AS Decimal(8, 0)), 0, NULL, NULL, CAST(N'2020-05-22T11:01:16.420' AS DateTime), N'dan', NULL, NULL, N'sedf')
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (43, CAST(N'2020-05-11T00:01:26.000' AS DateTime), CAST(712000 AS Decimal(8, 0)), 0, NULL, NULL, CAST(N'2020-05-22T11:01:26.000' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (44, CAST(N'2020-05-11T00:01:30.843' AS DateTime), CAST(1041000 AS Decimal(8, 0)), 0, NULL, NULL, CAST(N'2020-05-22T11:01:30.843' AS DateTime), N'dan', NULL, NULL, N'ee')
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (45, CAST(N'2020-05-14T11:01:59.497' AS DateTime), CAST(1921000 AS Decimal(8, 0)), 0, NULL, NULL, CAST(N'2020-05-22T11:01:59.497' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (46, CAST(N'2020-05-15T14:18:19.773' AS DateTime), CAST(185000 AS Decimal(8, 0)), 0, NULL, NULL, CAST(N'2020-05-22T14:18:19.773' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (47, CAST(N'2020-05-16T14:18:23.770' AS DateTime), CAST(304000 AS Decimal(8, 0)), 0, NULL, NULL, CAST(N'2020-05-22T14:18:23.770' AS DateTime), N'dan', NULL, NULL, N'ewr23r')
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (48, CAST(N'2020-05-17T00:00:27.500' AS DateTime), CAST(491000 AS Decimal(8, 0)), 0, NULL, NULL, CAST(N'2020-05-22T14:18:27.500' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (49, CAST(N'2020-05-25T14:18:31.113' AS DateTime), CAST(741000 AS Decimal(8, 0)), 0, NULL, NULL, CAST(N'2020-05-22T14:18:31.113' AS DateTime), N'dan', NULL, NULL, N'oo')
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (50, CAST(N'2020-05-19T14:18:36.377' AS DateTime), CAST(1039000 AS Decimal(8, 0)), 0, NULL, NULL, CAST(N'2020-05-22T14:18:36.377' AS DateTime), N'dan', NULL, NULL, N'sdfsd dg ')
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (51, CAST(N'2020-05-20T14:18:40.553' AS DateTime), CAST(1383000 AS Decimal(8, 0)), 0, NULL, NULL, CAST(N'2020-05-22T14:18:40.553' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (52, CAST(N'2020-05-21T14:18:45.200' AS DateTime), CAST(1855000 AS Decimal(8, 0)), 0, NULL, NULL, CAST(N'2020-05-22T14:18:45.200' AS DateTime), N'dan', NULL, NULL, N'ds fsdf')
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (53, CAST(N'2020-05-22T14:18:51.530' AS DateTime), CAST(2413000 AS Decimal(8, 0)), 0, NULL, NULL, CAST(N'2020-05-22T14:18:51.530' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (54, CAST(N'2020-05-23T14:51:02.890' AS DateTime), CAST(39000 AS Decimal(8, 0)), 0, NULL, NULL, CAST(N'2020-05-22T14:51:02.890' AS DateTime), N'dan', NULL, NULL, NULL)
INSERT [dbo].[Bills] ([id], [time_payment], [total_money], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [note]) VALUES (55, CAST(N'2020-05-24T14:51:05.100' AS DateTime), CAST(97000 AS Decimal(8, 0)), 0, NULL, NULL, CAST(N'2020-05-22T14:51:05.100' AS DateTime), N'dan', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Bills] OFF
SET IDENTITY_INSERT [dbo].[Cataloges] ON 

INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (2, N'Cà Phê', 0, CAST(N'2020-05-19T16:08:46.570' AS DateTime), N'dan', NULL, NULL, NULL, NULL)
INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (4, N'Trà - Macchiato', 0, CAST(N'2020-05-19T16:32:07.447' AS DateTime), N'dan', NULL, NULL, CAST(N'2020-05-20T14:41:47.477' AS DateTime), N'dan')
INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (13, N'Bánh - Snack', 0, NULL, NULL, CAST(N'2020-05-20T13:46:58.673' AS DateTime), N'dan', CAST(N'2020-05-20T15:03:33.400' AS DateTime), N'dan')
INSERT [dbo].[Cataloges] ([id], [name], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by]) VALUES (14, N'Đá Xay - Sinh Tố', 0, NULL, NULL, CAST(N'2020-05-20T14:56:38.040' AS DateTime), N'dan', CAST(N'2020-05-20T14:57:13.740' AS DateTime), N'dan')
SET IDENTITY_INSERT [dbo].[Cataloges] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (26, N'Cà phê đen', N'3fbbeb34-a3c4-4762-b601-75bd46ca2916_resize_vnesecoffee.jpg', CAST(29000 AS Decimal(8, 0)), N'ly', 0, CAST(N'2020-05-18T14:29:13.883' AS DateTime), N'dan', CAST(N'2020-05-18T10:12:32.927' AS DateTime), N'dan', CAST(N'2020-05-20T13:52:21.820' AS DateTime), N'dan', 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (51, N'Cà phê sữa', N'3b7e5baa-1953-49a9-afa9-3f30b5aa8ab3_resize_adsd.jpg', CAST(29000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:20:59.573' AS DateTime), N'dan', NULL, NULL, 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (52, N'Caramel Macchiato', N'f2a94df8-d8f2-4cf4-a67e-36bd6bf6c04b_resize_caramelmacchiatob6f694f469794e12b04a91845f5fce2dmaster.jpg', CAST(50000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:22:53.287' AS DateTime), N'dan', CAST(N'2020-05-20T14:23:50.257' AS DateTime), N'dan', 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (53, N'Cappucinno', N'1f17248b-44f1-4725-8847-51b255f495c4_resize_cappuccinomaster.jpg', CAST(45000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:24:57.303' AS DateTime), N'dan', NULL, NULL, 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (54, N'Cold Brew Sữa Tươi Macchiato', N'44b3e65a-5a12-49ca-9539-010408325a2a_resize_coldbrewmacchiatoaf7dc44ed71b4856bfe48a756ed939e6master.jpg', CAST(50000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:25:52.060' AS DateTime), N'dan', NULL, NULL, 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (55, N'Cold Brew Sữa Tươi', N'08321b66-3b92-4195-9ed9-fa83e19d55e8_resize_coldbrewmilk09db086189ce43d5bb78172613af57dcmaster.jpg', CAST(50000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:32:42.833' AS DateTime), N'dan', NULL, NULL, 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (56, N'Espresso', N'2d05e17d-efeb-4e2a-91f7-a03a51563951_resize_espressomaster.jpg', CAST(35000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:33:14.680' AS DateTime), N'dan', NULL, NULL, 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (57, N'Bạc sỉu', N'eefdca8e-6e99-4dd7-9537-dd70a441a4e2_resize_whitevnesecoffee9968c1184d7f4634a9bb9fce7b5ff313master.jpg', CAST(29000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:33:56.563' AS DateTime), N'dan', CAST(N'2020-05-20T15:00:07.820' AS DateTime), N'dan', 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (58, N'Americano', N'871d23d9-dda5-4bc2-9e69-8a42fc2c9637_resize_americanomaster.jpg', CAST(39000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:34:40.550' AS DateTime), N'dan', CAST(N'2020-05-22T08:15:13.570' AS DateTime), N'dan', 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (59, N'Cold Brew Cam Sả', N'f49fc298-6890-4276-8177-bce88ae8a955_resize_colbrewcamsac2a45ec3fea94e248fd1b4f71abebe09master.jpg', CAST(45000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:35:08.840' AS DateTime), N'dan', NULL, NULL, 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (60, N'Cold Brew Phúc Bồn Tử', N'a643cb5b-3bb2-4761-b3bb-13b327a85a4f_resize_caramelmacchiatob6f694f469794e12b04a91845f5fce2dmaster.jpg', CAST(50000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:35:59.300' AS DateTime), N'dan', CAST(N'2020-05-20T14:40:10.563' AS DateTime), N'dan', 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (61, N'Cold Brew Truyền Thống', N'70e3902c-b92c-4e3f-864a-bec5246ee376_resize_classic47aa187278184a4ea36a59cf279350c0master.jpg', CAST(45000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:40:01.307' AS DateTime), N'dan', NULL, NULL, 2)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (62, N'Trà  Cherry Macchiato', N'fd81c34a-b186-40a3-bfbc-afc2caace626_resize_cherrymac6a3403fdb832464da88de8c6e6ddf662master.jpg', CAST(55000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:44:34.980' AS DateTime), N'dan', NULL, NULL, 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (63, N'Trà Đào Cam Sả', N'6ebead8d-586d-4503-8ccb-6a6989ca5cc3_resize_tradaocamsaonbgmaster.jpg', CAST(45000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:45:23.990' AS DateTime), N'dan', NULL, NULL, 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (64, N'Trà Đen Macchiato', N'5e5e7b14-c4b0-4272-b05a-88faeb237ad2_resize_blackteamacchiatmaster.jpg', CAST(42000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:45:56.433' AS DateTime), N'dan', CAST(N'2020-05-20T15:00:41.513' AS DateTime), N'dan', 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (65, N'Trà Matcha Latte', N'8417951d-05a6-4d3c-bf0a-6b732a188685_resize_matchalattemaster.jpg', CAST(59000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:46:23.210' AS DateTime), N'dan', CAST(N'2020-05-20T14:52:54.603' AS DateTime), N'dan', 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (66, N'Trà Matcha Macchiato', N'b3029217-3542-4ffc-999d-b03e4654964d_resize_matchamacchiatomaster.jpg', CAST(45000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:47:03.027' AS DateTime), N'dan', NULL, NULL, 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (67, N'Trà Ô Long Sen An Nhiên', N'0c024d4d-10db-4344-aab4-5783761f4108_resize_trasen29e9b22739f941ff84671361ae53f3ddmaster.jpg', CAST(45000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:52:12.850' AS DateTime), N'dan', CAST(N'2020-05-20T15:01:10.430' AS DateTime), N'dan', 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (68, N'Trà Ô Long Vải Như Ý', N'd4c5bd04-cb3f-4197-9f8d-53333f5321a3_resize_travaimaster.jpg', CAST(45000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:52:42.400' AS DateTime), N'dan', CAST(N'2020-05-20T14:53:08.920' AS DateTime), N'dan', 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (69, N'Trà Phúc Bồn Tử', N'671aa493-0bb5-4de7-9456-c7c61857a8b4_resize_tearaspberryfda1ba90f506483eb6568f433690173amaster.png', CAST(49000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:53:35.870' AS DateTime), N'dan', NULL, NULL, 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (70, N'Trà Xoài Macchiato', N'e93b3538-32fc-4e56-b12b-80cf3eb64eb0_resize_xoainongmac7f000cdac75e458e9ea5cdc3cb990419master.jpg', CAST(55000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:54:11.887' AS DateTime), N'dan', NULL, NULL, 4)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (71, N'Chanh Sả Đá Xay', N'4057e2ab-b3ee-499c-ab56-ff338e7551ce_resize_chanhsadaxay45d1c4971e4f4251a2858aa3970fed80master.jpg', CAST(49000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:58:05.980' AS DateTime), N'dan', NULL, NULL, 14)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (72, N'Chocolate Đá Xay', N'd6b783ad-7144-40b9-83d2-c220d4191761_resize_chocolateiceblended45497439e5ea4aa980b8c63078608a2dmaster.jpg', CAST(59000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:58:36.023' AS DateTime), N'dan', NULL, NULL, 14)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (73, N'Cookies Đá Xay', N'e079206c-dcf6-4a33-868e-466cde64f17e_resize_cookiedaxay947815b346254a48bf76f6222101e5d5master.jpg', CAST(59000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:59:06.100' AS DateTime), N'dan', NULL, NULL, 14)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (74, N'MatCha Đá Xay', N'bc13793b-be3d-4339-9f7d-9d667e79007a_resize_matchadaxay5d6b255ccee94330b847b6ed3fece40cmaster.jpg', CAST(59000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T14:59:34.910' AS DateTime), N'dan', NULL, NULL, 14)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (75, N'Phúc Bồn Tử Cam Đá Xay', N'eee03492-8778-4175-bda3-6e536b8aeb3d_resize_campbtdaxay27dc80ef2efb4828885c2be429aa42famaster.jpg', CAST(59000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T15:00:00.567' AS DateTime), N'dan', NULL, NULL, 14)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (76, N'Sinh Tố Cam Xoài', N'd4aca074-3f6d-43e9-b56f-9363724f8ce9_resize_sinhtocamxoaic3cfa1beec0d4e49b0b229104cbfe412master.jpg', CAST(49000 AS Decimal(8, 0)), N'ly', 0, NULL, NULL, CAST(N'2020-05-20T15:03:06.723' AS DateTime), N'dan', NULL, NULL, 14)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (77, N'Bánh Bông Lan Trứng Muối', N'2c81fe9f-74a1-4fd6-a072-8b7c5b635c5a_resize_trungmui19abf7c43946b44e9948dbac1eff95e40master.jpg', CAST(29000 AS Decimal(8, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:04:12.150' AS DateTime), N'dan', CAST(N'2020-05-20T15:09:31.060' AS DateTime), N'dan', 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (78, N'Bánh Chocolate', N'117574c7-2f38-4f9c-80d8-8ddf707e2a64_resize_choco1x14faf8c80e6604cad88ce30528e2bd409master.jpg', CAST(29000 AS Decimal(8, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:04:50.333' AS DateTime), N'dan', CAST(N'2020-05-20T15:09:35.337' AS DateTime), N'dan', 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (79, N'Bánh Croissant Bơ Tỏi', N'32875d0b-6a06-468d-85a2-eafef5a3f35d_resize_sungtrau1x10e9a3e2590794cb9a6ff7ad9d9562c25master.jpg', CAST(29000 AS Decimal(8, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:07:31.867' AS DateTime), N'dan', CAST(N'2020-05-20T15:09:39.093' AS DateTime), N'dan', 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (80, N'Bánh Gấu Chocolate', N'c25fe4f0-a0fa-4e8d-9caa-d32ce9ed2927_resize_gau1x18b308db3a67a47688ff0d69a8c5615bfmaster.jpg', CAST(39000 AS Decimal(8, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:08:56.193' AS DateTime), N'dan', CAST(N'2020-05-20T15:09:44.110' AS DateTime), N'dan', 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (81, N'Bánh Matcha', N'dc2ac751-8acb-4227-b3dd-f4a606bab67b_resize_matcha178bdeeb1f9b47ea9f782048eb145f49master.jpg', CAST(29000 AS Decimal(8, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:10:09.153' AS DateTime), N'dan', NULL, NULL, 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (82, N'Bánh Mì Chà Bông Phô Mai', N'4f91e196-3e26-41fc-b673-ac0fbd0be040_resize_phomaichabong1x1e86c140c8a084458afcace64a93d2fd1master.jpg', CAST(32000 AS Decimal(8, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:10:36.727' AS DateTime), N'dan', NULL, NULL, 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (83, N'Bánh Passion Cheese', N'd40c77a7-37df-47ac-82d1-d52b46b9f352_resize_chanhday1x1da85397059a149e1b886237434f7ce48master.jpg', CAST(29000 AS Decimal(8, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:11:12.670' AS DateTime), N'dan', NULL, NULL, 13)
INSERT [dbo].[Products] ([id], [name], [images], [price], [unit], [isDeleted], [deleted_at], [deleted_by], [created_at], [created_by], [updated_at], [updated_by], [CatalogesId]) VALUES (84, N'Bánh Tiramisu', N'869a748e-95e5-4467-87e2-04d32962bc19_resize_tira1x1eb865751a24e4520be32a56129dd7a2dmaster.jpg', CAST(29000 AS Decimal(8, 0)), N'dĩa', 0, NULL, NULL, CAST(N'2020-05-20T15:11:50.710' AS DateTime), N'dan', NULL, NULL, 13)
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
/****** Object:  StoredProcedure [dbo].[AddBill]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddBillDetail]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddCataloges]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[addImage]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddProducts]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditBill]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditCataloges]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditProducts]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllBills]    Script Date: 5/26/2020 5:07:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllBills]
AS
BEGIN
    SELECT [id], [total_money], [created_by] ,[note], FORMAT ([time_payment], 'dd-MM-yyyy HH:mm:ss') AS time_payment
	FROM [Bills]  WHERE [isDeleted] = 0
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllBillsByDate]    Script Date: 5/26/2020 5:07:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllBillsByDate]
@StartDate nvarchar(100),
@EndDate nvarchar(100)
AS
BEGIN
    SELECT [id], [total_money], [created_by] ,[note], FORMAT ([time_payment], 'dd-MM-yyyy HH:mm:ss') AS time_payment
	FROM [Bills]  WHERE [isDeleted] = 0 AND CAST(time_payment as DATE) BETWEEN @StartDate AND @EndDate
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllCataloges]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllProductsByCataloges]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetBillDetailsByBill]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetChart7Day]    Script Date: 5/26/2020 5:07:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetChart7Day]
AS
BEGIN
    SELECT total_money FROM Bills WHERE CAST(time_payment as DATE) BETWEEN DATEADD(DD,-7,GETDATE()) AND GETDATE() AND isDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveCataloges]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RemoveProducts]    Script Date: 5/26/2020 5:07:14 PM ******/
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
/****** Object:  StoredProcedure [dbo].[test]    Script Date: 5/26/2020 5:07:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test]
@name nvarchar(100)
AS
BEGIN
    SELECT
        [id], [name]
    FROM
        [Cataloges]
   WHERE [name] LIKE N'%' +@name+'%'
END;
GO
/****** Object:  StoredProcedure [dbo].[test2]    Script Date: 5/26/2020 5:07:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test2]
  @total decimal(8,0),
  @created_by nvarchar(100),
  @price decimal(8,0),
  @quantity int,
  @ProductsId int
AS
BEGIN
    SET NOCOUNT ON;
	INSERT INTO [dbo].[BillDetails]
           ([price],[quantity],[total],[BillsId],[ProductsId],[isDeleted],[created_at],[created_by])
     VALUES
           (@price,@quantity,@total,15,@ProductsId,0,GETDATE(),@created_by)			
END
GO
USE [master]
GO
ALTER DATABASE [Coffee] SET  READ_WRITE 
GO
