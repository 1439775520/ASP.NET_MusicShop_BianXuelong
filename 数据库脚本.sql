USE [master]
GO
/****** Object:  Database [OLMSDB]    Script Date: 2020/5/16 11:06:12 ******/
CREATE DATABASE [OLMSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OLMSDB', FILENAME = N'D:\Visual_Studio_ASP\项目\WebApplication1\OLMSDB.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OLMSDB_log', FILENAME = N'D:\Visual_Studio_ASP\项目\WebApplication1\OLMSDB_log.ldf' , SIZE = 2368KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OLMSDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OLMSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OLMSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OLMSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OLMSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OLMSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OLMSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OLMSDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OLMSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OLMSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OLMSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OLMSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OLMSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OLMSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OLMSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OLMSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OLMSDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OLMSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OLMSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OLMSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OLMSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OLMSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OLMSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OLMSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OLMSDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OLMSDB] SET  MULTI_USER 
GO
ALTER DATABASE [OLMSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OLMSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OLMSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OLMSDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OLMSDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OLMSDB', N'ON'
GO
ALTER DATABASE [OLMSDB] SET QUERY_STORE = OFF
GO
USE [OLMSDB]
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 2020/5/16 11:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albums](
	[AlbumId] [int] IDENTITY(1,1) NOT NULL,
	[GenreId] [int] NOT NULL,
	[ArtistId] [int] NOT NULL,
	[Title] [nvarchar](160) NOT NULL,
	[Price] [numeric](10, 2) NOT NULL,
	[AlbumArtUrl] [nvarchar](1024) NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artists]    Script Date: 2020/5/16 11:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artists](
	[ArtistId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](120) NULL,
 CONSTRAINT [PK__Artists__25706B50245D67DE] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 2020/5/16 11:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AlbumId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 2020/5/16 11:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](120) NULL,
	[Description] [nvarchar](4000) NULL,
 CONSTRAINT [PK__Genres__0385057E1EA48E88] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2020/5/16 11:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[AlbumId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK__InvoiceL__0D760AD91DE57479] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2020/5/16 11:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Username] [nvarchar](256) NULL,
	[Address] [nvarchar](70) NULL,
	[OrderStatus] [int] NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Phone] [nvarchar](24) NULL,
	[Email] [nvarchar](160) NULL,
	[Total] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK__Invoice__D796AAB51A14E395] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2020/5/16 11:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2020/5/16 11:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[LoginId] [nvarchar](50) NULL,
	[LoginPwd] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[RoleId] [int] NULL,
	[UserStatus] [int] NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Albums] ON 

INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (1, 1, 283, N'For Those About To Rock We Salute You', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/TIM图片20200228152350.jpg')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (2, 1, 282, N'For Those About To Rock We Salute You', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/TIM图片20200228152350.jpg')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (5, 1, 105, N'The Best Of Men At Work', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (7, 1, 110, N'Nevermind', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (8, 1, 111, N'Compositores', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (9, 1, 114, N'Bark at the Moon (Remastered)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (10, 1, 114, N'Blizzard of Ozz', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (11, 1, 114, N'Diary of a Madman (Remastered)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (12, 1, 114, N'No More Tears (Remastered)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (13, 1, 114, N'Speak of the Devil', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (14, 1, 115, N'Walking Into Clarksdale', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (15, 1, 117, N'The Beast Live', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (16, 1, 118, N'Live On Two Legs [Live]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (17, 1, 118, N'Riot Act', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (18, 1, 118, N'Ten', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (19, 1, 118, N'Vs.', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (20, 1, 120, N'Dark Side Of The Moon', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (21, 1, 124, N'New Adventures In Hi-Fi', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (22, 1, 126, N'Raul Seixas', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (23, 1, 127, N'By The Way', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (24, 1, 127, N'Californication', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (25, 1, 128, N'Retrospective I (1974-1980)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (26, 1, 130, N'Maquinarama', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (27, 1, 130, N'O Samba Poconé', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (28, 1, 132, N'A-Sides', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (29, 1, 134, N'Core', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (30, 1, 136, N'[1997] Black Light Syndrome', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (31, 1, 139, N'Beyond Good And Evil', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (33, 1, 140, N'The Doors', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (34, 1, 141, N'The Police Greatest Hits', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (35, 1, 142, N'Hot Rocks, 1964-1971 (Disc 1)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (36, 1, 142, N'No Security', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (37, 1, 142, N'Voodoo Lounge', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (38, 1, 144, N'My Generation - The Very Best Of The Who', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (39, 1, 150, N'Achtung Baby', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (40, 1, 150, N'B-Sides 1980-1990', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (41, 1, 150, N'How To Dismantle An Atomic Bomb', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (42, 1, 150, N'Pop', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (43, 1, 150, N'Rattle And Hum', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (44, 1, 150, N'The Best Of 1980-1990', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (45, 1, 150, N'War', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (46, 1, 150, N'Zooropa', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (47, 1, 152, N'Diver Down', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (48, 1, 152, N'The Best Of Van Halen, Vol. I', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (49, 1, 152, N'Van Halen III', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (50, 1, 152, N'Van Halen', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (51, 1, 153, N'Contraband', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (52, 1, 157, N'Un-Led-Ed', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (54, 1, 2, N'Balls to the Wall', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (55, 1, 2, N'Restless and Wild', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (56, 1, 200, N'Every Kind of Light', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (57, 1, 22, N'BBC Sessions [Disc 1] [Live]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (58, 1, 22, N'BBC Sessions [Disc 2] [Live]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (59, 1, 22, N'Coda', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (60, 1, 22, N'Houses Of The Holy', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (61, 1, 22, N'In Through The Out Door', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (62, 1, 22, N'IV', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (63, 1, 22, N'Led Zeppelin I', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (64, 1, 22, N'Led Zeppelin II', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (65, 1, 22, N'Led Zeppelin III', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (66, 1, 22, N'Physical Graffiti [Disc 1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (67, 1, 22, N'Physical Graffiti [Disc 2]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (68, 1, 22, N'Presence', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (69, 1, 22, N'The Song Remains The Same (Disc 1)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (70, 1, 22, N'The Song Remains The Same (Disc 2)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (71, 1, 23, N'Bongo Fury', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (72, 1, 3, N'Big Ones', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (73, 1, 4, N'Jagged Little Pill', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (74, 1, 5, N'Facelift', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (75, 1, 51, N'Greatest Hits I', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (76, 1, 51, N'Greatest Hits II', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (77, 1, 51, N'News Of The World', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (78, 1, 52, N'Greatest Kiss', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (79, 1, 52, N'Unplugged [Live]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (80, 1, 55, N'Into The Light', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (81, 1, 58, N'Come Taste The Band', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (82, 1, 58, N'Deep Purple In Rock', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (83, 1, 58, N'Fireball', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (84, 1, 58, N'Machine Head', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (85, 1, 58, N'MK III The Final Concerts [Disc 1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (86, 1, 58, N'Purpendicular', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (87, 1, 58, N'Slaves And Masters', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (88, 1, 58, N'Stormbringer', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (89, 1, 58, N'The Battle Rages On', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (90, 1, 58, N'The Final Concerts (Disc 2)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (91, 1, 59, N'Santana - As Years Go By', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (92, 1, 59, N'Santana Live', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (93, 1, 59, N'Supernatural', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (94, 1, 76, N'Chronicle, Vol. 1', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (95, 1, 76, N'Chronicle, Vol. 2', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (96, 1, 8, N'Audioslave', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (97, 1, 82, N'King For A Day Fool For A Lifetime', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (98, 1, 84, N'In Your Honor [Disc 1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (99, 1, 84, N'In Your Honor [Disc 2]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (100, 1, 84, N'The Colour And The Shape', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (101, 1, 88, N'Appetite for Destruction', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (102, 1, 88, N'Use Your Illusion I', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (103, 1, 90, N'A Matter of Life and Death', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (104, 1, 90, N'Brave New World', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
GO
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (105, 1, 90, N'Fear Of The Dark', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (106, 1, 90, N'Live At Donington 1992 (Disc 1)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (107, 1, 90, N'Live At Donington 1992 (Disc 2)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (108, 1, 90, N'Rock In Rio [CD2]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (109, 1, 90, N'The Number of The Beast', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (110, 1, 90, N'The X Factor', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (111, 1, 90, N'Virtual XI', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (112, 1, 92, N'Emergency On Planet Earth', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (113, 1, 94, N'Are You Experienced?', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (114, 1, 95, N'Surfing with the Alien (Remastered)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (115, 10, 203, N'The Best of Beethoven', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (119, 10, 208, N'Pachelbel: Canon & Gigue', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (122, 10, 211, N'Bach: Goldberg Variations', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (123, 10, 212, N'Bach: The Cello Suites', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (124, 10, 213, N'Handel: The Messiah (Highlights)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (128, 10, 217, N'Haydn: Symphonies 99 - 104', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (130, 10, 219, N'A Soprano Inspired', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (132, 10, 221, N'Wagner: Favourite Overtures', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (134, 10, 223, N'Tchaikovsky: The Nutcracker', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (135, 10, 224, N'The Last Night of the Proms', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (138, 10, 226, N'Respighi:Pines of Rome', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (139, 10, 226, N'Strauss: Waltzes', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (140, 10, 229, N'Carmina Burana', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (141, 10, 230, N'A Copland Celebration, Vol. I', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (142, 10, 231, N'Bach: Toccata & Fugue in D Minor', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (143, 10, 232, N'Prokofiev: Symphony No.1', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (144, 10, 233, N'Scheherazade', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (145, 10, 234, N'Bach: The Brandenburg Concertos', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (147, 10, 236, N'Mascagni: Cavalleria Rusticana', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (148, 10, 237, N'Sibelius: Finlandia', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (152, 10, 242, N'Adams, John: The Chairman Dances', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (154, 10, 245, N'Berlioz: Symphonie Fantastique', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (155, 10, 245, N'Prokofiev: Romeo & Juliet', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (157, 10, 247, N'English Renaissance', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (159, 10, 248, N'Mozart: Symphonies Nos. 40 & 41', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (161, 10, 250, N'SCRIABIN: Vers la flamme', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (163, 10, 255, N'Bartok: Violin & Viola Concertos', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (166, 10, 259, N'South American Getaway', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (167, 10, 260, N'Górecki: Symphony No. 3', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (168, 10, 261, N'Purcell: The Fairy Queen', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (171, 10, 264, N'Weill: The Seven Deadly Sins', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (173, 10, 266, N'Szymanowski: Piano Works, Vol. 1', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (174, 10, 267, N'Nielsen: The Six Symphonies', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (177, 10, 274, N'Mozart: Chamber Music', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (178, 2, 10, N'The Best Of Billy Cobham', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (179, 2, 197, N'Quiet Songs', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (180, 2, 202, N'Worlds', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (181, 2, 27, N'Quanta Gente Veio ver--Bônus De Carnaval', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (182, 2, 53, N'Heart of the Night', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (183, 2, 53, N'Morning Dance', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (184, 2, 6, N'Warner 25 Anos', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (185, 2, 68, N'Miles Ahead', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (186, 2, 68, N'The Essential Miles Davis [Disc 1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (187, 2, 68, N'The Essential Miles Davis [Disc 2]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (188, 2, 79, N'Outbreak', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (189, 2, 89, N'Blue Moods', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (190, 3, 100, N'Greatest Hits', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (191, 3, 106, N'Ace Of Spades', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (192, 3, 109, N'Motley Crue Greatest Hits', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (193, 3, 11, N'Alcohol Fueled Brewtality Live! [Disc 1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (194, 3, 11, N'Alcohol Fueled Brewtality Live! [Disc 2]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (195, 3, 114, N'Tribute', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (196, 3, 12, N'Black Sabbath Vol. 4 (Remaster)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (197, 3, 12, N'Black Sabbath', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (198, 3, 135, N'Mezmerize', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (199, 3, 14, N'Chemical Wedding', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (200, 3, 50, N'...And Justice For All', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (201, 3, 50, N'Black Album', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (202, 3, 50, N'Garage Inc. (Disc 1)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (203, 3, 50, N'Garage Inc. (Disc 2)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (204, 3, 50, N'Load', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (205, 3, 50, N'Master Of Puppets', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (206, 3, 50, N'ReLoad', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (207, 3, 50, N'Ride The Lightning', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (208, 3, 50, N'St. Anger', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (209, 3, 7, N'Plays Metallica By Four Cellos', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (210, 3, 87, N'Faceless', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (211, 3, 88, N'Use Your Illusion II', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (212, 3, 90, N'A Real Dead One', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (213, 3, 90, N'A Real Live One', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (214, 3, 90, N'Live After Death', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (215, 3, 90, N'No Prayer For The Dying', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (216, 3, 90, N'Piece Of Mind', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (217, 3, 90, N'Powerslave', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (218, 3, 90, N'Rock In Rio [CD1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (219, 3, 90, N'Rock In Rio [CD2]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (220, 3, 90, N'Seventh Son of a Seventh Son', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (221, 3, 90, N'Somewhere in Time', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (222, 3, 90, N'The Number of The Beast', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (223, 3, 98, N'Living After Midnight', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (224, 4, 196, N'Cake: B-Sides and Rarities', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (225, 4, 204, N'Temple of the Dog', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (226, 4, 205, N'Carry On', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (227, 4, 253, N'Carried to Dust (Bonus Track Version)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (228, 4, 8, N'Revelations', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (229, 6, 133, N'In Step', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (230, 6, 137, N'Live [Disc 1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (231, 6, 137, N'Live [Disc 2]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (233, 6, 81, N'The Cream Of Clapton', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (234, 6, 81, N'Unplugged', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
GO
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (235, 6, 90, N'Iron Maiden', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (238, 7, 103, N'Barulhinho Bom', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (239, 7, 112, N'Olodum', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (240, 7, 113, N'Acústico MTV', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (241, 7, 113, N'Arquivo II', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (242, 7, 113, N'Arquivo Os Paralamas Do Sucesso', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (243, 7, 145, N'Serie Sem Limite (Disc 1)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (244, 7, 145, N'Serie Sem Limite (Disc 2)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (245, 7, 155, N'Ao Vivo [IMPORT]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (246, 7, 16, N'Prenda Minha', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (247, 7, 16, N'Sozinho Remix Ao Vivo', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (248, 7, 17, N'Minha Historia', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (249, 7, 18, N'Afrociberdelia', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (250, 7, 18, N'Da Lama Ao Caos', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (251, 7, 20, N'Na Pista', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (252, 7, 201, N'Duos II', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (253, 7, 21, N'Sambas De Enredo 2001', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (254, 7, 21, N'Vozes do MPB', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (255, 7, 24, N'Chill: Brazil (Disc 1)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (256, 7, 27, N'Quanta Gente Veio Ver (Live)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (257, 7, 37, N'The Best of Ed Motta', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (258, 7, 41, N'Elis Regina-Minha História', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (259, 7, 42, N'Milton Nascimento Ao Vivo', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (260, 7, 42, N'Minas', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (261, 7, 46, N'Jorge Ben Jor 25 Anos', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (262, 7, 56, N'Meus Momentos', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (263, 7, 6, N'Chill: Brazil (Disc 2)', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (264, 7, 72, N'Vinicius De Moraes', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (266, 7, 77, N'Cássia Eller - Sem Limite [Disc 1]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (267, 7, 80, N'Djavan Ao Vivo - Vol. 02', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (268, 7, 80, N'Djavan Ao Vivo - Vol. 1', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (269, 7, 81, N'Unplugged', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (270, 7, 83, N'Deixa Entrar', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (271, 7, 86, N'Roda De Funk', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (272, 7, 96, N'Jota Quest-1995', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (274, 7, 99, N'Mais Do Mesmo', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (275, 8, 100, N'Greatest Hits', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (276, 8, 151, N'UB40 The Best Of - Volume Two [UK]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (277, 8, 19, N'Acústico MTV [Live]', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (278, 8, 19, N'Cidade Negra - Hits', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (280, 9, 21, N'Axé Bahia 2001', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (281, 9, 252, N'Frank', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (282, 5, 276, N'Le Freak', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (285, 1, 279, N'1', CAST(1.00 AS Numeric(10, 2)), N'6A79FEA3BF4D18CBD1270606B59E6E84.jpg')
INSERT [dbo].[Albums] ([AlbumId], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (286, 1, 280, N'3', CAST(3.00 AS Numeric(10, 2)), N'Binary_clock_samui_moon.jpg')
SET IDENTITY_INSERT [dbo].[Albums] OFF
SET IDENTITY_INSERT [dbo].[Artists] ON 

INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (1, N'AC/DC')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (2, N'Accept')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (3, N'Aerosmith')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (4, N'Alanis Morissette')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (5, N'Alice In Chains')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (6, N'Antônio Carlos Jobim')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (7, N'Apocalyptica')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (8, N'Audioslave')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (10, N'Billy Cobham')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (11, N'Black Label Society')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (12, N'Black Sabbath')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (14, N'Bruce Dickinson')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (15, N'Buddy Guy')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (16, N'Caetano Veloso')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (17, N'Chico Buarque')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (18, N'Chico Science & Nação Zumbi')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (19, N'Cidade Negra')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (20, N'Cláudio Zoli')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (21, N'Various Artists')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (22, N'Led Zeppelin')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (23, N'Frank Zappa & Captain Beefheart')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (24, N'Marcos Valle')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (27, N'Gilberto Gil')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (37, N'Ed Motta')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (41, N'Elis Regina')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (42, N'Milton Nascimento')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (46, N'Jorge Ben')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (50, N'Metallica')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (51, N'Queen')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (52, N'Kiss')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (53, N'Spyro Gyra')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (55, N'David Coverdale')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (56, N'Gonzaguinha')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (58, N'Deep Purple')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (59, N'Santana')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (68, N'Miles Davis')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (72, N'Vinícius De Moraes')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (76, N'Creedence Clearwater Revival')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (77, N'Cássia Eller')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (79, N'Dennis Chambers')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (80, N'Djavan')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (81, N'Eric Clapton')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (82, N'Faith No More')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (83, N'Falamansa')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (84, N'Foo Fighters')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (86, N'Funk Como Le Gusta')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (87, N'Godsmack')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (88, N'Guns N'' Roses')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (89, N'Incognito')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (90, N'Iron Maiden')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (92, N'Jamiroquai')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (94, N'Jimi Hendrix')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (95, N'Joe Satriani')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (96, N'Jota Quest')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (98, N'Judas Priest')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (99, N'Legião Urbana')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (100, N'Lenny Kravitz')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (101, N'Lulu Santos')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (102, N'Marillion')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (103, N'Marisa Monte')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (105, N'Men At Work')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (106, N'Motörhead')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (109, N'Mötley Crüe')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (110, N'Nirvana')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (111, N'O Terço')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (112, N'Olodum')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (113, N'Os Paralamas Do Sucesso')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (114, N'Ozzy Osbourne')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (115, N'Page & Plant')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (117, N'Paul D''Ianno')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (118, N'Pearl Jam')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (120, N'Pink Floyd')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (124, N'R.E.M.')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (126, N'Raul Seixas')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (127, N'Red Hot Chili Peppers')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (128, N'Rush')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (130, N'Skank')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (132, N'Soundgarden')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (133, N'Stevie Ray Vaughan & Double Trouble')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (134, N'Stone Temple Pilots')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (135, N'System Of A Down')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (136, N'Terry Bozzio, Tony Levin & Steve Stevens')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (137, N'The Black Crowes')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (139, N'The Cult')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (140, N'The Doors')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (141, N'The Police')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (142, N'The Rolling Stones')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (144, N'The Who')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (145, N'Tim Maia')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (150, N'U2')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (151, N'UB40')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (152, N'Van Halen')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (153, N'Velvet Revolver')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (155, N'Zeca Pagodinho')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (157, N'Dread Zeppelin')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (179, N'Scorpions')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (196, N'Cake')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (197, N'Aisha Duo')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (200, N'The Posies')
GO
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (201, N'Luciana Souza/Romero Lubambo')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (202, N'Aaron Goldberg')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (203, N'Nicolaus Esterhazy Sinfonia')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (204, N'Temple of the Dog')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (205, N'Chris Cornell')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (206, N'Alberto Turco & Nova Schola Gregoriana')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (208, N'English Concert & Trevor Pinnock')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (211, N'Wilhelm Kempff')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (212, N'Yo-Yo Ma')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (213, N'Scholars Baroque Ensemble')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (217, N'Royal Philharmonic Orchestra & Sir Thomas Beecham')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (219, N'Britten Sinfonia, Ivor Bolton & Lesley Garrett')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (221, N'Sir Georg Solti & Wiener Philharmoniker')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (223, N'London Symphony Orchestra & Sir Charles Mackerras')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (224, N'Barry Wordsworth & BBC Concert Orchestra')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (226, N'Eugene Ormandy')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (229, N'Boston Symphony Orchestra & Seiji Ozawa')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (230, N'Aaron Copland & London Symphony Orchestra')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (231, N'Ton Koopman')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (232, N'Sergei Prokofiev & Yuri Temirkanov')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (233, N'Chicago Symphony Orchestra & Fritz Reiner')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (234, N'Orchestra of The Age of Enlightenment')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (236, N'James Levine')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (237, N'Berliner Philharmoniker & Hans Rosbaud')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (238, N'Maurizio Pollini')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (240, N'Gustav Mahler')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (242, N'Edo de Waart & San Francisco Symphony')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (244, N'Choir Of Westminster Abbey & Simon Preston')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (245, N'Michael Tilson Thomas & San Francisco Symphony')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (247, N'The King''s Singers')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (248, N'Berliner Philharmoniker & Herbert Von Karajan')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (250, N'Christopher O''Riley')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (251, N'Fretwork')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (252, N'Amy Winehouse')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (253, N'Calexico')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (255, N'Yehudi Menuhin')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (258, N'Les Arts Florissants & William Christie')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (259, N'The 12 Cellists of The Berlin Philharmonic')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (260, N'Adrian Leaper & Doreen de Feis')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (261, N'Roger Norrington, London Classical Players')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (264, N'Kent Nagano and Orchestre de l''Opéra de Lyon')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (265, N'Julian Bream')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (266, N'Martin Roscoe')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (267, N'Göteborgs Symfoniker & Neeme Järvi')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (270, N'Gerald Moore')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (271, N'Mela Tenenbaum, Pro Musica Prague & Richard Kapp')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (274, N'Nash Ensemble')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (276, N'Chic')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (277, N'Anita Ward')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (278, N'Donna Summer')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (279, N'1')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (280, N'3')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (281, N'5')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (282, N'AC/DC阿松大')
INSERT [dbo].[Artists] ([ArtistId], [Name]) VALUES (283, N'AC/DC阿松大啊实打实的')
SET IDENTITY_INSERT [dbo].[Artists] OFF
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (1, N'Rock', N'Rock and Roll is a form of rock music developed in the 1950s and 1960s. Rock music combines many kinds of music from the United States, such as country music, folk music, church music, work songs, blues and jazz.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (2, N'Jazz', N'Jazz is a type of music which was invented in the United States. Jazz music combines African-American music with European music. Some common jazz instruments include the saxophone, trumpet, piano, double bass, and drums.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (3, N'Metal', N'Heavy Metal is a loud, aggressive style of Rock music. The bands who play heavy-metal music usually have one or two guitars, a bass guitar and drums. In some bands, electronic keyboards, organs, or other instruments are used. Heavy metal songs are loud and powerful-sounding, and have strong rhythms that are repeated. There are many different types of Heavy Metal, some of which are described below. Heavy metal bands sometimes dress in jeans, leather jackets, and leather boots, and have long hair. Heavy metal bands sometimes behave in a dramatic way when they play their instruments or sing. However, many heavy metal bands do not like to do this.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (4, N'Alternative', N'Alternative rock is a type of rock music that became popular in the 1980s and became widely popular in the 1990s. Alternative rock is made up of various subgenres that have come out of the indie music scene since the 1980s, such as grunge, indie rock, Britpop, gothic rock, and indie pop. These genres are sorted by their collective types of punk, which laid the groundwork for alternative music in the 1970s.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (5, N'Disco', N'Disco is a style of pop music that was popular in the mid-1970s. Disco music has a strong beat that people can dance to. People usually dance to disco music at bars called disco clubs. The word "disco" is also used to refer to the style of dancing that people do to disco music, or to the style of clothes that people wear to go disco dancing. Disco was at its most popular in the United States and Europe in the 1970s and early 1980s. Disco was brought into the mainstream by the hit movie Saturday Night Fever, which was released in 1977. This movie, which starred John Travolta, showed people doing disco dancing. Many radio stations played disco in the late 1970s.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (6, N'Blues', N'The blues is a form of music that started in the United States during the start of the 20th century. It was started by former African slaves from spirituals, praise songs, and chants. The first blues songs were called Delta blues. These songs came from the area near the mouth of the Mississippi River.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (7, N'Latin', N'Latin American music is the music of all countries in Latin America (and the Caribbean) and comes in many varieties. Latin America is home to musical styles such as the simple, rural conjunto music of northern Mexico, the sophisticated habanera of Cuba, the rhythmic sounds of the Puerto Rican plena, the symphonies of Heitor Villa-Lobos, and the simple and moving Andean flute. Music has played an important part recently in Latin America''s politics, the nueva canción movement being a prime example. Latin music is very diverse, with the only truly unifying thread being the use of Latin-derived languages, predominantly the Spanish language, the Portuguese language in Brazil, and to a lesser extent, Latin-derived creole languages, such as those found in Haiti.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (8, N'Reggae', N'Reggae is a music genre first developed in Jamaica in the late 1960s. While sometimes used in a broader sense to refer to most types of Jamaican music, the term reggae more properly denotes a particular music style that originated following on the development of ska and rocksteady.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (9, N'Pop', N'Pop music is a music genre that developed from the mid-1950s as a softer alternative to rock ''n'' roll and later to rock music. It has a focus on commercial recording, often oriented towards a youth market, usually through the medium of relatively short and simple love songs. While these basic elements of the genre have remained fairly constant, pop music has absorbed influences from most other forms of popular music, particularly borrowing from the development of rock music, and utilizing key technological innovations to produce new variations on existing themes.')
INSERT [dbo].[Genres] ([GenreId], [Name], [Description]) VALUES (10, N'Classical', N'Classical music is a very general term which normally refers to the standard music of countries in the Western world. It is music that has been composed by musicians who are trained in the art of writing music (composing) and written down in music notation so that other musicians can play it. Classical music can also be described as "art music" because great art (skill) is needed to compose it and to perform it well. Classical music differs from pop music because it is not made just in order to be popular for a short time or just to be a commercial success.')
SET IDENTITY_INSERT [dbo].[Genres] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (1, 1, 2, 1, CAST(8.99 AS Numeric(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (2, 2, 1, 1, CAST(8.99 AS Numeric(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (3, 3, 1, 1, CAST(8.99 AS Numeric(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (4, 3, 2, 1, CAST(8.99 AS Numeric(10, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Username], [Address], [OrderStatus], [PostalCode], [Phone], [Email], [Total]) VALUES (1, CAST(N'2019-07-30T11:00:11.247' AS DateTime), N'刘四', N'东湖高新开发区光谷大道国际企业中心一期栖凤楼B座一楼', 4, N'430000', N'138*****717', N'3045@sina.com', CAST(8.99 AS Numeric(10, 2)))
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Username], [Address], [OrderStatus], [PostalCode], [Phone], [Email], [Total]) VALUES (2, CAST(N'2019-07-31T20:52:13.700' AS DateTime), N'李四', N'东湖高新开发区光谷大道国际企业中心一期栖凤楼B座一楼', 3, N'430000', N'138*****717', N'3045@sina.com', CAST(8.99 AS Numeric(10, 2)))
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Username], [Address], [OrderStatus], [PostalCode], [Phone], [Email], [Total]) VALUES (3, CAST(N'2019-08-14T11:50:40.683' AS DateTime), N'李四', N'东湖高新开发区光谷大道', 0, N'430000', N'138*****717', N'3045@sina.com', CAST(17.98 AS Numeric(10, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (1, N'管理员       ')
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (2, N'普通用户      ')
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (4, N'白金用户      ')
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (5, N'钻石用户      ')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [LoginId], [LoginPwd], [UserName], [Phone], [RoleId], [UserStatus], [DateCreated]) VALUES (1, N'admin', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'系统管理员', N'139*****113', 1, 1, CAST(N'2019-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserId], [LoginId], [LoginPwd], [UserName], [Phone], [RoleId], [UserStatus], [DateCreated]) VALUES (2, N'lli', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'李四', N'138*****717', 5, 1, CAST(N'2019-08-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserId], [LoginId], [LoginPwd], [UserName], [Phone], [RoleId], [UserStatus], [DateCreated]) VALUES (3, N'111', N'6216F8A75FD5BB3D5F22B6F9958CDEDE3FC086C2', N'111', N'111', 4, 1, CAST(N'2020-05-06T18:12:12.970' AS DateTime))
INSERT [dbo].[Users] ([UserId], [LoginId], [LoginPwd], [UserName], [Phone], [RoleId], [UserStatus], [DateCreated]) VALUES (4, N'123', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', N'123', N'123', 2, 1, CAST(N'2020-05-06T18:13:50.517' AS DateTime))
INSERT [dbo].[Users] ([UserId], [LoginId], [LoginPwd], [UserName], [Phone], [RoleId], [UserStatus], [DateCreated]) VALUES (5, N'122', N'05A8EA5382B9FD885261BB3EED0527D1D3B07262', N'122', N'122', 2, 1, CAST(N'2020-05-06T18:14:18.863' AS DateTime))
INSERT [dbo].[Users] ([UserId], [LoginId], [LoginPwd], [UserName], [Phone], [RoleId], [UserStatus], [DateCreated]) VALUES (6, N'133', N'D30F79CF7FEF47BD7A5611719F936539BEC0D2E9', N'133', N'133', 2, 1, CAST(N'2020-05-06T18:14:49.657' AS DateTime))
INSERT [dbo].[Users] ([UserId], [LoginId], [LoginPwd], [UserName], [Phone], [RoleId], [UserStatus], [DateCreated]) VALUES (7, N'321', N'5F6955D227A320C7F1F6C7DA2A6D96A851A8118F', N'321', N'312', 2, 1, CAST(N'2020-05-06T18:17:00.803' AS DateTime))
INSERT [dbo].[Users] ([UserId], [LoginId], [LoginPwd], [UserName], [Phone], [RoleId], [UserStatus], [DateCreated]) VALUES (8, N'1234', N'7110EDA4D09E062AA5E4A390B0A572AC0D2C0220', N'1234', N'1234', 2, 1, CAST(N'2020-05-07T14:12:50.330' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Albums] ADD  CONSTRAINT [DF_Album_AlbumArtUrl]  DEFAULT (N'/Content/Images/placeholder.gif') FOR [AlbumArtUrl]
GO
ALTER TABLE [dbo].[Albums]  WITH NOCHECK ADD  CONSTRAINT [FK__Album__ArtistId__276EDEB3] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artists] ([ArtistId])
GO
ALTER TABLE [dbo].[Albums] CHECK CONSTRAINT [FK__Album__ArtistId__276EDEB3]
GO
ALTER TABLE [dbo].[Albums]  WITH NOCHECK ADD  CONSTRAINT [FK_Album_Genre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([GenreId])
GO
ALTER TABLE [dbo].[Albums] CHECK CONSTRAINT [FK_Album_Genre]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Album] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Albums] ([AlbumId])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Cart_Album]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH NOCHECK ADD  CONSTRAINT [FK__InvoiceLi__Invoi__2F10007B] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__InvoiceLi__Invoi__2F10007B]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Album] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Albums] ([AlbumId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetail_Album]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [OLMSDB] SET  READ_WRITE 
GO
