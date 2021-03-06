USE [master]
GO
/****** Object:  Database [ISKCON_BOOK_STORE_DB]    Script Date: 12-May-19 7:06:15 PM ******/
CREATE DATABASE [ISKCON_BOOK_STORE_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ISKCON_BOOK_STORE_DB', FILENAME = N'D:\ISKCON_BOOK_STORE_DB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ISKCON_BOOK_STORE_DB_log', FILENAME = N'D:\ISKCON_BOOK_STORE_DB_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ISKCON_BOOK_STORE_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET  MULTI_USER 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ISKCON_BOOK_STORE_DB]
GO
/****** Object:  Table [dbo].[BookTable]    Script Date: 12-May-19 7:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookTable](
	[BookName] [varchar](50) NOT NULL,
	[PublisherID] [int] NOT NULL,
	[CostingPrice] [float] NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_BookTable] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerBookTable]    Script Date: 12-May-19 7:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerBookTable](
	[CustomerBookID] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [varchar](50) NOT NULL,
	[Publisher] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[GrossAmount] [float] NOT NULL,
	[NetAmount] [float] NOT NULL,
	[InvoiceID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerBookTable1] PRIMARY KEY CLUSTERED 
(
	[CustomerBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerTable]    Script Date: 12-May-19 7:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerTable](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[CustomerCellNo] [varchar](50) NOT NULL,
	[Address] [varchar](100) NULL,
 CONSTRAINT [PK_CustomerTable] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DamageTable]    Script Date: 12-May-19 7:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DamageTable](
	[BookName] [varchar](50) NULL,
	[CostingPrice] [float] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[Date] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceTable]    Script Date: 12-May-19 7:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceTable](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[InvoiceDate] [date] NULL,
	[InvoiceNo] [int] NULL,
	[InvoiceCreator] [varchar](50) NULL,
	[TotalAmount] [float] NULL,
	[Paid] [float] NULL,
	[Due] [float] NULL,
 CONSTRAINT [PK_InvoiceTable] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PublisherTable]    Script Date: 12-May-19 7:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PublisherTable](
	[PublisherID] [int] NOT NULL,
	[PublisherName] [varchar](50) NULL,
 CONSTRAINT [PK_PublisherTable] PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseEntryTable]    Script Date: 12-May-19 7:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseEntryTable](
	[SuplierName] [varchar](50) NULL,
	[BookName] [varchar](50) NULL,
	[Publisher] [varchar](50) NULL,
	[Price] [float] NULL,
	[CostingPrice] [float] NULL,
	[Quantity] [int] NULL,
	[RQuantity] [int] NULL,
	[NewPrice] [float] NULL,
	[NewCostingPrice] [float] NULL,
	[OGAmount] [float] NULL,
	[GAmount] [float] NULL,
	[Date] [date] NULL,
	[OcostingAmount] [float] NULL,
	[NGAmount] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegisterTable]    Script Date: 12-May-19 7:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterTable](
	[UserName] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](14) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NULL,
 CONSTRAINT [PK_RegisterTable_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesReturnTable]    Script Date: 12-May-19 7:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesReturnTable](
	[InvoiceNo] [int] NULL,
	[CustomerName] [varchar](50) NULL,
	[ReturnType] [varchar](50) NULL,
	[BookName] [varchar](50) NULL,
	[ReturnQuantity] [int] NULL,
	[PurchaseDate] [date] NULL,
	[ReturnDate] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TemporalyPurchaseEntryTable]    Script Date: 12-May-19 7:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TemporalyPurchaseEntryTable](
	[BookName] [varchar](50) NULL,
	[Publisher] [varchar](50) NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[RQuantity] [int] NULL,
	[NewPrice] [float] NULL,
	[OGAmount] [float] NULL,
	[GAmount] [float] NULL,
	[Date] [date] NULL,
	[CostingPrice] [float] NULL,
	[OcostingAmount] [float] NULL,
	[NewCostingPrice] [float] NULL,
	[NGAmount] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TemporalySalesReturnTable]    Script Date: 12-May-19 7:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TemporalySalesReturnTable](
	[InvoiceNo] [int] NULL,
	[CustomerName] [varchar](50) NULL,
	[BookName] [varchar](50) NULL,
	[Price] [float] NULL,
	[ReturnQuantity] [int] NULL,
	[ReturnType] [varchar](50) NULL,
	[StockBook] [int] NULL,
	[PurchaseDate] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TemporarlyTable]    Script Date: 12-May-19 7:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TemporarlyTable](
	[BookName] [varchar](50) NULL,
	[Publisher] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[GA] [float] NULL,
	[Discount] [float] NULL,
	[NA] [float] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CT_CBT_BT_PT_RT_View]    Script Date: 12-May-19 7:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CT_CBT_BT_PT_RT_View]
AS
SELECT dbo.CustomerTable.InvoiceNo, dbo.CustomerTable.CustomerName, dbo.CustomerTable.CustomerCellNo, dbo.CustomerTable.Date, dbo.CustomerBookTable.Quantity, dbo.CustomerBookTable.Discount, dbo.CustomerBookTable.Price, 
                  dbo.CustomerBookTable.BookName, dbo.PublisherTable.PublisherName, dbo.RegisterTable.FullName, dbo.CustomerTable.Address, dbo.CustomerTable.TotalAmount, dbo.CustomerTable.Paid AS Expr1, 
                  dbo.CustomerTable.Due AS Expr2
FROM     dbo.CustomerTable INNER JOIN
                  dbo.CustomerBookTable ON dbo.CustomerTable.CustomerBookID = dbo.CustomerBookTable.CustomerBookID INNER JOIN
                  dbo.BookTable ON dbo.CustomerBookTable.BookID = dbo.BookTable.BookID INNER JOIN
                  dbo.PublisherTable ON dbo.BookTable.PublisherID = dbo.PublisherTable.PublisherID AND dbo.BookTable.PublisherID = dbo.PublisherTable.PublisherID INNER JOIN
                  dbo.RegisterTable ON dbo.BookTable.UserID = dbo.RegisterTable.UserID

GO
/****** Object:  View [dbo].[TransectionINFO]    Script Date: 12-May-19 7:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Delete 
from InvoiceTable;
Delete 
from CustomerTable;
Delete 
from CustomerBookTable;*/
CREATE VIEW [dbo].[TransectionINFO]
AS
SELECT dbo.CustomerTable.CustomerName, dbo.CustomerTable.CustomerCellNo, dbo.CustomerTable.Address, dbo.InvoiceTable.InvoiceNo, dbo.InvoiceTable.InvoiceDate, dbo.CustomerBookTable.BookName, dbo.CustomerBookTable.Publisher, 
                  dbo.CustomerBookTable.Quantity, dbo.CustomerBookTable.Price, dbo.CustomerBookTable.GrossAmount, dbo.CustomerBookTable.Discount, dbo.CustomerBookTable.NetAmount, dbo.InvoiceTable.TotalAmount, dbo.InvoiceTable.Paid, 
                  dbo.InvoiceTable.Due, dbo.InvoiceTable.InvoiceCreator
FROM     dbo.CustomerTable INNER JOIN
                  dbo.InvoiceTable ON dbo.CustomerTable.CustomerID = dbo.InvoiceTable.CustomerID INNER JOIN
                  dbo.CustomerBookTable ON dbo.InvoiceTable.InvoiceID = dbo.CustomerBookTable.InvoiceID

GO
ALTER TABLE [dbo].[CustomerBookTable]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBookTable_InvoiceTable1] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[InvoiceTable] ([InvoiceID])
GO
ALTER TABLE [dbo].[CustomerBookTable] CHECK CONSTRAINT [FK_CustomerBookTable_InvoiceTable1]
GO
ALTER TABLE [dbo].[InvoiceTable]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceTable_InvoiceTable] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerTable] ([CustomerID])
GO
ALTER TABLE [dbo].[InvoiceTable] CHECK CONSTRAINT [FK_InvoiceTable_InvoiceTable]
GO
ALTER TABLE [dbo].[RegisterTable]  WITH CHECK ADD  CONSTRAINT [FK_RegisterTable_BookTable] FOREIGN KEY([BookID])
REFERENCES [dbo].[BookTable] ([BookID])
GO
ALTER TABLE [dbo].[RegisterTable] CHECK CONSTRAINT [FK_RegisterTable_BookTable]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[32] 2[24] 3) )"
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
         Begin Table = "CustomerBookTable"
            Begin Extent = 
               Top = 7
               Left = 303
               Bottom = 311
               Right = 506
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BookTable"
            Begin Extent = 
               Top = 7
               Left = 554
               Bottom = 241
               Right = 797
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PublisherTable"
            Begin Extent = 
               Top = 0
               Left = 828
               Bottom = 119
               Right = 1023
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RegisterTable"
            Begin Extent = 
               Top = 124
               Left = 829
               Bottom = 332
               Right = 1023
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CustomerTable"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 313
               Right = 255
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
         Width = 1596
         Width = 1680
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CT_CBT_BT_PT_RT_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Alias = 900
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CT_CBT_BT_PT_RT_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CT_CBT_BT_PT_RT_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[72] 4[3] 2[24] 3) )"
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
         Begin Table = "CustomerTable"
            Begin Extent = 
               Top = 240
               Left = 84
               Bottom = 471
               Right = 318
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InvoiceTable"
            Begin Extent = 
               Top = 166
               Left = 351
               Bottom = 419
               Right = 545
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CustomerBookTable"
            Begin Extent = 
               Top = 3
               Left = 85
               Bottom = 235
               Right = 317
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TransectionINFO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TransectionINFO'
GO
USE [master]
GO
ALTER DATABASE [ISKCON_BOOK_STORE_DB] SET  READ_WRITE 
GO
