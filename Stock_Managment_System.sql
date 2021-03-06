USE [master]
GO
/****** Object:  Database [StockMS_DB]    Script Date: 06-Sep-18 9:36:36 PM ******/
CREATE DATABASE [StockMS_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockMS_DB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StockMS_DB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockMS_DB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StockMS_DB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockMS_DB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockMS_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockMS_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockMS_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockMS_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockMS_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockMS_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockMS_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockMS_DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StockMS_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockMS_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockMS_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockMS_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockMS_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockMS_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockMS_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockMS_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockMS_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockMS_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockMS_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockMS_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockMS_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockMS_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockMS_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockMS_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockMS_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockMS_DB] SET  MULTI_USER 
GO
ALTER DATABASE [StockMS_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockMS_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockMS_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockMS_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StockMS_DB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 06-Sep-18 9:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 06-Sep-18 9:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 06-Sep-18 9:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](50) NOT NULL,
	[ReorderLevel] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[AvailableQuantity] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoginUser]    Script Date: 06-Sep-18 9:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginUser](
	[LoginUserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[LoginUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockIn]    Script Date: 06-Sep-18 9:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockIn](
	[StockInId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[StockInQuantity] [int] NOT NULL,
	[StockInTime] [datetime] NOT NULL,
 CONSTRAINT [PK_StockIn] PRIMARY KEY CLUSTERED 
(
	[StockInId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockOut]    Script Date: 06-Sep-18 9:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockOut](
	[StockOutId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[StockOutQuantity] [int] NOT NULL,
	[StockOutTypeId] [int] NOT NULL,
	[StockOutTime] [datetime] NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_StockOut] PRIMARY KEY CLUSTERED 
(
	[StockOutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockOutputs]    Script Date: 06-Sep-18 9:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockOutputs](
	[StockOutId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[StockOutQunatity] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_StockOutputs] PRIMARY KEY CLUSTERED 
(
	[StockOutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockOutType]    Script Date: 06-Sep-18 9:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockOutType](
	[StockOutTypeId] [int] IDENTITY(1,1) NOT NULL,
	[StockOutTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StockOutType] PRIMARY KEY CLUSTERED 
(
	[StockOutTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserEntryLog]    Script Date: 06-Sep-18 9:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserEntryLog](
	[UserEntryId] [int] IDENTITY(1,1) NOT NULL,
	[LogInUserId] [int] NOT NULL,
	[EntryType] [nvarchar](50) NOT NULL,
	[LogInOutTime] [datetime] NOT NULL,
 CONSTRAINT [PK_UserEntryLog] PRIMARY KEY CLUSTERED 
(
	[UserEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ShowAllItem]    Script Date: 06-Sep-18 9:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ShowAllItem]
AS
SELECT dbo.Item.ItemName, dbo.Item.ReorderLevel, dbo.Category.CategoryName, dbo.Company.CompanyName, dbo.Item.AvailableQuantity, dbo.Category.CategoryId, dbo.Company.CompanyId
FROM     dbo.Item INNER JOIN
                  dbo.Category ON dbo.Category.CategoryId = dbo.Item.CategoryId INNER JOIN
                  dbo.Company ON dbo.Company.CompanyId = dbo.Item.CompanyId

GO
/****** Object:  View [dbo].[StockOutputsRelation]    Script Date: 06-Sep-18 9:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StockOutputsRelation]
AS
SELECT dbo.StockOutputs.StockOutQunatity, dbo.Item.ItemName, dbo.Company.CompanyName, dbo.Item.ItemId, dbo.Company.CompanyId
FROM     dbo.StockOutputs INNER JOIN
                  dbo.Item ON dbo.StockOutputs.ItemId = dbo.Item.ItemId INNER JOIN
                  dbo.Company ON dbo.Item.CompanyId = dbo.Company.CompanyId

GO
/****** Object:  View [dbo].[StockOutRelation]    Script Date: 06-Sep-18 9:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StockOutRelation]
AS
SELECT dbo.Company.CompanyName, dbo.Item.ItemName, dbo.StockOut.StockOutQuantity, dbo.StockOut.StockOutTime, dbo.StockOut.StockOutTypeId
FROM     dbo.Company INNER JOIN
                  dbo.Item ON dbo.Company.CompanyId = dbo.Item.CompanyId INNER JOIN
                  dbo.StockOut ON dbo.Item.ItemId = dbo.StockOut.ItemId

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (30, N'bb')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (28, N'Cloths')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (23, N'Cosmetics')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (24, N'Electronics')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (26, N'Furniture')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (25, N'Kitchen Items')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (29, N'kk')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (27, N'Products')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (22, N'Stationary')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyId], [CompanyName]) VALUES (13, N'Blue Barry')
INSERT [dbo].[Company] ([CompanyId], [CompanyName]) VALUES (12, N'Nova')
INSERT [dbo].[Company] ([CompanyId], [CompanyName]) VALUES (15, N'pran')
INSERT [dbo].[Company] ([CompanyId], [CompanyName]) VALUES (14, N'Raymond')
INSERT [dbo].[Company] ([CompanyId], [CompanyName]) VALUES (10, N'RFL')
INSERT [dbo].[Company] ([CompanyId], [CompanyName]) VALUES (9, N'Unilever')
INSERT [dbo].[Company] ([CompanyId], [CompanyName]) VALUES (11, N'Walton')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (43, N'Oil', 11, 23, 9, 25)
INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (44, N'Powder', 22, 23, 9, 25)
INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (45, N'Crem', 33, 23, 9, 25)
INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (46, N'WM101', 44, 24, 11, 0)
INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (47, N'WM202', 55, 24, 11, 0)
INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (48, N'WM303', 66, 24, 11, 0)
INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (49, N'Reading Table', 77, 22, 10, 15)
INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (50, N'Computer Table', 88, 22, 10, 5)
INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (51, N'Drawing Table', 88, 22, 10, 40)
INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (52, N'Glass Cliner', 99, 25, 9, 30)
INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (53, N'Pen', 101, 22, 13, 0)
INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (54, N'Note Book', 110, 22, 13, 3)
INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (55, N'Stack', 111, 26, 10, 200)
INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (56, N'jouice', 5, 30, 15, 30)
INSERT [dbo].[Item] ([ItemId], [ItemName], [ReorderLevel], [CategoryId], [CompanyId], [AvailableQuantity]) VALUES (57, N'coldrings', 3, 30, 15, 0)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[StockIn] ON 

INSERT [dbo].[StockIn] ([StockInId], [ItemId], [StockInQuantity], [StockInTime]) VALUES (11, 49, 20, CAST(0x0000A94900000000 AS DateTime))
INSERT [dbo].[StockIn] ([StockInId], [ItemId], [StockInQuantity], [StockInTime]) VALUES (12, 50, 20, CAST(0x0000A94900000000 AS DateTime))
INSERT [dbo].[StockIn] ([StockInId], [ItemId], [StockInQuantity], [StockInTime]) VALUES (13, 51, 20, CAST(0x0000A94900000000 AS DateTime))
INSERT [dbo].[StockIn] ([StockInId], [ItemId], [StockInQuantity], [StockInTime]) VALUES (14, 44, 30, CAST(0x0000A94900000000 AS DateTime))
INSERT [dbo].[StockIn] ([StockInId], [ItemId], [StockInQuantity], [StockInTime]) VALUES (15, 43, 30, CAST(0x0000A94900000000 AS DateTime))
INSERT [dbo].[StockIn] ([StockInId], [ItemId], [StockInQuantity], [StockInTime]) VALUES (16, 45, 30, CAST(0x0000A94900000000 AS DateTime))
INSERT [dbo].[StockIn] ([StockInId], [ItemId], [StockInQuantity], [StockInTime]) VALUES (17, 52, 25, CAST(0x0000A94900000000 AS DateTime))
INSERT [dbo].[StockIn] ([StockInId], [ItemId], [StockInQuantity], [StockInTime]) VALUES (18, 51, 50, CAST(0x0000A94900000000 AS DateTime))
INSERT [dbo].[StockIn] ([StockInId], [ItemId], [StockInQuantity], [StockInTime]) VALUES (19, 44, 30, CAST(0x0000A94900000000 AS DateTime))
INSERT [dbo].[StockIn] ([StockInId], [ItemId], [StockInQuantity], [StockInTime]) VALUES (20, 54, 30, CAST(0x0000A94A00000000 AS DateTime))
INSERT [dbo].[StockIn] ([StockInId], [ItemId], [StockInQuantity], [StockInTime]) VALUES (21, 55, 500, CAST(0x0000A94A00000000 AS DateTime))
INSERT [dbo].[StockIn] ([StockInId], [ItemId], [StockInQuantity], [StockInTime]) VALUES (22, 49, 15, CAST(0x0000A94B00CDF9B0 AS DateTime))
INSERT [dbo].[StockIn] ([StockInId], [ItemId], [StockInQuantity], [StockInTime]) VALUES (25, 52, 30, CAST(0x0000A94B00CF19F8 AS DateTime))
INSERT [dbo].[StockIn] ([StockInId], [ItemId], [StockInQuantity], [StockInTime]) VALUES (26, 56, 60, CAST(0x0000A94B00CD2594 AS DateTime))
SET IDENTITY_INSERT [dbo].[StockIn] OFF
SET IDENTITY_INSERT [dbo].[StockOut] ON 

INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (52, 44, 25, 1, CAST(0x0000A94900000000 AS DateTime), 9)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (53, 50, 10, 1, CAST(0x0000A94900000000 AS DateTime), 10)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (54, 49, 5, 1, CAST(0x0000A94900000000 AS DateTime), 10)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (55, 50, 5, 2, CAST(0x0000A94900000000 AS DateTime), 10)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (56, 44, 3, 3, CAST(0x0000A94900000000 AS DateTime), 9)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (57, 44, 2, 3, CAST(0x0000A94900000000 AS DateTime), 9)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (58, 54, 25, 3, CAST(0x0000A94A00000000 AS DateTime), 13)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (59, 54, 2, 1, CAST(0x0000A94A00000000 AS DateTime), 13)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (60, 55, 100, 1, CAST(0x0000A94A00000000 AS DateTime), 10)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (61, 55, 100, 1, CAST(0x0000A94A00000000 AS DateTime), 10)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (62, 55, 100, 1, CAST(0x0000A94A00000000 AS DateTime), 10)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (63, 44, 5, 1, CAST(0x0000A94A00000000 AS DateTime), 9)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (64, 45, 5, 3, CAST(0x0000A94A00000000 AS DateTime), 9)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (65, 52, 5, 3, CAST(0x0000A94A00000000 AS DateTime), 9)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (66, 43, 5, 1, CAST(0x0000A94A00000000 AS DateTime), 9)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (67, 55, 100, 1, CAST(0x0000A94A00000000 AS DateTime), 10)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (68, 51, 10, 1, CAST(0x0000A94A00000000 AS DateTime), 10)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (69, 56, 10, 1, CAST(0x0000A94B00CD9998 AS DateTime), 15)
INSERT [dbo].[StockOut] ([StockOutId], [ItemId], [StockOutQuantity], [StockOutTypeId], [StockOutTime], [CompanyId]) VALUES (70, 56, 20, 1, CAST(0x0000A94B00000000 AS DateTime), 15)
SET IDENTITY_INSERT [dbo].[StockOut] OFF
SET IDENTITY_INSERT [dbo].[StockOutType] ON 

INSERT [dbo].[StockOutType] ([StockOutTypeId], [StockOutTypeName]) VALUES (2, N'Damage')
INSERT [dbo].[StockOutType] ([StockOutTypeId], [StockOutTypeName]) VALUES (3, N'Lost')
INSERT [dbo].[StockOutType] ([StockOutTypeId], [StockOutTypeName]) VALUES (1, N'Sell')
SET IDENTITY_INSERT [dbo].[StockOutType] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Category]    Script Date: 06-Sep-18 9:36:37 PM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [IX_Category] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Company]    Script Date: 06-Sep-18 9:36:37 PM ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [IX_Company] UNIQUE NONCLUSTERED 
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Item]    Script Date: 06-Sep-18 9:36:37 PM ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [IX_Item] UNIQUE NONCLUSTERED 
(
	[ItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_StockOutType]    Script Date: 06-Sep-18 9:36:37 PM ******/
ALTER TABLE [dbo].[StockOutType] ADD  CONSTRAINT [IX_StockOutType] UNIQUE NONCLUSTERED 
(
	[StockOutTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Company]
GO
ALTER TABLE [dbo].[StockIn]  WITH CHECK ADD  CONSTRAINT [FK_StockIn_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[StockIn] CHECK CONSTRAINT [FK_StockIn_Item]
GO
ALTER TABLE [dbo].[StockOut]  WITH CHECK ADD  CONSTRAINT [FK_StockOut_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[StockOut] CHECK CONSTRAINT [FK_StockOut_Item]
GO
ALTER TABLE [dbo].[StockOut]  WITH CHECK ADD  CONSTRAINT [FK_StockOut_StockOutType] FOREIGN KEY([StockOutTypeId])
REFERENCES [dbo].[StockOutType] ([StockOutTypeId])
GO
ALTER TABLE [dbo].[StockOut] CHECK CONSTRAINT [FK_StockOut_StockOutType]
GO
ALTER TABLE [dbo].[UserEntryLog]  WITH CHECK ADD  CONSTRAINT [FK_UserEntryLog_User] FOREIGN KEY([LogInUserId])
REFERENCES [dbo].[LoginUser] ([LoginUserId])
GO
ALTER TABLE [dbo].[UserEntryLog] CHECK CONSTRAINT [FK_UserEntryLog_User]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Item"
            Begin Extent = 
               Top = 50
               Left = 503
               Bottom = 310
               Right = 697
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Category"
            Begin Extent = 
               Top = 66
               Left = 279
               Bottom = 185
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Company"
            Begin Extent = 
               Top = 67
               Left = 728
               Bottom = 186
               Right = 926
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ShowAllItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ShowAllItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[6] 2[34] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "StockOutputs"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item"
            Begin Extent = 
               Top = 7
               Left = 307
               Bottom = 170
               Right = 501
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Company"
            Begin Extent = 
               Top = 7
               Left = 549
               Bottom = 126
               Right = 747
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StockOutputsRelation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StockOutputsRelation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[13] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Company"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item"
            Begin Extent = 
               Top = 7
               Left = 294
               Bottom = 242
               Right = 488
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StockOut"
            Begin Extent = 
               Top = 7
               Left = 536
               Bottom = 246
               Right = 747
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StockOutRelation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StockOutRelation'
GO
USE [master]
GO
ALTER DATABASE [StockMS_DB] SET  READ_WRITE 
GO
