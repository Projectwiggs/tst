IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTTicketStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] DROP CONSTRAINT [FK_TSTTickets_TSTTicketStatuses]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTTicketPriorites]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] DROP CONSTRAINT [FK_TSTTickets_TSTTicketPriorites]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTEmployees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] DROP CONSTRAINT [FK_TSTTickets_TSTEmployees1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] DROP CONSTRAINT [FK_TSTTickets_TSTEmployees]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTTickets]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]'))
ALTER TABLE [dbo].[TSTTechNotes] DROP CONSTRAINT [FK_TSTTechNotes_TSTTickets]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]'))
ALTER TABLE [dbo].[TSTTechNotes] DROP CONSTRAINT [FK_TSTTechNotes_TSTEmployees]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTEmployeeStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] DROP CONSTRAINT [FK_TSTEmployees_TSTEmployeeStatuses]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTDepartments]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] DROP CONSTRAINT [FK_TSTEmployees_TSTDepartments]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Index [UserNameIndex]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND name = N'UserNameIndex')
DROP INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_UserId]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_UserId')
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_RoleId')
DROP INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_UserId]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND name = N'IX_UserId')
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
GO
/****** Object:  Index [IX_UserId]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND name = N'IX_UserId')
DROP INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND name = N'RoleNameIndex')
DROP INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[TSTTickets]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTTickets]') AND type in (N'U'))
DROP TABLE [dbo].[TSTTickets]
GO
/****** Object:  Table [dbo].[TSTTicketPriorities]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTTicketPriorities]') AND type in (N'U'))
DROP TABLE [dbo].[TSTTicketPriorities]
GO
/****** Object:  Table [dbo].[TSTTechNotes]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]') AND type in (N'U'))
DROP TABLE [dbo].[TSTTechNotes]
GO
/****** Object:  Table [dbo].[TSTEmployeeStatuses]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTEmployeeStatuses]') AND type in (N'U'))
DROP TABLE [dbo].[TSTEmployeeStatuses]
GO
/****** Object:  Table [dbo].[TSTEmployees]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTEmployees]') AND type in (N'U'))
DROP TABLE [dbo].[TSTEmployees]
GO
/****** Object:  Table [dbo].[TSTDepartments]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTDepartments]') AND type in (N'U'))
DROP TABLE [dbo].[TSTDepartments]
GO
/****** Object:  Table [dbo].[TicketStatuses]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TicketStatuses]') AND type in (N'U'))
DROP TABLE [dbo].[TicketStatuses]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  Database [TSTProject]    Script Date: 1/19/2017 9:41:44 AM ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'TSTProject')
DROP DATABASE [TSTProject]
GO
/****** Object:  Database [TSTProject]    Script Date: 1/19/2017 9:41:44 AM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'TSTProject')
BEGIN
CREATE DATABASE [TSTProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TSTProject', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TSTProject.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TSTProject_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TSTProject_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [TSTProject] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TSTProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TSTProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TSTProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TSTProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TSTProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TSTProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [TSTProject] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TSTProject] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TSTProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TSTProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TSTProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TSTProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TSTProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TSTProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TSTProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TSTProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TSTProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TSTProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TSTProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TSTProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TSTProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TSTProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TSTProject] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TSTProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TSTProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TSTProject] SET  MULTI_USER 
GO
ALTER DATABASE [TSTProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TSTProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TSTProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TSTProject] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/19/2017 9:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/19/2017 9:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/19/2017 9:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/19/2017 9:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/19/2017 9:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/19/2017 9:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[EmployeeID] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TicketStatuses]    Script Date: 1/19/2017 9:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TicketStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TicketStatuses](
	[TicketStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_TSTTicketStatuses] PRIMARY KEY CLUSTERED 
(
	[TicketStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTDepartments]    Script Date: 1/19/2017 9:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTDepartments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTDepartments](
	[DeptID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TSTDepartments] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTEmployees]    Script Date: 1/19/2017 9:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTEmployees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTEmployees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](20) NOT NULL,
	[LName] [nvarchar](20) NOT NULL,
	[DeptID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[EmployeeStatusID] [int] NOT NULL,
	[HireDate] [date] NOT NULL,
	[SeparationDate] [date] NULL,
	[Address1] [nvarchar](150) NULL,
	[Address2] [nvarchar](150) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](15) NULL,
	[Zip] [nvarchar](10) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](75) NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[EmpPhoto] [nvarchar](120) NULL,
 CONSTRAINT [PK_TSTEmployees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTEmployeeStatuses]    Script Date: 1/19/2017 9:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTEmployeeStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTEmployeeStatuses](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
	[Description] [nchar](250) NULL,
 CONSTRAINT [PK_TSTEmployeeStatuses] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTTechNotes]    Script Date: 1/19/2017 9:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTTechNotes](
	[NotationID] [int] IDENTITY(1,1) NOT NULL,
	[Notation] [nvarchar](500) NOT NULL,
	[TechID] [int] NOT NULL,
	[TicketID] [int] NOT NULL,
	[NotationDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_TSTTechNotes] PRIMARY KEY CLUSTERED 
(
	[NotationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTTicketPriorities]    Script Date: 1/19/2017 9:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTTicketPriorities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTTicketPriorities](
	[PriorityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_TSTTicketPriorites] PRIMARY KEY CLUSTERED 
(
	[PriorityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TSTTickets]    Script Date: 1/19/2017 9:41:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TSTTickets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TSTTickets](
	[TicketID] [int] IDENTITY(1000,1) NOT NULL,
	[TicketStatusID] [int] NOT NULL,
	[TicketSubject] [nvarchar](100) NOT NULL,
	[TicketDescription] [nvarchar](max) NOT NULL,
	[SubmittedDate] [smalldatetime] NOT NULL,
	[SubmittedByID] [int] NOT NULL,
	[TechID] [int] NULL,
	[Attachment] [nvarchar](250) NULL,
	[Priority] [int] NOT NULL,
	[ResolvedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_TSTTickets] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'37f44b56-496e-4f11-945b-563659a9dbab', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'82bca328-a124-4958-8530-ec1769d5005e', N'Technician')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'47d978ed-43cd-4917-93b3-b54c287df3d3', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'049f273b-d81d-4dcc-87b4-8647bc478150', N'37f44b56-496e-4f11-945b-563659a9dbab')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1e6e4661-4fef-45ec-a8da-e2b507be19da', N'82bca328-a124-4958-8530-ec1769d5005e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd465ddc7-bb04-43d5-8c08-39df3a106dd2', N'47d978ed-43cd-4917-93b3-b54c287df3d3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ddb1165f-a5cf-45c5-ac3d-fe2a4a4c6a2b', N'82bca328-a124-4958-8530-ec1769d5005e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e4d5be58-efa9-462d-b40f-3c506fc44f3c', N'47d978ed-43cd-4917-93b3-b54c287df3d3')
INSERT [dbo].[AspNetUsers] ([Id], [EmployeeID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'049f273b-d81d-4dcc-87b4-8647bc478150', NULL, N'TheRealKyloRen@EmpireOnline.net', 0, N'ADSAzQ4s99/V1bO8ez6UcLsVbaNGdq65itiXO00quRvs3ygQa/ms9YrKvv4cgykMgA==', N'b1d77cee-5691-44fb-9bcb-84cb465ecf5f', NULL, 0, 0, NULL, 1, 0, N'TheRealKyloRen@EmpireOnline.net')
INSERT [dbo].[AspNetUsers] ([Id], [EmployeeID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1e6e4661-4fef-45ec-a8da-e2b507be19da', NULL, N'NotKyloRen@EmpireOnline.net', 0, N'AKiS5TS/DP1Q+6Ii6e0/NqVMG64posIUOfk00olAQvGXH4rTooZx9aGre3tv/iybbA==', N'34937e86-af83-4ccb-92a0-1919be14f4af', NULL, 0, 0, NULL, 1, 0, N'NotKyloRen@EmpireOnline.net')
INSERT [dbo].[AspNetUsers] ([Id], [EmployeeID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd465ddc7-bb04-43d5-8c08-39df3a106dd2', NULL, N'TimTrooper@Clones.net', 0, N'AJvWQeu1UtAMMDIyTpaWCWey/h3/ZYU5G2dGUPjx8/ogaQdN0uwxImXIlYbN3eVFig==', N'495dea5d-a19e-46d4-a988-230b69f1bbbb', NULL, 0, 0, NULL, 1, 0, N'TimTrooper@Clones.net')
INSERT [dbo].[AspNetUsers] ([Id], [EmployeeID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ddb1165f-a5cf-45c5-ac3d-fe2a4a4c6a2b', NULL, N'K-2SO@Droids.net', 0, N'AKstCXl6XpHgksE811MQHjrlPML4SJ5YkEYDb50P/w+VA0dNmVuxdXwdN34AvBhKPg==', N'075e7ced-c23f-416f-ae6c-ee7f1a66c2f5', NULL, 0, 0, NULL, 1, 0, N'K-2SO@Droids.net')
INSERT [dbo].[AspNetUsers] ([Id], [EmployeeID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e4d5be58-efa9-462d-b40f-3c506fc44f3c', NULL, N'ZackAttack@EmpireOnline.net', 0, N'AEWUdNKMaZ0lB2NFAjgK2EJkKgCBKt4qpbM++OfYCJ/DH1m5wciHTXdxycKCwl3Avg==', N'df0fd342-615a-4494-a6b6-a35630729705', NULL, 0, 0, NULL, 1, 0, N'ZackAttack@EmpireOnline.net')
SET IDENTITY_INSERT [dbo].[TicketStatuses] ON 

INSERT [dbo].[TicketStatuses] ([TicketStatusID], [Name], [Description]) VALUES (1, N'Pending', N'Being processed by technicians')
INSERT [dbo].[TicketStatuses] ([TicketStatusID], [Name], [Description]) VALUES (2, N'Open', N'Currently being worked on')
INSERT [dbo].[TicketStatuses] ([TicketStatusID], [Name], [Description]) VALUES (3, N'Closed', N'Ticket has been solved or not enough information was provided.')
INSERT [dbo].[TicketStatuses] ([TicketStatusID], [Name], [Description]) VALUES (4, N'Archived', N'Saved for later reflection')
INSERT [dbo].[TicketStatuses] ([TicketStatusID], [Name], [Description]) VALUES (5, N'Cancelled', N'User no longer needs support')
SET IDENTITY_INSERT [dbo].[TicketStatuses] OFF
SET IDENTITY_INSERT [dbo].[TSTDepartments] ON 

INSERT [dbo].[TSTDepartments] ([DeptID], [Name], [Description], [IsActive]) VALUES (1, N'Imperial Troops', N'The bulk of the emperial troops', 1)
INSERT [dbo].[TSTDepartments] ([DeptID], [Name], [Description], [IsActive]) VALUES (2, N'Technicians', N'They make things work', 1)
INSERT [dbo].[TSTDepartments] ([DeptID], [Name], [Description], [IsActive]) VALUES (3, N'Order 66', N'Classified', 0)
INSERT [dbo].[TSTDepartments] ([DeptID], [Name], [Description], [IsActive]) VALUES (4, N'High Command', N'They order people to do, stuff....', 1)
SET IDENTITY_INSERT [dbo].[TSTDepartments] OFF
SET IDENTITY_INSERT [dbo].[TSTEmployees] ON 

INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [IsActive], [EmployeeStatusID], [HireDate], [SeparationDate], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [JobTitle], [UserId], [EmpPhoto]) VALUES (1, N'Kylo', N'Ren', 4, 0, 1, CAST(0x583C0B00 AS Date), CAST(0x5A3C0B00 AS Date), NULL, NULL, NULL, NULL, NULL, NULL, N'TheRealKyloRen@EmpireOnline.net', N'Commander of the First Order', N'049f273b-d81d-4dcc-87b4-8647bc478150', N'c9da96d0-5066-45e7-9ade-29e1ac3158f2.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [IsActive], [EmployeeStatusID], [HireDate], [SeparationDate], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [JobTitle], [UserId], [EmpPhoto]) VALUES (2, N'Matt', N'Solo', 2, 1, 1, CAST(0x583C0B00 AS Date), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'NotKyloRen@EmpireOnline.net', N'Radar Technician', N'1e6e4661-4fef-45ec-a8da-e2b507be19da', N'e6eb2768-1948-498e-8a6c-461e0ddef5d6.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [IsActive], [EmployeeStatusID], [HireDate], [SeparationDate], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [JobTitle], [UserId], [EmpPhoto]) VALUES (3, N'Zack', N'Reloc', 4, 1, 1, CAST(0x583C0B00 AS Date), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'ZackAttack@EmpireOnline.net', N'Lieutenant Colonel', N'e4d5be58-efa9-462d-b40f-3c506fc44f3c', N'305bbc8c-33bd-4696-a3a3-be3d256217a4.png')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [IsActive], [EmployeeStatusID], [HireDate], [SeparationDate], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [JobTitle], [UserId], [EmpPhoto]) VALUES (4, N'Tim', N'Fett', 1, 1, 1, CAST(0x583C0B00 AS Date), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'TimTrooper@Clones.net', N'501st Stormtroopers', N'd465ddc7-bb04-43d5-8c08-39df3a106dd2', N'25a82179-c1c0-49b6-a45e-7f172d4c41f0.jpg')
INSERT [dbo].[TSTEmployees] ([EmployeeID], [FName], [LName], [DeptID], [IsActive], [EmployeeStatusID], [HireDate], [SeparationDate], [Address1], [Address2], [City], [State], [Zip], [Phone], [Email], [JobTitle], [UserId], [EmpPhoto]) VALUES (5, N'K-2SO', N'Droid', 2, 1, 1, CAST(0x583C0B00 AS Date), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'K-2SO@Droids.net', N'Technician Droid', N'ddb1165f-a5cf-45c5-ac3d-fe2a4a4c6a2b', N'90f0186f-8303-4683-96b7-f0d01839152f.jpg')
SET IDENTITY_INSERT [dbo].[TSTEmployees] OFF
SET IDENTITY_INSERT [dbo].[TSTEmployeeStatuses] ON 

INSERT [dbo].[TSTEmployeeStatuses] ([StatusID], [StatusName], [Description]) VALUES (1, N'Active', NULL)
INSERT [dbo].[TSTEmployeeStatuses] ([StatusID], [StatusName], [Description]) VALUES (2, N'Inactive', NULL)
INSERT [dbo].[TSTEmployeeStatuses] ([StatusID], [StatusName], [Description]) VALUES (3, N'Do Not Hire', NULL)
INSERT [dbo].[TSTEmployeeStatuses] ([StatusID], [StatusName], [Description]) VALUES (4, N'Departed', NULL)
SET IDENTITY_INSERT [dbo].[TSTEmployeeStatuses] OFF
SET IDENTITY_INSERT [dbo].[TSTTechNotes] ON 

INSERT [dbo].[TSTTechNotes] ([NotationID], [Notation], [TechID], [TicketID], [NotationDate]) VALUES (19, N'I''m sorry, Dave. I''m afraid I can''t do that.', 1, 1001, CAST(0xA6FE03E8 AS SmallDateTime))
INSERT [dbo].[TSTTechNotes] ([NotationID], [Notation], [TechID], [TicketID], [NotationDate]) VALUES (20, N'No.', 2, 1004, CAST(0xA7000230 AS SmallDateTime))
INSERT [dbo].[TSTTechNotes] ([NotationID], [Notation], [TechID], [TicketID], [NotationDate]) VALUES (21, N'No.', 2, 1004, CAST(0xA7000230 AS SmallDateTime))
INSERT [dbo].[TSTTechNotes] ([NotationID], [Notation], [TechID], [TicketID], [NotationDate]) VALUES (22, N'He went on vacation. Somewhere. Totally have no clue where he went.', 2, 1005, CAST(0xA7000231 AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[TSTTechNotes] OFF
SET IDENTITY_INSERT [dbo].[TSTTicketPriorities] ON 

INSERT [dbo].[TSTTicketPriorities] ([PriorityID], [Name], [Description]) VALUES (1, N'High', N'Needs to be solved ASAP')
INSERT [dbo].[TSTTicketPriorities] ([PriorityID], [Name], [Description]) VALUES (2, N'Medium', N'Normal Ticket')
INSERT [dbo].[TSTTicketPriorities] ([PriorityID], [Name], [Description]) VALUES (3, N'Low', N'No immediate solution needed')
SET IDENTITY_INSERT [dbo].[TSTTicketPriorities] OFF
SET IDENTITY_INSERT [dbo].[TSTTickets] ON 

INSERT [dbo].[TSTTickets] ([TicketID], [TicketStatusID], [TicketSubject], [TicketDescription], [SubmittedDate], [SubmittedByID], [TechID], [Attachment], [Priority], [ResolvedDate]) VALUES (1001, 2, N'HAL!', N'Open the pod bay doors, HAL', CAST(0xA6FE0337 AS SmallDateTime), 4, 1, N'ba1846fc-3f49-4071-a8cc-8faca74e510b.jpg', 3, CAST(0xA6FE03E9 AS SmallDateTime))
INSERT [dbo].[TSTTickets] ([TicketID], [TicketStatusID], [TicketSubject], [TicketDescription], [SubmittedDate], [SubmittedByID], [TechID], [Attachment], [Priority], [ResolvedDate]) VALUES (1003, 5, N'Profile Change Request', N'First Name: Tim <br /> Last Name: Fett <br /> Phone: Not Provided <br /> Email: TimTrooper@Clones.net', CAST(0xA6FF020D AS SmallDateTime), 4, NULL, NULL, 3, CAST(0xA6FF0217 AS SmallDateTime))
INSERT [dbo].[TSTTickets] ([TicketID], [TicketStatusID], [TicketSubject], [TicketDescription], [SubmittedDate], [SubmittedByID], [TechID], [Attachment], [Priority], [ResolvedDate]) VALUES (1004, 3, N'Help me, please.', N'I have no clue what I''m doing.', CAST(0xA700022D AS SmallDateTime), 3, 1, NULL, 2, NULL)
INSERT [dbo].[TSTTickets] ([TicketID], [TicketStatusID], [TicketSubject], [TicketDescription], [SubmittedDate], [SubmittedByID], [TechID], [Attachment], [Priority], [ResolvedDate]) VALUES (1005, 4, N'Where''s Kylo', N'I haven''t seen him in a while.', CAST(0xA700022E AS SmallDateTime), 3, 2, NULL, 2, NULL)
INSERT [dbo].[TSTTickets] ([TicketID], [TicketStatusID], [TicketSubject], [TicketDescription], [SubmittedDate], [SubmittedByID], [TechID], [Attachment], [Priority], [ResolvedDate]) VALUES (1006, 1, N'Dear Technicians...', N'This is my formal complaint', CAST(0xA700022E AS SmallDateTime), 3, NULL, NULL, 2, NULL)
INSERT [dbo].[TSTTickets] ([TicketID], [TicketStatusID], [TicketSubject], [TicketDescription], [SubmittedDate], [SubmittedByID], [TechID], [Attachment], [Priority], [ResolvedDate]) VALUES (1007, 1, N'Zack is spamming the tickets again', N'Any knowledge on how to stop him?', CAST(0xA6FF023A AS SmallDateTime), 2, 1, N'a7df7a47-1434-4d4b-8358-0ca1a2702450.jpg', 2, NULL)
SET IDENTITY_INSERT [dbo].[TSTTickets] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 1/19/2017 9:41:45 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND name = N'RoleNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 1/19/2017 9:41:45 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 1/19/2017 9:41:45 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 1/19/2017 9:41:45 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_RoleId')
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 1/19/2017 9:41:45 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 1/19/2017 9:41:45 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND name = N'UserNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTDepartments]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees]  WITH CHECK ADD  CONSTRAINT [FK_TSTEmployees_TSTDepartments] FOREIGN KEY([DeptID])
REFERENCES [dbo].[TSTDepartments] ([DeptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTDepartments]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] CHECK CONSTRAINT [FK_TSTEmployees_TSTDepartments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTEmployeeStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees]  WITH CHECK ADD  CONSTRAINT [FK_TSTEmployees_TSTEmployeeStatuses] FOREIGN KEY([EmployeeStatusID])
REFERENCES [dbo].[TSTEmployeeStatuses] ([StatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTEmployees_TSTEmployeeStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTEmployees]'))
ALTER TABLE [dbo].[TSTEmployees] CHECK CONSTRAINT [FK_TSTEmployees_TSTEmployeeStatuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]'))
ALTER TABLE [dbo].[TSTTechNotes]  WITH CHECK ADD  CONSTRAINT [FK_TSTTechNotes_TSTEmployees] FOREIGN KEY([TechID])
REFERENCES [dbo].[TSTEmployees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]'))
ALTER TABLE [dbo].[TSTTechNotes] CHECK CONSTRAINT [FK_TSTTechNotes_TSTEmployees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTTickets]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]'))
ALTER TABLE [dbo].[TSTTechNotes]  WITH CHECK ADD  CONSTRAINT [FK_TSTTechNotes_TSTTickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[TSTTickets] ([TicketID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTechNotes_TSTTickets]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTechNotes]'))
ALTER TABLE [dbo].[TSTTechNotes] CHECK CONSTRAINT [FK_TSTTechNotes_TSTTickets]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets]  WITH CHECK ADD  CONSTRAINT [FK_TSTTickets_TSTEmployees] FOREIGN KEY([SubmittedByID])
REFERENCES [dbo].[TSTEmployees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTEmployees]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] CHECK CONSTRAINT [FK_TSTTickets_TSTEmployees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTEmployees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets]  WITH CHECK ADD  CONSTRAINT [FK_TSTTickets_TSTEmployees1] FOREIGN KEY([TechID])
REFERENCES [dbo].[TSTEmployees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTEmployees1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] CHECK CONSTRAINT [FK_TSTTickets_TSTEmployees1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTTicketPriorites]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets]  WITH CHECK ADD  CONSTRAINT [FK_TSTTickets_TSTTicketPriorites] FOREIGN KEY([Priority])
REFERENCES [dbo].[TSTTicketPriorities] ([PriorityID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTTicketPriorites]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] CHECK CONSTRAINT [FK_TSTTickets_TSTTicketPriorites]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTTicketStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets]  WITH CHECK ADD  CONSTRAINT [FK_TSTTickets_TSTTicketStatuses] FOREIGN KEY([TicketStatusID])
REFERENCES [dbo].[TicketStatuses] ([TicketStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TSTTickets_TSTTicketStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[TSTTickets]'))
ALTER TABLE [dbo].[TSTTickets] CHECK CONSTRAINT [FK_TSTTickets_TSTTicketStatuses]
GO
ALTER DATABASE [TSTProject] SET  READ_WRITE 
GO
