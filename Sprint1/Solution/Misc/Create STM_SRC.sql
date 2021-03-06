USE [master]
GO
/****** Object:  Database [STM_SRC]    Script Date: 7/7/2014 1:44:32 AM ******/
CREATE DATABASE [STM_SRC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'STM_SRC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\STM_SRC.mdf' , SIZE = 728128KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'STM_SRC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\STM_SRC_log.ldf' , SIZE = 359424KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [STM_SRC] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [STM_SRC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [STM_SRC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [STM_SRC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [STM_SRC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [STM_SRC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [STM_SRC] SET ARITHABORT OFF 
GO
ALTER DATABASE [STM_SRC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [STM_SRC] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [STM_SRC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [STM_SRC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [STM_SRC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [STM_SRC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [STM_SRC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [STM_SRC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [STM_SRC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [STM_SRC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [STM_SRC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [STM_SRC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [STM_SRC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [STM_SRC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [STM_SRC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [STM_SRC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [STM_SRC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [STM_SRC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [STM_SRC] SET RECOVERY FULL 
GO
ALTER DATABASE [STM_SRC] SET  MULTI_USER 
GO
ALTER DATABASE [STM_SRC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [STM_SRC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [STM_SRC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [STM_SRC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'STM_SRC', N'ON'
GO
USE [STM_SRC]
GO
/****** Object:  Table [dbo].[agency]    Script Date: 7/7/2014 1:44:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[agency](
	[agency_id] [varchar](50) NOT NULL,
	[agency_name] [varchar](50) NULL,
	[agency_url] [varchar](50) NULL,
	[agency_timezone] [varchar](50) NULL,
	[agency_lang] [varchar](50) NULL,
 CONSTRAINT [PK_agency] PRIMARY KEY CLUSTERED 
(
	[agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[calendar_dates]    Script Date: 7/7/2014 1:44:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[calendar_dates](
	[service_id] [varchar](50) NULL,
	[date] [varchar](50) NOT NULL,
	[exception_type] [varchar](50) NULL,
 CONSTRAINT [PK_calendar_dates] PRIMARY KEY CLUSTERED 
(
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[fare_attributes]    Script Date: 7/7/2014 1:44:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fare_attributes](
	[fare_id] [varchar](50) NOT NULL,
	[price] [varchar](50) NULL,
	[currency_type] [varchar](50) NULL,
	[payment_method] [varchar](50) NULL,
	[transfers] [varchar](50) NULL,
	[transfer_duration] [varchar](50) NULL,
 CONSTRAINT [PK_fare_attributes] PRIMARY KEY CLUSTERED 
(
	[fare_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[fare_rules]    Script Date: 7/7/2014 1:44:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fare_rules](
	[fare_id] [varchar](50) NOT NULL,
	[route_id] [varchar](50) NOT NULL,
	[origin_id] [varchar](50) NULL,
	[destination_id] [varchar](50) NULL,
	[contains_id] [varchar](50) NULL,
 CONSTRAINT [PK_fare_rules] PRIMARY KEY CLUSTERED 
(
	[fare_id] ASC,
	[route_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[frequencies]    Script Date: 7/7/2014 1:44:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frequencies](
	[trip_id] [varchar](50) NOT NULL,
	[start_time] [varchar](50) NULL,
	[end_time] [varchar](50) NULL,
	[headway_secs] [varchar](50) NULL,
 CONSTRAINT [PK_frequencies] PRIMARY KEY CLUSTERED 
(
	[trip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[routes]    Script Date: 7/7/2014 1:44:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[routes](
	[route_id] [varchar](50) NOT NULL,
	[agency_id] [varchar](50) NULL,
	[route_short_name] [varchar](50) NULL,
	[route_long_name] [varchar](50) NULL,
	[route_type] [varchar](50) NULL,
	[route_url] [varchar](50) NULL,
	[route_color] [varchar](50) NULL,
	[route_text_color] [varchar](50) NULL,
 CONSTRAINT [PK_routes] PRIMARY KEY CLUSTERED 
(
	[route_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[shapes]    Script Date: 7/7/2014 1:44:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[shapes](
	[shape_id] [varchar](50) NULL,
	[shape_pt_lat] [varchar](50) NULL,
	[shape_pt_lon] [varchar](50) NULL,
	[shape_pt_sequence] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stop_times]    Script Date: 7/7/2014 1:44:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stop_times](
	[trip_id] [varchar](50) NOT NULL,
	[arrival_time] [varchar](50) NULL,
	[departure_time] [varchar](50) NULL,
	[stop_id] [varchar](50) NOT NULL,
	[stop_sequence] [varchar](50) NOT NULL,
 CONSTRAINT [PK_stop_times] PRIMARY KEY CLUSTERED 
(
	[trip_id] ASC,
	[stop_id] ASC,
	[stop_sequence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stops]    Script Date: 7/7/2014 1:44:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stops](
	[stop_id] [varchar](50) NOT NULL,
	[stop_code] [varchar](50) NULL,
	[stop_name] [varchar](5000) NULL,
	[stop_lat] [varchar](50) NULL,
	[stop_lon] [varchar](50) NULL,
	[stop_url] [varchar](50) NULL,
	[wheelchair_boarding] [varchar](50) NULL,
 CONSTRAINT [PK_stops] PRIMARY KEY CLUSTERED 
(
	[stop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[trips]    Script Date: 7/7/2014 1:44:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[trips](
	[route_id] [varchar](50) NULL,
	[service_id] [varchar](50) NULL,
	[trip_id] [varchar](50) NOT NULL,
	[trip_headsign] [varchar](50) NULL,
	[wheelchair_accessible] [varchar](50) NULL,
 CONSTRAINT [PK_trips] PRIMARY KEY CLUSTERED 
(
	[trip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[fare_rules]  WITH CHECK ADD  CONSTRAINT [FK_fare_rules_fare_attributes] FOREIGN KEY([fare_id])
REFERENCES [dbo].[fare_attributes] ([fare_id])
GO
ALTER TABLE [dbo].[fare_rules] CHECK CONSTRAINT [FK_fare_rules_fare_attributes]
GO
ALTER TABLE [dbo].[fare_rules]  WITH CHECK ADD  CONSTRAINT [FK_fare_rules_routes] FOREIGN KEY([route_id])
REFERENCES [dbo].[routes] ([route_id])
GO
ALTER TABLE [dbo].[fare_rules] CHECK CONSTRAINT [FK_fare_rules_routes]
GO
ALTER TABLE [dbo].[routes]  WITH CHECK ADD  CONSTRAINT [FK_routes_agency] FOREIGN KEY([agency_id])
REFERENCES [dbo].[agency] ([agency_id])
GO
ALTER TABLE [dbo].[routes] CHECK CONSTRAINT [FK_routes_agency]
GO
ALTER TABLE [dbo].[stop_times]  WITH CHECK ADD  CONSTRAINT [FK_stop_times_stops] FOREIGN KEY([stop_id])
REFERENCES [dbo].[stops] ([stop_id])
GO
ALTER TABLE [dbo].[stop_times] CHECK CONSTRAINT [FK_stop_times_stops]
GO
ALTER TABLE [dbo].[stop_times]  WITH CHECK ADD  CONSTRAINT [FK_stop_times_trips] FOREIGN KEY([trip_id])
REFERENCES [dbo].[trips] ([trip_id])
GO
ALTER TABLE [dbo].[stop_times] CHECK CONSTRAINT [FK_stop_times_trips]
GO
ALTER TABLE [dbo].[trips]  WITH CHECK ADD  CONSTRAINT [FK_trips_routes] FOREIGN KEY([route_id])
REFERENCES [dbo].[routes] ([route_id])
GO
ALTER TABLE [dbo].[trips] CHECK CONSTRAINT [FK_trips_routes]
GO
USE [master]
GO
ALTER DATABASE [STM_SRC] SET  READ_WRITE 
GO
