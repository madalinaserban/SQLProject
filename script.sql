USE [master]
GO
/****** Object:  Database [dbTAM]    Script Date: 1/15/2023 5:18:51 PM ******/
CREATE DATABASE [dbTAM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbTAM', FILENAME = N'C:\Program Files\Microsoft SQL Server Express\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbTAM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbTAM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server Express\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbTAM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbTAM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbTAM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbTAM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbTAM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbTAM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbTAM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbTAM] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbTAM] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbTAM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbTAM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbTAM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbTAM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbTAM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbTAM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbTAM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbTAM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbTAM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbTAM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbTAM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbTAM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbTAM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbTAM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbTAM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbTAM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbTAM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbTAM] SET  MULTI_USER 
GO
ALTER DATABASE [dbTAM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbTAM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbTAM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbTAM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbTAM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbTAM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbTAM] SET QUERY_STORE = OFF
GO
USE [dbTAM]
GO
/****** Object:  Table [dbo].[Groupe]    Script Date: 1/15/2023 5:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groupe](
	[GroupeId] [int] IDENTITY(1,1) NOT NULL,
	[GroupeTypeId] [int] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Groupe] PRIMARY KEY CLUSTERED 
(
	[GroupeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupeType]    Script Date: 1/15/2023 5:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupeType](
	[GroupeTypeId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[ShortName] [nvarchar](10) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_GroupeType] PRIMARY KEY CLUSTERED 
(
	[GroupeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Note]    Script Date: 1/15/2023 5:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Note](
	[NoteId] [int] IDENTITY(1,1) NOT NULL,
	[ProfessorId] [int] NULL,
	[SubjectId] [int] NULL,
	[Grade] [smallint] NULL,
	[ExamDate] [date] NULL,
	[StudentId] [int] NULL,
 CONSTRAINT [PK_Note] PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professor]    Script Date: 1/15/2023 5:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professor](
	[ProfessorId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Cnp] [varchar](13) NOT NULL,
	[Telephone] [nvarchar](10) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Professor] PRIMARY KEY CLUSTERED 
(
	[ProfessorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 1/15/2023 5:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[GroupeId] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Cnp] [varchar](13) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 1/15/2023 5:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectTypeId] [int] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[ShortName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectProfessor]    Script Date: 1/15/2023 5:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectProfessor](
	[ProfessorSubjectid] [int] IDENTITY(1,1) NOT NULL,
	[Subjectid] [int] NOT NULL,
	[Professorid] [int] NOT NULL,
 CONSTRAINT [PK_SubjectProfessor] PRIMARY KEY CLUSTERED 
(
	[ProfessorSubjectid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectType]    Script Date: 1/15/2023 5:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectType](
	[SubjectTypeId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_SubjectType] PRIMARY KEY CLUSTERED 
(
	[SubjectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Groupe] ADD  CONSTRAINT [DF_Groupe_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[GroupeType] ADD  CONSTRAINT [DF_GroupeType_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Professor] ADD  CONSTRAINT [DF_Professor_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Subject] ADD  CONSTRAINT [DF_Subject_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[SubjectType] ADD  CONSTRAINT [DF_SubjectType_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Groupe]  WITH CHECK ADD  CONSTRAINT [FK_Groupe_GroupeType] FOREIGN KEY([GroupeTypeId])
REFERENCES [dbo].[GroupeType] ([GroupeTypeId])
GO
ALTER TABLE [dbo].[Groupe] CHECK CONSTRAINT [FK_Groupe_GroupeType]
GO
ALTER TABLE [dbo].[Note]  WITH CHECK ADD  CONSTRAINT [FK_Note_Professor] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professor] ([ProfessorId])
GO
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_Professor]
GO
ALTER TABLE [dbo].[Note]  WITH CHECK ADD  CONSTRAINT [FK_Note_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_Student]
GO
ALTER TABLE [dbo].[Note]  WITH CHECK ADD  CONSTRAINT [FK_Note_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_Subject]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Groupe] FOREIGN KEY([GroupeId])
REFERENCES [dbo].[Groupe] ([GroupeId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Groupe]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_SubjectType1] FOREIGN KEY([SubjectTypeId])
REFERENCES [dbo].[SubjectType] ([SubjectTypeId])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_SubjectType1]
GO
ALTER TABLE [dbo].[SubjectProfessor]  WITH CHECK ADD  CONSTRAINT [FK_SubjectProfessor_Professor] FOREIGN KEY([Professorid])
REFERENCES [dbo].[Professor] ([ProfessorId])
GO
ALTER TABLE [dbo].[SubjectProfessor] CHECK CONSTRAINT [FK_SubjectProfessor_Professor]
GO
ALTER TABLE [dbo].[SubjectProfessor]  WITH CHECK ADD  CONSTRAINT [FK_SubjectProfessor_Subject] FOREIGN KEY([Subjectid])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[SubjectProfessor] CHECK CONSTRAINT [FK_SubjectProfessor_Subject]
GO
/****** Object:  StoredProcedure [dbo].[DELETESTUDENT]    Script Date: 1/15/2023 5:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETESTUDENT] @ID_STUDENT INT
AS
UPDATE Student
SET Student.Active= 0
WHERE StudentId = @ID_STUDENT
GO
/****** Object:  StoredProcedure [dbo].[GETID_STUDENT]    Script Date: 1/15/2023 5:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETID_STUDENT] @MAIL NVARCHAR(255)
AS
SELECT StudentId FROM Student WHERE Email=@MAIL
GO
/****** Object:  StoredProcedure [dbo].[InsertStudent]    Script Date: 1/15/2023 5:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertStudent] @GroupeId int, @FirstName nvarchar(50), @LastName nvarchar(50),@Cnp varchar(13), @Email nvarchar(255), @Active bit
AS
BEGIN
	INSERT INTO dbo.Student(
		GroupeId,FirstName,LastName,Cnp,Email,Active)
		VALUES(@GroupeId,@FirstName,@LastName,@Cnp,@Email,@Active)
END
GO
/****** Object:  StoredProcedure [dbo].[spStudentSelect]    Script Date: 1/15/2023 5:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spStudentSelect]
	-- Add the parameters for the stored procedure here
	@StudentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [StudentId]
      ,[GroupeId]
      ,[FirstName]
      ,[LastName]
      ,[Cnp]
      ,[Email]
      --,[Active]
  FROM [dbo].[Student]
  WHERE [StudentId] = @StudentId
END
GO
/****** Object:  StoredProcedure [dbo].[spStudentUpdate]    Script Date: 1/15/2023 5:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spStudentUpdate]
	-- Add the parameters for the stored procedure here
	@StudentId int,
	@GroupeId int,
    @FirstName nchar(50),
    @LastName nchar(50),
    @Cnp varchar(13),
    @Email nchar(255),
    @Active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Student]
   SET [GroupeId] = @GroupeId
      ,[FirstName] = @FirstName
,[LastName] = @LastName
      ,[Cnp] = @Cnp
      ,[Email] = @Email
      ,[Active] = @Active
 WHERE StudentId=@StudentId
 end
GO
USE [master]
GO
ALTER DATABASE [dbTAM] SET  READ_WRITE 
GO
