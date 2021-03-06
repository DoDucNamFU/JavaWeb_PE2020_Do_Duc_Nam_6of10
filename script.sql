USE [master]
GO
/****** Object:  Database [CoffeeStore]    Script Date: 8/16/2020 11:11:51 PM ******/
CREATE DATABASE [CoffeeStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoffeeStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CoffeeStore.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CoffeeStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CoffeeStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CoffeeStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoffeeStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoffeeStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoffeeStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoffeeStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoffeeStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoffeeStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoffeeStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoffeeStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoffeeStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoffeeStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoffeeStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoffeeStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoffeeStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoffeeStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoffeeStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoffeeStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CoffeeStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoffeeStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoffeeStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoffeeStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoffeeStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoffeeStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoffeeStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoffeeStore] SET RECOVERY FULL 
GO
ALTER DATABASE [CoffeeStore] SET  MULTI_USER 
GO
ALTER DATABASE [CoffeeStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoffeeStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoffeeStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoffeeStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CoffeeStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CoffeeStore', N'ON'
GO
USE [CoffeeStore]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 8/16/2020 11:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[id] [int] NOT NULL,
	[productID] [varchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[orderID] [int] NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 8/16/2020 11:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] NOT NULL,
	[userPhone] [char](10) NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[totalMoney] [float] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 8/16/2020 11:11:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [char](5) NOT NULL,
	[productName] [varchar](50) NOT NULL,
	[description] [varchar](500) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblOrders] ([orderID], [userPhone], [orderDate], [totalMoney], [status]) VALUES (11, N'11        ', CAST(N'2020-11-05 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userPhone], [orderDate], [totalMoney], [status]) VALUES (22, N'22        ', CAST(N'2020-12-05 00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [price], [quantity], [status]) VALUES (N'1    ', N'1', N'1', 1, 1, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [price], [quantity], [status]) VALUES (N'2    ', N'2', N'2', 2, 22, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [price], [quantity], [status]) VALUES (N'3    ', N'3', N'3', 3, 33, 0)
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrders]
GO
USE [master]
GO
ALTER DATABASE [CoffeeStore] SET  READ_WRITE 
GO
