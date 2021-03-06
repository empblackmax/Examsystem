USE [ExamOnline]
GO
/****** Object:  Table [dbo].[tb_test]    Script Date: 01/14/2014 13:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_test](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[testContent] [varchar](200) NULL,
	[testAns1] [varchar](200) NULL,
	[testAns2] [varchar](200) NULL,
	[testAns3] [varchar](200) NULL,
	[testAns4] [varchar](200) NULL,
	[rightAns] [varchar](200) NULL,
	[pub] [int] NULL,
	[testCourse] [varchar](50) NULL,
	[Examtype] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Teacher]    Script Date: 01/14/2014 13:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Teacher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherNum] [varchar](50) NULL,
	[TeacherName] [varchar](50) NULL,
	[TeacherPwd] [varchar](50) NULL,
	[Teachercourse] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Student]    Script Date: 01/14/2014 13:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentNum] [varchar](50) NULL,
	[StudentName] [varchar](50) NULL,
	[StudentPwd] [varchar](50) NULL,
	[StudentSex] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_score]    Script Date: 01/14/2014 13:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_score](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [varchar](50) NULL,
	[LessonName] [varchar](50) NULL,
	[score] [int] NULL,
	[StudentName] [varchar](50) NULL,
	[StudentAns] [varchar](200) NULL,
	[RightAns] [varchar](200) NULL,
	[ExamType] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Lesson]    Script Date: 01/14/2014 13:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Lesson](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LessonName] [varchar](50) NOT NULL,
	[LessonData Time] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Examtype]    Script Date: 01/14/2014 13:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Examtype](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Examtype] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Admin]    Script Date: 01/14/2014 13:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AdminNum] [varchar](50) NULL,
	[AdminName] [varchar](50) NULL,
	[AdminPwd] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
