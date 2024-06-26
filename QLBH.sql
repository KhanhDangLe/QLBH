USE [master]
GO
CREATE DATABASE [D:\SPMARKETMGMT.MDF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'spMarketmgmt', FILENAME = N'D:\spMarketmgmt.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'spMarketmgmt_log', FILENAME = N'D:\spMarketmgmt_log.ldf' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)

/****** Object:  Table [dbo].[Employees]    Script Date: 4/1/2024 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[Sex] [nchar](10) NULL,
	[IDCard] [int] NULL,
	[Address] [nvarchar](50) NULL,
	[Tel] [nchar](10) NULL,
	[Username] [nchar](10) NULL,
	[Password] [nchar](10) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InOrderDetail]    Script Date: 4/1/2024 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InOrderDetail](
	[InOrderID] [int] NOT NULL,
	[ProductID] [char](6) NOT NULL,
	[Quantity] [int] NULL,
	[ProductInPrice] [float] NULL,
 CONSTRAINT [PK_InOrderDetail] PRIMARY KEY CLUSTERED 
(
	[InOrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InOrders]    Script Date: 4/1/2024 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InOrders](
	[InOrderID] [int] IDENTITY(1,1) NOT NULL,
	[InDate] [datetime] NULL,
	[ProviderID] [int] NULL,
	[Notes] [nvarchar](max) NULL,
	[EmployeeID] [int] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_InOrders] PRIMARY KEY CLUSTERED 
(
	[InOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/1/2024 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [char](6) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[TypeID] [int] NULL,
	[UnitCalc] [nchar](10) NULL,
	[sellPrice] [float] NULL,
	[totalImport] [float] NULL,
	[totalSell] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 4/1/2024 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[ProviderID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Tel] [nchar](10) NULL,
 CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellOrderDetail]    Script Date: 4/1/2024 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellOrderDetail](
	[SellOrderID] [int] NOT NULL,
	[ProductID] [char](6) NOT NULL,
	[Quantity] [int] NULL,
	[productPrice] [float] NULL,
	[totalProducts] [float] NULL,
 CONSTRAINT [PK_SellOrderDetail] PRIMARY KEY CLUSTERED 
(
	[SellOrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellOrders]    Script Date: 4/1/2024 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellOrders](
	[SellOrderID] [int] IDENTITY(1,1) NOT NULL,
	[SellDate] [datetime] NULL,
	[Total] [float] NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_SellOrders] PRIMARY KEY CLUSTERED 
(
	[SellOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 4/1/2024 2:09:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [Title], [DateOfBirth], [Sex], [IDCard], [Address], [Tel], [Username], [Password]) VALUES (37, NULL, N'Quan Ly', NULL, NULL, NULL, NULL, NULL, N'1         ', N'2         ')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [Title], [DateOfBirth], [Sex], [IDCard], [Address], [Tel], [Username], [Password]) VALUES (38, N'2', N'Nhan vien', CAST(N'2024-03-18T00:00:00.000' AS DateTime), N'Male      ', 2, N'2', N'2         ', N'2         ', N'2         ')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [Title], [DateOfBirth], [Sex], [IDCard], [Address], [Tel], [Username], [Password]) VALUES (39, N'3', N'Nhan vien', CAST(N'2024-03-30T00:00:00.000' AS DateTime), N'Male      ', 3, N'3', N'3         ', N'3         ', N'3         ')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
INSERT [dbo].[Products] ([ProductID], [Name], [TypeID], [UnitCalc], [sellPrice], [totalImport], [totalSell]) VALUES (N'SP0001', N'1', 41, N'1         ', 1000, 0, 2)
INSERT [dbo].[Products] ([ProductID], [Name], [TypeID], [UnitCalc], [sellPrice], [totalImport], [totalSell]) VALUES (N'SP0002', N'a1', 41, N'cai       ', 4000, 0, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [TypeID], [UnitCalc], [sellPrice], [totalImport], [totalSell]) VALUES (N'SP0003', N'a2', 41, N'cai       ', 1000, 0, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [TypeID], [UnitCalc], [sellPrice], [totalImport], [totalSell]) VALUES (N'SP0004', N'a3', 41, N'cai       ', 1000, 0, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [TypeID], [UnitCalc], [sellPrice], [totalImport], [totalSell]) VALUES (N'SP0005', N'c2', 42, N'cai       ', 1000, 0, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [TypeID], [UnitCalc], [sellPrice], [totalImport], [totalSell]) VALUES (N'SP0006', N'c3', 42, N'cai       ', 1000, 0, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [TypeID], [UnitCalc], [sellPrice], [totalImport], [totalSell]) VALUES (N'SP0007', N'c4', 42, N'cai       ', 1000, 0, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [TypeID], [UnitCalc], [sellPrice], [totalImport], [totalSell]) VALUES (N'SP0009', N's222', 42, N'cai       ', 1000, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Providers] ON 

INSERT [dbo].[Providers] ([ProviderID], [Name], [Address], [Tel]) VALUES (9, N'1', N'ac', N'12345     ')
INSERT [dbo].[Providers] ([ProviderID], [Name], [Address], [Tel]) VALUES (11, N'2', N'2222', N'222222    ')
INSERT [dbo].[Providers] ([ProviderID], [Name], [Address], [Tel]) VALUES (13, N'3', N'333333333', N'33333     ')
SET IDENTITY_INSERT [dbo].[Providers] OFF
GO
INSERT [dbo].[SellOrderDetail] ([SellOrderID], [ProductID], [Quantity], [productPrice], [totalProducts]) VALUES (36, N'SP0001', 1, 1000, NULL)
INSERT [dbo].[SellOrderDetail] ([SellOrderID], [ProductID], [Quantity], [productPrice], [totalProducts]) VALUES (37, N'SP0001', 1, 1000, NULL)
GO
SET IDENTITY_INSERT [dbo].[SellOrders] ON 

INSERT [dbo].[SellOrders] ([SellOrderID], [SellDate], [Total], [EmployeeID]) VALUES (36, CAST(N'2024-03-29T16:17:51.357' AS DateTime), 1000, 37)
INSERT [dbo].[SellOrders] ([SellOrderID], [SellDate], [Total], [EmployeeID]) VALUES (37, CAST(N'2024-03-29T16:19:56.997' AS DateTime), 1000, 37)
SET IDENTITY_INSERT [dbo].[SellOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([TypeID], [Name]) VALUES (41, N'123abc')
INSERT [dbo].[Types] ([TypeID], [Name]) VALUES (42, N'chungloai2')
SET IDENTITY_INSERT [dbo].[Types] OFF
GO
ALTER TABLE [dbo].[InOrders] ADD  CONSTRAINT [DF_InOrders_InDate]  DEFAULT (getdate()) FOR [InDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductID]  DEFAULT ((0)) FOR [ProductID]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_sellPrice]  DEFAULT ((0)) FOR [sellPrice]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_totalImport]  DEFAULT ((0)) FOR [totalImport]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_totalSell]  DEFAULT ((0)) FOR [totalSell]
GO
ALTER TABLE [dbo].[SellOrders] ADD  CONSTRAINT [DF_SellOrders_SellDate]  DEFAULT (getdate()) FOR [SellDate]
GO
ALTER TABLE [dbo].[InOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_InOrderDetail_InOrders] FOREIGN KEY([InOrderID])
REFERENCES [dbo].[InOrders] ([InOrderID])
GO
ALTER TABLE [dbo].[InOrderDetail] CHECK CONSTRAINT [FK_InOrderDetail_InOrders]
GO
ALTER TABLE [dbo].[InOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_InOrderDetail_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[InOrderDetail] CHECK CONSTRAINT [FK_InOrderDetail_Products]
GO
ALTER TABLE [dbo].[InOrders]  WITH CHECK ADD  CONSTRAINT [FK_InOrders_Providers] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Providers] ([ProviderID])
GO
ALTER TABLE [dbo].[InOrders] CHECK CONSTRAINT [FK_InOrders_Providers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Types1] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Types] ([TypeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Types1]
GO
ALTER TABLE [dbo].[SellOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SellOrderDetail_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[SellOrderDetail] CHECK CONSTRAINT [FK_SellOrderDetail_Products]
GO
ALTER TABLE [dbo].[SellOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_SellOrderDetail_SellOrders] FOREIGN KEY([SellOrderID])
REFERENCES [dbo].[SellOrders] ([SellOrderID])
GO
ALTER TABLE [dbo].[SellOrderDetail] CHECK CONSTRAINT [FK_SellOrderDetail_SellOrders]
GO
ALTER TABLE [dbo].[SellOrders]  WITH CHECK ADD  CONSTRAINT [FK_SellOrders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[SellOrders] CHECK CONSTRAINT [FK_SellOrders_Employees]
GO
USE [master]
GO
ALTER DATABASE [D:\TMPDATN\QLBH\SPMARKETMGMT.MDF] SET  READ_WRITE 
GO
