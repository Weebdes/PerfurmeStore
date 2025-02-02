USE [master]
GO
/****** Object:  Database [PRN221]    Script Date: 19/03/2023 21:29:17 ******/
CREATE DATABASE [PRN221]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN221].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRN221] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRN221] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRN221] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRN221] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRN221] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRN221] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRN221] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRN221] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRN221] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRN221] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRN221] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRN221] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRN221] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRN221] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRN221] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRN221] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRN221] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRN221] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRN221] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRN221] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRN221] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRN221] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRN221] SET RECOVERY FULL 
GO
ALTER DATABASE [PRN221] SET  MULTI_USER 
GO
ALTER DATABASE [PRN221] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRN221] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRN221] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRN221] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRN221] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRN221] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRN221', N'ON'
GO
ALTER DATABASE [PRN221] SET QUERY_STORE = OFF
GO
USE [PRN221]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 19/03/2023 21:29:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 19/03/2023 21:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 19/03/2023 21:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](32) NOT NULL,
	[Password] [varchar](32) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[FirstName] [nvarchar](10) NULL,
	[LastName] [nvarchar](10) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [varchar](10) NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 19/03/2023 21:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CounpID] [int] NULL,
	[Total] [decimal](18, 0) NOT NULL,
	[OrderStatus] [nvarchar](50) NOT NULL,
	[IsPaid] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 19/03/2023 21:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ShippingAddress] [nvarchar](100) NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[TotalPrice] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19/03/2023 21:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (1, N'Chanel')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (2, N'Gucci')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (3, N'Versace')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (4, N'Burberry')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (5, N'Bvlgari')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (6, N'Giorgio Armani')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (7, N'Dior')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (8, N'Dolce & Gabbana')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (9, N'Tom Ford')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (10, N'Prada')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (11, N'Yves Saint Laurent')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (12, N'Tom Ford')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (13, N'Calvin Klein')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (14, N'Marc Jacobs')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (15, N'Hermes')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (16, N'Lancôme')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [FirstName], [LastName], [Address], [Phone], [IsAdmin]) VALUES (1, N'ThuNguyen', N'123@', N'nguyenthu@gmail.com', N'Thu', N'Nguyen', N'Thai Binh', N'0984839844', 0)
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [FirstName], [LastName], [Address], [Phone], [IsAdmin]) VALUES (3, N'Seller', N'111@', N'seller@gmail.com', N'Hiep', N'Nguyen', N'Ha Noi', N'0938212323', 1)
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [FirstName], [LastName], [Address], [Phone], [IsAdmin]) VALUES (5, N'Tomy', N'123@', N'tommy@gmail.com', N'Tommy', N'William', N'Long bien', N'0998883212', 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [CustomerID], [CreateDate], [CounpID], [Total], [OrderStatus], [IsPaid]) VALUES (1, 1, CAST(N'2023-03-13T00:00:00.000' AS DateTime), 0, CAST(171 AS Decimal(18, 0)), N'Done', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [ShippingAddress], [Quantity], [TotalPrice]) VALUES (2, 1, 1, N'16-03-2023', 1, 171)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (1, 3, N'Versace Bright Crystal EDT', N'In 2006, Versace released a fragrance that surprised the world with its unique scent and design, Bright Crystal, erotic, transparent and striking. Inspired by the unique creations of his predecessors, Alberto Morillas paints a sparkling diamond for romantic dinner parties to create sublime love stories.', N'/img/nuochoa1.png', 171)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (2, 1, N'Gucci Flora Gorgeous Jasmine Eau de Parfum', N'The new fragrance for men - Versace Pour Homme - is a blend of essences of Mediterranean origin with a blend of top fragrances that are well suited for today''s men: those of men. Knowledgeable and confident, dynamic, strong and passionate, living in harmony with the natural world.', N'/img/nuochoa2.png', 104)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (3, 3, N'Versace Bright Crystal EDT', N'The new fragrance for men - Versace Pour Homme - is a blend of essences of Mediterranean origin with a blend of top fragrances that are well suited for today''s men: those of men. Knowledgeable and confident, dynamic, strong and passionate, living in harmony with the natural world.', N'/img/nuochoa3.png', 88)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (4, 1, N'Chanel Coco Mademoiselle EDP', N'After Coco, Coco Mademoiselle is an additional version of Gabrielle Chanel''s contrasting personality. It is an expression of femininity, a lively, fresh and complex fragrance for elegant and aristocratic women.', N'/img/nuochoa4.png', 104)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (5, 3, N'Versace Dylan Turquoise EDT', N'Dylan Turquoise is a new fragrance for women launched by Versace brand in 2020. The scent is a combination of tradition and modernity, giving us the feeling of escaping to islands far away from the sky. blue and sparkling clear water. It is also inspired by the sea breeze that gently caresses the skin and awakens the senses, regenerating the soul. It is a fragrance reminiscent of warm sunshine and vibrant summer days.', N'/img/nuochoa5.png', 129)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (6, 1, N'Gucci Flora Gorgeous Jasmine Eau de Parfum SET 5ml', N'Gucci Flora Gorgeous Gardenia được ra mắt với phiên bản Eau de Parfum mới, có nồng độ tinh dầu cao hơn phiên bản Eau de Toilette trước đó. Với dấu ấn hương hoa tươi vui, mùi hương xoay quanh nốt hương hoa Dành Dành, loài hoa bừng nở trong bình minh và thường được dùng để điều chế các loại tiên dược.', N'/img/nuochoa6.jpg', 22)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (7, 1, N'Dior Sauvage EDP', N'Dior Eau Sauvage EDT là một loại nước hoa tươi mới có thể dễ dàng nhận ra trong số các loại nước hoa có mùi hương tươi mới khác. Hương thơm tươi mát của chanh và hương thơm cay đắng được kết hợp hoàn hảo cùng với sắc thái nam tính của nốt hương gỗ.', N'/img/nuochoa7.jpg', 170)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (8, 4, N'My Burberry EDP', N'My Burberry Blush EDP Women''s Perfume Launched in 2017. Burberry''s most successful women''s fragrance line, My Burberry takes the main rose scent. The Blush version is like a spring garden, with the scent of roses mixed with red apple, fresh lemon, a fresh and sweet scent.', N'/img/nuochoa8.jpg', 100)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (9, 13, N'Calvin Klein Sheer Beauty', N'The new fragrance for men - Versace Pour Homme - is a blend of essences of Mediterranean origin with a blend of top fragrances that are well suited for today''s men: those of men. Knowledgeable and confident, dynamic, strong and passionate, living in harmony with the natural world.', N'/img/nuochoa9.jpg', 99)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (10, 1, N'Dolce & Gabbana The Only One Eau De Parfum Intense', N'Dolce & Gabbana The Only One Intense fragrance is feminine and sweet The fusion of seemingly familiar and boring scents creates a magical whole. The scent stays on her skin, glides on her hair and clothes for up to 12 hours, opening a delicate and enchanting space. The opening of vanilla and sweet fruit welcomes everyone with an affectionate aftertaste like a candle lit in the dark sky. Bringing intense vitality to people who are lonely, need some warmth from the small things around.', N'/img/nuochoa10.jpg', 250)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (11, 16, N'Lancôme Tresor Midnight Rose EDP', N'Lancôme Tresor Midnight Rose EDp Eau de Parfum opens with a wonderful burst of energy of a blend of rose and raspberry aromas interwoven with strong notes of pepper and cedar. The fragrance gradually settles, penetrates and blends to arouse a coherent and harmonious melody.', N'/img/nuochoa11.jpg', 220)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (12, 6, N' Giorgio Armani Acqua Di Gio Pour Homme EDT', N'The new fragrance for men - Versace Pour Homme - is a blend of essences of Mediterranean origin with a blend of top fragrances that are well suited for today''s men: those of men. Knowledgeable and confident, dynamic, strong and passionate, living in harmony with the natural world.', N'/img/nuochoa12.jpg', 156)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (13, 3, N'Versace Eros Man EDT', N'In 2006, Versace released a fragrance that surprised the world with its unique scent and design, Bright Crystal, erotic, transparent and striking. Inspired by the unique creations of his predecessors, Alberto Morillas paints a sparkling diamond for romantic dinner parties to create sublime love stories.', N'/img/nuochoa13.jpg', 300)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (14, 1, N'Chanel Coco Mademoiselle EDP Twist & Spray', N'After Coco, Coco Mademoiselle is an additional version of Gabrielle Chanel''s contrasting personality. It is an expression of femininity, a lively, fresh and complex fragrance for elegant and aristocratic women.', N'/img/nuochoa14.jpg', 269)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (15, 1, N'Marc Jacobs Daisy Love Eau So Sweet EDT', N'After Coco, Coco Mademoiselle is an additional version of Gabrielle Chanel''s contrasting personality. It is an expression of femininity, a lively, fresh and complex fragrance for elegant and aristocratic women.', N'/img/nuochoa15.jpg', 699)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (16, 1, N'Marc Jacobs Daisy Ever So Fresh Eau De Parfum', N'Dylan Turquoise is a new fragrance for women launched by Versace brand in 2020. The scent is a combination of tradition and modernity, giving us the feeling of escaping to islands far away from the sky. blue and sparkling clear water. It is also inspired by the sea breeze that gently caresses the skin and awakens the senses, regenerating the soul. It is a fragrance reminiscent of warm sunshine and vibrant summer days.', N'/img/nuochoa16.jpg', 333)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [Name], [Description], [Image], [Price]) VALUES (17, 6, N'Giorgio Armani Acqua Di Gio Absolu EDP ', N'Gucci Flora Gorgeous Gardenia được ra mắt với phiên bản Eau de Parfum mới, có nồng độ tinh dầu cao hơn phiên bản Eau de Toilette trước đó. Với dấu ấn hương hoa tươi vui, mùi hương xoay quanh nốt hương hoa Dành Dành, loài hoa bừng nở trong bình minh và thường được dùng để điều chế các loại tiên dược.', N'/img/nuochoa20.jpg', 329)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customer]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [PRN221] SET  READ_WRITE 
GO
