USE [master]
GO
/****** Object:  Database [ProductManagement]    Script Date: 3/27/2021 2:47:53 PM ******/
CREATE DATABASE [ProductManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProductManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProductManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProductManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProductManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductManagement] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ProductManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [ProductManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ProductManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProductManagement', N'ON'
GO
ALTER DATABASE [ProductManagement] SET QUERY_STORE = OFF
GO
USE [ProductManagement]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/27/2021 2:47:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiUsers]    Script Date: 3/27/2021 2:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[CreatedUserId] [int] NULL,
	[ModifiedUserId] [int] NULL,
	[ApiKey] [nvarchar](max) NULL,
	[ApiPassword] [nvarchar](max) NULL,
 CONSTRAINT [PK_ApiUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 3/27/2021 2:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [nvarchar](max) NULL,
	[LogLevel] [nvarchar](max) NULL,
	[UserId] [int] NULL,
	[PageUrl] [nvarchar](max) NULL,
	[Parameters] [nvarchar](max) NULL,
	[ExceptionMessage] [nvarchar](max) NULL,
	[InnerException] [nvarchar](max) NULL,
	[InInnerExceptionMessage] [nvarchar](max) NULL,
	[RequestType] [nvarchar](max) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[Method] [nvarchar](max) NULL,
	[Action] [nvarchar](max) NULL,
	[IpAddress] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/27/2021 2:47:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[CreatedUserId] [int] NULL,
	[ModifiedUserId] [int] NULL,
	[ProductName] [nvarchar](max) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[ProductImageLink] [nvarchar](max) NULL,
	[ProductPrice] [decimal](18, 2) NOT NULL,
	[ProductLikeCount] [int] NOT NULL,
	[ProductViewCount] [int] NOT NULL,
	[ProductPoint] [float] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210327094828_Init', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210327112227_AddedLogTable', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210327114107_UpdatedLogTableForUserId', N'3.1.4')
GO
SET IDENTITY_INSERT [dbo].[ApiUsers] ON 

INSERT [dbo].[ApiUsers] ([Id], [IsDeleted], [CreatedDate], [ModifiedDate], [CreatedUserId], [ModifiedUserId], [ApiKey], [ApiPassword]) VALUES (2, 0, CAST(N'2021-03-27T13:00:00.0000000' AS DateTime2), NULL, NULL, NULL, N'162737b5-bba0-428b-aa08-e5073788bbb7', N'8PZwtdK6qES$D{QS')
SET IDENTITY_INSERT [dbo].[ApiUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([Id], [Guid], [LogLevel], [UserId], [PageUrl], [Parameters], [ExceptionMessage], [InnerException], [InInnerExceptionMessage], [RequestType], [StackTrace], [Method], [Action], [IpAddress], [CreatedDate]) VALUES (1, N'e7feb317-68f8-4d50-aab0-d9783611e698', N'INFO', 2, N'Product/GetProducts', N'Skip: 0| Take: 20| ApiKey: 162737b5-bba0-428b-aa08-e5073788bbb7', NULL, NULL, NULL, N'GET', NULL, N'Product', N'GetProducts', N'::1', CAST(N'2021-03-27T14:41:44.9457414' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Guid], [LogLevel], [UserId], [PageUrl], [Parameters], [ExceptionMessage], [InnerException], [InInnerExceptionMessage], [RequestType], [StackTrace], [Method], [Action], [IpAddress], [CreatedDate]) VALUES (2, N'3401ba6b-6a49-46e3-82da-616becc88b27', N'SUCCESS', 2, N'Product/GetProducts', N'Skip: 0| Take: 20| ApiKey: 162737b5-bba0-428b-aa08-e5073788bbb7', NULL, NULL, NULL, N'GET', NULL, N'Product', N'GetProducts', N'::1', CAST(N'2021-03-27T14:41:45.0828568' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Guid], [LogLevel], [UserId], [PageUrl], [Parameters], [ExceptionMessage], [InnerException], [InInnerExceptionMessage], [RequestType], [StackTrace], [Method], [Action], [IpAddress], [CreatedDate]) VALUES (3, N'fe4c8dba-1bf6-4f55-ab9d-c869abe7fdd1', N'INFO', 2, N'Product/GetProducts', N'Skip: 2| Take: 1| ApiKey: 162737b5-bba0-428b-aa08-e5073788bbb7', NULL, NULL, NULL, N'GET', NULL, N'Product', N'GetProducts', N'::1', CAST(N'2021-03-27T14:43:32.8223768' AS DateTime2))
INSERT [dbo].[Logs] ([Id], [Guid], [LogLevel], [UserId], [PageUrl], [Parameters], [ExceptionMessage], [InnerException], [InInnerExceptionMessage], [RequestType], [StackTrace], [Method], [Action], [IpAddress], [CreatedDate]) VALUES (4, N'48775e4b-7183-4439-8859-6b2272484deb', N'SUCCESS', 2, N'Product/GetProducts', N'Skip: 2| Take: 1| ApiKey: 162737b5-bba0-428b-aa08-e5073788bbb7', NULL, NULL, NULL, N'GET', NULL, N'Product', N'GetProducts', N'::1', CAST(N'2021-03-27T14:43:32.9650516' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Logs] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [IsDeleted], [CreatedDate], [ModifiedDate], [CreatedUserId], [ModifiedUserId], [ProductName], [ProductDescription], [ProductImageLink], [ProductPrice], [ProductLikeCount], [ProductViewCount], [ProductPoint]) VALUES (1, 0, CAST(N'2021-03-27T13:57:21.8138789' AS DateTime2), NULL, 2, NULL, N'Haylou Solar LS05 Akıllı Saat', N'Haylou Solar LS05 , spor tutkunlarının spor aktiviteleriyle ilgili tüm bilgileri öğrenebilmeleri için tasarlanmış en ilginç akıllı saatlerden biri olarak öne çıkıyor.', N'https://n11scdn1.akamaized.net/a1/1024/03/81/51/04/75730261.jpg', CAST(150.00 AS Decimal(18, 2)), 0, 0, 0)
INSERT [dbo].[Products] ([Id], [IsDeleted], [CreatedDate], [ModifiedDate], [CreatedUserId], [ModifiedUserId], [ProductName], [ProductDescription], [ProductImageLink], [ProductPrice], [ProductLikeCount], [ProductViewCount], [ProductPoint]) VALUES (2, 0, CAST(N'2021-03-27T13:58:51.1194858' AS DateTime2), NULL, 2, NULL, N'İmilab KW66 Akıllı Saat', N'Kusursuz bir deneyim sunan akıllı saatin yenilikçi teknolojisi ile kullanıcılar beklentilerini en ideal şekilde karşılamanın konforuna sahip olabilir. Hayatı kolaylaştıran özellikleri ile daima kullanıcılarına ayrıcalıklı bir hizmet sunar.', N'https://n11scdn1.akamaized.net/a1/1024/16/23/62/16/73352670.jpg', CAST(350.00 AS Decimal(18, 2)), 0, 0, 0)
INSERT [dbo].[Products] ([Id], [IsDeleted], [CreatedDate], [ModifiedDate], [CreatedUserId], [ModifiedUserId], [ProductName], [ProductDescription], [ProductImageLink], [ProductPrice], [ProductLikeCount], [ProductViewCount], [ProductPoint]) VALUES (3, 0, CAST(N'2021-03-27T13:59:49.2509848' AS DateTime2), NULL, 2, NULL, N'Huawei Watch GT2 46 MM Sport Edition Akıllı Saat', N'Bünyesinde barındırdığı uzman mühendislerin elbirliğiyle ürettiği, teknolojiye yön veren pek çok ürünü bulunan bir marka olan Huawei, akıllı saat üretimiyle de hayatımızda yer etmeye başlamıştır. Günlük yoğun rutinimiz içerisinde neredeyse herkes her an teknolojinin yardımını almaktadır. Bu durum yakın zamanda giyilebilir teknolojilerin üretiminin önünü açmıştır. Geliştirdiği pek çok ürünle sektöre büyük oranda yön veren Huawei, Huawei Watch GT2 ile büyük bir başarıya daha imza atmıştır. Huawei Watch GT2 Sport Edition büyük başarıda yer edinen ürünlerden biri olarak karşımıza çıkmaktadır. Kullanımı, günlük hayatımızı büyük bir oranda kolaylaştırdığı gibi oldukça şık olan tasarımı ile de her zevke, tarza ve stile uyacak potansiyele sahiptir. Üretim aşamasında evrensel bir estetiklik anlayışını sahiplenen marka, teknolojinin herkes için ulaşılabilir ve anlaşılabilir olması için çaba sarf etmektedir. Bu sayede her bütçeye uygun ürünler ortaya koymaya çalıştığı gibi, aynı zamanda da her yaşa ve her cinsiyete uygun modeller de üretmeye çalışmaktadır. Tüm bu özellikleri sayesinde, gününüzün her anında ve nerede bulunduğunuz fark etmeksizin pek çok işinizi kolunuza takmış olduğunuz saat ile halledebileceksiniz. Ayrıca ergonomik ve hafif yapısı sayesinde de sürekli kullanım aşamasında sizi yorabilecek herhangi bir özelliği bünyesinde barındırmayacak bir biçimde üretilmiştir. Örneğin, ömür boyu ürünün kendisinde bulunan aynı bataryayı kullanabilme garantisinin verilmesi, üreticilerin bu konuda kendilerinden ne derece emin olduğunun en başat belirtilerinden bir tanesidir.', N'https://n11scdn1.akamaized.net/a1/1024/05/39/29/47/78164997.jpg', CAST(550.00 AS Decimal(18, 2)), 0, 0, 0)
INSERT [dbo].[Products] ([Id], [IsDeleted], [CreatedDate], [ModifiedDate], [CreatedUserId], [ModifiedUserId], [ProductName], [ProductDescription], [ProductImageLink], [ProductPrice], [ProductLikeCount], [ProductViewCount], [ProductPoint]) VALUES (4, 0, CAST(N'2021-03-27T14:00:38.5424552' AS DateTime2), CAST(N'2021-03-27T14:03:22.2180762' AS DateTime2), 2, 2, N'Xiaomi Mi Watch Lite Akıllı Saat', N'Ürün unisex olarak özel tasarımda üretilmiştir. Yeni nesil teknolojide geliştirilmiş ürün ekran ve kordon yapısıyla günlük kullanımda büyük bir şıklık yaratır. Kavisli dörtgen ekranı çerçevesiz olarak üretilmiştir. Gövde geçişi ince yapıdadır.', N'https://n11scdn1.akamaized.net/a1/1024/03/39/38/95/84344209.png', CAST(750.00 AS Decimal(18, 2)), 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
USE [master]
GO
ALTER DATABASE [ProductManagement] SET  READ_WRITE 
GO
