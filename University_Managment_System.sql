USE [master]
GO
/****** Object:  Database [UniversityManagementSystemDB]    Script Date: 29-Sep-18 2:06:56 PM ******/
CREATE DATABASE [UniversityManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'[VoidUniversityManagementDB]', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\[VoidUniversityManagementDB] .mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'[VoidUniversityManagementDB] _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\[VoidUniversityManagementDB] _log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityManagementSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityManagementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityManagementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityManagementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityManagementSystemDB]
GO
/****** Object:  StoredProcedure [dbo].[spAddCourse]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddCourse]
@Code nvarchar(50),
@Name nvarchar(50),
@Credit float,
@Description nvarchar(max),
@DepartmentId int,
@SemesterId int
AS
BEGIN
INSERT INTO t_Course VALUES(@Code,@Name,@Credit,@Description,@DepartmentId,@SemesterId);
END







GO
/****** Object:  StoredProcedure [dbo].[spAddStudent]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddStudent]
@Name nvarchar(50),
@RegNo nvarchar(20),
@Email nvarchar(50),
@ContactNo nvarchar(20),
@RegisterationDate datetime,
@Address nvarchar(50),
@DepartmentId int
AS
BEGIN
INSERT INTO t_Student VALUES(@Name,@RegNo,@Email,@ContactNo,@RegisterationDate,@Address,@DepartmentId);
END







GO
/****** Object:  StoredProcedure [dbo].[spAddTeacher]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddTeacher]
@Name nvarchar(50),
@Address nvarchar(Max),
@Email nvarchar(50),
@Contact nvarchar(50),
@DesignationId int,
@DepartmentId int,
@CreditTobeTaken float,
@RemainingCredit float
AS
BEGIN

INSERT INTO t_Teacher VALUES(@Name,@Address,@Email,@Contact, @DesignationId,@DepartmentId,@CreditTobeTaken,@RemainingCredit)
END








GO
/****** Object:  StoredProcedure [dbo].[spClassScheduleAndClassRoomAllocation]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spClassScheduleAndClassRoomAllocation]
AS
BEGIN
SELECT d.Id as DepartmentId,c.Code,c.Name,COALESCE(t_Room.Name,'Not sheduled yet') AS Room_Name,t_Day.Name as Day_Name,r.StartTime,r.EndTime as EndTime
FROM t_Course c  LEFT OUTER JOIN t_AllocateClassRoom r
ON r.CourseId=c.Id LEFT OUTER JOIN t_Room  
ON r.RoomId=t_Room.Id LEFT OUTER JOIN t_Day 
ON r.DayId=t_Day.Id LEFT OUTER JOIN t_Departments d ON c.DepartmentId=d.Id 
END







GO
/****** Object:  StoredProcedure [dbo].[spDepartmentInformationWithTeacher]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDepartmentInformationWithTeacher]
As
BEGIN
SELECT d.Id,d.Code,d.Name, COALESCE(t.Name,'Not Assign yet') as Teacher,t.Email,t.Contact FROM t_Departments d LEFT OUTER JOIN t_Teacher t ON d.Id=t.DepartmentId
END








GO
/****** Object:  StoredProcedure [dbo].[spGetCourseByStudentId]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCourseByStudentId]
@Id  int
AS
 BEGIN
Select C.Id,c.Code,c.Name,c.Credit,c.Descirption,c.DepartmentId,c.SemesterId FROM t_Departments d INNER JOIN t_Course c ON d.Id=c.DepartmentId AND d.Id=(SELECT s.DepartmentId FROM t_Student s WHERE s.Id=@Id)
END







GO
/****** Object:  StoredProcedure [dbo].[spGetCourseInformation]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCourseInformation]
AS
BEGIN
SELECT d.Id as DepartmentId,COALESCE(c.Code,'Not Assigned yet') AS Code,COALESCE(c.Name,'Not Assigned yet') AS Name,COALESCE(s.Name,'Not Assigned yet') as Semester,COALESCE(t.Name,'Not Assigned yet')  as Teacher FROM  t_Departments d  LEFT OUTER JOIN t_Course  c  ON d.Id=c.DepartmentId LEFT OUTER JOIN  t_Semester s ON c.SemesterId=s.Id  LEFT OUTER JOIN t_CourseAssignToTeacher Ct  ON (c.Id=Ct.CourseId AND Ct.IsActive=1) LEFT OUTER JOIN t_Teacher t ON t.Id=Ct.TeacherId ORDER BY c.Code
END







GO
/****** Object:  StoredProcedure [dbo].[spGetCoursesTakenByaStudent]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCoursesTakenByaStudent]
  @StudentId int
  AS
  BEGIN
  SELECT c.Id,c.Code,c.Name,c.Credit,c.Descirption,c.DepartmentId,c.SemesterId FROM t_Course c INNER JOIN t_StudentEnrollInCourse r ON (c.Id=r.CourseId AND r.StudentId=@StudentId AND r.IsStudentActive=1)
  END







GO
/****** Object:  StoredProcedure [dbo].[spGetStudentInformationById]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[spGetStudentInformationById]
  @Id int
  AS
  BEGIN

  SELECT s.Id,s.RegNo,s.Name,s.Email,s.ContactNo,s.RegisterationDate,s.Address,d.Name as Department FROM t_Student s INNER JOIN t_Departments d ON s.DepartmentId=d.Id AND s.Id=@Id
  END







GO
/****** Object:  StoredProcedure [dbo].[spGetStudentResult]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetStudentResult]
@studentId int
AS
BEGIN
SELECT en.StudentId, c.Code,c.Name,COALESCE(r.Grade,'Not Graded yet') as Grade FROM t_StudentResult r RIGHT OUTER JOIN ( SELECT e.Id,e.StudentId,e.CourseId FROM t_StudentEnrollInCourse e WHERE e.StudentId=@studentId AND e.IsStudentActive=1) en ON r.CourseId=en.CourseId AND r.StudentId=en.StudentId AND r.IsStudentActive=1 INNER JOIN t_Course c ON en.CourseId=c.Id
END







GO
/****** Object:  Table [dbo].[ AllocateClassRoom]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ AllocateClassRoom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[StartTime] [varchar](50) NOT NULL,
	[EndTime] [varchar](50) NOT NULL,
	[AllocationStatus] [bit] NULL,
 CONSTRAINT [PK_t_AllocateClassRoom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ Course]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Credit] [float] NOT NULL,
	[Descirption] [nvarchar](max) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_t_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ CourseAssignToTeacher]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ CourseAssignToTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_t_CourseAssignToTeacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ Day]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ Day](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_t_Day] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ Departments]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](7) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_t_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ Designation]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
 CONSTRAINT [PK_t_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ Room]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_t_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ Semester]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ Semester](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_t_Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ Student]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[RegisterationDate] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_t_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ StudentEnrollInCourse]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ StudentEnrollInCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[EnrollDate] [nvarchar](50) NOT NULL,
	[IsStudentActive] [bit] NULL,
 CONSTRAINT [PK_t_StudentEnrollInCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ StudentResult]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ StudentResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Grade] [nvarchar](5) NOT NULL,
	[IsStudentActive] [bit] NULL,
 CONSTRAINT [PK_t_StudentResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ Teacher]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditToBeTaken] [float] NOT NULL,
	[CreditTaken] [float] NOT NULL,
 CONSTRAINT [PK_t_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[CourseViewStatics]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseViewStatics]
AS
SELECT dbo.[ Course].Code, dbo.[ Course].Name, dbo.[ Semester].Name AS SemesterName, dbo.[ Departments].Id, dbo.[ Departments].Name AS Expr2, dbo.[ Teacher].Name AS TeacherName
FROM     dbo.[ Course] INNER JOIN
                  dbo.[ Semester] ON dbo.[ Course].SemesterId = dbo.[ Semester].Id INNER JOIN
                  dbo.[ Departments] ON dbo.[ Course].DepartmentId = dbo.[ Departments].Id INNER JOIN
                  dbo.[ Teacher] ON dbo.[ Departments].Id = dbo.[ Teacher].DepartmentId

GO
/****** Object:  View [dbo].[GetStudentResult]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetStudentResult]
AS
SELECT en.StudentId, c.Code,c.Name,COALESCE(r.Grade,'Not Graded yet') as Grade,r.IsStudentActive FROM t_StudentResult r RIGHT OUTER JOIN ( SELECT e.Id,e.StudentId,e.CourseId FROM t_StudentEnrollInCourse e WHERE  e.IsStudentActive=1) en ON r.CourseId=en.CourseId AND r.StudentId=en.StudentId INNER JOIN t_Course c ON en.CourseId=c.Id








GO
/****** Object:  View [dbo].[ScheduleOfClass]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ScheduleOfClass]
AS
SELECT d.Id as DepartmentId,c.Id AS CourseId,c.Code,c.Name,COALESCE(t_Room.Name,'Not sheduled yet') AS Room_Name,COALESCE(t_Day.Name,'Not sheduled yet') as Day_Name,

case when r.StartTime IS NULL THEN '00:00:00.0000000'
else CONVERT(varchar, r.StartTime) end as StartTime,
case when r.EndTime IS NULL THEN '00:00:00.0000000'
else CONVERT(varchar, r.EndTime) end as EndTime,
COALESCE(AllocationStatus,0) AS AllocationStatus
FROM t_Course c  LEFT OUTER JOIN t_AllocateClassRoom r
ON r.CourseId=c.Id LEFT OUTER JOIN t_Room  
ON r.RoomId=t_Room.Id LEFT OUTER JOIN t_Day 
ON r.DayId=t_Day.Id LEFT OUTER JOIN t_Departments d ON c.DepartmentId=d.Id 









GO
/****** Object:  View [dbo].[StudentResult]    Script Date: 29-Sep-18 2:06:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create VIEW [dbo].[StudentResult]
AS
SELECT c.Id,c.Code,c.Name,r.Grade FROM t_Course c INNER JOIN ( SELECT r.Id,r.StudentId,r.CourseId,r.Grade FROM t_StudentResult r WHERE StudentId=2 ) r  ON  c.Id=r.CourseId 









GO
SET IDENTITY_INSERT [dbo].[ AllocateClassRoom] ON 

INSERT [dbo].[ AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (1, 1, 1, 1, 2, N'10:01 PM', N'10:01 PM', 0)
INSERT [dbo].[ AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (2, 2, 2, 1, 1, N'2:30 PM', N'3:49 PM', 0)
SET IDENTITY_INSERT [dbo].[ AllocateClassRoom] OFF
SET IDENTITY_INSERT [dbo].[ Course] ON 

INSERT [dbo].[ Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (1, N'CSE111', N'Introduction to Software', 4, N'hrgj', 1, 1)
INSERT [dbo].[ Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (2, N'BBA111', N'basain', 4, N'buuuu', 2, 1)
INSERT [dbo].[ Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (4, N'cse325', N'computer graphics', 3.5, N'djfldfd', 1, 6)
INSERT [dbo].[ Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (5, N'CSE112', N'programming', 3.5, N'yfdsas', 1, 6)
INSERT [dbo].[ Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (8, N'CSE333', N'Math', 5, N'kkkkkk', 6, 3)
INSERT [dbo].[ Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (9, N'CSE444', N'phy', 6, N'lllll', 6, 6)
SET IDENTITY_INSERT [dbo].[ Course] OFF
SET IDENTITY_INSERT [dbo].[ CourseAssignToTeacher] ON 

INSERT [dbo].[ CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (1, 1, 1, 1, 1)
INSERT [dbo].[ CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (2, 2, 2, 2, 1)
INSERT [dbo].[ CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (4, 6, 9, 8, 1)
SET IDENTITY_INSERT [dbo].[ CourseAssignToTeacher] OFF
SET IDENTITY_INSERT [dbo].[ Day] ON 

INSERT [dbo].[ Day] ([Id], [Name]) VALUES (1, N'Saturday')
INSERT [dbo].[ Day] ([Id], [Name]) VALUES (2, N'Sunday')
INSERT [dbo].[ Day] ([Id], [Name]) VALUES (3, N'Monday')
INSERT [dbo].[ Day] ([Id], [Name]) VALUES (4, N'Tuesday')
INSERT [dbo].[ Day] ([Id], [Name]) VALUES (5, N'Wednessday')
INSERT [dbo].[ Day] ([Id], [Name]) VALUES (6, N'Thursday')
INSERT [dbo].[ Day] ([Id], [Name]) VALUES (7, N'Friday')
SET IDENTITY_INSERT [dbo].[ Day] OFF
SET IDENTITY_INSERT [dbo].[ Departments] ON 

INSERT [dbo].[ Departments] ([Id], [Code], [Name]) VALUES (1, N'CSE', N'Computer Science Engineering')
INSERT [dbo].[ Departments] ([Id], [Code], [Name]) VALUES (2, N'BBA101', N'Bachelor of business ')
INSERT [dbo].[ Departments] ([Id], [Code], [Name]) VALUES (5, N'IT', N'Information Technology')
INSERT [dbo].[ Departments] ([Id], [Code], [Name]) VALUES (6, N'ME', N'Mechanical Engineering')
INSERT [dbo].[ Departments] ([Id], [Code], [Name]) VALUES (9, N'EE', N'Electrical Engineering')
INSERT [dbo].[ Departments] ([Id], [Code], [Name]) VALUES (24, N'MG', N'Management')
INSERT [dbo].[ Departments] ([Id], [Code], [Name]) VALUES (25, N'E', N'electronics')
SET IDENTITY_INSERT [dbo].[ Departments] OFF
SET IDENTITY_INSERT [dbo].[ Designation] ON 

INSERT [dbo].[ Designation] ([Id], [Title]) VALUES (1, N'Professor')
INSERT [dbo].[ Designation] ([Id], [Title]) VALUES (2, N'Assistent Professor')
INSERT [dbo].[ Designation] ([Id], [Title]) VALUES (3, N'Lecturer')
SET IDENTITY_INSERT [dbo].[ Designation] OFF
SET IDENTITY_INSERT [dbo].[ Room] ON 

INSERT [dbo].[ Room] ([Id], [Name]) VALUES (1, N'Room No:101')
INSERT [dbo].[ Room] ([Id], [Name]) VALUES (2, N'Room No:102')
INSERT [dbo].[ Room] ([Id], [Name]) VALUES (3, N'Room No:103')
INSERT [dbo].[ Room] ([Id], [Name]) VALUES (4, N'Room No:201')
INSERT [dbo].[ Room] ([Id], [Name]) VALUES (5, N'Room No:202')
INSERT [dbo].[ Room] ([Id], [Name]) VALUES (6, N'Room No:203')
INSERT [dbo].[ Room] ([Id], [Name]) VALUES (7, N'Room No:301')
INSERT [dbo].[ Room] ([Id], [Name]) VALUES (8, N'Room No:302')
INSERT [dbo].[ Room] ([Id], [Name]) VALUES (9, N'Room No:303')
SET IDENTITY_INSERT [dbo].[ Room] OFF
SET IDENTITY_INSERT [dbo].[ Semester] ON 

INSERT [dbo].[ Semester] ([Id], [Name]) VALUES (1, N'1st')
INSERT [dbo].[ Semester] ([Id], [Name]) VALUES (2, N'2nd')
INSERT [dbo].[ Semester] ([Id], [Name]) VALUES (3, N'3rd')
INSERT [dbo].[ Semester] ([Id], [Name]) VALUES (4, N'4th')
INSERT [dbo].[ Semester] ([Id], [Name]) VALUES (5, N'5th')
INSERT [dbo].[ Semester] ([Id], [Name]) VALUES (6, N'6th')
INSERT [dbo].[ Semester] ([Id], [Name]) VALUES (7, N'7th')
INSERT [dbo].[ Semester] ([Id], [Name]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[ Semester] OFF
SET IDENTITY_INSERT [dbo].[ Student] ON 

INSERT [dbo].[ Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (1, N'CSE-2018-001', N'fghfh', N'fgdf@gmail.com', N'44654645635', N'6/6/2018', N'uhjl', 1)
INSERT [dbo].[ Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (2, N'BBA101-2018-001', N'Abu Hasan', N'hasan@gmail.com', N'01933322211', N'06-Jun-18', N'Khulna', 2)
INSERT [dbo].[ Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (3, N'CSE-2018-002', N'Robin Chandro Mozumder', N'robi@gmail.com', N'013644', N'28-Sep-18', N'446djfh', 1)
INSERT [dbo].[ Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (4, N'CSE-2018-003', N'Robin', N'gonopati@gmail.com', N'1548', N'28-Sep-18', N'asd', 1)
INSERT [dbo].[ Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (5, N'ME-2018-001', N'vrindaban', N'probhupad@gmail.com', N'549491', N'28-Sep-18', N'sa', 6)
SET IDENTITY_INSERT [dbo].[ Student] OFF
SET IDENTITY_INSERT [dbo].[ StudentEnrollInCourse] ON 

INSERT [dbo].[ StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (1, 1, 1, N'06-Jun-18', 1)
SET IDENTITY_INSERT [dbo].[ StudentEnrollInCourse] OFF
SET IDENTITY_INSERT [dbo].[ Teacher] ON 

INSERT [dbo].[ Teacher] ([Id], [Name], [Address], [Email], [Contact], [DesignationId], [DepartmentId], [CreditToBeTaken], [CreditTaken]) VALUES (1, N'hhfgh', N'fghfgh', N'fgdf@gmail.com', N'44654645635', 3, 1, 12, 4)
INSERT [dbo].[ Teacher] ([Id], [Name], [Address], [Email], [Contact], [DesignationId], [DepartmentId], [CreditToBeTaken], [CreditTaken]) VALUES (2, N'Hasan', N'Dhaka ', N'hasan@gmail.com', N'01947521133', 1, 2, 12, 4)
INSERT [dbo].[ Teacher] ([Id], [Name], [Address], [Email], [Contact], [DesignationId], [DepartmentId], [CreditToBeTaken], [CreditTaken]) VALUES (9, N'Gonopati', N'39', N'gonopati@gmail.com', N'36987', 3, 6, 4, 0)
INSERT [dbo].[ Teacher] ([Id], [Name], [Address], [Email], [Contact], [DesignationId], [DepartmentId], [CreditToBeTaken], [CreditTaken]) VALUES (10, N'ganapati', N'kljh', N'googl@gmail.com', N'3210816', 3, 6, 4, 0)
SET IDENTITY_INSERT [dbo].[ Teacher] OFF
ALTER TABLE [dbo].[ AllocateClassRoom] ADD  CONSTRAINT [DF_t_AllocateClassRoom_AllocationStatus]  DEFAULT ((1)) FOR [AllocationStatus]
GO
ALTER TABLE [dbo].[ CourseAssignToTeacher] ADD  CONSTRAINT [DF_t_CourseAssignToTeacher_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ StudentEnrollInCourse] ADD  CONSTRAINT [DF_t_StudentEnrollInCourse_IsStudentActive]  DEFAULT ((1)) FOR [IsStudentActive]
GO
ALTER TABLE [dbo].[ StudentResult] ADD  CONSTRAINT [DF_t_StudentResult_IsStudentActive]  DEFAULT ((1)) FOR [IsStudentActive]
GO
ALTER TABLE [dbo].[ AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_t_AllocateClassRoom_t_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[ Course] ([Id])
GO
ALTER TABLE [dbo].[ AllocateClassRoom] CHECK CONSTRAINT [FK_t_AllocateClassRoom_t_Course]
GO
ALTER TABLE [dbo].[ AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_t_AllocateClassRoom_t_Day] FOREIGN KEY([DayId])
REFERENCES [dbo].[ Day] ([Id])
GO
ALTER TABLE [dbo].[ AllocateClassRoom] CHECK CONSTRAINT [FK_t_AllocateClassRoom_t_Day]
GO
ALTER TABLE [dbo].[ AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_t_AllocateClassRoom_t_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[ Departments] ([Id])
GO
ALTER TABLE [dbo].[ AllocateClassRoom] CHECK CONSTRAINT [FK_t_AllocateClassRoom_t_Departments]
GO
ALTER TABLE [dbo].[ AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_t_AllocateClassRoom_t_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[ Room] ([Id])
GO
ALTER TABLE [dbo].[ AllocateClassRoom] CHECK CONSTRAINT [FK_t_AllocateClassRoom_t_Room]
GO
ALTER TABLE [dbo].[ Course]  WITH CHECK ADD  CONSTRAINT [FK_t_Course_t_Semester] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[ Departments] ([Id])
GO
ALTER TABLE [dbo].[ Course] CHECK CONSTRAINT [FK_t_Course_t_Semester]
GO
ALTER TABLE [dbo].[ Course]  WITH CHECK ADD  CONSTRAINT [FK_t_Course_t_Semester1] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[ Semester] ([Id])
GO
ALTER TABLE [dbo].[ Course] CHECK CONSTRAINT [FK_t_Course_t_Semester1]
GO
ALTER TABLE [dbo].[ CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_t_CourseAssignToTeacher_t_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[ Course] ([Id])
GO
ALTER TABLE [dbo].[ CourseAssignToTeacher] CHECK CONSTRAINT [FK_t_CourseAssignToTeacher_t_Course]
GO
ALTER TABLE [dbo].[ CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_t_CourseAssignToTeacher_t_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[ Departments] ([Id])
GO
ALTER TABLE [dbo].[ CourseAssignToTeacher] CHECK CONSTRAINT [FK_t_CourseAssignToTeacher_t_Departments]
GO
ALTER TABLE [dbo].[ CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_t_CourseAssignToTeacher_t_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[ Teacher] ([Id])
GO
ALTER TABLE [dbo].[ CourseAssignToTeacher] CHECK CONSTRAINT [FK_t_CourseAssignToTeacher_t_Teacher]
GO
ALTER TABLE [dbo].[ StudentEnrollInCourse]  WITH CHECK ADD  CONSTRAINT [FK_t_StudentEnrollInCourse_t_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[ Course] ([Id])
GO
ALTER TABLE [dbo].[ StudentEnrollInCourse] CHECK CONSTRAINT [FK_t_StudentEnrollInCourse_t_Course]
GO
ALTER TABLE [dbo].[ StudentEnrollInCourse]  WITH CHECK ADD  CONSTRAINT [FK_t_StudentEnrollInCourse_t_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[ Student] ([Id])
GO
ALTER TABLE [dbo].[ StudentEnrollInCourse] CHECK CONSTRAINT [FK_t_StudentEnrollInCourse_t_Student]
GO
ALTER TABLE [dbo].[ StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_t_StudentResult_t_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[ Course] ([Id])
GO
ALTER TABLE [dbo].[ StudentResult] CHECK CONSTRAINT [FK_t_StudentResult_t_Course]
GO
ALTER TABLE [dbo].[ StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_t_StudentResult_t_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[ Student] ([Id])
GO
ALTER TABLE [dbo].[ StudentResult] CHECK CONSTRAINT [FK_t_StudentResult_t_Student]
GO
ALTER TABLE [dbo].[ Teacher]  WITH CHECK ADD  CONSTRAINT [FK_t_Teacher_t_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[ Designation] ([Id])
GO
ALTER TABLE [dbo].[ Teacher] CHECK CONSTRAINT [FK_t_Teacher_t_Designation]
GO
ALTER TABLE [dbo].[ Teacher]  WITH CHECK ADD  CONSTRAINT [FK_t_Teacher_t_Teacher] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[ Departments] ([Id])
GO
ALTER TABLE [dbo].[ Teacher] CHECK CONSTRAINT [FK_t_Teacher_t_Teacher]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[61] 4[3] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = " Course"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = " Semester"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 294
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = " Departments"
            Begin Extent = 
               Top = 294
               Left = 48
               Bottom = 435
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = " Teacher"
            Begin Extent = 
               Top = 441
               Left = 48
               Bottom = 604
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1512
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseViewStatics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseViewStatics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseViewStatics'
GO
USE [master]
GO
ALTER DATABASE [UniversityManagementSystemDB] SET  READ_WRITE 
GO
