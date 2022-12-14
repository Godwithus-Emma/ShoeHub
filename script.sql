USE [master]
GO
/****** Object:  Database [EcommerceAppdb]    Script Date: 01/09/2022 12:36:08 ******/
CREATE DATABASE [EcommerceAppdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EcommerceAppdb', FILENAME = N'C:\Users\hp\EcommerceAppdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EcommerceAppdb_log', FILENAME = N'C:\Users\hp\EcommerceAppdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EcommerceAppdb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EcommerceAppdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EcommerceAppdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EcommerceAppdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EcommerceAppdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EcommerceAppdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EcommerceAppdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EcommerceAppdb] SET  MULTI_USER 
GO
ALTER DATABASE [EcommerceAppdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EcommerceAppdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EcommerceAppdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EcommerceAppdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EcommerceAppdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EcommerceAppdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EcommerceAppdb] SET QUERY_STORE = OFF
GO
USE [EcommerceAppdb]
GO
/****** Object:  Table [dbo].[dbo.tbImage]    Script Date: 01/09/2022 12:36:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbo.tbImage](
	[Id] [nchar](10) NOT NULL,
	[ProductId] [nchar](10) NOT NULL,
	[ImageUrl] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbProduct]    Script Date: 01/09/2022 12:36:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbProduct](
	[ProductId] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[CurrentPrice] [decimal](18, 0) NOT NULL,
	[InitialPrice] [decimal](18, 0) NOT NULL,
	[Discount] [float] NOT NULL,
	[ImageId] [int] NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[ProductRating] [int] NOT NULL,
 CONSTRAINT [PK_tbProduct] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbUser]    Script Date: 01/09/2022 12:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbProduct] ([ProductId], [ProductName], [CurrentPrice], [InitialPrice], [Discount], [ImageId], [Category], [ProductRating]) VALUES (1, N'Sneaker', CAST(2333 AS Decimal(18, 0)), CAST(2323 AS Decimal(18, 0)), 12, 1, N'Badges', 2)
INSERT [dbo].[tbProduct] ([ProductId], [ProductName], [CurrentPrice], [InitialPrice], [Discount], [ImageId], [Category], [ProductRating]) VALUES (2, N'Shoe', CAST(2323 AS Decimal(18, 0)), CAST(2323 AS Decimal(18, 0)), 34, 2, N'Sneakers', 4)
INSERT [dbo].[tbProduct] ([ProductId], [ProductName], [CurrentPrice], [InitialPrice], [Discount], [ImageId], [Category], [ProductRating]) VALUES (3, N'Bag', CAST(323 AS Decimal(18, 0)), CAST(323 AS Decimal(18, 0)), 24, 3, N'Badges', 5)
INSERT [dbo].[tbProduct] ([ProductId], [ProductName], [CurrentPrice], [InitialPrice], [Discount], [ImageId], [Category], [ProductRating]) VALUES (4, N'Key', CAST(300 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), 10, 4, N'Sneakers', 4)
INSERT [dbo].[tbProduct] ([ProductId], [ProductName], [CurrentPrice], [InitialPrice], [Discount], [ImageId], [Category], [ProductRating]) VALUES (5, N'Ado', CAST(244 AS Decimal(18, 0)), CAST(400 AS Decimal(18, 0)), 23, 5, N'Sunglass', 3)
INSERT [dbo].[tbProduct] ([ProductId], [ProductName], [CurrentPrice], [InitialPrice], [Discount], [ImageId], [Category], [ProductRating]) VALUES (6, N'Lappy', CAST(755 AS Decimal(18, 0)), CAST(6888 AS Decimal(18, 0)), 21, 6, N'Badges', 1)
INSERT [dbo].[tbProduct] ([ProductId], [ProductName], [CurrentPrice], [InitialPrice], [Discount], [ImageId], [Category], [ProductRating]) VALUES (7, N'Adidas', CAST(1234 AS Decimal(18, 0)), CAST(768 AS Decimal(18, 0)), 87, 7, N'Sunglass', 3)
INSERT [dbo].[tbProduct] ([ProductId], [ProductName], [CurrentPrice], [InitialPrice], [Discount], [ImageId], [Category], [ProductRating]) VALUES (8, N'Slippers', CAST(4346 AS Decimal(18, 0)), CAST(235 AS Decimal(18, 0)), 54, 8, N'Badge', 2)
INSERT [dbo].[tbProduct] ([ProductId], [ProductName], [CurrentPrice], [InitialPrice], [Discount], [ImageId], [Category], [ProductRating]) VALUES (9, N'Edifier', CAST(28767 AS Decimal(18, 0)), CAST(434 AS Decimal(18, 0)), 37, 9, N'Sneakers', 4)
GO
SET IDENTITY_INSERT [dbo].[tbUser] ON 

INSERT [dbo].[tbUser] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (1, N'a@a.a', N'Aaaaaa1!', N'ade', N'bola')
INSERT [dbo].[tbUser] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (2, N'a@aa.a', N'Aaaaaa1!', N'saa', N'ass')
INSERT [dbo].[tbUser] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (3, N'fdgh', N'gfh', N'gfh', N'dgfhg')
INSERT [dbo].[tbUser] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (4, N'Blessed@Emmtol.com', N'aaaa@ASSddw3', N'nmbn', N'nmbn')
INSERT [dbo].[tbUser] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (1003, N'Blessed@Emsdmtol.com', N'aaaa@ASSddw3', N'ascadc', N'xcczc')
INSERT [dbo].[tbUser] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (1004, N'Blessdfded@Emsdmtol.com', N'aaaa@ASSddw3', N'fhgnvb', N'gfbdfdfv')
INSERT [dbo].[tbUser] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (1005, N'Blessdfdnmbed@Emsdmtol.com', N'aaaa@ASSddw3', N'ljkhj', N'mnbn')
SET IDENTITY_INSERT [dbo].[tbUser] OFF
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 01/09/2022 12:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetAllUsers]
as
Begin

SELECT * FROM tbUser
END
GO
/****** Object:  StoredProcedure [dbo].[spCreateUser]    Script Date: 01/09/2022 12:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCreateUser]
@FirstName varchar(50), @LastName varchar(50), @Email varchar(50), @Password varchar(50)
AS
Begin
INSERT INTO[tbUser](FirstName,LastName,Email,[Password])
Values(@FirstName,@LastName,@Email,@Password)
END		
GO
/****** Object:  StoredProcedure [dbo].[spGetAllProducts]    Script Date: 01/09/2022 12:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllProducts] 
AS 
SELECT * FROM dbo.tbProduct
GO
/****** Object:  StoredProcedure [dbo].[spGetProductById]    Script Date: 01/09/2022 12:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetProductById]
@Id int AS 
SELECT * FROM dbo.tbProduct
WHERE ProductId = @Id
GO
/****** Object:  StoredProcedure [dbo].[spGetUserByEmailAndPassword]    Script Date: 01/09/2022 12:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUserByEmailAndPassword]
@Email varchar(50),
@Password varchar(50)
AS 
SELECT * FROM dbo.tbUser
WHERE Email = @Email AND Password = @Password 
GO
USE [master]
GO
ALTER DATABASE [EcommerceAppdb] SET  READ_WRITE 
GO
