USE [WeatherDb]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 20/08/2023 15:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Longtitude] [decimal](11, 5) NOT NULL,
	[Latitude] [decimal](11, 5) NOT NULL,
 CONSTRAINT [PK_Location_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SourceType]    Script Date: 20/08/2023 15:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SourceType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SourceType_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeatherDetails]    Script Date: 20/08/2023 15:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeatherDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WeatherSource] [int] NOT NULL,
	[Location] [int] NOT NULL,
	[UTCTime] [smalldatetime] NOT NULL,
	[Temperature] [decimal](18, 0) NULL,
	[WindSpeed] [decimal](18, 0) NULL,
	[WindDirection] [nvarchar](50) NULL,
	[PrecipitationChance] [decimal](18, 0) NULL,
 CONSTRAINT [PK_WeatherDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeatherSource]    Script Date: 20/08/2023 15:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeatherSource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SourceType] [int] NOT NULL,
 CONSTRAINT [PK_WeatherSource_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WeatherDetails]  WITH CHECK ADD  CONSTRAINT [FK_Location] FOREIGN KEY([Location])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[WeatherDetails] CHECK CONSTRAINT [FK_Location]
GO
ALTER TABLE [dbo].[WeatherDetails]  WITH CHECK ADD  CONSTRAINT [FK_WeatherSource] FOREIGN KEY([WeatherSource])
REFERENCES [dbo].[WeatherSource] ([Id])
GO
ALTER TABLE [dbo].[WeatherDetails] CHECK CONSTRAINT [FK_WeatherSource]
GO
ALTER TABLE [dbo].[WeatherSource]  WITH CHECK ADD  CONSTRAINT [FK_WeatherSourceType] FOREIGN KEY([SourceType])
REFERENCES [dbo].[SourceType] ([Id])
GO
ALTER TABLE [dbo].[WeatherSource] CHECK CONSTRAINT [FK_WeatherSourceType]
GO
