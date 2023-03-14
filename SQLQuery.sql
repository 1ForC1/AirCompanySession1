USE [master]
GO
/****** Object:  Database [Session1_01]    Script Date: 14.03.2023 20:29:21 ******/
CREATE DATABASE [Session1_01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Session1_01', FILENAME = N'D:\Program files\SQL_SERVER_2022\MSSQL16.MSSQLSERVER22\MSSQL\DATA\Session1_01.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Session1_01_log', FILENAME = N'D:\Program files\SQL_SERVER_2022\MSSQL16.MSSQLSERVER22\MSSQL\DATA\Session1_01_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Session1_01] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Session1_01].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Session1_01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Session1_01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Session1_01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Session1_01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Session1_01] SET ARITHABORT OFF 
GO
ALTER DATABASE [Session1_01] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Session1_01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Session1_01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Session1_01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Session1_01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Session1_01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Session1_01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Session1_01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Session1_01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Session1_01] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Session1_01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Session1_01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Session1_01] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Session1_01] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Session1_01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Session1_01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Session1_01] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Session1_01] SET RECOVERY FULL 
GO
ALTER DATABASE [Session1_01] SET  MULTI_USER 
GO
ALTER DATABASE [Session1_01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Session1_01] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Session1_01] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Session1_01] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Session1_01] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Session1_01] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Session1_01', N'ON'
GO
ALTER DATABASE [Session1_01] SET QUERY_STORE = ON
GO
ALTER DATABASE [Session1_01] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Session1_01]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 14.03.2023 20:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offices]    Script Date: 14.03.2023 20:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 14.03.2023 20:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.03.2023 20:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[OfficeID] [int] NULL,
	[Birthdate] [date] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (1, N'Afghanistan')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (2, N'Albania')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (3, N'Algeria')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (4, N'Andorra')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (5, N'Angola')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (6, N'Antigua & Deps')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (7, N'Argentina')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (8, N'Armenia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (9, N'Australia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (10, N'Austria')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (11, N'Azerbaijan')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (12, N'Bahamas')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (13, N'Bahrain')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (14, N'Bangladesh')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (15, N'Barbados')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (16, N'Belarus')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (17, N'Belgium')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (18, N'Belize')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (19, N'Benin')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (20, N'Bhutan')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (21, N'Bolivia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (22, N'Bosnia Herzegovina')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (23, N'Botswana')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (24, N'Brazil')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (25, N'Brunei')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (26, N'Bulgaria')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (27, N'Burkina')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (28, N'Burundi')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (29, N'Cambodia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (30, N'Cameroon')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (31, N'Canada')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (32, N'Cape Verde')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (33, N'Central African Rep')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (34, N'Chad')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (35, N'Chile')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (36, N'China')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (37, N'Colombia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (38, N'Comoros')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (39, N'Congo')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (40, N'Congo {Democratic Rep}')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (41, N'Costa Rica')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (42, N'Croatia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (43, N'Cuba')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (44, N'Cyprus')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (45, N'Czech Republic')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (46, N'Denmark')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (47, N'Djibouti')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (48, N'Dominica')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (49, N'Dominican Republic')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (50, N'East Timor')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (51, N'Ecuador')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (52, N'Egypt')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (53, N'El Salvador')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (54, N'Equatorial Guinea')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (55, N'Eritrea')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (56, N'Estonia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (57, N'Ethiopia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (58, N'Fiji')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (59, N'Finland')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (60, N'France')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (61, N'Gabon')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (62, N'Gambia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (63, N'Georgia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (64, N'Germany')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (65, N'Ghana')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (66, N'Greece')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (67, N'Grenada')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (68, N'Guatemala')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (69, N'Guinea')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (70, N'Guinea-Bissau')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (71, N'Guyana')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (72, N'Haiti')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (73, N'Honduras')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (74, N'Hungary')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (75, N'Iceland')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (76, N'India')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (77, N'Indonesia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (78, N'Iran')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (79, N'Iraq')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (80, N'Ireland {Republic}')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (81, N'Israel')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (82, N'Italy')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (83, N'Ivory Coast')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (84, N'Jamaica')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (85, N'Japan')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (86, N'Jordan')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (87, N'Kazakhstan')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (88, N'Kenya')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (89, N'Kiribati')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (90, N'Korea North')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (91, N'Korea South')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (92, N'Kosovo')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (93, N'Kuwait')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (94, N'Kyrgyzstan')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (95, N'Laos')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (96, N'Latvia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (97, N'Lebanon')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (98, N'Lesotho')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (99, N'Liberia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (100, N'Libya')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (101, N'Liechtenstein')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (102, N'Lithuania')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (103, N'Luxembourg')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (104, N'Macedonia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (105, N'Madagascar')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (106, N'Malawi')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (107, N'Malaysia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (108, N'Maldives')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (109, N'Mali')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (110, N'Malta')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (111, N'Marshall Islands')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (112, N'Mauritania')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (113, N'Mauritius')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (114, N'Mexico')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (115, N'Micronesia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (116, N'Moldova')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (117, N'Monaco')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (118, N'Mongolia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (119, N'Montenegro')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (120, N'Morocco')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (121, N'Mozambique')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (122, N'Myanmar, {Burma}')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (123, N'Namibia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (124, N'Nauru')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (125, N'Nepal')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (126, N'Netherlands')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (127, N'New Zealand')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (128, N'Nicaragua')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (129, N'Niger')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (130, N'Nigeria')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (131, N'Norway')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (132, N'Oman')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (133, N'Pakistan')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (134, N'Palau')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (135, N'Panama')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (136, N'Papua New Guinea')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (137, N'Paraguay')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (138, N'Peru')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (139, N'Philippines')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (140, N'Poland')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (141, N'Portugal')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (142, N'Qatar')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (143, N'Romania')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (144, N'Russian Federation')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (145, N'Rwanda')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (146, N'St Kitts & Nevis')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (147, N'St Lucia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (148, N'Saint Vincent & the Grenadines')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (149, N'Samoa')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (150, N'San Marino')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (151, N'Sao Tome & Principe')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (152, N'Saudi Arabia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (153, N'Senegal')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (154, N'Serbia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (155, N'Seychelles')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (156, N'Sierra Leone')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (157, N'Singapore')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (158, N'Slovakia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (159, N'Slovenia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (160, N'Solomon Islands')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (161, N'Somalia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (162, N'South Africa')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (163, N'South Sudan')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (164, N'Spain')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (165, N'Sri Lanka')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (166, N'Sudan')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (167, N'Suriname')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (168, N'Swaziland')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (169, N'Sweden')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (170, N'Switzerland')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (171, N'Syria')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (172, N'Taiwan')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (173, N'Tajikistan')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (174, N'Tanzania')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (175, N'Thailand')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (176, N'Togo')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (177, N'Tonga')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (178, N'Trinidad & Tobago')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (179, N'Tunisia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (180, N'Turkey')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (181, N'Turkmenistan')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (182, N'Tuvalu')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (183, N'Uganda')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (184, N'Ukraine')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (185, N'United Arab Emirates')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (186, N'United Kingdom')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (187, N'United States')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (188, N'Uruguay')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (189, N'Uzbekistan')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (190, N'Vanuatu')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (191, N'Vatican City')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (192, N'Venezuela')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (193, N'Vietnam')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (194, N'Yemen')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (195, N'Zambia')
GO
INSERT [dbo].[Countries] ([ID], [Name]) VALUES (196, N'Zimbabwe')
GO
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Offices] ON 
GO
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (1, 185, N'Abu dhabi', N'638-757-8582
', N'MIchael Malki')
GO
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (3, 52, N'Cairo', N'252-224-8525', N'David Johns')
GO
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (4, 13, N'Bahrain', N'542-227-5825', N'Katie Ballmer')
GO
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (5, 142, N'Doha', N'758-278-9597', N'Ariel Levy')
GO
INSERT [dbo].[Offices] ([ID], [CountryID], [Title], [Phone], [Contact]) VALUES (6, 152, N'Riyadh', N'285-285-1474', N'Andrew Hobart')
GO
SET IDENTITY_INSERT [dbo].[Offices] OFF
GO
INSERT [dbo].[Roles] ([ID], [Title]) VALUES (1, N'Administrator')
GO
INSERT [dbo].[Roles] ([ID], [Title]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (1, 1, N'j.doe@amonic.com', N'123', N'John', N'Doe', 1, CAST(N'1983-01-13' AS Date), 1)
GO
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (2, 2, N'k.omar@amonic.com', N'4258', N'Karim', N'Omar', 1, CAST(N'1980-03-19' AS Date), 1)
GO
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (3, 2, N'h.saeed@amonic.com', N'2020', N'Hannan', N'Saeed', 3, CAST(N'1989-12-20' AS Date), 1)
GO
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (4, 2, N'a.hobart@amonic.com', N'6996', N'Andrew', N'Hobart', 6, CAST(N'1990-01-30' AS Date), 1)
GO
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (5, 2, N'k.anderson@amonic.com', N'4570', N'Katrin', N'Anderson', 5, CAST(N'1992-10-11' AS Date), 1)
GO
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (6, 2, N'h.wyrick@amonic.com', N'1199', N'Hava', N'Wyrick', 1, CAST(N'1988-08-08' AS Date), 1)
GO
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (7, 2, N'marie.horn@amonic.com', N'55555', N'Marie', N'Horn', 4, CAST(N'1981-06-04' AS Date), 1)
GO
INSERT [dbo].[Users] ([ID], [RoleID], [Email], [Password], [FirstName], [LastName], [OfficeID], [Birthdate], [Active]) VALUES (8, 2, N'm.osteen@amonic.com', N'9800', N'Milagros', N'Osteen', 1, CAST(N'1991-03-02' AS Date), 0)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Offices]  WITH CHECK ADD  CONSTRAINT [FK_Office_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([ID])
GO
ALTER TABLE [dbo].[Offices] CHECK CONSTRAINT [FK_Office_Country]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Offices] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[Offices] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Offices]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [Session1_01] SET  READ_WRITE 
GO
