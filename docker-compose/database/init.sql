IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DockerSpringSqlServer')
BEGIN
  CREATE DATABASE [lms_cpl];
END;
GO
USE [lms_cpl]
GO
/****** Object:  Table [dbo].[Assignment]    Script Date: 02/09/2025 4:21:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[classRoomId] [int] NULL,
	[title] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[assignmentUrl] [nvarchar](500) NULL,
	[startAt] [datetime] NULL,
	[endAt] [datetime] NULL,
	[maxScore] [int] NULL,
	[createBy] [int] NULL,
	[isAllowLate] [bit] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignmentResult]    Script Date: 02/09/2025 4:21:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignmentResult](
	[userId] [int] NOT NULL,
	[assignmentId] [int] NOT NULL,
	[doneAt] [datetime] NULL,
	[submissionUrl] [nvarchar](500) NULL,
	[mark] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_AssignmentResult] PRIMARY KEY CLUSTERED
(
	[userId] ASC,
	[assignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassRoom]    Script Date: 02/09/2025 4:21:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassRoom](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[className] [nvarchar](255) NULL,
	[createAt] [datetime] NULL,
	[createBy] [int] NULL,
	[inviteCode] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 02/09/2025 4:21:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[category] [nvarchar](100) NULL,
	[level] [nvarchar](50) NULL,
	[duration] [int] NULL,
	[status] [nvarchar](50) NULL,
	[author] [nvarchar](255) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseContent]    Script Date: 02/09/2025 4:21:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseContent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseId] [int] NULL,
	[title] [nvarchar](255) NULL,
	[type] [varchar](255) NULL,
	[contentUrl] [nvarchar](500) NULL,
	[duration] [int] NULL,
	[orderIndex] [int] NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseTest]    Script Date: 02/09/2025 4:21:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseTest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseId] [int] NULL,
	[testTitle] [nvarchar](255) NULL,
	[testDescription] [nvarchar](max) NULL,
	[type] [nvarchar](50) NULL,
	[testUrl] [nvarchar](500) NULL,
	[maxScore] [int] NULL,
	[duration] [int] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseTestResult]    Script Date: 02/09/2025 4:21:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseTestResult](
	[userId] [int] NOT NULL,
	[courseTestId] [int] NOT NULL,
	[mark] [int] NULL,
	[doneAt] [datetime] NULL,
	[status] [int] NULL,
	[url] [varchar](500) NULL,
PRIMARY KEY CLUSTERED
(
	[userId] ASC,
	[courseTestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnrollClassRoom]    Script Date: 02/09/2025 4:21:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollClassRoom](
	[userId] [int] NOT NULL,
	[classRoomId] [int] NOT NULL,
	[enrollAt] [datetime] NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[userId] ASC,
	[classRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnrollCourse]    Script Date: 02/09/2025 4:21:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollCourse](
	[userId] [int] NOT NULL,
	[courseId] [int] NOT NULL,
	[enrollAt] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[userId] ASC,
	[courseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 02/09/2025 4:21:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[token] [nvarchar](512) NOT NULL,
	[expireTime] [datetime2](7) NOT NULL,
	[isUsed] [bit] NOT NULL,
	[userId] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token]    Script Date: 02/09/2025 4:21:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[token] [varchar](500) NULL,
	[isUsed] [bit] NULL,
	[isExpired] [bit] NULL,
	[userId] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 02/09/2025 4:21:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[fullName] [nvarchar](255) NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[avatarUrl] [nvarchar](500) NULL,
	[role] [int] NULL,
	[status] [int] NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assignment] ON

INSERT [dbo].[Assignment] ([id], [classRoomId], [title], [description], [assignmentUrl], [startAt], [endAt], [maxScore], [createBy], [isAllowLate]) VALUES (1, 1, N'Java Homework 1', N'Complete exercises 1-5', N'C:\Users\thanh\OneDrive\Documents\test.txt', CAST(N'2025-06-30T16:26:42.413' AS DateTime), CAST(N'2025-07-07T16:26:42.413' AS DateTime), 100, 2, 1)
INSERT [dbo].[Assignment] ([id], [classRoomId], [title], [description], [assignmentUrl], [startAt], [endAt], [maxScore], [createBy], [isAllowLate]) VALUES (2, 2, N'Web Homework 1', N'Create a webpage', N'C:\Users\thanh\OneDrive\Documents\test.txt', CAST(N'2025-06-30T16:26:42.413' AS DateTime), CAST(N'2025-07-05T16:26:42.413' AS DateTime), 100, 2, 0)
INSERT [dbo].[Assignment] ([id], [classRoomId], [title], [description], [assignmentUrl], [startAt], [endAt], [maxScore], [createBy], [isAllowLate]) VALUES (3, 3, N'BTVN', N'Lam kanji', N'C:\Users\thanh\OneDrive\Documents\FALL2023\CEA-FA~1\APZNZA~1.PDF', CAST(N'2025-07-01T20:18:42.767' AS DateTime), CAST(N'2025-07-17T03:04:00.000' AS DateTime), 100, 1, 1)
INSERT [dbo].[Assignment] ([id], [classRoomId], [title], [description], [assignmentUrl], [startAt], [endAt], [maxScore], [createBy], [isAllowLate]) VALUES (4, 3, N'BTVN hom nay', N'oop slide', N'C:\Users\thanh\OneDrive\Documents\FALL2023\CEA-FA~1\APZNZA~1.PDF', CAST(N'2025-07-03T21:20:10.533' AS DateTime), CAST(N'2025-07-09T02:04:00.000' AS DateTime), 100, 1, 1)
INSERT [dbo].[Assignment] ([id], [classRoomId], [title], [description], [assignmentUrl], [startAt], [endAt], [maxScore], [createBy], [isAllowLate]) VALUES (5, 1, N'test btvn', N'test', N'C:\Users\thanh\OneDrive\Documents\FALL2023\CEA-FA~1\APZNZA~1.PDF', CAST(N'2025-07-03T21:20:10.533' AS DateTime), CAST(N'2025-07-09T02:04:00.000' AS DateTime), 100, 2, 1)
INSERT [dbo].[Assignment] ([id], [classRoomId], [title], [description], [assignmentUrl], [startAt], [endAt], [maxScore], [createBy], [isAllowLate]) VALUES (6, 1011, N'ngahaha', N'ngahaha', N'76d0fafe7d0e15dd7c63fb87573f6468_6247914017084683284.png', CAST(N'2025-08-19T16:24:10.653' AS DateTime), CAST(N'2025-08-24T21:24:00.000' AS DateTime), 100, 14, 1)
INSERT [dbo].[Assignment] ([id], [classRoomId], [title], [description], [assignmentUrl], [startAt], [endAt], [maxScore], [createBy], [isAllowLate]) VALUES (7, 1011, N'tesst', N'tests', N'314585044_1185912979005926_8789201185581381365_n.jpg', CAST(N'2025-08-21T11:27:52.997' AS DateTime), CAST(N'2025-08-27T04:27:00.000' AS DateTime), 100, 14, 1)
INSERT [dbo].[Assignment] ([id], [classRoomId], [title], [description], [assignmentUrl], [startAt], [endAt], [maxScore], [createBy], [isAllowLate]) VALUES (8, 1014, N'test', N'123', N'311520337_783887232867451_4852056214614198369_n.jpg', CAST(N'2025-08-24T16:45:20.280' AS DateTime), CAST(N'2025-08-20T21:45:00.000' AS DateTime), 100, 14, 1)
INSERT [dbo].[Assignment] ([id], [classRoomId], [title], [description], [assignmentUrl], [startAt], [endAt], [maxScore], [createBy], [isAllowLate]) VALUES (9, 1020, N'testing ass', N'testing ass', N'297196622_126728490069371_4531916935010711145_n.png', CAST(N'2025-08-25T10:16:40.700' AS DateTime), CAST(N'2025-08-07T10:16:00.000' AS DateTime), 100, 14, 1)
INSERT [dbo].[Assignment] ([id], [classRoomId], [title], [description], [assignmentUrl], [startAt], [endAt], [maxScore], [createBy], [isAllowLate]) VALUES (10, 1025, N'Bài tập về ORM/ Hibernate', N'Bài tập về ORM/ Hibernate', N'1a1b7d8e-5733-4562-b998-ff32d04cc714.jfif', CAST(N'2025-08-30T10:46:42.330' AS DateTime), CAST(N'2025-08-20T02:46:00.000' AS DateTime), 10, 1019, 1)
INSERT [dbo].[Assignment] ([id], [classRoomId], [title], [description], [assignmentUrl], [startAt], [endAt], [maxScore], [createBy], [isAllowLate]) VALUES (11, 1025, N'baif tập về JPA', N'baif tập về JPA', N'76d0fafe7d0e15dd7c63fb87573f6468_6247914017084683284.png', CAST(N'2025-08-30T16:49:54.277' AS DateTime), CAST(N'2025-08-30T16:53:00.000' AS DateTime), 100, 1025, 1)
INSERT [dbo].[Assignment] ([id], [classRoomId], [title], [description], [assignmentUrl], [startAt], [endAt], [maxScore], [createBy], [isAllowLate]) VALUES (12, 1025, N'Bài tập về thymleaf', N'kiểm tra annotation', N'496dddbac1d51f8b46c4.jpg', CAST(N'2025-08-30T19:48:58.420' AS DateTime), CAST(N'2025-08-01T22:48:00.000' AS DateTime), 100, 1025, 1)
INSERT [dbo].[Assignment] ([id], [classRoomId], [title], [description], [assignmentUrl], [startAt], [endAt], [maxScore], [createBy], [isAllowLate]) VALUES (1012, 1027, N'Bài tập hello world', N'Bài tập hello world', N'TemplateSWT301PE.docx', CAST(N'2025-09-02T10:48:29.647' AS DateTime), CAST(N'2025-09-28T02:48:00.000' AS DateTime), 100, 1019, 1)
SET IDENTITY_INSERT [dbo].[Assignment] OFF
GO
INSERT [dbo].[AssignmentResult] ([userId], [assignmentId], [doneAt], [submissionUrl], [mark], [comment], [status]) VALUES (1, 6, CAST(N'2025-06-30T16:26:42.413' AS DateTime), N'blob:http://localhost:8080/43bfbfc6-ed3a-496b-ba98-b8f11e697935', 18, N'hehe
                            ', 0)
INSERT [dbo].[AssignmentResult] ([userId], [assignmentId], [doneAt], [submissionUrl], [mark], [comment], [status]) VALUES (13, 9, CAST(N'2025-08-25T10:16:52.900' AS DateTime), N'blob:http://localhost:8080/5e16a65a-eb91-431b-abaf-5e3fa11b2be8', 10, N'               oke đấy
                            ', 1)
INSERT [dbo].[AssignmentResult] ([userId], [assignmentId], [doneAt], [submissionUrl], [mark], [comment], [status]) VALUES (14, 1, CAST(N'2025-08-19T09:51:40.313' AS DateTime), N'blob:http://localhost:8080/43bfbfc6-ed3a-496b-ba98-b8f11e697935', -1, NULL, 1)
INSERT [dbo].[AssignmentResult] ([userId], [assignmentId], [doneAt], [submissionUrl], [mark], [comment], [status]) VALUES (14, 5, CAST(N'2025-06-30T16:26:42.413' AS DateTime), N'test', 30, N'ok', 0)
INSERT [dbo].[AssignmentResult] ([userId], [assignmentId], [doneAt], [submissionUrl], [mark], [comment], [status]) VALUES (14, 6, CAST(N'2025-06-30T16:26:42.413' AS DateTime), N'blob:http://localhost:8080/43bfbfc6-ed3a-496b-ba98-b8f11e697935', 20, N'                                  dgrvf

                           t
                            ', 1)
INSERT [dbo].[AssignmentResult] ([userId], [assignmentId], [doneAt], [submissionUrl], [mark], [comment], [status]) VALUES (14, 7, CAST(N'2025-08-22T22:57:34.003' AS DateTime), N'blob:http://localhost:8080/16fc25b9-e73b-4875-a8c1-6c5355594794', -1, NULL, 0)
INSERT [dbo].[AssignmentResult] ([userId], [assignmentId], [doneAt], [submissionUrl], [mark], [comment], [status]) VALUES (1019, 12, CAST(N'2025-08-30T19:49:11.157' AS DateTime), N'blob:http://localhost:8080/e0ba07af-505e-41b1-b02a-53d6f207c1c2', 10, N'
                Tốt            ', 1)
INSERT [dbo].[AssignmentResult] ([userId], [assignmentId], [doneAt], [submissionUrl], [mark], [comment], [status]) VALUES (1025, 10, CAST(N'2025-08-30T10:47:03.690' AS DateTime), N'blob:http://localhost:8080/af43f0a4-adcb-4776-bda7-bb3c2db3e6ad', 6, N'
               Làm tạm ổn             ', 1)
INSERT [dbo].[AssignmentResult] ([userId], [assignmentId], [doneAt], [submissionUrl], [mark], [comment], [status]) VALUES (1025, 1012, CAST(N'2025-09-02T10:48:45.357' AS DateTime), N'blob:http://localhost:8080/1ae79b94-1365-4a27-997b-e737dedd9ece', 10, N'                Tốt
                            ', 0)
GO
SET IDENTITY_INSERT [dbo].[ClassRoom] ON

INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1, N'Java Class A', CAST(N'2025-06-30T16:26:42.410' AS DateTime), 1, N'JAVA123')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (2, N'Web Class B', CAST(N'2025-06-30T16:26:42.410' AS DateTime), 2, N'WEB456')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (3, N'JS03', CAST(N'2025-07-01T20:10:47.773' AS DateTime), 1, N'316363e9')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (4, N'ClassJS', CAST(N'2025-07-02T16:33:23.347' AS DateTime), 3, N'd1b1307d')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1010, N'AJSAs', CAST(N'2025-07-03T16:53:27.287' AS DateTime), 3, N'577743d0')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1011, N'new', CAST(N'2025-08-18T11:03:54.097' AS DateTime), 14, N'76495a7f')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1012, N'test', CAST(N'2025-08-18T11:04:14.760' AS DateTime), 14, N'f1d0b626')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1013, N'tesst', CAST(N'2025-08-21T11:28:13.693' AS DateTime), 14, N'c94d505b')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1014, N'lớp', CAST(N'2025-08-24T16:41:57.760' AS DateTime), 14, N'573088e2')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1015, N'create test', CAST(N'2025-08-24T16:46:02.443' AS DateTime), 14, N'79a8ea7d')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1016, N'new c', CAST(N'2025-08-24T17:00:04.827' AS DateTime), 14, N'efafee51')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1017, N'debug', CAST(N'2025-08-24T17:02:29.060' AS DateTime), 14, N'b1e08cd2')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1018, N'b1e08cd2', CAST(N'2025-08-24T17:08:39.323' AS DateTime), 13, N'84e37ceb')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1019, N'testing new', CAST(N'2025-08-25T09:34:47.833' AS DateTime), 14, N'b08a094a')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1020, N'testing bt', CAST(N'2025-08-25T10:11:51.580' AS DateTime), 14, N'9975cde3')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1021, N'9975cde3', CAST(N'2025-08-25T10:14:12.923' AS DateTime), 13, N'0b2a037b')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1022, N'tét', CAST(N'2025-08-26T10:19:35.887' AS DateTime), 14, N'50756652')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1023, N'testing bt2', CAST(N'2025-08-26T10:42:38.110' AS DateTime), 14, N'3db92f86')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1024, N'new trfdv', CAST(N'2025-08-26T10:43:58.543' AS DateTime), 14, N'21f1f59b')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1025, N'Lớp JS', CAST(N'2025-08-30T10:42:47.767' AS DateTime), 1019, N'5931f8e5')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1026, N'Lowps ks', CAST(N'2025-08-30T10:44:11.337' AS DateTime), 1019, N'4bbcfd4d')
INSERT [dbo].[ClassRoom] ([id], [className], [createAt], [createBy], [inviteCode]) VALUES (1027, N'Lớp ASP SE1886', CAST(N'2025-09-02T10:47:30.453' AS DateTime), 1019, N'2f721069')
SET IDENTITY_INSERT [dbo].[ClassRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON

INSERT [dbo].[Course] ([id], [title], [description], [category], [level], [duration], [status], [author], [createdAt], [updatedAt]) VALUES (1, N'Java Advance11', N'Khoa hoc ngon', N'Data Science', N'Intermediate', 60, N'inactive', N'DUYPHUONG', CAST(N'2025-08-14T16:19:35.427' AS DateTime), CAST(N'2025-08-14T16:19:35.427' AS DateTime))
INSERT [dbo].[Course] ([id], [title], [description], [category], [level], [duration], [status], [author], [createdAt], [updatedAt]) VALUES (2, N'Web Development1', N'Learn HTML, CSS, JS', N'Data Science', N'Intermediate', 90, N'active', N'Bob Tran', CAST(N'2025-08-22T22:57:58.827' AS DateTime), CAST(N'2025-08-22T22:57:58.827' AS DateTime))
INSERT [dbo].[Course] ([id], [title], [description], [category], [level], [duration], [status], [author], [createdAt], [updatedAt]) VALUES (3, N'Spring MVC', N'Khoa hoc cua HOABUI', N'pro', N'kho', 120, N'active', N'DUYPHUONG', CAST(N'2025-07-01T20:39:04.710' AS DateTime), CAST(N'2025-07-01T20:39:04.710' AS DateTime))
INSERT [dbo].[Course] ([id], [title], [description], [category], [level], [duration], [status], [author], [createdAt], [updatedAt]) VALUES (4, N'Testing', N'Cho fu', N'Data Science', N'Advanced', 123, N'active', N'DUYPHUONG', CAST(N'2025-08-21T10:38:07.913' AS DateTime), CAST(N'2025-08-21T10:38:07.913' AS DateTime))
INSERT [dbo].[Course] ([id], [title], [description], [category], [level], [duration], [status], [author], [createdAt], [updatedAt]) VALUES (5, N'0', N'123', N'123', N'123', 123, N'inactive', N'13', CAST(N'2025-07-01T20:58:05.137' AS DateTime), CAST(N'2025-07-01T20:58:05.137' AS DateTime))
INSERT [dbo].[Course] ([id], [title], [description], [category], [level], [duration], [status], [author], [createdAt], [updatedAt]) VALUES (6, N'khoa hoc lam giau update', N'lam giau vip', N'lamgiau', N'hard', 130, N'inactive', N'Cuong', CAST(N'2025-07-03T20:49:43.380' AS DateTime), CAST(N'2025-07-03T20:50:55.977' AS DateTime))
INSERT [dbo].[Course] ([id], [title], [description], [category], [level], [duration], [status], [author], [createdAt], [updatedAt]) VALUES (8, N'1231', N'23123', N'Data Science', N'Beginner', 4, N'inactive', N'DUYPHUONG', CAST(N'2025-08-13T09:19:57.107' AS DateTime), CAST(N'2025-08-13T09:19:57.107' AS DateTime))
INSERT [dbo].[Course] ([id], [title], [description], [category], [level], [duration], [status], [author], [createdAt], [updatedAt]) VALUES (9, N'ôi', N'234', N'Design', N'Beginner', 4, N'inactive', N'DUYPHUONG', CAST(N'2025-08-14T16:19:48.310' AS DateTime), CAST(N'2025-08-14T16:19:48.310' AS DateTime))
INSERT [dbo].[Course] ([id], [title], [description], [category], [level], [duration], [status], [author], [createdAt], [updatedAt]) VALUES (10, N'1     ', N'     1', N'Web Development', N'Beginner', 4, N'inactive', N'Bob Tran', CAST(N'2025-08-21T10:36:35.663' AS DateTime), CAST(N'2025-08-21T10:36:35.663' AS DateTime))
INSERT [dbo].[Course] ([id], [title], [description], [category], [level], [duration], [status], [author], [createdAt], [updatedAt]) VALUES (11, N'1eqw21313', N'eqwe', N'Data Science', N'Intermediate', 4, N'active', N'Bob Tran', CAST(N'2025-08-25T09:42:36.627' AS DateTime), CAST(N'2025-08-25T09:42:36.627' AS DateTime))
INSERT [dbo].[Course] ([id], [title], [description], [category], [level], [duration], [status], [author], [createdAt], [updatedAt]) VALUES (12, N'new course ', N'new course ', N'Data Science', N'Intermediate', 4, N'inactive', N'DUYPHUONG', CAST(N'2025-08-25T09:42:25.487' AS DateTime), CAST(N'2025-08-25T09:42:25.487' AS DateTime))
INSERT [dbo].[Course] ([id], [title], [description], [category], [level], [duration], [status], [author], [createdAt], [updatedAt]) VALUES (13, N'Spring Boot- Advance', N'khóa học spring căng tay', N'Web Development', N'Intermediate', 4, N'active', N'DUYPHUONG', CAST(N'2025-08-30T10:30:31.093' AS DateTime), CAST(N'2025-08-30T10:30:31.093' AS DateTime))
INSERT [dbo].[Course] ([id], [title], [description], [category], [level], [duration], [status], [author], [createdAt], [updatedAt]) VALUES (14, N'Spring MVC - advance', N'học thêm phần avb', N'Web Development', N'Advanced', 4, N'active', N'Bob Tran', CAST(N'2025-08-30T19:43:01.557' AS DateTime), CAST(N'2025-08-30T19:43:01.557' AS DateTime))
INSERT [dbo].[Course] ([id], [title], [description], [category], [level], [duration], [status], [author], [createdAt], [updatedAt]) VALUES (1014, N'ASP .NET', N'framework c#', N'Data Science', N'Beginner', 4, N'active', N'Bob Tran', CAST(N'2025-09-02T10:37:00.883' AS DateTime), CAST(N'2025-09-02T10:37:00.883' AS DateTime))
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseContent] ON

INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (1, 1, N'Intro to Java', N'video', N'C:\Users\thanh\OneDrive\Documents\test.txt', 15, 1, CAST(N'2025-06-30T16:26:42.410' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (2, 1, N'Java Variables', N'document', N'C:\Users\thanh\OneDrive\Documents\test.txt', 10, 2, CAST(N'2025-06-30T16:26:42.410' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (3, 2, N'HTML Basics', N'video', N'C:\Users\thanh\OneDrive\Documents\test.txt', 20, 1, CAST(N'2025-06-30T16:26:42.410' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (4, 1, N'Requirement projec', N'document', N'C:\Users\thanh\OneDrive\Documents\FALL2023\CEA-FA~1\APZNZA~1.PDF', 20, 2, CAST(N'2025-07-01T20:36:16.747' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (5, 6, N'TaiLieuLuaDao', N'video', N'C:\Users\thanh\OneDrive\Documents\FALL2023\CEA-FA~1\APZNZA~1.PDF', 20, 1, CAST(N'2025-07-03T20:51:31.750' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (6, 1, N'gpt_api_key_secret.txt', N'txt', N'blob:http://localhost:8080/7e5b9979-b5ab-4916-a3c7-58119192b313', 20, 4, CAST(N'2025-08-13T00:00:00.000' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (7, 2, N'2. PE_PRN211_SP24_TrialTest_Notes.docx', N'docx', N'blob:http://localhost:8080/3c281136-1dec-4e8b-bbab-a34ce1708173', 20, 2, CAST(N'2025-08-17T00:00:00.000' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (8, 2, N'2. PE_PRN211_SP24_TrialTest_Notes.docx', N'docx', N'blob:http://localhost:8080/3c281136-1dec-4e8b-bbab-a34ce1708173', 20, 2, CAST(N'2025-08-17T00:00:00.000' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (1007, 13, N'bot_query.json', N'json', N'blob:http://localhost:8080/ad6c527c-28e9-49da-acb5-9f8c86fc6768', 20, 1, CAST(N'2025-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (1008, 13, N'bot_query.json', N'json', N'blob:http://localhost:8080/ad6c527c-28e9-49da-acb5-9f8c86fc6768', 20, 1, CAST(N'2025-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (1009, 13, N'thuchi.transactions.json', N'json', N'blob:http://localhost:8080/97c9940c-23a3-4706-97a6-fa095cb68321', 20, 3, CAST(N'2025-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (1010, 13, N'thuchi.transactions.json', N'json', N'blob:http://localhost:8080/97c9940c-23a3-4706-97a6-fa095cb68321', 20, 3, CAST(N'2025-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (1011, 13, N'496dddbac1d51f8b46c4.jpg', N'jpg', N'blob:http://localhost:8080/e878acb5-b418-4c6e-8112-73ae2846c016', 20, 5, CAST(N'2025-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (1012, 13, N'496dddbac1d51f8b46c4.jpg', N'jpg', N'blob:http://localhost:8080/e878acb5-b418-4c6e-8112-73ae2846c016', 20, 5, CAST(N'2025-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (1013, 13, N'1a1b7d8e-5733-4562-b998-ff32d04cc714.jfif', N'jfif', N'blob:http://localhost:8080/13898ce8-53f8-4ce1-9968-3673494cfe7d', 20, 7, CAST(N'2025-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (1014, 13, N'1a1b7d8e-5733-4562-b998-ff32d04cc714.jfif', N'jfif', N'blob:http://localhost:8080/13898ce8-53f8-4ce1-9968-3673494cfe7d', 20, 7, CAST(N'2025-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (1015, 14, N'30_j2wuIM71WDtHm.jpg', N'jpg', N'blob:http://localhost:8080/6d9b0367-3bad-48ef-9f98-368c69b374cb', 20, 1, CAST(N'2025-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CourseContent] ([id], [courseId], [title], [type], [contentUrl], [duration], [orderIndex], [createdAt]) VALUES (2015, 1014, N'HE180066_SWT301_PE.docx', N'docx', N'blob:http://localhost:8080/e4ea050b-6e37-4272-bd02-100a902dc199', 20, 1, CAST(N'2025-09-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[CourseContent] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseTest] ON

INSERT [dbo].[CourseTest] ([id], [courseId], [testTitle], [testDescription], [type], [testUrl], [maxScore], [duration], [status]) VALUES (1, 1, N'Java Quiz 1', N'Basic Java concepts', N'quiz', N'C:\Users\thanh\OneDrive\Documents\test.txt', 10, 15, 1)
INSERT [dbo].[CourseTest] ([id], [courseId], [testTitle], [testDescription], [type], [testUrl], [maxScore], [duration], [status]) VALUES (2, 2, N'Web Quiz', N'HTML/CSS Basics', N'quiz', N'C:\Users\thanh\OneDrive\Documents\test.txt', 15, 20, 1)
INSERT [dbo].[CourseTest] ([id], [courseId], [testTitle], [testDescription], [type], [testUrl], [maxScore], [duration], [status]) VALUES (3, 1, N'Bai test OOP', N'Kho', N'quiz', N'C:\Users\thanh\OneDrive\Documents\FALL2023\CEA-FA~1\APZNZA~1.PDF', 100, 120, 1)
INSERT [dbo].[CourseTest] ([id], [courseId], [testTitle], [testDescription], [type], [testUrl], [maxScore], [duration], [status]) VALUES (4, 6, N'KiemTraLamGiau', N'Kho lam', N'quiz', N'C:\Users\thanh\OneDrive\Documents\FALL2023\CEA-FA~1\APZNZA~1.PDF', 100, 60, 1)
INSERT [dbo].[CourseTest] ([id], [courseId], [testTitle], [testDescription], [type], [testUrl], [maxScore], [duration], [status]) VALUES (5, 1, N'123', N'123', N'quiz', N'blob:http://localhost:8080/8a0e0a59-88f3-4276-a134-a57a7c3ca718', 1, 1, 1)
INSERT [dbo].[CourseTest] ([id], [courseId], [testTitle], [testDescription], [type], [testUrl], [maxScore], [duration], [status]) VALUES (6, 1, N'123', N'123', N'quiz', N'blob:http://localhost:8080/34987a67-2a1c-4016-9012-e2e3038c77d6', 123, 123, 1)
INSERT [dbo].[CourseTest] ([id], [courseId], [testTitle], [testDescription], [type], [testUrl], [maxScore], [duration], [status]) VALUES (7, 2, N'test', N'test', N'quiz', N'blob:http://localhost:8080/97df7a88-63ec-4198-bf42-ee827b845806', 123, 123, 1)
INSERT [dbo].[CourseTest] ([id], [courseId], [testTitle], [testDescription], [type], [testUrl], [maxScore], [duration], [status]) VALUES (10, 14, N'kiểm tra annotation', N'kiểm tra annotation với MVC', N'quiz', N'9dc3ae680a31d46f8d20.jpg', 10, 30, 1)
INSERT [dbo].[CourseTest] ([id], [courseId], [testTitle], [testDescription], [type], [testUrl], [maxScore], [duration], [status]) VALUES (11, 14, N'test all', N'test all', N'quiz', N'1a1b7d8e-5733-4562-b998-ff32d04cc714.jfif', 100, 30, 1)
INSERT [dbo].[CourseTest] ([id], [courseId], [testTitle], [testDescription], [type], [testUrl], [maxScore], [duration], [status]) VALUES (1011, 1014, N'Tạo project với c#', N'Tạo project với c#', N'quiz', N'gpt_api_key_secret.txt', 100, 123, 1)
INSERT [dbo].[CourseTest] ([id], [courseId], [testTitle], [testDescription], [type], [testUrl], [maxScore], [duration], [status]) VALUES (1012, 1014, N'test cuối khóaaa', N'test cuối khóaaa', N'quiz', N'HE180066_SWT301_PE.docx', 100, 10, 1)
SET IDENTITY_INSERT [dbo].[CourseTest] OFF
GO
INSERT [dbo].[CourseTestResult] ([userId], [courseTestId], [mark], [doneAt], [status], [url]) VALUES (1, 1, 8, CAST(N'2025-06-30T16:26:42.410' AS DateTime), 1, NULL)
INSERT [dbo].[CourseTestResult] ([userId], [courseTestId], [mark], [doneAt], [status], [url]) VALUES (1, 2, 100, CAST(N'2025-07-01T20:05:38.193' AS DateTime), 1, NULL)
INSERT [dbo].[CourseTestResult] ([userId], [courseTestId], [mark], [doneAt], [status], [url]) VALUES (2, 2, 12, CAST(N'2025-06-30T16:26:42.410' AS DateTime), 1, NULL)
INSERT [dbo].[CourseTestResult] ([userId], [courseTestId], [mark], [doneAt], [status], [url]) VALUES (14, 1, 1, CAST(N'2025-06-30T16:26:42.410' AS DateTime), 1, NULL)
INSERT [dbo].[CourseTestResult] ([userId], [courseTestId], [mark], [doneAt], [status], [url]) VALUES (14, 2, 100, CAST(N'2025-08-16T21:19:36.407' AS DateTime), 1, N'{"fileUrl":"blob:http://localhost:8080/b4f75af2-2cdd-4abf-a313-7bb672e1d3b1"}')
INSERT [dbo].[CourseTestResult] ([userId], [courseTestId], [mark], [doneAt], [status], [url]) VALUES (14, 7, 100, CAST(N'2025-08-21T11:25:18.103' AS DateTime), 1, N'{"fileUrl":"blob:http://localhost:8080/5d44fdc2-c815-4807-9882-8c4d8b73e0a9"}')
INSERT [dbo].[CourseTestResult] ([userId], [courseTestId], [mark], [doneAt], [status], [url]) VALUES (1019, 1011, 100, CAST(N'2025-09-02T10:45:49.253' AS DateTime), 1, N'{"fileUrl":"blob:http://localhost:8080/550255a6-e3a0-4aff-84a8-038d58ef1a2e"}')
GO
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (1, 1, CAST(N'2025-06-30T16:26:42.413' AS DateTime), 0)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (1, 3, CAST(N'2025-07-01T20:10:47.847' AS DateTime), 1)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (1, 1011, CAST(N'2025-08-19T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (2, 2, CAST(N'2025-06-30T16:26:42.413' AS DateTime), 1)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (3, 3, CAST(N'2025-07-01T20:23:26.937' AS DateTime), 0)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (3, 4, CAST(N'2025-07-02T16:33:23.443' AS DateTime), 1)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (3, 1010, CAST(N'2025-07-03T16:53:27.457' AS DateTime), 1)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (4, 2, CAST(N'2025-07-03T20:55:57.180' AS DateTime), 0)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (13, 1017, CAST(N'2025-08-24T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (13, 1020, CAST(N'2025-08-25T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (13, 1021, CAST(N'2025-08-25T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (14, 1, CAST(N'2025-08-17T17:04:47.877' AS DateTime), 0)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (14, 2, CAST(N'2025-08-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (14, 1011, CAST(N'2025-08-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (14, 1024, CAST(N'2025-08-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (1019, 1025, CAST(N'2025-08-30T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (1019, 1026, CAST(N'2025-08-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (1019, 1027, CAST(N'2025-09-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (1025, 1025, CAST(N'2025-08-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[EnrollClassRoom] ([userId], [classRoomId], [enrollAt], [role]) VALUES (1025, 1027, CAST(N'2025-09-02T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[EnrollCourse] ([userId], [courseId], [enrollAt]) VALUES (1, 1, CAST(N'2025-06-30T16:26:42.410' AS DateTime))
INSERT [dbo].[EnrollCourse] ([userId], [courseId], [enrollAt]) VALUES (1, 2, CAST(N'2025-07-01T20:04:14.700' AS DateTime))
INSERT [dbo].[EnrollCourse] ([userId], [courseId], [enrollAt]) VALUES (2, 2, CAST(N'2025-06-30T16:26:42.410' AS DateTime))
INSERT [dbo].[EnrollCourse] ([userId], [courseId], [enrollAt]) VALUES (3, 2, CAST(N'2025-07-01T20:25:48.007' AS DateTime))
INSERT [dbo].[EnrollCourse] ([userId], [courseId], [enrollAt]) VALUES (3, 5, CAST(N'2025-07-02T16:28:50.457' AS DateTime))
INSERT [dbo].[EnrollCourse] ([userId], [courseId], [enrollAt]) VALUES (4, 6, CAST(N'2025-07-03T20:54:03.147' AS DateTime))
INSERT [dbo].[EnrollCourse] ([userId], [courseId], [enrollAt]) VALUES (14, 2, CAST(N'2025-08-21T11:18:58.307' AS DateTime))
INSERT [dbo].[EnrollCourse] ([userId], [courseId], [enrollAt]) VALUES (14, 3, CAST(N'2025-08-24T16:53:04.030' AS DateTime))
INSERT [dbo].[EnrollCourse] ([userId], [courseId], [enrollAt]) VALUES (14, 4, CAST(N'2025-08-24T16:55:03.900' AS DateTime))
INSERT [dbo].[EnrollCourse] ([userId], [courseId], [enrollAt]) VALUES (1019, 13, CAST(N'2025-08-30T10:48:20.560' AS DateTime))
INSERT [dbo].[EnrollCourse] ([userId], [courseId], [enrollAt]) VALUES (1019, 1014, CAST(N'2025-09-02T10:45:41.287' AS DateTime))
INSERT [dbo].[EnrollCourse] ([userId], [courseId], [enrollAt]) VALUES (1025, 13, CAST(N'2025-08-30T10:30:48.980' AS DateTime))
INSERT [dbo].[EnrollCourse] ([userId], [courseId], [enrollAt]) VALUES (1025, 14, CAST(N'2025-08-30T19:43:11.220' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] ON

INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (1, N'300488f5-39f0-4278-8e34-0578cd9a5f37', CAST(N'2025-08-30T23:00:17.5351729' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (2, N'488ceb91-f74a-49a5-8b91-1a1a9a523479', CAST(N'2025-08-30T23:04:31.3208423' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (3, N'67cf59e3-c65f-4cd5-8c50-84520161ce0f', CAST(N'2025-08-30T23:09:28.9677889' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (4, N'7ad1fe68-da21-4106-bcd0-8f61a0555dee', CAST(N'2025-08-30T23:09:34.5789661' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (5, N'3540ec9c-1384-4089-a10f-ee665ab40679', CAST(N'2025-08-30T23:10:06.5430998' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (6, N'7819e7f8-cec1-423c-83ae-155c11293cb5', CAST(N'2025-08-30T23:11:10.7255869' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (7, N'f549e508-9bb5-4a26-9bb9-0e89c13ee3c6', CAST(N'2025-08-30T23:11:42.7660719' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (8, N'a081d082-a8f3-4bc7-9b68-50cbb132db61', CAST(N'2025-08-30T23:11:59.3631303' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (9, N'29dd0b72-b461-41cf-ab75-39e9c75990bd', CAST(N'2025-08-30T23:12:16.2369962' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (10, N'ac8f1b56-1731-4149-87b5-b4a23b0d84ce', CAST(N'2025-08-31T16:40:13.1847865' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (11, N'13d63bde-0688-4b3e-ba1b-5355f10d7587', CAST(N'2025-08-31T16:40:24.5324090' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (12, N'c35f32a3-0e54-4563-a3c6-c6e1f44df25d', CAST(N'2025-08-31T16:40:47.6816794' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (13, N'93cfb86a-244f-4636-be78-4c469a6dfa7e', CAST(N'2025-08-31T16:40:58.9895723' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (14, N'c0e30fe1-6897-45c6-841e-ecfdf01dbeb4', CAST(N'2025-08-31T16:41:08.2024380' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (15, N'd03afb98-af8f-443a-84d7-a6978ad132e5', CAST(N'2025-08-31T16:41:18.4063973' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (16, N'34cfed01-5382-40b1-a656-6806bed4429d', CAST(N'2025-08-31T16:41:37.5067520' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (17, N'1a3ac3f8-f22c-4487-9ba6-3e9e5f166014', CAST(N'2025-08-31T16:41:57.7190441' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (18, N'4eca2b7b-3af1-4abb-947e-f3c83bee1f49', CAST(N'2025-08-31T16:41:57.7190441' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (19, N'4e602968-3ee5-4c25-af8f-bbd4260ca3fa', CAST(N'2025-08-31T16:44:07.5101335' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (20, N'e00d8dc3-fdb5-4f49-b1d3-9663fe0f8117', CAST(N'2025-08-31T16:44:07.5144024' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (21, N'f4c66375-b6a8-4808-93ca-f2f10d9d529b', CAST(N'2025-08-31T16:44:18.7749266' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (22, N'8642cc70-eb0d-4361-b3ee-1a526fba8df4', CAST(N'2025-08-31T16:44:32.3982401' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (23, N'2b58cc0c-8422-4cc3-aca8-fb56105da2ff', CAST(N'2025-08-31T16:44:51.4346571' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (24, N'a0bfb940-86d9-486b-9aa0-ef816dfcab31', CAST(N'2025-08-31T16:44:57.7681757' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (25, N'febce449-eb2c-4713-b67b-daeafe2a6250', CAST(N'2025-08-31T16:45:08.3771169' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (26, N'62e72767-61b5-484b-bc48-0534ddf78bae', CAST(N'2025-08-31T16:45:20.2215822' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (27, N'f7f80c0a-46b9-42b3-ae62-17f6c394d288', CAST(N'2025-08-31T16:45:31.1228111' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (28, N'9e00a6f3-d05d-4e1c-bba3-7509469fe6c2', CAST(N'2025-08-31T16:45:43.3541162' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (29, N'c87121fd-6f61-4414-9837-7bad9fa244f8', CAST(N'2025-08-31T16:45:57.1821607' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (30, N'c817dbdb-88f4-4620-9182-ba690166a4c0', CAST(N'2025-08-31T16:46:13.0712547' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (31, N'21e92f0a-22f9-4f67-a9ee-80bb0b661f70', CAST(N'2025-08-31T16:46:23.7695994' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (32, N'3edd5e57-e086-48a6-aa40-93a9b87e4e05', CAST(N'2025-08-31T16:47:28.0005879' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (33, N'0a2197fd-1b79-4c08-b79d-df0b586a03a1', CAST(N'2025-08-31T16:51:54.4511022' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (34, N'c071615e-8a94-4309-a153-66398b6b1887', CAST(N'2025-08-31T16:51:57.6334538' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (35, N'935f1b5d-40e5-4821-b103-ecccf7670e71', CAST(N'2025-08-31T16:52:33.6584142' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (36, N'2d85f59f-9e02-4113-8040-a6f8a906c355', CAST(N'2025-08-31T16:52:33.6584142' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (37, N'd9439f26-cfcf-454e-99a2-e6e264cd291e', CAST(N'2025-08-31T16:52:42.1849195' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (38, N'f85fdb69-a76f-4343-8805-8aa151d1edd6', CAST(N'2025-08-31T16:54:23.9900126' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (39, N'32e7f50f-0b25-4644-be8f-516aeabd8740', CAST(N'2025-08-31T16:54:33.9028247' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (40, N'eac9c248-cc72-448f-bc63-7395c6254cc7', CAST(N'2025-08-31T16:54:43.9021119' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (41, N'6699f055-d5a6-429b-94d7-fa9b9618535e', CAST(N'2025-08-31T16:54:53.7403805' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (42, N'f2b3b3d5-e6ae-4c9f-8d32-169ca137b90a', CAST(N'2025-08-31T16:56:40.6896766' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (43, N'f70c68be-e16f-45fc-8ec7-bea0b2a0f89c', CAST(N'2025-08-31T16:56:44.4130862' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (44, N'5aafe21a-8186-45e0-95e0-ee9d575b638f', CAST(N'2025-08-31T16:57:06.5196010' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (45, N'c337d17e-484f-4c4c-86ce-0459b30a20d8', CAST(N'2025-08-31T16:59:25.2644827' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (46, N'333dbd56-0a7c-43a3-bb5b-d1b956817bb8', CAST(N'2025-08-31T16:59:29.2586970' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (47, N'd01c0d0e-2cff-45d7-88d2-9e16bf2f992a', CAST(N'2025-08-31T16:59:40.8960963' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (48, N'41278cbe-83d9-4762-b9f4-5df588a36b3b', CAST(N'2025-08-31T16:59:50.8888594' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (49, N'4a3db5d5-5183-4b66-9e48-3890a7754ad7', CAST(N'2025-08-31T17:00:04.7768027' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (50, N'd02c1e87-74af-48e4-8ba5-53d3dfc37bd4', CAST(N'2025-08-31T17:00:04.7768027' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (51, N'db499b7d-3655-40fd-98ee-48fc3cf4be81', CAST(N'2025-08-31T17:00:17.3812634' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (52, N'efa7a2f3-9cd9-499e-aded-66b3f822b734', CAST(N'2025-08-31T17:00:20.3753277' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (53, N'58fb5c81-0670-42cb-8cf8-41d30ca9412e', CAST(N'2025-08-31T17:01:19.8365571' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (54, N'fd8baa03-c4bd-490b-99aa-7d7b9e88c37f', CAST(N'2025-08-31T17:01:19.8365571' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (55, N'09b110ce-1408-4db6-98df-bbfa63cbf7f7', CAST(N'2025-08-31T17:01:26.3627709' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (56, N'd9af84c7-f551-4183-82cb-94ba94a28b3a', CAST(N'2025-08-31T17:01:40.4377106' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (57, N'3f074402-014b-434c-a953-70e8f101b1a7', CAST(N'2025-08-31T17:01:51.0687410' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (58, N'b8a7f72c-3ad2-474b-8416-4cb2cd809b2b', CAST(N'2025-08-31T17:01:54.2463849' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (59, N'e672c5f4-8830-4892-b1a0-74f326eccb54', CAST(N'2025-08-31T17:02:27.0080618' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (60, N'd9aa2be3-a1cd-48c2-94f8-d316af5af1fa', CAST(N'2025-08-31T17:04:44.0148817' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (61, N'2785c06f-11e2-4f0b-aee7-ca6ffae01850', CAST(N'2025-08-31T17:04:47.9365296' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (62, N'd65615cc-840a-4fb7-ac68-1256b32e62b6', CAST(N'2025-08-31T17:04:59.1859282' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (63, N'1276b9bc-1c93-4594-9432-20c7931abc01', CAST(N'2025-08-31T17:05:14.0040206' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (64, N'9826d218-7f0f-4691-98b1-3663fb1ee82d', CAST(N'2025-08-31T17:05:25.2781598' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (65, N'92461e3a-1f01-4771-8dc1-4cfb5830768b', CAST(N'2025-08-31T17:05:36.3933204' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (66, N'f2bdeac0-34fd-46c3-a3a9-ed1aea0e37fc', CAST(N'2025-08-31T17:05:36.4140094' AS DateTime2), 1, 5)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (67, N'9462051b-6d5d-4668-87b0-68e8e0a18d0f', CAST(N'2025-08-31T17:05:50.7204116' AS DateTime2), 1, 5)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (68, N'115a23f3-0d75-43fc-a549-9cdd776dcd3b', CAST(N'2025-08-31T17:06:16.1814447' AS DateTime2), 1, 5)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (69, N'c5a08dac-3bce-4344-b455-f6a5405dee12', CAST(N'2025-08-31T17:06:37.2077635' AS DateTime2), 1, 5)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (70, N'05761708-4fd5-4799-beec-cabaf0df2d39', CAST(N'2025-08-31T17:07:15.3335637' AS DateTime2), 0, 5)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (71, N'e020d0d8-8c10-4482-9408-c48f28beb8c4', CAST(N'2025-08-31T17:07:15.3523984' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (72, N'50e4d10a-3134-4de0-ab48-46b33e2a2d38', CAST(N'2025-08-31T17:07:31.7572983' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (73, N'2c84daf0-e972-49ab-8c8d-9b26c5fc1597', CAST(N'2025-08-31T17:07:31.7627620' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (74, N'421ad51c-f331-48c1-836b-d42880f0ffbd', CAST(N'2025-08-31T17:07:49.2232248' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (75, N'2b941131-fef2-49ec-91a0-72ced880c383', CAST(N'2025-08-31T17:08:05.3529328' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (76, N'34936824-6c82-42fb-9919-cf39b8c89d02', CAST(N'2025-08-31T17:08:24.0956917' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (77, N'163f81a1-726d-488a-9bb8-3fc5512eb2e4', CAST(N'2025-08-31T17:08:28.8585181' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (78, N'5a59fd85-9898-4f48-8bcb-6947ebd6d25d', CAST(N'2025-08-31T17:08:39.2830217' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (79, N'2a0d53ae-2dbd-4008-8cc2-7fa41f0ae57b', CAST(N'2025-08-31T17:08:39.2908171' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (80, N'1a989e2c-a01c-4c42-9a52-7eca55afbe98', CAST(N'2025-08-31T17:09:13.9701493' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (81, N'd14bdcd1-316d-4361-93d9-c80bcd26b1cc', CAST(N'2025-08-31T17:09:17.1597628' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (82, N'953d2abb-822f-422d-b6ca-b1c48f6261f5', CAST(N'2025-08-31T17:09:27.2209019' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (83, N'85128ce2-b6b2-49a8-a208-4182ed6899ea', CAST(N'2025-08-31T17:09:38.0575477' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (84, N'4d9220eb-94b1-4b25-8b5a-89c2ffc99529', CAST(N'2025-08-31T17:09:57.2677254' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (85, N'14a4e1a0-c81f-4786-bda2-ff54ad42a31f', CAST(N'2025-08-31T17:10:04.0421914' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (86, N'98bf4d76-4c1c-4b92-90c8-582f3154f930', CAST(N'2025-08-31T17:10:15.6862718' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (87, N'ad0c8c5d-82d9-48d6-a9a8-23015a587640', CAST(N'2025-08-31T17:10:38.0994321' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (88, N'd22a5f6b-7971-4c34-9ef4-f0cc97870f78', CAST(N'2025-08-31T17:10:43.3594942' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (89, N'e12131c7-34c1-4d9a-9a2c-378bbcd152ca', CAST(N'2025-08-31T17:11:19.8534325' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (90, N'833341d1-04d7-4bda-b2d1-ce8a67233b70', CAST(N'2025-08-31T17:11:19.8534325' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (91, N'7225d092-e2ea-4143-a22e-d47d2f11bd18', CAST(N'2025-08-31T17:12:01.5159273' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (92, N'00669a3e-ecac-4bd2-ab97-d8bac148506d', CAST(N'2025-08-31T17:12:16.0972978' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (93, N'e5757656-2d5e-4f7a-9cfd-1b0f1ff677d6', CAST(N'2025-08-31T17:12:38.1432134' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (94, N'be75f92c-cc14-41b4-afed-40ec1d4fa176', CAST(N'2025-08-31T17:12:58.7065560' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (95, N'e9defdd1-6722-4595-b7ea-a3094e45e162', CAST(N'2025-08-31T17:12:58.7181158' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (96, N'1d505826-ea02-4910-9cc3-50c1d228197c', CAST(N'2025-08-31T17:13:47.3963930' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (97, N'c0dbed98-6b5f-4d53-aeea-892323485fd6', CAST(N'2025-08-31T17:13:53.9662367' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (98, N'fc893053-0979-4c95-84a0-12426093ff9a', CAST(N'2025-08-31T17:14:04.5590058' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (99, N'b5d8d20b-f773-4b95-b6c7-c7d430abc3ce', CAST(N'2025-08-31T17:14:15.5660476' AS DateTime2), 1, 13)
GO
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (100, N'63cc89fb-e599-49c2-a276-e314bdbd14b1', CAST(N'2025-08-31T17:15:32.4273424' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (101, N'ea992084-00f3-405d-bebc-d9b464e20293', CAST(N'2025-08-31T17:15:36.5865924' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (102, N'7fc95425-9762-41c5-bf2c-e9d4481457a0', CAST(N'2025-08-31T17:15:52.2404413' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (103, N'cc736caf-f89a-412d-a801-8915d5018b26', CAST(N'2025-08-31T17:15:55.8745793' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (104, N'd80a3a20-0333-417a-bd97-d86fa6fac52b', CAST(N'2025-08-31T17:16:10.3086305' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (105, N'5ebf10d7-f48f-4e47-bfc0-8fb6e3020a39', CAST(N'2025-08-31T17:16:20.0023825' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (106, N'05c0ae1a-8f0f-46a7-86ca-6d599cb3a29f', CAST(N'2025-08-31T17:17:09.2817729' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (107, N'6d1b37da-12fc-4d3c-a3d4-10c1b484c5a5', CAST(N'2025-08-31T17:17:15.5737384' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (108, N'25f91cbf-adc5-4839-adad-42b255dcf0be', CAST(N'2025-08-31T17:17:47.8589004' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (109, N'a6094401-eb5f-4a42-b6b7-013463914a52', CAST(N'2025-08-31T17:19:51.1396559' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (110, N'560a206c-229e-430d-8846-c6bd728a28d1', CAST(N'2025-08-31T17:19:55.7754472' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (111, N'a6f2ff09-c41b-48c3-9c22-f17854cf37ba', CAST(N'2025-08-31T17:20:10.1659168' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (112, N'b9fa86f4-403c-4e73-a335-a854a114213f', CAST(N'2025-08-31T17:21:28.9226237' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (113, N'4ac4e27b-1bcb-4a0c-abd3-5a6e5bf7fb49', CAST(N'2025-08-31T17:21:33.6194495' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (114, N'1042b853-6432-4b25-b30c-0fe9126ff7f9', CAST(N'2025-08-31T17:21:47.0154672' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (115, N'b8b6ea71-d18c-4fef-a763-d67c524ab242', CAST(N'2025-08-31T17:21:50.6381705' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (116, N'72b931be-b5f2-4fac-ba53-ebde02f3d35a', CAST(N'2025-08-31T17:22:00.4750732' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (117, N'5a74ae5b-5eb1-461b-8022-9b164e2768e9', CAST(N'2025-08-31T17:22:34.9083466' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (118, N'a14a1ea9-fd92-4aa7-aba1-f141cdfd5413', CAST(N'2025-08-31T17:22:38.6364681' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (119, N'dd556041-73db-49d0-ad36-b046abc3c92b', CAST(N'2025-08-31T17:22:55.0027797' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (120, N'39be01c0-e5e3-478a-a45b-05f5530e8915', CAST(N'2025-08-31T17:23:09.0921906' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (121, N'049473fb-de7f-4daa-b05f-e9e23b2cb734', CAST(N'2025-08-31T17:23:34.9725671' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (122, N'4172f42d-3358-4fa4-a343-2634c7dd9b5e', CAST(N'2025-08-31T17:23:39.3762665' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (123, N'b58deb34-aff6-4f97-bdd3-4c20d45b5947', CAST(N'2025-08-31T17:23:54.6497437' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (124, N'4a58e30e-70f7-4bb0-b204-466b0d456a73', CAST(N'2025-08-31T17:24:05.7546448' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (125, N'f7d97222-27dd-4e70-b94b-a91c5e7fa307', CAST(N'2025-08-31T17:24:15.9076867' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (126, N'b6417257-dc55-4a7f-a89d-4ed34d1d69b4', CAST(N'2025-08-31T17:24:50.1589688' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (127, N'5486381c-ebca-413b-8904-813e72edb73b', CAST(N'2025-08-31T17:24:59.0281860' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (128, N'd437bc71-4b34-44f2-a4ad-6b3a63a76d0c', CAST(N'2025-08-31T17:24:59.0281860' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (129, N'1e46ad53-4eb7-462f-90e5-6a8ba2f51a3e', CAST(N'2025-08-31T17:25:03.3743587' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (130, N'f5538d02-435d-45ec-a2fe-8f30c343a30a', CAST(N'2025-08-31T17:25:27.5266830' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (131, N'10b12631-b49b-4cc9-a512-06d3f2c81bde', CAST(N'2025-08-31T17:25:38.2284527' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (132, N'04fc7714-a07c-464d-8bbb-0c56565c19b1', CAST(N'2025-08-31T17:25:46.2437528' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (133, N'42ebdf7a-5c51-4e7c-902d-af7ce9d6bc97', CAST(N'2025-08-31T17:26:23.2926766' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (134, N'8486cc7a-f46a-4995-8757-d6d4ea6a34cb', CAST(N'2025-08-31T17:27:18.7976054' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (135, N'63c464c8-46d7-4428-9c09-e25e81ed9aea', CAST(N'2025-08-31T17:27:29.8452297' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (136, N'28ec3ce7-16a6-4bbb-94da-4f0873b426be', CAST(N'2025-08-31T17:27:29.9288626' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (137, N'60932f89-8e52-4087-ac07-7afd2f4b7dfb', CAST(N'2025-08-31T17:27:41.2113093' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (138, N'294e878d-6382-4c15-b68f-c22443259ba3', CAST(N'2025-08-31T17:28:15.1755628' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (139, N'a3f57939-533d-49cb-8d69-e26f3a0420b4', CAST(N'2025-08-31T17:28:19.2714597' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (140, N'32711968-9f1e-4224-bc51-4d12452b9394', CAST(N'2025-08-31T17:28:32.4633742' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (141, N'0e669b0f-308c-460d-b6d9-8ccc9fbf3657', CAST(N'2025-08-31T17:28:40.1821903' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (142, N'58a58af4-d05d-4d37-817c-a6341a3d325e', CAST(N'2025-08-31T17:28:56.0303260' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (143, N'2e200b36-49b0-443c-be97-f4bab2e67d4d', CAST(N'2025-08-31T17:40:57.7761426' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (144, N'1c269928-e6c7-4767-863c-17f8cff3ab04', CAST(N'2025-08-31T17:41:09.3226179' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (145, N'74457a63-8198-49a8-9f02-00cd5fab5f21', CAST(N'2025-08-31T17:41:09.3872752' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (146, N'5677c1bc-a230-41c6-97b6-865eb298e070', CAST(N'2025-08-31T17:41:21.6064289' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (147, N'5716c1c2-faed-49fb-9f5a-a705dee0b89c', CAST(N'2025-08-31T17:41:21.6146815' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (148, N'c80ade07-1971-4fff-bb08-912b676f05da', CAST(N'2025-08-31T17:49:09.0463897' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (149, N'1476f89a-918f-47bc-bc61-788bffd2e580', CAST(N'2025-08-31T17:49:13.3580210' AS DateTime2), 1, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (150, N'11df2d06-ada3-4246-9fc5-54f95eb65978', CAST(N'2025-09-01T09:34:11.9807693' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (151, N'f06416e0-0bb2-41a1-a573-436433610ff6', CAST(N'2025-09-01T09:42:04.7039988' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (152, N'e3a66cf1-9f73-401e-a1d9-6c0a70c3a80b', CAST(N'2025-09-01T09:54:25.0981580' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (153, N'6e606ea5-a9e3-497d-9274-d2f9b9d0ffff', CAST(N'2025-09-01T09:58:39.9204691' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (154, N'9e5c7fce-fb9e-4d94-b21a-7c6fc4cdbd14', CAST(N'2025-09-01T09:58:44.0212216' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (155, N'b678e418-a820-4438-80d4-b50d8dcdc3cc', CAST(N'2025-09-01T09:58:56.8553587' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (156, N'4e172c8a-039e-482c-8d33-0e047d439841', CAST(N'2025-09-01T09:59:01.8091110' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (157, N'dab13a61-be8c-4858-946a-71000b516107', CAST(N'2025-09-01T10:00:34.9326723' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (158, N'4f8bd620-0b6b-433e-b087-103d05669b2d', CAST(N'2025-09-01T10:00:44.7663976' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (159, N'14892dcc-31b0-45c6-8c0e-9c8a53564d60', CAST(N'2025-09-01T10:03:21.5771165' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (160, N'040a2e62-f10c-4bf7-9327-3ba8e2fe03eb', CAST(N'2025-09-01T10:07:22.8084869' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (161, N'913ccc24-a353-4a22-9336-ea9b3f25c809', CAST(N'2025-09-01T10:09:48.5801906' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (162, N'2fd3ed18-9aef-4e15-ac66-2aa3c674b8d1', CAST(N'2025-09-01T10:10:58.0283775' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (163, N'ca864cde-05a2-4f73-9c63-60fd654342be', CAST(N'2025-09-01T10:11:08.7869945' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (164, N'cbfe17c5-2d59-464a-b6d3-028824f569d4', CAST(N'2025-09-01T10:13:36.3292840' AS DateTime2), 0, 13)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (165, N'160ab96b-e985-4d53-b8ab-aaa486878689', CAST(N'2025-09-01T10:45:57.3356432' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (166, N'ed23f68e-ba45-42a9-bdaf-e698e21e6213', CAST(N'2025-09-01T11:08:18.3583487' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (167, N'9f08a78a-ae8f-40f2-97c9-58468a264af5', CAST(N'2025-09-01T11:08:23.7581070' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (168, N'8b76b374-925f-40ba-aa8a-e335738f27bd', CAST(N'2025-09-01T11:12:05.6443389' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (169, N'5793c3a4-fb76-45b9-ba6d-c8c412811992', CAST(N'2025-09-01T11:12:05.7088670' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (170, N'a6fba08d-6def-4509-93bd-441fdc8f84c1', CAST(N'2025-09-01T11:12:05.7740105' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (171, N'5f916730-c5ab-4228-bf04-7b9251e7fc44', CAST(N'2025-09-01T11:25:32.3630764' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (172, N'9de4944e-e9e5-4b31-a3e4-0823923560d8', CAST(N'2025-09-01T11:25:36.2588373' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (173, N'90cfa3d5-fdb2-4d72-930c-45561638e100', CAST(N'2025-09-01T11:27:43.4352221' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (174, N'92692155-6927-4746-8b77-7d090002cb9c', CAST(N'2025-09-01T11:27:46.8625684' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (175, N'17de49e7-c088-4faf-b1a9-2611c89120b9', CAST(N'2025-09-01T12:13:20.6348328' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (176, N'5b20ac6f-b343-430a-b992-007345f93084', CAST(N'2025-09-01T12:14:21.4016567' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (177, N'6736a506-8ca7-4c62-b048-94f194290603', CAST(N'2025-09-01T12:14:24.6341434' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (178, N'0e9f224d-1fd4-4834-951c-97a11bf4a1aa', CAST(N'2025-09-01T12:16:45.3007240' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (179, N'6a42c373-9079-493b-8611-6f386a15e890', CAST(N'2025-09-01T12:16:48.6488069' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (180, N'7d2c9a21-a2e9-4cf8-a4af-fe5f76903e70', CAST(N'2025-09-01T12:18:06.3355507' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (181, N'b656be76-28ab-42c9-9f3a-ba4a19d194ed', CAST(N'2025-09-01T12:18:09.1368790' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (182, N'3159b05b-65c5-48e2-83ff-e911e5e57131', CAST(N'2025-09-01T12:18:30.5054451' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (183, N'a6781838-4e87-4774-b012-e264c6e05584', CAST(N'2025-09-01T12:18:40.0408135' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (184, N'fa24a636-b8d3-4fcf-8c60-bb4ea180b910', CAST(N'2025-09-01T12:20:37.2956488' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (185, N'ce20dc08-3431-479c-9d5a-dc043b8cbb64', CAST(N'2025-09-01T12:20:47.6168926' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (186, N'4e1f524d-90f3-417f-962d-f38509e2c5b3', CAST(N'2025-09-01T12:23:21.0814834' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (187, N'2a411059-99a9-4cd4-a814-5a43e9616f27', CAST(N'2025-09-01T12:24:06.2175382' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (188, N'00453e56-a1ec-4624-9b8a-1a739999a253', CAST(N'2025-09-01T12:25:44.8824521' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (189, N'7d075949-edc2-4fbd-b997-8b40e780bf16', CAST(N'2025-09-01T12:26:01.2023939' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (190, N'5cbb229e-b818-475f-8ddb-ad5e1c008350', CAST(N'2025-09-01T12:27:00.1801613' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (191, N'443b85e0-a923-4594-b587-08ab52fb46d6', CAST(N'2025-09-01T12:27:03.0586469' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (192, N'949de35d-0d86-4d60-a73f-cde8bd049d35', CAST(N'2025-09-01T12:27:17.9860464' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (193, N'6b9b4144-7df5-4126-b8d1-77175e4cb8f9', CAST(N'2025-09-01T12:30:58.1601673' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (194, N'0b530d78-9f12-41e5-8b0f-b5f388c3cbc7', CAST(N'2025-09-01T12:31:00.8049966' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (195, N'78e8ab9c-bd85-4196-bb33-3972fc3a92d3', CAST(N'2025-09-01T12:31:38.6949173' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (196, N'5b2f122f-2cfe-4396-8530-62c2484f4482', CAST(N'2025-09-01T12:31:38.6949173' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (197, N'3bc9d329-541d-47c9-8d93-5bcc6de6ba5e', CAST(N'2025-09-01T12:31:38.8340851' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (198, N'efc09808-a585-4a0c-b34e-874a3961bd99', CAST(N'2025-09-01T12:32:30.1440610' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (199, N'6263ec5f-b4c5-4428-ab18-fdbf14e26062', CAST(N'2025-09-01T12:32:43.7454030' AS DateTime2), 1, 14)
GO
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (200, N'd55d506c-0733-4e65-baf5-8ad634236313', CAST(N'2025-09-01T12:33:12.5807552' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (201, N'a3d52c1d-a95d-4b98-b42f-3289bd6c604e', CAST(N'2025-09-01T12:33:33.1429448' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (202, N'd34bab10-3c1d-4a89-ae9b-e0f529cc6c00', CAST(N'2025-09-01T12:34:22.9461900' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (203, N'1fb82fd8-d9bc-4c5b-b3bd-d6d5d8447506', CAST(N'2025-09-01T12:36:20.8814457' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (204, N'7128d479-fce7-457c-8011-e22aac717e48', CAST(N'2025-09-01T12:36:20.9576184' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (205, N'e30f33fe-65bc-48b8-a7d1-fb9506e1ce7d', CAST(N'2025-09-01T15:59:04.8208857' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (206, N'3bdff239-f104-41c8-b4e0-9754bf651bfb', CAST(N'2025-09-01T16:02:44.6451592' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (207, N'878abcb9-0fd3-44ff-8dbc-8740bfa0a853', CAST(N'2025-09-01T16:02:44.6451592' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (208, N'c2255bd4-1bc6-4da3-97d0-28256dc47671', CAST(N'2025-09-01T16:02:44.6451592' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (209, N'd13bdf8d-09ec-4a6b-b46e-6b8be25d7ae5', CAST(N'2025-09-01T16:02:44.7886229' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (210, N'afc8469d-594d-4e3f-afe5-974148fd0825', CAST(N'2025-09-02T10:13:46.8791687' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (211, N'8d8f718e-e877-481b-866c-7f875825e9bb', CAST(N'2025-09-02T10:14:00.2903340' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (212, N'59212b24-f2ad-4569-898a-a4f23e3d152e', CAST(N'2025-09-02T10:14:28.7033952' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (213, N'1988e902-791e-47dc-8fdf-908bbcb84aa0', CAST(N'2025-09-02T10:15:40.6418344' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (214, N'250a1af6-db52-4285-bb57-4f27ef4544d3', CAST(N'2025-09-02T10:15:50.4318643' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (215, N'01f374ba-dbc3-4ece-aff8-e0475811478d', CAST(N'2025-09-02T10:16:07.1758200' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (216, N'c4435cce-b9f8-42c2-8ef1-113edd808e61', CAST(N'2025-09-02T10:16:31.5764361' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (217, N'42940315-166d-4551-aa16-16b99f4c21d9', CAST(N'2025-09-02T10:16:46.2169640' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (218, N'02d6af22-88a5-413d-af7f-def08e123160', CAST(N'2025-09-02T10:19:35.8410900' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (219, N'b0d1ea71-38fd-41a7-b8e8-e095bdefa225', CAST(N'2025-09-02T10:19:35.8410900' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (220, N'dbb85318-39e0-4755-b19a-2edf023b9c12', CAST(N'2025-09-02T10:19:45.7860195' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (221, N'289aee60-649a-409f-8e19-a0a80d194c40', CAST(N'2025-09-02T10:19:57.4456026' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (222, N'2ee3e616-0a62-4037-9756-35e37bfb9a52', CAST(N'2025-09-02T10:19:57.4582881' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (223, N'ffde56d6-0e9b-4cf5-ad63-990731edeb18', CAST(N'2025-09-02T10:22:20.5320595' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (224, N'e172cb21-4d25-45e0-b894-47a5c6606806', CAST(N'2025-09-02T10:22:23.5612221' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (225, N'86880347-8a46-4f8f-b0f7-d015e8bbeac3', CAST(N'2025-09-02T10:25:05.8917990' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (226, N'ce8ac738-c485-4c58-87fb-6964b0d54b5c', CAST(N'2025-09-02T10:25:38.6647577' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (227, N'663a39c0-48db-4226-b7c5-518205bbf7af', CAST(N'2025-09-02T10:27:18.4918204' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (228, N'89c3fa86-4439-425f-b66d-301fbbe9a5da', CAST(N'2025-09-02T10:27:36.0300132' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (229, N'd4b87283-fcf2-45d5-9936-17b14829fc76', CAST(N'2025-09-02T10:29:35.7799206' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (230, N'11cd3d9a-4839-41d0-b5a9-ebef291b547a', CAST(N'2025-09-02T10:29:44.2384076' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (231, N'bf254f62-3a2c-42a3-b2cf-b8e4b1c9bbe6', CAST(N'2025-09-02T10:30:51.4557809' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (232, N'fcf03d0c-9abb-447c-bd2b-c6ea31216254', CAST(N'2025-09-02T10:33:18.9518039' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (233, N'eddfaa76-041a-44f9-8fed-8f3df77ce8f4', CAST(N'2025-09-02T10:39:34.7274871' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (234, N'7929b7e0-727c-448e-9377-69b022913ba9', CAST(N'2025-09-02T10:40:20.1154025' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (235, N'8c72a0e1-6950-48bd-8120-72dc60f69e16', CAST(N'2025-09-02T10:40:40.5907965' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (236, N'4eb6c2a3-64d1-4767-aa97-647cc4414aba', CAST(N'2025-09-02T10:40:50.2118536' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (237, N'f45497ce-9338-43a6-9a17-45bfde7dd14e', CAST(N'2025-09-02T10:41:01.2475612' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (238, N'33b6bf5d-0012-4373-8b03-2dd7c6d27bc4', CAST(N'2025-09-02T10:41:11.0329042' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (239, N'a6e05ca3-003d-4815-a9fb-cebfe4f165ca', CAST(N'2025-09-02T10:41:21.9045166' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (240, N'88659c3b-a4ed-40f8-a7f3-13ab38bf4cbf', CAST(N'2025-09-02T10:42:23.5010919' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (241, N'47d9b0ea-1823-40b9-99db-8aa78ebebe6d', CAST(N'2025-09-02T10:42:23.5010919' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (242, N'd2b270b0-eda0-4b97-8963-f3a56f5c4189', CAST(N'2025-09-02T10:42:38.0656722' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (243, N'090c4152-5720-46f7-a43e-cfdd8df22963', CAST(N'2025-09-02T10:42:38.0656722' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (244, N'67c884c1-cc43-4f1e-a6b3-baceb3d7f129', CAST(N'2025-09-02T10:42:48.4555924' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (245, N'da64a698-0b26-4bf9-bf61-1f7b539d41c4', CAST(N'2025-09-02T10:43:00.5642443' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (246, N'caff2789-57d5-4371-9b96-24f481d06677', CAST(N'2025-09-02T10:43:24.8210201' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (247, N'0d9ce859-d3bc-4769-be08-bbb0583a4fd0', CAST(N'2025-09-02T10:43:42.8856783' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (248, N'df419f7b-533b-4719-94b3-1014e8652346', CAST(N'2025-09-02T10:43:45.5958857' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (249, N'2873379e-5c7f-41c2-92fd-622d7248d3fd', CAST(N'2025-09-02T10:43:58.5387974' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (250, N'ec0c6594-7491-483c-aabe-50d51d50693a', CAST(N'2025-09-02T10:43:58.5387974' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (251, N'15de6f00-0460-4331-aa92-c2bbd7523c16', CAST(N'2025-09-02T10:44:08.1387268' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (252, N'336a0a54-3b5c-4492-9951-cb3985f917b9', CAST(N'2025-09-02T10:44:20.3551659' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (253, N'a5b9f5a8-2fb9-4759-a9b3-7caad0ba9f56', CAST(N'2025-09-02T10:44:20.3701457' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (254, N'1c42e73e-6e73-4db2-9d8b-ff985bfb733c', CAST(N'2025-09-02T10:44:30.3740811' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (255, N'239de81c-dc9a-4f64-8fbf-1a19c0ce31af', CAST(N'2025-09-02T10:44:42.6728626' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (256, N'7798bf82-8d7e-46da-b196-c172fc81e028', CAST(N'2025-09-02T10:44:54.3132015' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (257, N'e3e3ea6f-4ef4-4c40-902a-09aaedc333b4', CAST(N'2025-09-02T10:57:35.0891056' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (258, N'3f75aa8b-7636-49d0-9cbb-ea6a8a3fe674', CAST(N'2025-09-02T11:06:06.2103922' AS DateTime2), 1, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (259, N'9d59e436-8e64-46a2-98d3-7789abf7fdcb', CAST(N'2025-09-02T11:07:41.7652648' AS DateTime2), 0, 1)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (260, N'9a5dbd5b-31a2-4920-92f9-72348a4e1b29', CAST(N'2025-09-02T11:08:04.9337656' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (261, N'72167605-3e9d-42fd-94ed-ae8d2dce12c0', CAST(N'2025-09-02T11:08:31.0316606' AS DateTime2), 1, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (262, N'de922d4d-fb39-4d0a-89e7-dc94c46a5386', CAST(N'2025-09-02T11:09:34.3748555' AS DateTime2), 0, 14)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (263, N'8239b8e3-f8e1-455c-a3c7-bbeddd587e4d', CAST(N'2025-09-02T15:00:20.5619942' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (264, N'39b74d8b-ec33-493a-9564-9233d96125b7', CAST(N'2025-09-02T16:50:05.3451803' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (265, N'205075fa-5b00-43d0-8001-5ccd9ebe5ca7', CAST(N'2025-09-02T16:50:32.0876715' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (266, N'a8ded2c8-e1c8-455d-b20f-f5b2177fd786', CAST(N'2025-09-02T16:55:25.0438964' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (267, N'25bb5635-86a4-4eeb-93a5-5a22c73923c2', CAST(N'2025-09-02T16:55:25.1116929' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (268, N'6ec32edd-a56f-4d86-8e4c-7bc40b24be08', CAST(N'2025-09-02T16:55:32.2257314' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (269, N'ebc75e7a-d6d8-4dc9-9bbe-999844c25804', CAST(N'2025-09-02T16:58:48.1071021' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (270, N'a00e2dc6-2a33-49c9-b73b-4cdbcec10d0d', CAST(N'2025-09-02T16:58:52.8059245' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (271, N'03693675-c1f1-47ab-b897-c40a8891d826', CAST(N'2025-09-02T17:00:02.4908371' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (272, N'b57c1b13-5acb-49b8-b0fe-78269c3d6b84', CAST(N'2025-09-02T17:00:02.5892176' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (273, N'8367b388-8287-4625-b5a9-a47cf1832c06', CAST(N'2025-09-02T17:02:14.1126640' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (274, N'95edb8f6-8b71-45c7-b80c-23cf9bf3e650', CAST(N'2025-09-02T17:02:14.2332050' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (275, N'716770a9-78dc-4f80-ab44-b677ed825db7', CAST(N'2025-09-02T17:03:22.1742290' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (276, N'c6816b3d-5da0-4a60-8ad2-d27e5933e743', CAST(N'2025-09-02T17:03:22.2455492' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (277, N'98888de9-f95c-4db5-b452-5bbfe278e004', CAST(N'2025-09-02T17:06:02.2429199' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (278, N'f6320182-a6c8-4f61-b83b-fca788a003be', CAST(N'2025-09-02T17:06:02.2999833' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (279, N'2d4287aa-457b-44c4-b37a-64d4f5a044ea', CAST(N'2025-09-02T17:07:05.8052377' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (280, N'b49e2523-a5f7-49a7-a569-aa6869b13db5', CAST(N'2025-09-02T17:07:05.8623477' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (281, N'b8fbc222-5369-42cb-a109-eeebfb970aa6', CAST(N'2025-09-02T17:34:24.6877012' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (282, N'8a542f48-6760-4001-9445-d844231853a5', CAST(N'2025-09-02T17:34:40.6809100' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (283, N'8ce92ffd-34f5-4300-a897-a349ec7d99f6', CAST(N'2025-09-02T17:35:11.2888719' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (284, N'941f95f3-8eb7-4ab6-9ac3-0f4e972eec13', CAST(N'2025-09-02T17:35:11.3514289' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (285, N'9e87e622-693a-40c6-8924-5e37838c0757', CAST(N'2025-09-02T17:35:13.1360661' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (286, N'1622d395-c3f2-49bb-b842-03529f6322c4', CAST(N'2025-09-02T17:35:40.2717567' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (287, N'5fa25f80-b2f8-47a9-b8ca-f7a0d7b9ec97', CAST(N'2025-09-04T19:34:17.7115622' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (288, N'e71b30a2-3953-402d-87ac-c01055cc5179', CAST(N'2025-09-04T19:37:40.4706120' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (289, N'fe7f7d93-5172-49e4-8a2d-d1b2a71df840', CAST(N'2025-09-04T19:37:52.7737848' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (290, N'75e1f1b8-2ed6-47a5-a2c6-4041289f4f26', CAST(N'2025-09-04T19:41:08.1965281' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (291, N'5b7554c5-a203-42f7-9fe5-0350a146902c', CAST(N'2025-09-04T19:41:22.4350493' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (292, N'd01cfb68-1e9d-4dd8-a3c7-9403210ec580', CAST(N'2025-09-04T19:42:59.6411234' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (293, N'99d52d4a-df6e-4ca0-8db7-a69478580f5b', CAST(N'2025-09-04T19:43:07.3605135' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (294, N'8312c941-4519-4956-b048-15f207029c8d', CAST(N'2025-09-04T19:44:12.3572548' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (295, N'3ddcf7c4-785a-4ef2-99a6-bc60ea304d27', CAST(N'2025-09-04T19:44:22.1526936' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (296, N'11400524-4c52-43b0-b73f-91e60f4419b4', CAST(N'2025-09-04T19:45:22.1851121' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (297, N'e61d9fc8-9bcd-4bfd-9b52-f83678c33ee6', CAST(N'2025-09-04T19:45:30.6632790' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (298, N'70c0fdb5-12ca-4e22-8761-7441402b9679', CAST(N'2025-09-04T19:49:22.7683357' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (299, N'fd0848d0-3d6c-4489-890e-48a2c01b2584', CAST(N'2025-09-04T19:49:28.2703644' AS DateTime2), 1, 1019)
GO
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (300, N'82f8d300-bd11-4f8b-b763-7ce1bc4fa713', CAST(N'2025-09-04T19:52:13.9440505' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (301, N'dc40b9e8-bb74-4607-86ca-1f69e87ade49', CAST(N'2025-09-04T19:52:21.9134021' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (302, N'1a6c243e-f604-4ad1-a5a8-9da87e5aebbd', CAST(N'2025-09-04T19:57:32.9572901' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (303, N'45a790a5-f39d-4186-8b3b-ea1d5a3505f0', CAST(N'2025-09-04T19:57:39.9939174' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (304, N'48c0b5cf-6d44-4f67-8ebc-9f73b6ac3092', CAST(N'2025-09-04T19:58:51.1679530' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (305, N'9d1a2e6e-9e7c-4493-83c3-0a1fe058c06c', CAST(N'2025-09-04T20:06:04.7712976' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (306, N'3313d2f9-00e3-45e6-b85e-60c2c3b4c8c0', CAST(N'2025-09-06T09:48:06.8599493' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (307, N'844071ae-cac2-42db-809d-de30706a8f7d', CAST(N'2025-09-06T09:56:36.9170981' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (308, N'4323aa97-06d9-475f-bd17-4f3aaac36d25', CAST(N'2025-09-06T09:59:22.9165945' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (309, N'7b471ea9-1df7-40af-ae01-9c791a6c6afa', CAST(N'2025-09-06T09:59:35.2641056' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (310, N'dac5c46a-28db-4c51-8492-4a36a598f39e', CAST(N'2025-09-06T10:01:33.7640531' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (311, N'89baad21-d96b-4051-aeff-36ec1132bb29', CAST(N'2025-09-06T10:02:00.3948963' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (312, N'11eefdf6-aae1-44a7-a8f0-38df508b8fec', CAST(N'2025-09-06T10:04:41.0951347' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (313, N'eafb5046-adfd-4cd9-8d4e-e7d14aa4fef0', CAST(N'2025-09-06T10:04:47.1980774' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (314, N'3e9ecda6-e9d6-4b4a-983d-f687462bd6de', CAST(N'2025-09-06T10:05:26.6352490' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (315, N'fa14f24b-1069-43d2-86d5-cf77f81bcbad', CAST(N'2025-09-06T10:24:55.0573725' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (316, N'bd3f876f-8e19-4268-b377-0aaa66dda346', CAST(N'2025-09-06T10:25:34.1827660' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (317, N'31d13ec5-ee36-4a3a-8be0-9e76b53820ed', CAST(N'2025-09-06T10:27:24.9939897' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (318, N'58a07860-df32-49aa-9c77-a6c95de0a547', CAST(N'2025-09-06T10:28:50.8570904' AS DateTime2), 1, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (319, N'c19ee42c-e80e-4af9-bb71-e2f58c6f2823', CAST(N'2025-09-06T10:29:51.9959343' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (320, N'37ecc1b7-6018-4980-8145-36f46b80298b', CAST(N'2025-09-06T10:34:47.8288375' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (321, N'6bf3352d-842a-4870-af31-b3adfaba8250', CAST(N'2025-09-06T10:40:40.0622399' AS DateTime2), 1, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (322, N'f3153f8e-c169-4c51-aec1-35530792cadc', CAST(N'2025-09-06T10:41:22.5634803' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (323, N'71748ad4-4649-4f9f-961f-a4584f67aa15', CAST(N'2025-09-06T10:42:08.7948025' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (324, N'3a4ad2ec-4751-4c56-b545-93c2af3a7a65', CAST(N'2025-09-06T10:42:11.6759162' AS DateTime2), 1, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (325, N'52170869-3cc9-4d7b-a74e-7b236aae2be4', CAST(N'2025-09-06T10:42:38.6318952' AS DateTime2), 1, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (326, N'a2a469b8-a9b7-415c-a723-077ddb4b41fe', CAST(N'2025-09-06T10:42:39.5031779' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (327, N'1b726097-11b8-48f9-be77-6cbe75936f77', CAST(N'2025-09-06T10:43:37.2482841' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (328, N'5b64d29e-2b93-4158-90cb-b86948caf815', CAST(N'2025-09-06T10:43:52.8564357' AS DateTime2), 1, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (329, N'7ebfa171-ccfe-47c3-af3b-d8492c5545a2', CAST(N'2025-09-06T10:43:53.4050880' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (330, N'14360cf9-fa1e-4554-b497-96527dc5fd6a', CAST(N'2025-09-06T10:55:08.5192751' AS DateTime2), 1, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (331, N'ee7bc6d7-32ad-4b9c-8c25-ce26f114b704', CAST(N'2025-09-06T10:55:15.4623133' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (332, N'b91d2356-b288-4bf9-a686-a3e3e26394c5', CAST(N'2025-09-06T10:55:35.1899095' AS DateTime2), 1, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (333, N'f96fbb75-d3c7-4247-8039-fa9dd55b450a', CAST(N'2025-09-06T10:56:35.6550528' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (334, N'd0055573-1224-4938-a87f-241b0d79bbd9', CAST(N'2025-09-06T16:04:20.8678999' AS DateTime2), 1, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (335, N'3be4bf1e-0c53-4f88-bbfd-36eb99b53390', CAST(N'2025-09-06T16:04:42.9644203' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (336, N'2f5dcb76-48ad-48ee-9869-8592bbfd44c9', CAST(N'2025-09-06T16:05:35.2658890' AS DateTime2), 1, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (337, N'407a821c-f2a2-4ca2-8933-24d9ca8d7ba2', CAST(N'2025-09-06T16:05:39.1333537' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (338, N'a0210f76-f147-4d68-a9fc-91cc998aae7e', CAST(N'2025-09-06T16:06:33.3334964' AS DateTime2), 1, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (339, N'faf5829e-86f8-49b7-8fd2-18ed54c92d89', CAST(N'2025-09-06T16:06:33.3334964' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (340, N'f2d18730-a2f3-4f92-a148-e205c62a4190', CAST(N'2025-09-06T16:09:48.1829341' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (341, N'b8ab7331-61ec-4a44-afb8-4271d1d6df0b', CAST(N'2025-09-06T16:10:53.1205154' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (342, N'6d81b210-4b44-4ece-b6af-ac5bb5a32f91', CAST(N'2025-09-06T16:16:08.6809140' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (343, N'03254d9f-fb43-4ac5-9a3f-394d26b1d721', CAST(N'2025-09-06T16:17:37.4686258' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (344, N'302d40db-38bc-4184-bb9c-f2b24920ca1c', CAST(N'2025-09-06T16:49:13.3282419' AS DateTime2), 1, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (345, N'6875f029-71cc-43ce-a564-0acf70a8a98a', CAST(N'2025-09-06T16:53:17.5597893' AS DateTime2), 1, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (346, N'ff609518-78a2-447f-97cd-f0d8af621e56', CAST(N'2025-09-06T16:53:27.4855183' AS DateTime2), 1, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (347, N'302532bb-576c-40ac-b537-0d7ac51d478e', CAST(N'2025-09-06T16:53:39.3203623' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (348, N'dd6d683a-8474-42e4-ac0b-80a1b12bdf74', CAST(N'2025-09-06T17:29:02.0688701' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (349, N'fdac301a-b8b7-4216-b0c4-3705bb0eab3f', CAST(N'2025-09-06T17:30:20.4805305' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (350, N'04418805-518d-4d00-85a4-978226d4e84f', CAST(N'2025-09-06T17:31:13.5811014' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (351, N'ef873981-7f59-421c-8d19-fa8bd3985438', CAST(N'2025-09-06T17:32:29.2299149' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (352, N'a1459056-c691-4d6c-bc6b-d7815a652124', CAST(N'2025-09-06T17:38:46.9012481' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (353, N'562fadd9-6715-4c3d-aefe-87a80b85514f', CAST(N'2025-09-06T17:41:09.7738643' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (354, N'f3f3092f-0e2c-4397-8725-455f03064322', CAST(N'2025-09-06T17:43:36.3215637' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (355, N'ffbebf71-b3ba-4a45-b63d-4bbe4022d4af', CAST(N'2025-09-06T17:45:11.7639232' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (356, N'87bf8b55-0714-4670-b678-1df5880cbbbd', CAST(N'2025-09-06T17:46:01.5198374' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (357, N'a4af2777-7938-43a8-b088-903ef1c22f7f', CAST(N'2025-09-06T17:46:11.6788305' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (358, N'd68ec2ef-b758-497a-9104-b5a813075034', CAST(N'2025-09-06T17:47:06.8916117' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (359, N'd70120e8-9168-47ec-892f-da5925f9cf22', CAST(N'2025-09-06T17:49:44.5281454' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (360, N'e26217c3-dd52-480f-8aa4-8baef03242b2', CAST(N'2025-09-06T17:49:59.3671924' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (361, N'58a668e2-311a-45af-b22c-1fdefa7a7888', CAST(N'2025-09-06T17:53:32.4674856' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (362, N'4408b721-27fc-4888-861d-215a8cb2d773', CAST(N'2025-09-06T17:54:37.8347305' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (363, N'612f8139-b793-4519-bbf8-fa0d8a9969e9', CAST(N'2025-09-06T17:58:44.0879772' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (364, N'3af9be68-aa4b-429c-b851-a169756fa08e', CAST(N'2025-09-06T17:59:46.4609493' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (365, N'ba9c57dc-fcf5-4b53-99f7-5d8e9a6d67e7', CAST(N'2025-09-06T19:10:45.2475688' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (366, N'bfe4b529-f2c2-43ea-80c1-da3aa16d66d7', CAST(N'2025-09-06T19:22:28.3961528' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (367, N'733863b8-ef64-46db-9cb0-910798ffd811', CAST(N'2025-09-06T19:25:10.6627225' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (368, N'6cd15d22-9e79-475e-a289-2a6045415ca4', CAST(N'2025-09-06T19:30:48.8946167' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (369, N'6150ce83-4dc3-4787-874c-55308f58d1ad', CAST(N'2025-09-06T19:30:53.8276295' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (370, N'3c4b9001-d6dd-4295-9551-0e0b21c71689', CAST(N'2025-09-06T19:42:08.0405875' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (371, N'90bad89e-ff63-4a96-92d1-e7827d5f3802', CAST(N'2025-09-06T19:42:26.5819481' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (372, N'aaed6f28-422a-4aea-85bc-ca803fc0f14a', CAST(N'2025-09-06T19:42:35.9483466' AS DateTime2), 1, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (373, N'dee80ce2-521b-4c3d-99e5-309dd7b0c709', CAST(N'2025-09-06T19:46:24.7384591' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (374, N'59a3222e-c12c-4644-8384-e55851b05d59', CAST(N'2025-09-06T19:51:33.4704995' AS DateTime2), 1, 1019)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (375, N'64fe538e-f633-423b-bf21-f06d00c5b1de', CAST(N'2025-09-06T19:52:01.2768561' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (1365, N'8f092ee5-356d-4dd3-a114-27c4c723f711', CAST(N'2025-09-09T10:34:47.6605253' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (1366, N'986b8fab-1efb-4af3-ab4f-a09ccf5f5161', CAST(N'2025-09-09T10:40:01.0398062' AS DateTime2), 1, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (1367, N'5298025f-aa5c-4cec-accd-36f28a463781', CAST(N'2025-09-09T10:44:10.2972181' AS DateTime2), 0, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (1368, N'01a42bb9-fa53-4414-8375-b273285ac547', CAST(N'2025-09-09T10:44:10.2972181' AS DateTime2), 0, 1018)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (1369, N'22959333-b640-4e98-a7b8-33e1d889126f', CAST(N'2025-09-09T10:45:17.7816913' AS DateTime2), 0, 1025)
INSERT [dbo].[RefreshToken] ([id], [token], [expireTime], [isUsed], [userId]) VALUES (1370, N'b8234914-91dc-4aaf-98fe-c69cafd0cced', CAST(N'2025-09-09T10:45:22.5231031' AS DateTime2), 0, 1019)
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
GO
SET IDENTITY_INSERT [dbo].[Token] ON

INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (2, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTU5NjQ4MTcsImV4cCI6MTc1NTk2NDgxN30.JzDPp6EbyPhSfRG9ulMrJ0PsUXTHb23TfWyI4XYTfWk', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (3, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTU5NjUwNzEsImV4cCI6MTc1NTk2NTA4MX0.tfJh1zogAfiui569IxMrClbXB29BGK3lUumG77JVl5Y', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (4, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTU5NjUzNjgsImV4cCI6MTc1NTk2NTM3OH0.VBziGKyBBjNwQI_3LKCuw-iWEkBsKNYz_or9z2r4irQ', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (5, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTU5NjUzNzQsImV4cCI6MTc1NTk2NTM4NH0.YOPXAIyUqK6flhA4y2pOf1sVpIekalmXk6lfqER9kWU', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (6, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTU5NjU0MDYsImV4cCI6MTc1NTk2NTQxNn0.NwQwPUHZrzqyqkDiHGYCsz_VSKthpEQ8Ux0shsl8Rj8', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (7, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTU5NjU0NzAsImV4cCI6MTc1NTk2NTQ4MH0.ksDUGd44CpU86P-zkAJDf4sKUo4QQ-QOLrLvE-6SK8M', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (8, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTU5NjU1MDIsImV4cCI6MTc1NTk2NTUxMn0.gTVP9DxSsFDwIBuZu4Io6-Vt5vqPjxxZ07gUOrXEv9s', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (9, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTU5NjU1MTksImV4cCI6MTc1NTk2NTUyOX0.H5XA8uOsldM7HJI0612IilA3yGMPO_ngi-7uqjsUIMU', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (10, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTU5NjU1MzYsImV4cCI6MTc1NTk2NTU0Nn0.VRosKy2SJao5i50eOLMkzmyBhEC6Sl4uaPvsZ3Sz4DQ', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (11, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg0MTMsImV4cCI6MTc1NjAyODQyM30.u7ivZxL5uF6jL95ejUpUS3wA6ZhJbfiVrtHxm7WdPgA', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (12, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg0MjQsImV4cCI6MTc1NjAyODQzNH0.V_fkdwhZfQ1wOx5pvXwSceJBEPgKUO417i4mhL8ld14', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (13, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg0NDcsImV4cCI6MTc1NjAyODQ1N30.ZGn68au5A64K_uU6p-8Kn3kaizvb40Vgl1Xi62W4XVA', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (14, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg0NTgsImV4cCI6MTc1NjAyODQ2OH0.ZepqbQjhGyQL2KKk_KskVSWGCWUhPTfL5QsAH-9tAkA', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (15, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg0NjgsImV4cCI6MTc1NjAyODQ3OH0.vqcB-WBlPFWm5cZs4smc1Ml8rR0anE7akCziDg9FmpQ', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (16, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg0NzgsImV4cCI6MTc1NjAyODQ4OH0.82L77qhR9TETeaEzLZYMq_Sav_KieXEmwMD5Va8SqEY', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (17, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg0OTcsImV4cCI6MTc1NjAyODUwN30.8av_W3CU0xjaKJ7eaPyxeXzUFhUPh6--jHOySvTLhaI', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (18, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg1MTcsImV4cCI6MTc1NjAyODUyN30.cGSFzCkZZXzvcRSWwsFOKpUTYCPgRSzeiWmja_-7Jls', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (19, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg1MTcsImV4cCI6MTc1NjAyODUyN30.cGSFzCkZZXzvcRSWwsFOKpUTYCPgRSzeiWmja_-7Jls', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (20, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg2NDcsImV4cCI6MTc1NjAyODY1N30.59OBXWzKjAXtHVCjoFSK3ABjdP0uGeZ06NGbAFUYoVs', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (21, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg2NDcsImV4cCI6MTc1NjAyODY1N30.59OBXWzKjAXtHVCjoFSK3ABjdP0uGeZ06NGbAFUYoVs', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (22, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg2NTgsImV4cCI6MTc1NjAyODY2OH0.LCTel4st_hDC1eNmaqmbDV57wVnEW45dN2qbApbwbfc', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (23, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg2NzIsImV4cCI6MTc1NjAyODY4Mn0.whTDyC86LUPxTtID0MJdDkslVwfCtiFMrbpIjCWKrJI', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (24, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg2OTEsImV4cCI6MTc1NjAyODcwMX0.impLXB0CesQddYKJJbMY_F96XBRbDAbcBdffKypbiXY', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (25, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg2OTcsImV4cCI6MTc1NjAyODcwN30.yyJSykDzwinT1z8isSNPlgoqqH9GSeb6wQNHVJEjt90', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (26, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg3MDgsImV4cCI6MTc1NjAyODcxOH0.l2E9A8IMEFiiPLPQWsR_kecpkWD9ev6mH-MjUe_osUI', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (27, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg3MjAsImV4cCI6MTc1NjAyODczMH0.mmmH12mwYFQOECoYP97j9NEXbL4dSDGXkN_rU5aHBVk', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (28, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg3MzEsImV4cCI6MTc1NjAyODc0MX0.Iz78MXmJHARFC_1T1zMwdBfMCyBZcEsOQAdDRLuafPU', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (29, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg3NDMsImV4cCI6MTc1NjAyODc1M30.31sB-jycm6M8momOw6kErXW-yBVMEW3w6M5_rRHqXCY', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (30, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg3NTcsImV4cCI6MTc1NjAyODc2N30.hXBPgbZHffv6vhD71Dd2_XnnbEppMKdx404qbFsArf0', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (31, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg3NzMsImV4cCI6MTc1NjAyODc4M30.1TKJhj9F92mPs7IbaJdM13WkGRU7OOPXoxl3RnuKXu4', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (32, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg3ODMsImV4cCI6MTc1NjAyODc5M30.kpJlvLzwAiRtZbxGV1sPhgcH6QRIzpcw5leQYv2Fr4c', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (33, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjg4NDcsImV4cCI6MTc1NjAyODg1N30.OzUgBD_aKmqyGKm3fYavGBlHaOyxeQobhsPByodePMI', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (34, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjkxMTQsImV4cCI6MTc1NjAyOTEyNH0.si2cl8MP4pF31wpt7qirD1Anp4F0iszp4GGfOb1fs34', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (35, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjkxMTcsImV4cCI6MTc1NjAyOTEyN30.K7cfe3fX6WmBh5ixew5fScEBM7zbF-CeTlOr0hQ7J7Y', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (36, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjkxNTMsImV4cCI6MTc1NjAyOTE2M30.AQi4dd7Qo1cxALF5iXioDkYnItHEowOhtzwJvnZiWY4', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (37, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjkxNTMsImV4cCI6MTc1NjAyOTE2M30.AQi4dd7Qo1cxALF5iXioDkYnItHEowOhtzwJvnZiWY4', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (38, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjkxNjIsImV4cCI6MTc1NjAyOTE3Mn0.wARs0cQLWDEBD5jVFRgX3gK-sZNOJtZ1N3JIl5EcpbQ', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (39, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjkyNjMsImV4cCI6MTc1NjAyOTI3M30.pc6OXtGhEnbZ1waSUO9LfQauVLSV-B2T197yM0AkdgM', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (40, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjkyNzMsImV4cCI6MTc1NjAyOTI4M30.Tsn4zAnZZLqxKC3BgiE3iIIhsA4lUvzpxFKxgw316T4', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (41, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjkyODMsImV4cCI6MTc1NjAyOTI5M30.u1DA1WJ1pyEHelvmcMJR0zYeWqGiKz9d1wqTTZ7-W2g', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (42, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjkyOTMsImV4cCI6MTc1NjAyOTMwM30.CdtkYJyD8GcL6Pa_nkQmttxbWsx4ahpYkiCIJBgqAEg', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (43, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk0MDAsImV4cCI6MTc1NjAyOTQxMH0.rMSYnmW6HoohsJnuFOGTqqse4td8iCIbeJalr1Tl_i8', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (44, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk0MDQsImV4cCI6MTc1NjAyOTQxNH0.FOanrQ9Ny7wB8c2xsP3WXq-8_zyWugKu0ze8QuiHbbg', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (45, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk0MjYsImV4cCI6MTc1NjAyOTQzNn0.vlh5OWmCcV5qkJ9IhZ0iIAQojsdBHP7JSudNhY_Ef8I', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (46, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk1NjUsImV4cCI6MTc1NjAyOTU3NX0.Rfa6mNqZMfyQbwYvFUwfyMs26A9zdaMHqqAgTUT2ZOI', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (47, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk1NjksImV4cCI6MTc1NjAyOTU3OX0.QXJcEhoJUBSLo9CfBvX5rnvABr3BG-nXEulU3JthVZ4', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (48, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk1ODAsImV4cCI6MTc1NjAyOTU5MH0.LERlKdSgqA9GlhI4U6C3LhB7dLqQDjip4IZ_2lFnUes', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (49, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk1OTAsImV4cCI6MTc1NjAyOTYwMH0.rKzFX1wnRGKLzGznMRem3zrfoM3tHpkKXF9hwnM2wUU', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (50, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk2MDQsImV4cCI6MTc1NjAyOTYxNH0.GbQhnjOE-aJyoNDLjFlamOFbAk31yGdNOZdiNkJPD9M', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (51, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk2MDQsImV4cCI6MTc1NjAyOTYxNH0.GbQhnjOE-aJyoNDLjFlamOFbAk31yGdNOZdiNkJPD9M', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (52, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk2MTcsImV4cCI6MTc1NjAyOTYyN30.pnYdOm8eLm9FEYQv8DpkqK3ik9abc68bo2EVuYZnKg8', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (53, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk2MjAsImV4cCI6MTc1NjAyOTYzMH0.8xG9CMWIvnWiWZpWVNTQ2Eh7Ffbhy3_icz8AK11LP50', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (54, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk2NzksImV4cCI6MTc1NjAyOTY4OX0.3vVlb-hvjK2mTtYNwDykmRbDa7kqhmnE1105GxhbSkQ', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (55, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk2NzksImV4cCI6MTc1NjAyOTY4OX0.3vVlb-hvjK2mTtYNwDykmRbDa7kqhmnE1105GxhbSkQ', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (56, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk2ODYsImV4cCI6MTc1NjAyOTY5Nn0.oggKrIAaIQ817pPojMBck7w0g244WgER1anSyQ1MjOk', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (57, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk3MDAsImV4cCI6MTc1NjAyOTcxMH0.66Qo33iQt_vXyCjNuyvFYjW6B2UazTKiRlXP1oJgRLY', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (58, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk3MTEsImV4cCI6MTc1NjAyOTcyMX0.boIZDw2lZ3UA68x0vwVwqogwIxuifG1eWLfJ0BaYcbE', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (59, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk3MTQsImV4cCI6MTc1NjAyOTcyNH0.6sekuy17BbZOQ7NuW2pzjdEPcpbsBSGqeac5Y8MhfQk', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (60, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk3NDYsImV4cCI6MTc1NjAyOTc1Nn0.1GQuv1J5w-ScbvJz7AV_Lb3WfJe8mUeRdGj63VynqKA', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (61, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk4ODMsImV4cCI6MTc1NjAyOTg5M30.YWQEABgGhkI6oBXcqbILHfk5yueTeuEVgjaadEXMyQg', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (62, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk4ODcsImV4cCI6MTc1NjAyOTg5N30.ZSSoim2_yuplCt0_jtEZzOJwrrrRyQ3LwofbPkHBK_0', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (63, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk4OTksImV4cCI6MTc1NjAyOTkwOX0.J89lEcR_oIW2EGAAfLeG-LSDrrgl00U-qsDN4ksiKLY', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (64, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk5MTMsImV4cCI6MTc1NjAyOTkyM30.MHIMDitzLh_FMlGxBpVoocv-0_V-SHAYruncwXTESBI', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (65, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk5MjUsImV4cCI6MTc1NjAyOTkzNX0.I_MUKn8A5vP5Z_Ni5yYN2v3jpHN6xruwXays2c6rZK0', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (66, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk5MzYsImV4cCI6MTc1NjAyOTk0Nn0.R4xrOmvq4LGH6wGAImmrMDGPVZBlOeNG5sdVvZgN-uM', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (67, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJsdWFua2hpMjAwNEBnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk5MzYsImV4cCI6MTc1NjAyOTk0Nn0.27s-BIVqwbB8sMuousjDg2-yjrpD62ia4YqKgrBW1U0', 1, 0, 5)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (68, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJsdWFua2hpMjAwNEBnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk5NTAsImV4cCI6MTc1NjAyOTk2MH0.Ccxs5kuNW0aiu6yqbEhFLfKwLPu_QlJ5NbjS-7dMIho', 1, 0, 5)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (69, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJsdWFua2hpMjAwNEBnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk5NzYsImV4cCI6MTc1NjAyOTk4Nn0.sS33AZU1oIskay-mUBzt3Q1ABmebNgzrxczghDI_qF4', 1, 0, 5)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (70, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJsdWFua2hpMjAwNEBnbWFpbC5jb20iLCJpYXQiOjE3NTYwMjk5OTcsImV4cCI6MTc1NjAzMDAwN30.s0Fsu-E6gYi2TSU2C7wwZ_JKTcMBGz1RKR3CnMhGWpk', 1, 0, 5)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (71, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJsdWFua2hpMjAwNEBnbWFpbC5jb20iLCJpYXQiOjE3NTYwMzAwMzUsImV4cCI6MTc1NjAzMDA0NX0.v8HloCjar3ulLDzYkFyOB6EZ3Hxl5ncLALRmnrFzPzM', 0, 0, 5)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (72, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMDM1LCJleHAiOjE3NTYwMzAwNDV9.CNO8W_GgDYNFGgPHQw-D3j-EEG37AtwynXv6IbYMFus', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (73, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMDUxLCJleHAiOjE3NTYwMzAwNjF9.zbFD6xeZS5l_GRvkOr1-GB2ncrkB6FePD0KYthK0Pr4', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (74, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMDUxLCJleHAiOjE3NTYwMzAwNjF9.zbFD6xeZS5l_GRvkOr1-GB2ncrkB6FePD0KYthK0Pr4', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (75, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMDY5LCJleHAiOjE3NTYwMzAwNzl9.LtuQct-EZohavsdcODPe-CxF2eWuNwSFwpQOu57BK3A', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (76, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMDg1LCJleHAiOjE3NTYwMzAwOTV9.at5wT9nnB6jpMDMTHg_68u-sIqcV09x-CsgWQ8cdkUk', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (77, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMTA0LCJleHAiOjE3NTYwMzAxMTR9.dOedygxQmYGTdD886ypspkr9mYyRHU7d5MQJzNk9kxQ', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (78, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMTA4LCJleHAiOjE3NTYwMzAxMTh9.nvWRPvAdOAhdmxyrOeJpbw0s76fAZX_X1KGYsGqG7qc', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (79, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMTE5LCJleHAiOjE3NTYwMzAxMjl9.AItDjuLGUFZqj0AZlRH3lJN5rAWCkBkz7sF9VwR7o2Q', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (80, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMTE5LCJleHAiOjE3NTYwMzAxMjl9.AItDjuLGUFZqj0AZlRH3lJN5rAWCkBkz7sF9VwR7o2Q', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (81, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMTUzLCJleHAiOjE3NTYwMzAxNjN9.4tpGZjTx_bY_N8Hb4lL24tx909c44b-MMSqhLmhXlzU', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (82, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMzAxNTcsImV4cCI6MTc1NjAzMDE2N30.aEUp0Iqe-s-WTi6NOT797fXTiB9CWx2fmDVtJZt8ZoA', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (83, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMzAxNjcsImV4cCI6MTc1NjAzMDE3N30.LAhJQDd0kEPla1XXQ7P1iHjcGG_xJ9AWPXxMmp1i1yE', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (84, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMzAxNzgsImV4cCI6MTc1NjAzMDE4OH0.v5ZNd0zaRoygIV0WQmu9jWFWhXs-DxMa85tm3lBjPk4', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (85, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMzAxOTcsImV4cCI6MTc1NjAzMDIwN30.rQZMuXvw6jQKSy_zsErlU2PHwSx5IcGwRxip7hLb9w0', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (86, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMjA0LCJleHAiOjE3NTYwMzAyMTR9.jm-vgoENQ9DEqIQzWCnrundxGbyvrgGq0daoFVxkCac', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (87, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMjE1LCJleHAiOjE3NTYwMzAyMjV9.d_hKv9IzAEmYT7mEyoeupslwwrBb3p6EDCcl0wCWZCg', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (88, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMjM4LCJleHAiOjE3NTYwMzAyNDh9.20KCKYZjq24p-kXxDB97oQ4Hg9zRACmjqNAwqvLUJ94', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (89, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMjQzLCJleHAiOjE3NTYwMzAyNTN9.ER7--jUndfzOYmAzOdSbCXok_zYEfza_Ksa98HaIYSg', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (90, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMjc5LCJleHAiOjE3NTYwMzAyODl9.g5pmNm4fMKBFWfNprYhT4kSWJ2Ah9DKjfzluW4dF5fE', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (91, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMjc5LCJleHAiOjE3NTYwMzAyODl9.g5pmNm4fMKBFWfNprYhT4kSWJ2Ah9DKjfzluW4dF5fE', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (92, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMzIxLCJleHAiOjE3NTYwMzAzMzF9.jyqQzJux6eTfIX_omchit96RmMsAXE0KbLJ0QW_GgZM', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (93, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMzM2LCJleHAiOjE3NTYwMzAzNDZ9.fglnVhOJ0dOLt-G-A2gTJYFc_zjDVJ7ofQBZenCwYXo', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (94, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMzU4LCJleHAiOjE3NTYwMzAzNjh9.dSwMojlDxsNogOtsveJePHKy4zZSH_OAeztxPW8_Ul8', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (95, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMzc4LCJleHAiOjE3NTYwMzAzODh9.8Yr1Ojk_662ZUHvBTEZvZvP4NhAEHl5DjM0QllZYjqA', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (96, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwMzc4LCJleHAiOjE3NTYwMzAzODh9.8Yr1Ojk_662ZUHvBTEZvZvP4NhAEHl5DjM0QllZYjqA', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (97, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwNDI3LCJleHAiOjE3NTYwMzA0Mzd9.2e69fsh7WBvTmpf679U0AGqZdW6TjzzBxk5Fx4yIyJg', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (98, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwNDMzLCJleHAiOjE3NTYwMzA0NDN9.wk0Tz1KAw0h1lklDhPCYFgYW3c07-olRR-a4gNz9h8A', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (99, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwNDQ0LCJleHAiOjE3NTYwMzA0NTR9.5F5jgMSE7253H81cG7RNhWGXfZCc89Y4q4VbMBt95qw', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (100, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwNDU1LCJleHAiOjE3NTYwMzA0NjV9.h6DgDzpAY95vPDZFGjMsqqPFIX7IS-ty88Nl_NFVFtA', 1, 0, 13)
GO
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (101, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwNTMyLCJleHAiOjE3NTYwMzA1NDJ9.ULyzSRuXeHJjcTjw04OAYWGneSGeAIOvbwbLWWmU6EA', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (102, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMzA1MzYsImV4cCI6MTc1NjAzMDU0Nn0.TOayrbHaVSkekTzLbiMdQ7Vou58m8yH_f4zV2uBsTy8', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (103, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwMzA1NTIsImV4cCI6MTc1NjAzMDU2Mn0.hCb7bfoAG1Ok3OQ_ctEovPZQuzYHV8yUnGc4tUodkpQ', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (104, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwNTU1LCJleHAiOjE3NTYwMzA1NjV9.G9CS2T4g3BS4PV4Hk8V5-PfWFsfMjeFiUCz26icNukw', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (105, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwNTcwLCJleHAiOjE3NTYwMzA1ODB9._GzrjLdHF8OxCvtIvbeUWdNi_HmjLk0Lq3JNR_Lwv4E', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (106, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwNTcwLCJleHAiOjE3NTYwMzA1ODB9._GzrjLdHF8OxCvtIvbeUWdNi_HmjLk0Lq3JNR_Lwv4E', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (107, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwNjI5LCJleHAiOjE3NTYwMzA2Mzl9.tGbgi1uIs0Mo8lKmDzB5FmbZCNZ3XJuYRBe5h-NogwE', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (108, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwNjM1LCJleHAiOjE3NTYwMzA2NDV9.D840zDCUPMBEfypz7s2BSRu2ku8GbDeQdhElpqhkT0s', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (109, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwNjY3LCJleHAiOjE3NTYwMzA2Nzd9.u1DBIb-VISQrY9SfbHvfYBzHQcza0RZLx9R6Qk64Sx0', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (110, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwNzkxLCJleHAiOjE3NTYwMzA4MDF9.bhCjsCD236tQhVbaTheqyOL_k8qGGbuviTwNuxX5rZQ', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (111, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwNzk1LCJleHAiOjE3NTYwMzA4MDV9.vfqkkQ3RB-rZk-Te3hkxdEDQ8GJHiwUiMOp7kV-7uIs', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (112, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwODEwLCJleHAiOjE3NTYwMzA4MjB9.HSGhOyHfus35HCi2-KVJ41moppV3_m51TAMMLoZ8Qe8', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (113, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwODg4LCJleHAiOjE3NTYwMzA4OTh9.XWTI-MQKWTPegQCEUTDPLMwyEneIGl12qTFOtUUQZsE', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (114, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwODkzLCJleHAiOjE3NTYwMzA5MDN9.n6p1qqhquF9UwXmmaGUkWdai77XP81DpcLVb6DWm7hc', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (115, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwOTA3LCJleHAiOjE3NTYwMzA5MTd9.b7F4siufI8gK_N9uDbSv-gXQlHI0-YRfQDRB5WDfRlQ', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (116, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwOTEwLCJleHAiOjE3NTYwMzA5MjB9.-YgGaNQjWHj7oB3hZHHlKCZSMAAMszLN94qhxZdXFL8', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (117, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwOTIwLCJleHAiOjE3NTYwMzA5MzB9._lfTohdKe0kf6Z1isyY6T9yE3EQV14BovWMvK2UIlA0', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (118, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwOTU0LCJleHAiOjE3NTYwMzA5NjR9.slA5SLYYpfGRVIH9t_awbrPF6RGSoEiEf8xHgXiJfAM', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (119, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwOTU4LCJleHAiOjE3NTYwMzA5Njh9.OdgNtl0y-X4Q28LZ0uwFQjG5R4ovLd71SVzyrsGYJbs', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (120, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwOTc0LCJleHAiOjE3NTYwMzA5ODR9.uHs8I7S-UGPMWvn348LjUkVUxveSHxCgIjJH20hiMYA', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (121, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMwOTg5LCJleHAiOjE3NTYwMzA5OTl9.xBnaSoNAwx8LPFWyBY-uddY8T60xdoZmnseMNaY-OnU', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (122, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMDE0LCJleHAiOjE3NTYwMzEwMjR9.oBCMcEBWy5XX5PvJ06rqYdA4KSoovuh64t4FQuO8apo', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (123, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMDE5LCJleHAiOjE3NTYwMzEwMjl9.VI4Sn8asaXuLoqFPEw3h5EaQbH9VU50hCnrYXMUEDbE', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (124, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMDM0LCJleHAiOjE3NTYwMzEwNDR9.mYDqIf3ZasGJH2pIFZM2ZnlTm2-OxIB4cw3mum9fuj4', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (125, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMDQ1LCJleHAiOjE3NTYwMzEwNTV9.iJPQwSvhceo7Xs3qC9v14TFEv_3cpfBouiTuA8cjDHo', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (126, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMDU1LCJleHAiOjE3NTYwMzEwNjV9.xyl0zFAZW43u0IdbYHZWS5XMmPR1hry5hETSKwKF7Bs', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (127, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMDkwLCJleHAiOjE3NTYwMzExMDB9.tU_OjRKwhbt36hJA30Un-Npdj6Onk6ofDtE_zk7AR6o', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (128, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMDk5LCJleHAiOjE3NTYwMzExMDl9.TthEd6p6Akdb-r5p9KULmYfH7ztaEgXNNqY_rMSaa48', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (129, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMDk5LCJleHAiOjE3NTYwMzExMDl9.TthEd6p6Akdb-r5p9KULmYfH7ztaEgXNNqY_rMSaa48', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (130, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMTAzLCJleHAiOjE3NTYwMzExMTN9.uvhfP-o5HWGnZ0pj5LQP2Kc80S48LR4nb50GaZbYVl8', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (131, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMTI3LCJleHAiOjE3NTYwMzExMzd9.tztuzHiqco0kch_KUOfkvuUs6fzrpOos5n_1kAaWIEw', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (132, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMTM4LCJleHAiOjE3NTYwMzExNDh9.tRAWS2DXi6j2HzkaQjxJqn9OeaUP1TNHSndhj0jCgaA', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (133, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMTQyLCJleHAiOjE3NTYwMzExNTJ9.E70dl5dqg3RzxUtmCqV_Xf9jy3rdL6cZF37xg0uoIu4', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (134, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMTgzLCJleHAiOjE3NTYwMzExOTN9._p1tEAh8b_GM-nXJ4NoLtUjQNFD5Ba1EJlbw6KF1SSs', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (135, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMjM4LCJleHAiOjE3NTYwMzEyNDh9.VjA0almQjz81SxUa1eBLaLWVd4vXMl4bHvKghvajCU4', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (136, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMjQ5LCJleHAiOjE3NTYwMzEyNTl9.RNTZfcYzoWO5b315MaW94bdqV4i97vQPDmEB4XFcCf0', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (137, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMjQ5LCJleHAiOjE3NTYwMzEyNTl9.RNTZfcYzoWO5b315MaW94bdqV4i97vQPDmEB4XFcCf0', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (138, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMjYxLCJleHAiOjE3NTYwMzEyNzF9.VCPZB-7LgwtyyjFwVze-bDV-IsLEkwx9KVA6RCuQR_U', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (139, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMjk1LCJleHAiOjE3NTYwMzEzMDV9.xOAb33vopW1dqlUNluwejUSV0HBn0kVc7oRlduGmu_I', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (140, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMjk5LCJleHAiOjE3NTYwMzEzMDl9.ysLHX_CmjYtz1JVfSd60zDOP-tFhwTFdTfxoFxA5d8I', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (141, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMzEyLCJleHAiOjE3NTYwMzEzMjJ9.Sgtk1aIfWF51GX_YV8lTPvv8YeJREVvRlUEZZaT7XXY', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (142, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMzIwLCJleHAiOjE3NTYwMzEzMzB9.QOF2-Yy_nK5SWPzvv-U_V0o1K9Rz93N5vT4lq6HaOZ0', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (143, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMxMzM2LCJleHAiOjE3NTYwMzEzNDZ9.eoYy1K1RTR9aKGbuHhGZkSuZ9hQnfTB-vMWyUrxcKMU', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (144, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMyMDU3LCJleHAiOjE3NTYwMzIwNjd9.Aj_UZ1C8J6Z3ZRXVAdO4s6oAb-Ljw6IunZTMFxtNHWg', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (145, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMyMDY5LCJleHAiOjE3NTYwMzIwNzl9.aZT1LBEn2bgft75GoorTBTKko4Wl6QvzUaPin9tMRvU', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (146, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMyMDY5LCJleHAiOjE3NTYwMzIwNzl9.aZT1LBEn2bgft75GoorTBTKko4Wl6QvzUaPin9tMRvU', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (147, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMyMDgxLCJleHAiOjE3NTYwMzIwOTF9.YgKdADPPKxE9yiZ6NDoKzt_hNK3-OBfXfHjrAIUtBso', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (148, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMyMDgxLCJleHAiOjE3NTYwMzIwOTF9.YgKdADPPKxE9yiZ6NDoKzt_hNK3-OBfXfHjrAIUtBso', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (149, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMyNTQ4LCJleHAiOjE3NTYwMzI1NTh9.7gSoB37BEUPOGrZoo4NV-kIz1iXVGuGfHjpx82YZrnA', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (150, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDMyNTUzLCJleHAiOjE3NTYwMzI1NjN9.eSAgZmDXExmWuLSvQCPuBKiL6UzOJpBQaBnpUmLz6Qg', 1, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (151, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwODkyNTEsImV4cCI6MTc1NjA4OTI2MX0.EalkdahQ7EVNUiotwQkFxgg7KK8CU6onylQp7XVp0BU', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (152, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDg5NzI0LCJleHAiOjE3NTYwODk3MzR9.9fQX2eoNzLOpWV08M183ks1UE5vaVPIYYpxXFTHFamg', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (153, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDkwNDY1LCJleHAiOjE3NTYwOTA0NzV9.DpOQMVPvjJafJBSrmIbE0kD8uKTL2skAbrxpfQg7gMo', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (154, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDkwNzE5LCJleHAiOjE3NTYwOTA3Mjl9.YeRKPImhTA29YzecdgzEWAiXBTeCzlLQ0n11iFtpCVQ', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (155, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDkwNzI0LCJleHAiOjE3NTYwOTA3MzR9.c8qrLAEfNjs8TTcyHKRpjbAoAi0wkVYZ5RT94ZXF3CY', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (156, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTA3MzYsImV4cCI6MTc1NjA5MDc0Nn0.kiWkL-vw_vmO2a7XHYTaLDXw6f7Ag5Bq31RgLJ6rmy4', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (157, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDkwNzQxLCJleHAiOjE3NTYwOTA3NTF9.Lhf3bRAZ-OOb8gkn2xt5ZNyray1aC71USp6B65mowQg', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (158, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDkwODM0LCJleHAiOjE3NTYwOTA4NDR9.Eg4DKgTV3_VNYj9neojJJ2227ULjQJ3nhTv7j5WzVF8', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (159, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTA4NDQsImV4cCI6MTc1NjA5MDg1NH0.xEKpHx92nG-edt5L_lB1xSidSZJ9iaFWsyLxR-UeSSg', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (160, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTEwMDEsImV4cCI6MTc1NjA5MTAxMX0.FJ6aHkY0KqWordty8QwLBX87Lm6eZZ-KbNKdaPHECVY', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (161, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTEyNDIsImV4cCI6MTc1NjA5MTI1Mn0.J2ZVdQ_roLGuukH-KbWC1vTsP6yW2Oa3te140xEe1CM', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (162, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTEzODgsImV4cCI6MTc1NjA5MTM5OH0.SleCn3N0T49OkTLSdFx4vCType6AMae6rD-ztMsTSfs', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (163, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTE0NTcsImV4cCI6MTc1NjA5MTQ2N30.MGj5Uoq1XV1ioUEPppGjD4J2NbJl1mhGrPt0dqLsVHI', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (164, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTE0NjgsImV4cCI6MTc1NjA5MTQ3OH0.42tnIojbhBEeBSHbDL_vaeg4fbdjIKRAIHl6ZvGGKrM', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (165, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNzU2MDkxNjE2LCJleHAiOjE3NTYwOTE2MjZ9.0doWzmjSX9hjWu6NFpi1taDvTGkUs8l7K7YEBDJmwRc', 0, 0, 13)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (166, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDkzNTU3LCJleHAiOjE3NTYwOTM1Njd9.NF4WmK_zzUxAT8QHrT8wEe8Tbi73QOpzvs6XLycME5s', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (167, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDk0ODk4LCJleHAiOjE3NTYwOTQ5MDh9.WG7C4vxEoeSKGi1_0FzMyfAlhoWqcvdCv3OLdKMxeq8', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (168, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDk0OTAzLCJleHAiOjE3NTYwOTQ5MTN9.1R6XUILuEfh2HD3mRa2LlkFg8tnnAC_tAQGYzQKaz3c', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (169, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDk1MTI1LCJleHAiOjE3NTYwOTUxMzV9.WXjgEQy0q6BNq5PHAMySD5slYJ8nyNxekYgvEysdxlE', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (170, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDk1MTI1LCJleHAiOjE3NTYwOTUxMzV9.WXjgEQy0q6BNq5PHAMySD5slYJ8nyNxekYgvEysdxlE', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (171, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDk1MTI1LCJleHAiOjE3NTYwOTUxMzV9.WXjgEQy0q6BNq5PHAMySD5slYJ8nyNxekYgvEysdxlE', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (172, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDk1OTMyLCJleHAiOjE3NTYwOTU5NDJ9.pNYgwCUAB2W-Kq0AiPDQYZt1VTwZv5mJFaR_yuOFlQU', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (173, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDk1OTM2LCJleHAiOjE3NTYwOTU5NDZ9.T-ehSFh_YBV2paG8KcNw5Le-MjaezI0lwIdAtEUdw_0', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (174, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDk2MDYzLCJleHAiOjE3NTYwOTYwNzN9.oauZBHJ4ThVwU1qEXKrEdfmwk2d0Z5WPjq_Jq-AUo6E', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (175, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDk2MDY2LCJleHAiOjE3NTYwOTYwNzZ9.BsUB-JqXji11JK_xgTU2Vbbn-In8l2U2PecAsr1w5p4', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (176, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDk4ODAwLCJleHAiOjE3NTYwOTg4MTB9.csiOm5Pd6a8rny_u-cwMAjNQp467-r5ARazhknPYdCQ', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (177, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MDk4ODYxLCJleHAiOjE3NTYwOTg4NzF9.WCWKsj1biiVec5_0C63yYA47RNZ4FYRGXNJOXs3ZPcs', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (178, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTg4NjQsImV4cCI6MTc1NjA5ODg3NH0.dMmd5O5LfeJAN06lS58S1zRm1Vpiyl8puDQjPiZoDcA', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (179, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTkwMDUsImV4cCI6MTc1NjA5OTAxNX0.Un9GbY0ctkE-OVKxeWCkCeB3L1za-fb268A_xH3FbyI', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (180, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTkwMDgsImV4cCI6MTc1NjA5OTAxOH0.TEqUpXBUAn0bEhOG8iLubiloN_6K7CA3DaH_csuQwlI', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (181, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTkwODYsImV4cCI6MTc1NjA5OTA5Nn0.Stfwl23y7HSrHLF2hHxDx5nh4IFOsLp3PSU4l9IujEg', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (182, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTkwODksImV4cCI6MTc1NjA5OTA5OX0.Vyu-KRAzhcq4UqIrHeZMG9WjmUQ36M68g1z5FHgp_k0', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (183, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTkxMTAsImV4cCI6MTc1NjA5OTEyMH0.Gqbc_gckD3rpx24hGKfXWjtNVQ1Ss7Q-9Fa8xG-xlsI', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (184, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTkxMjAsImV4cCI6MTc1NjA5OTEzMH0.S76gfjmejGt5Vif9rWFadjXBv3KTThHe7eDuw-1mtlA', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (185, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTkyMzcsImV4cCI6MTc1NjA5OTI0N30.y7S4g6K0ByRgBnzsST5WVFV2GJWNaCamymVRkRL3VHs', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (186, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTkyNDcsImV4cCI6MTc1NjA5OTI1N30.rOgIMOAilFKYoiCb_oLaaBJmOvEoNEgNtpUDQDjjBAw', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (187, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk0MDEsImV4cCI6MTc1NjA5OTQxMX0.oMplUu70fRc_PqebJglQx60x3Pdu5dDiHhCJ6NvJNoc', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (188, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk0NDYsImV4cCI6MTc1NjA5OTQ1Nn0.Oz_7pfIkizQoDHzHFm_Ax5gDHPDoqw8skaDfcyfrooQ', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (189, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk1NDQsImV4cCI6MTc1NjA5OTU1NH0.YElgcl835ZxK2wvyAXVw0rkXmWe6eiVllMJNJ2q9l4E', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (190, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk1NjEsImV4cCI6MTc1NjA5OTU3MX0.j5GiEHOTOFmgkyAcCbGJ-6uqxzkPP71uOYhs7mt6x-o', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (191, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk2MjAsImV4cCI6MTc1NjA5OTYzMH0.9eqWbf0mUUIqIh-yGCRCEg_A-vIrEyyaBmOjv2hFQXg', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (192, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk2MjMsImV4cCI6MTc1NjA5OTYzM30.NaDbUgSg2GIBIBFFx-1C3LrniHjxmdyU6G2zfmTZbYE', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (193, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk2MzcsImV4cCI6MTc1NjA5OTY0N30.ixpSF3LF2-Xx-3U-aV0fnZd5m-fhtvZ14Awm8PYTxmg', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (194, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk4NTgsImV4cCI6MTc1NjA5OTg2OH0.obV2vZoffQersXUfUQ0mDrmA08g-UMNWnc27tQfgASU', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (195, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk4NjAsImV4cCI6MTc1NjA5OTg3MH0.9w4nApJrUOIMiPQuHSdT6hWIBMdcb4zR4r0tCSKEp-o', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (196, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk4OTgsImV4cCI6MTc1NjA5OTkwOH0.C-mdmzkZZEBiAxpPS5cICfydI-DKxkOBaHEIm7d9iIs', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (197, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk4OTgsImV4cCI6MTc1NjA5OTkwOH0.C-mdmzkZZEBiAxpPS5cICfydI-DKxkOBaHEIm7d9iIs', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (198, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk4OTgsImV4cCI6MTc1NjA5OTkwOH0.C-mdmzkZZEBiAxpPS5cICfydI-DKxkOBaHEIm7d9iIs', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (199, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk5NTAsImV4cCI6MTc1NjA5OTk2MH0.2V2cF-IF4ddp7QR1SpMV91Suj1uiUajn3tU0kXYuKW8', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (200, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk5NjMsImV4cCI6MTc1NjA5OTk3M30.FpD2Uz2AvfhSkOnrM67NCizCk-uCl3JME03St_Jqc-g', 1, 0, 14)
GO
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (201, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYwOTk5OTIsImV4cCI6MTc1NjEwMDAwMn0.JDU7xSE69ElCuRoWs6tM-8Um9_J3Hquz1yaQHZpga08', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (202, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxMDAwMTMsImV4cCI6MTc1NjEwMDAyM30.XiV8a-qCwLMlt6D8dbvRNip_9qkHxCVIHH_Dytx0Tw0', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (203, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxMDAwNjAsImV4cCI6MTc1NjEwMDA3MH0.7BQOnJEgzWRzWfrQgjPY6oSdoZBPMxkiuh2_5aHyu-Q', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (204, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxMDAxODAsImV4cCI6MTc1NjEwMDE5MH0.xuLj6cu1nZg3aohFzlmwJjTvzK6uMuYaAD13ubvLmGE', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (205, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxMDAxODAsImV4cCI6MTc1NjEwMDE5MH0.xuLj6cu1nZg3aohFzlmwJjTvzK6uMuYaAD13ubvLmGE', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (206, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxMTIzNDQsImV4cCI6MTc1NjExMjM1NH0.p0XYkolBSH4TNnyhVatTo_eQojOIOHMOfvX9brI_PLc', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (207, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxMTI1NjQsImV4cCI6MTc1NjExMjU3NH0.B5a0fp_odLPTFGAOAY7EJUBQpziDHca8FsKc_01t5_Q', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (208, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxMTI1NjQsImV4cCI6MTc1NjExMjU3NH0.B5a0fp_odLPTFGAOAY7EJUBQpziDHca8FsKc_01t5_Q', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (209, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxMTI1NjQsImV4cCI6MTc1NjExMjU3NH0.B5a0fp_odLPTFGAOAY7EJUBQpziDHca8FsKc_01t5_Q', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (210, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxMTI1NjQsImV4cCI6MTc1NjExMjU3NH0.B5a0fp_odLPTFGAOAY7EJUBQpziDHca8FsKc_01t5_Q', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (211, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzgwMjYsImV4cCI6MTc1NjE3ODAzNn0.izuq2h3_6MtoLJd5i-P66c5aEUCyHtch7PJhtMAWqaY', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (212, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzgwNDAsImV4cCI6MTc1NjE3ODA1MH0.VG6rGOc4UO4KzOCVe-UbKCeeUlLQGhRD3OR_04X34Cc', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (213, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzgwNjgsImV4cCI6MTc1NjE3ODA3OH0.QahxiGjBxk9ZT3aC33JPAM0GR6O7OsSR8Srh2eMilq0', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (214, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzgxNDAsImV4cCI6MTc1NjE3ODE1MH0.zuux-pL6A9LyPgTCtunkKEBL0yh_2NEqVrHtrco8RBg', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (215, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzgxNTAsImV4cCI6MTc1NjE3ODE2MH0.RA0DENQJTLk8zfjEUjP_6gDN98jfcBPkA9nnkejCzvA', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (216, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzgxNjcsImV4cCI6MTc1NjE3ODE3N30.y7Nb8eOWvWndxVdEcHhFO8jYvX0HZ-U87hFXB8Dvf-8', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (217, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzgxOTEsImV4cCI6MTc1NjE3ODIwMX0.ZxucxTawWlk_TV3mre3jjcvgcXcI0BaVLf-hsCraKVI', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (218, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzgyMDYsImV4cCI6MTc1NjE3ODIxNn0.3xQSsyfudc7fAT889UDdKfMX_55DjI0uwwp3BbhKtoQ', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (219, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzgzNzUsImV4cCI6MTc1NjE3ODM4NX0.09QjcGsmUY4fB9dMl0i_DYdUWYUAN1jYyT1aO63iV3g', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (220, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzgzNzUsImV4cCI6MTc1NjE3ODM4NX0.09QjcGsmUY4fB9dMl0i_DYdUWYUAN1jYyT1aO63iV3g', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (221, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzgzODUsImV4cCI6MTc1NjE3ODM5NX0.UHdx661FASSGQDiXWJkgod4tMiccwCOAM5iZfuCJc7M', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (222, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzgzOTcsImV4cCI6MTc1NjE3ODQwN30.yhQyFCbdmRv-YyygzCHX5OhK6id7G12gczAfVp81CyQ', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (223, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzgzOTcsImV4cCI6MTc1NjE3ODQwN30.yhQyFCbdmRv-YyygzCHX5OhK6id7G12gczAfVp81CyQ', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (224, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzg1NDAsImV4cCI6MTc1NjE3ODU1MH0.HnPD4lBwDJoJawmFZOkI5HjTKHyiwtlHJMTsSyKIWFY', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (225, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzg1NDMsImV4cCI6MTc1NjE3ODU1M30.1JenVGi1cyfE-6q70bTOIWY9w_DhiyjIN0IEy3Rl3OU', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (226, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzg3MDUsImV4cCI6MTc1NjE3ODcxNX0.rMwSJFfZu7IoCg9iU3kJJi-TmIcDvObS4CCAY82-I_4', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (227, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzg3MzgsImV4cCI6MTc1NjE3ODc0OH0.j0oouBCWD7RZRk7BrwnzmKLICJ12_EIZuTEIZ49DT70', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (228, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzg4MzgsImV4cCI6MTc1NjE3ODg0OH0.XXm6MI4DEoJemACqr9OJtWAqrZbDUn8QOxYY-02NuoQ', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (229, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzg4NTYsImV4cCI6MTc1NjE3ODg2Nn0.zZ1extxB--26H62WJMnkv53GlO1Q1o-dFIX_P2OZUm0', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (230, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzg5NzUsImV4cCI6MTc1NjE3ODk4NX0.8tTsPK-9VVSiC8ecdsD4I79iErjOSgfIwwR9CPpyD6w', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (231, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzg5ODQsImV4cCI6MTc1NjE3ODk5NH0.lKAHf2Zz39cL4uU-V_LiOxgdnwYMXJCODpLSurbMuqk', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (232, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzkwNTEsImV4cCI6MTc1NjE3OTA2MX0.QUHXba1rUk4s_pKTYx_uBcfAwLUZA7vL3PIhx7U8YD8', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (233, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzkxOTgsImV4cCI6MTc1NjE3OTIwOH0.-G00RlxY5SoFojQv-YHANXRAHEbfjLBe5wSyC5UTHQw', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (234, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk1NzQsImV4cCI6MTc1NjE3OTU4NH0.jAc2hC5MobycOv7rFITTL-AW_eN5g2u2quD0jX7HFMA', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (235, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk2MjAsImV4cCI6MTc1NjE3OTYzMH0.fQu02cNLNJSH0DkHTtd3JSLIqSxtGfyMh3wPCecBW3c', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (236, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk2NDAsImV4cCI6MTc1NjE3OTY1MH0.y0yd-Fn1_FnhGCKS1da6KhNPj0eGkHcIj-ifrL5smgw', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (237, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk2NTAsImV4cCI6MTc1NjE3OTY2MH0.hbaBf1-jnJrAGdvpBc5ZkpaizpU3ZY5Ui_2flp0dxNI', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (238, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk2NjEsImV4cCI6MTc1NjE3OTY3MX0.kK-85wDaMINMl3tOwDxONZdc-80sWA1XfSc48Mj3CnY', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (239, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk2NzEsImV4cCI6MTc1NjE3OTY4MX0.s2cNBo_gzf-8U7okTKCpXZObF4Zmte_ZUQm6cKukXBg', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (240, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk2ODEsImV4cCI6MTc1NjE3OTY5MX0.q5I-A5fYWWZdZVzRdYNCbPH7etqKnGFdFouL5LNAz2w', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (241, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk3NDMsImV4cCI6MTc1NjE3OTc1M30.-nIKMJvsEl3z-3Mwn0n7kxIzJ8lu21TbYF41u8DmX1c', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (242, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk3NDMsImV4cCI6MTc1NjE3OTc1M30.-nIKMJvsEl3z-3Mwn0n7kxIzJ8lu21TbYF41u8DmX1c', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (243, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk3NTgsImV4cCI6MTc1NjE3OTc2OH0.jfctIFhBTio0E1aoXKx_9ySSr5n5sf2PKKhGZTcUb_w', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (244, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk3NTgsImV4cCI6MTc1NjE3OTc2OH0.jfctIFhBTio0E1aoXKx_9ySSr5n5sf2PKKhGZTcUb_w', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (245, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk3NjgsImV4cCI6MTc1NjE3OTc3OH0.PdgU_pq712t3q-lImxx582RDFmZIIxdjY9HC64R3uqc', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (246, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk3ODAsImV4cCI6MTc1NjE3OTc5MH0.ZXHaRB6IR0m96M5FALHceuLZxGCiNxpwmNu-bF2l98s', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (247, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk4MDQsImV4cCI6MTc1NjE3OTgxNH0.1_23kmK3eKAngBEthIsmLfxOHjducT93bEbaQcFOJ_c', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (248, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk4MjIsImV4cCI6MTc1NjE3OTgzMn0.tQy5fU1BuYyE8vsG4WyUkvxHAtUhFDjmSOBw2FH0Pgc', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (249, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk4MjUsImV4cCI6MTc1NjE3OTgzNX0.ztfJuEtVqnStV3T7KBJigOhGhdQDGAqjAmqvLfoult8', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (250, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk4MzgsImV4cCI6MTc1NjE3OTg0OH0.ibbyjVlX6xR1iWw28Rr1WPAkZ4Dp5E4PkRaUai0OAy4', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (251, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk4MzgsImV4cCI6MTc1NjE3OTg0OH0.ibbyjVlX6xR1iWw28Rr1WPAkZ4Dp5E4PkRaUai0OAy4', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (252, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk4NDgsImV4cCI6MTc1NjE3OTg1OH0.qFzPxMC8lUnKCaNl1yhqPIMEn-p2apQCx4NW0FD1jj8', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (253, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk4NjAsImV4cCI6MTc1NjE3OTg3MH0.Vml4HlHdnbxljKGOBRGLl9OgIlg-_zTjhWkwO62aWZQ', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (254, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk4NjAsImV4cCI6MTc1NjE3OTg3MH0.Vml4HlHdnbxljKGOBRGLl9OgIlg-_zTjhWkwO62aWZQ', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (255, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk4NzAsImV4cCI6MTc1NjE3OTg4MH0.xqX2RAVVuy-8tG_zKRIkFz_7Dk31B-2HtVm1fjJUfTs', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (256, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk4ODIsImV4cCI6MTc1NjE3OTg5Mn0.2vhUwxhkSvsDqByz6JHKOfqCEHSuR2MpJ6u5x5bNRjk', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (257, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxNzk4OTQsImV4cCI6MTc1NjE3OTkwNH0.RZMH7o7KCG7adRs5CC7VdwaNn_h8vic9BRMh-ASdRZY', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (258, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxODA2NTUsImV4cCI6MTc1NjE4MDY2NX0.vZMU4RqcCke7tMBmRyMBAs-_nVlmUKojxnU3tG0EWEU', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (259, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MTgxMTY2LCJleHAiOjE3NTYxODExNzZ9.YPsipFhDaTPeh8GeGb8Mut-SAX1RDsmvVT1eEmJOOkc', 1, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (260, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNzU2MTgxMjYxLCJleHAiOjE3NTYxODEyNzF9.lQ6jdv_Zge8fMb767Var89wEgFQM03WCsZ76irMYXQI', 0, 0, 1)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (261, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxODEyODQsImV4cCI6MTc1NjE4MTI5NH0.NskhL_5zGm9DpnOOkt0mCSNLH-oa5f9eWglMnZjhbUk', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (262, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxODEzMTEsImV4cCI6MTc1NjE4MTMyMX0.ILSyCTOZRp61tLMkg-Eh8xvVW1-H_r_yV9LWJYDfupc', 1, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (263, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMyM0BnbWFpbC5jb20iLCJpYXQiOjE3NTYxODEzNzQsImV4cCI6MTc1NjE4MTM4NH0.uB5XjnCPYUecxFGGYUrDPMOpzUBKYRnWrrWJigNwYx8', 0, 0, 14)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (264, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxQGdtYWlsLmNvbSIsImlhdCI6MTc1NjE5NTIyMCwiZXhwIjoxNzU2MTk1MjMwfQ.k7kQ87zx0JqcrXwyPtmWEOTHZxTAhbLdIGfYsALCbWk', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (265, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMTgwNSwiZXhwIjoxNzU2MjAxODE1fQ.kjuvRiOMPSlWRJs1ck0No3qjp6nW9_a28KpOOQZ7bTo', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (266, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMTgzMiwiZXhwIjoxNzU2MjAxODQyfQ.xkkF09Mcg4Z4toqs0TWxV64to0aS9MeB-fDuMk5CJVA', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (267, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjEyNCwiZXhwIjoxNzU2MjAyMTM0fQ.HrqhvWvbIqLl648Qu3MzNqR0IcMnNMwjHcJR8kcWZv4', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (268, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjEyNSwiZXhwIjoxNzU2MjAyMTM1fQ.PRPq0M8jiKDG-aMTuqHPEvQqBMHhzkTvg1R_D2MBTUk', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (269, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjEzMiwiZXhwIjoxNzU2MjAyMTQyfQ.ewRCK9kKfTPF-oMVzi7-MwpuOAZYf-eK9vaUjN7v9lI', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (270, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjMyOCwiZXhwIjoxNzU2MjAyMzM4fQ.8dD0IxQicJ_1GevTsZSXOYNmXNQWya_3pyi02tO6tVM', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (271, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjMzMiwiZXhwIjoxNzU2MjAyMzQyfQ.lQCvwdHgLEob-W0DdiPTzjpANTL14xMpTHDr5BxWiZI', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (272, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjQwMiwiZXhwIjoxNzU2MjAyNDEyfQ.7D5wl2NrdwAln9TSmT7FW9JSkflCyX48wfMe-4ZFeMA', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (273, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjQwMiwiZXhwIjoxNzU2MjAyNDEyfQ.7D5wl2NrdwAln9TSmT7FW9JSkflCyX48wfMe-4ZFeMA', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (274, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjUzMywiZXhwIjoxNzU2MjAyNTQzfQ.qls8QIiROW0Ga1k6wqkaqv4IuiphYMtT3Ub5xvEVYYQ', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (275, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjUzNCwiZXhwIjoxNzU2MjAyNTQ0fQ.A3_fshT6lnmP3IJ6Be85i82RdfkDne7PtBCKGk07Yzk', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (276, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjYwMiwiZXhwIjoxNzU2MjAyNjEyfQ.k5nFG-SiQcl7jEhnPxK6YqXoEDeIrtwEZzUCclY-oYk', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (277, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjYwMiwiZXhwIjoxNzU2MjAyNjEyfQ.k5nFG-SiQcl7jEhnPxK6YqXoEDeIrtwEZzUCclY-oYk', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (278, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjc2MiwiZXhwIjoxNzU2MjAyNzcyfQ.zctMsMyKA6-BFeW3D-Ff3TInbyvt7UdffSAN-GN4q5Q', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (279, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjc2MiwiZXhwIjoxNzU2MjAyNzcyfQ.zctMsMyKA6-BFeW3D-Ff3TInbyvt7UdffSAN-GN4q5Q', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (280, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjgyNSwiZXhwIjoxNzU2MjAyODM1fQ.s3tLGr_Q1padNYmDyA-5q4okRCm12nCb6exQGb68z3o', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (281, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwMjgyNSwiZXhwIjoxNzU2MjAyODM1fQ.s3tLGr_Q1padNYmDyA-5q4okRCm12nCb6exQGb68z3o', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (282, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwNDQ2NCwiZXhwIjoxNzU2MjA0NDc0fQ.HDPvcBE2TZyyhj7af7IeJ3bd_H-x44bS-C27o4ZLwVw', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (283, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwNDQ4MCwiZXhwIjoxNzU2MjA0NDkwfQ.3OSetWtop5CO444L4d4JnsGYEJJzDmOmLqBUHDyIYYU', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (284, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwNDUxMSwiZXhwIjoxNzU2MjA0NTIxfQ.2KQmIaOOM9KlyNvxxA5v_8cbJS_vlfBs0MVsnhuvYZQ', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (285, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwNDUxMSwiZXhwIjoxNzU2MjA0NTIxfQ.2KQmIaOOM9KlyNvxxA5v_8cbJS_vlfBs0MVsnhuvYZQ', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (286, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwNDUxMywiZXhwIjoxNzU2MjA0NTIzfQ.doeElc6doTJoodx49LXLPn75tvo2dOkyO3xEtBRTWbY', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (287, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjIwNDU0MCwiZXhwIjoxNzU2MjA0NTUwfQ.3rJDVxDg3yzDTOnY5Jj4-1tMW9lHbIVypWfuJIgw1mY', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (288, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg0NDU3LCJleHAiOjE3NTYzODQ0Njd9.bg_mZLynr_BZqfVHhRG6JDSRSWOWOGciMGACswtvhAk', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (289, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg0NjYwLCJleHAiOjE3NTYzODQ2NzB9.d5UX1-TbFsX1SCcXrncuyf2Py2SHoX3aWeJbJbILUao', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (290, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg0NjcyLCJleHAiOjE3NTYzODQ2ODJ9.d6d4-qdy52TwJYbPlFsCQm-b12A60Hg908q6OgpA-MQ', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (291, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg0ODY3LCJleHAiOjE3NTYzODQ4Nzd9.IwvKWCH5ytJ02WTAwMoVI_Ce7sazEbqYZU1wMZJh3GU', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (292, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg0ODgyLCJleHAiOjE3NTYzODQ4OTJ9.L8mvJl8n8WnOGTIAOOsa2Dqgu2FrsXAtF9RfUCDYgYM', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (293, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg0OTc5LCJleHAiOjE3NTYzODQ5ODl9.3NgIN-9BEeIhcdy5xtqliuk8lGvTwxmJty1SwsOOwdw', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (294, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg0OTg3LCJleHAiOjE3NTYzODQ5OTd9.fTEOLIiPPimhSgZcqGZp8xsrY6U9w7f45a7CcqZB0OQ', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (295, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg1MDUyLCJleHAiOjE3NTYzODUwNjJ9.dFrk-p_UOEAJShUQGvFzZRAreAvFEjs5g7VDM-boAPc', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (296, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg1MDYyLCJleHAiOjE3NTYzODUwNzJ9.12Zz3MUJd88z_bfOWYfPUEXF6wnDeBFsNdwvDrVuZj4', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (297, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg1MTIxLCJleHAiOjE3NTYzODUxMzF9.OwcxL1YNM8us4l6ApG-ovKuZ9IapCPoZPqNTdGpaRuc', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (298, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg1MTMwLCJleHAiOjE3NTYzODUxNDB9.hMN4cmLo9Ne67KAqetGHDyrnYcn7YWFPKGZv4DNuz_A', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (299, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg1MzYyLCJleHAiOjE3NTYzODUzNzJ9.xlQ1n5Fq3eYKul7e-xAzJ7eYO97ZFWK1lqQsmznpvYM', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (300, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg1MzY4LCJleHAiOjE3NTYzODUzNzh9.TDiqfoomJo_blH_A2KUS0bJGAit7n3k_JMvVFYqTIcE', 1, 0, 1019)
GO
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (301, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg1NTMzLCJleHAiOjE3NTYzODU1NDN9.IShqhKBdA6tGb-aoMGDdmoUPXogFYfTAia025qYFwMg', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (302, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg1NTQxLCJleHAiOjE3NTYzODU1NTF9.HIgn49Wn4pp-Nm3DDbp4Dos1Cp7WwTEfVoH64EEQP90', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (303, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg1ODUyLCJleHAiOjE3NTYzODU4NjJ9.e25M9S-vEO8WtLIk3On-EexO8EUg4JYmK3rRa5QAKYA', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (304, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg1ODU5LCJleHAiOjE3NTYzODU4Njl9.K3mO6ZeNefJwTK1yNjreB1xAtYOPAjP2pUBH0HJ2BRI', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (305, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg1OTMxLCJleHAiOjE3NTYzODU5NDF9.bGjiAOCzf7GZNOvRVqDMChp3wPsIEEEa38sVlQWDy00', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (306, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Mzg2MzY0LCJleHAiOjE3NTYzODYzNzR9.jfZM3K3bS2m0-6kkvWiaLKowFKPu8PL27cBkkgou9D0', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (307, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTIyMDg2LCJleHAiOjE3NTY1MjIwOTZ9.HpHBlv9aZnmBT3YUjMSedT5Epn0FHCJy7uH3pb0bT90', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (308, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTIyNTk2LCJleHAiOjE3NTY1MjI2MDZ9.qWQr4F6lX8Fbado5b42CiTBqfEJY6ntengoZEjlZVTk', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (309, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTIyNzYyLCJleHAiOjE3NTY1MjI3NzJ9.YEIndtkoi-ak0HmJdkzk1qGtl2vkU2touk8eor-0wHw', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (310, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTIyNzc1LCJleHAiOjE3NTY1MjI3ODV9.bL8cPNEqtVtuy7-6MI2Abh3VkaieB-C_bUghOJJ-yiM', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (311, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTIyODkzLCJleHAiOjE3NTY1MjI5MDN9.CcV1f93aYumU_0-MPycGcE2FcBa79if80BTiFAMi8hE', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (312, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTIyOTIwLCJleHAiOjE3NTY1MjI5MzB9.KBZLY8h5_MBSj1EY6-vGlznBhYWtpEzXtY2N2w3-au4', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (313, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTIzMDgwLCJleHAiOjE3NTY1MjMwOTB9.7tdUq3QAByIM0sQt_sfsHBynHUa2Ygvn4YvmxqhAzdo', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (314, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTIzMDg3LCJleHAiOjE3NTY1MjMwOTd9.wS1UXwhtkDxWbOyO6kVj8kGanmDJJyLmfROBiYlaPXw', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (315, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTIzMTI2LCJleHAiOjE3NTY1MjMxMzZ9.iRKjhdWIYQ31_4InYDA9O1DKHfTecqthm-vZSN0tazw', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (316, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTI0Mjk0LCJleHAiOjE3NTY1MjQzMDR9.tYcFTNGGwprUiLw5LPX_91qWoGt9utfCCwQvsQ0U8_0', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (317, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjUyNDMzNCwiZXhwIjoxNzU2NTI0MzQ0fQ.-Wv08Eyp0ccGPFcPkx0HuUdTModuL-NTyK52wrTbfp8', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (318, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjUyNDQ0NCwiZXhwIjoxNzU2NTI0NDU0fQ.KCYdeChjp4Np4M1qTtupCd4a_AfzCXwMta2s30daUrc', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (319, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjUyNDUzMCwiZXhwIjoxNzU2NTI0NTQwfQ.CDOcS31EZoIe0t7YQKnNfasdudA8BXqiUbed2JWldo4', 1, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (320, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjUyNDU5MSwiZXhwIjoxNzU2NTI0NjAxfQ.MOXiPNngkd1Fz2b7rYnHuAcKnvv95jY38MDeCrTW3M8', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (321, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjUyNDg4NywiZXhwIjoxNzU2NTI0ODk3fQ.IbsR5rCPTjVTZwlsmKWUe6UnXi0IxKDf_wp0W-MNDK0', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (322, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjUyNTI0MCwiZXhwIjoxNzU2NTI1MjUwfQ.99spk05BGWLYelW7R39zKv-pkEBK_jSZ-LVy4vXP__0', 1, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (323, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTI1MjgyLCJleHAiOjE3NTY1MjUyOTJ9.Hzw8mBBXgCL2P60cBqgf-JjEagTNUZA8mPeMVPkCXRI', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (324, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTI1MzI4LCJleHAiOjE3NTY1MjUzMzh9.lMasmz0owkt83ybhX9D7BYAhtlW1FHE0iKFnqlDYB7g', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (325, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjUyNTMzMSwiZXhwIjoxNzU2NTI1MzQxfQ.-7ExVR2CmwH2R__tcgde3ScLOLmGqDS9T33H2x6rM7w', 1, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (326, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjUyNTM1OCwiZXhwIjoxNzU2NTI1MzY4fQ.6aucljn1i89JkU55S5cl33YOE3mFQ2GFtdfidcR9PHA', 1, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (327, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTI1MzU5LCJleHAiOjE3NTY1MjUzNjl9.BZT7wTn7qrXmE8WIA8kDM-HAT13MsjU__ze1fPVXkQM', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (328, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTI1NDE3LCJleHAiOjE3NTY1MjU0Mjd9.w5kj6w8xjRkKACIpe6WGSnZjCoFAfIJHSRvjEzgt9o0', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (329, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjUyNTQzMiwiZXhwIjoxNzU2NTI1NDQyfQ.HrjacuA1p3NPOo7xVqrKwF3Ahj-bsxzWgorzHoiHm7E', 1, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (330, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTI1NDMzLCJleHAiOjE3NTY1MjU0NDN9.eQ5l1hLr8guCazu9nzXd-4AVAoa07UJHVN5O4rV3aIc', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (331, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjUyNjEwOCwiZXhwIjoxNzU2NTI2MTE4fQ.8PzYzMOZpRJRA-jPA0ATrQuj1bk2PnzPuoqUUFs1ovg', 1, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (332, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTI2MTE1LCJleHAiOjE3NTY1MjYxMjV9.JNGdekkl5K6EXErb3qflzVa1QJEDaz1ODDgWQrNHg4k', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (333, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjUyNjEzNSwiZXhwIjoxNzU2NTI2MTQ1fQ.cSSONDvxcQNYAy9QnItSS17SHFzRDJYuqZnJSG-ju5w', 1, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (334, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjUyNjE5NSwiZXhwIjoxNzU2NTI2MjA1fQ.JJ4yePDMJi-Nk0MssxVVDzNdblCeDijsLC3FA2kfOX8', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (335, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjU0NDY2MCwiZXhwIjoxNzU2NTQ0NjcwfQ.yecfH-k8LPBnqkusA38wKLclAkIrZZnOzrWDH-iEx-w', 1, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (336, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU0NDY4MiwiZXhwIjoxNzU2NTQ0NjkyfQ.CDW1YOFHUVrEVKKwqEjKYrEGj9r1luc1hMzoYfynEE8', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (337, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjU0NDczNSwiZXhwIjoxNzU2NTQ0NzQ1fQ.Ns7ur0ClBgKN3_CGeedKhz_jpG-CqJOYiz46evUXSvw', 1, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (338, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU0NDczOSwiZXhwIjoxNzU2NTQ0NzQ5fQ.9-qQeH5a9dQg6vbjQiT0A4xXPhVkHidqaLfvRqPM5Ko', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (339, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjU0NDc5MywiZXhwIjoxNzU2NTQ0ODAzfQ.5tq7WRRBMempbqYQG8SZtwyDIesGaY1yerWk8yBGmEA', 1, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (340, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU0NDc5MywiZXhwIjoxNzU2NTQ0ODAzfQ.RhXS5nEt-J2IM-WT6HNKDVzNN8M2GXAYVa8B0Ds08tw', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (341, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU0NDk4OCwiZXhwIjoxNzU2NTQ0OTk4fQ._50HBgNy01CqUzealg13yGsU5ADACow5q7OOes3km8Q', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (342, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU0NTA1MiwiZXhwIjoxNzU2NTQ1MDYyfQ.f2vFvLaH8xKMfM1INPPb4KCOA-48sEebAglJ45U6Iig', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (343, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU0NTM2OCwiZXhwIjoxNzU2NTQ1Mzc4fQ.EHWLWvGi7356K439U0adUyv8JyYDnAvbHyTC_LP3EN4', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (344, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU0NTQ1NywiZXhwIjoxNzU2NTQ1NDY3fQ.5Wj4OD9jKMcBZz-Qt8Lumtl_RaaqVSHKJxns--d-wq8', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (345, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjU0NzM1MywiZXhwIjoxNzU2NTQ3MzYzfQ.lSZynqsvR8G8U_aWVoV-tf1ljeouWBtqoHpbyD8kRK4', 1, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (346, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjU0NzU5NywiZXhwIjoxNzU2NTQ3NjA3fQ.drxvLkVvKn8q4y25BFGJUydSxwqjbw3WHTsLxoY13Ik', 1, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (347, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjU0NzYwNywiZXhwIjoxNzU2NTQ3NjE3fQ.YCO1U8neRpUbZe9yN_AfvsTNmawqj6vbqPu5QqPISXQ', 1, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (348, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU0NzYxOSwiZXhwIjoxNzU2NTQ3NjI5fQ.YG4UP6wso-1BhTd61P3edJgZGAn4hNslpUur2B_-xkU', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (349, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU0OTc0MSwiZXhwIjoxNzU2NTQ5NzUxfQ.eV2DDzX7oWOc3RAE08F1WrG4M52n_QBCD14VZlciIRA', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (350, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU0OTgyMCwiZXhwIjoxNzU2NTQ5ODMwfQ.9Q38mWAU7OeoFgmw9HAztwc__Ngm4CuITkP07YOlnJs', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (351, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU0OTg3MywiZXhwIjoxNzU2NTQ5ODgzfQ.AIsrBQTQAjD0ykH1gxIqfwYXKCUOZSbt2QvEPIMTsRo', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (352, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU0OTk0OSwiZXhwIjoxNzU2NTQ5OTU5fQ.JCCqvBJEvhX5giOa90UH-6df88Bl81GJbMS_CB02j8Y', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (353, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1MDMyNiwiZXhwIjoxNzU2NTUwMzM2fQ.-aOwoePOXQSHrgkLJ710QK2RB1zldMoGwNvdwORSKL8', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (354, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1MDQ2OSwiZXhwIjoxNzU2NTUwNDc5fQ.R3O48EhbE5bkCl9FVCovpe2dRr5D11MT9efVALUPHOE', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (355, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1MDYxNiwiZXhwIjoxNzU2NTUwNjI2fQ.Tu1rT9KnldrIJvEvDW7lO_uKA_1SgPA3e8gW63EywtU', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (356, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1MDcxMSwiZXhwIjoxNzU2NTUwNzIxfQ.DLHhJhqrnTyg5_P7KSrKNQIKnqUrJHRscOzKfutzlW8', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (357, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1MDc2MSwiZXhwIjoxNzU2NTUwNzcxfQ.HFyuw0gNqmMGy7tSq2p89kA0sbv64IFbhDw63vIdy-8', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (358, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1MDc3MSwiZXhwIjoxNzU2NTUwNzgxfQ.IjwUm5WVe-mIMcI2XGNDrlf1CtvBDaFDZI3CiRstmB8', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (359, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1MDgyNiwiZXhwIjoxNzU2NTUwODM2fQ.b900D-MPxeB2kUUi60XxezHksjAf4ZTqnQmOi641VdU', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (360, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1MDk4NCwiZXhwIjoxNzU2NTUwOTk0fQ.B_ygFDeW5aJVhYd8y1yNmkvMQA_M-Sb7GI_3ZyOScTk', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (361, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1MDk5OSwiZXhwIjoxNzU2NTUxMDA5fQ.Vi59TbAgMi3Wb4cXnkxHLrwZ9YYN0w3--Q8TMC0aDJs', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (362, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1MTIxMiwiZXhwIjoxNzU2NTUxMjIyfQ.d2G2N2Y8uAriDVIvDyf3JkDA-T8E6U7BddXwTvj20ac', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (363, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1MTI3NywiZXhwIjoxNzU2NTUxMjg3fQ.q8vgBRDCNX6zMxvlf4G1Mou_o1jIvdEaNuftTxWEvus', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (364, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1MTUyMywiZXhwIjoxNzU2NTUxNTMzfQ.mmPCQpctvq7kAalg7u1B0B3vF5j8-mlQcOYh2CRxNzY', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (365, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1MTU4NiwiZXhwIjoxNzU2NTUxNTk2fQ.u9kGYuPd7sAKGXlbte9EQac5Wtc92NxwxKm5vt5t94c', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (366, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1NTg0NCwiZXhwIjoxNzU2NTU1ODU0fQ.v1FL0NF8q1kecZJCYds8xbeq5-FCRu65PfdrSv8MduA', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (367, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1NjU0OCwiZXhwIjoxNzU2NTU2NTU4fQ.CKJHSWdfvrlNQVz_y2IgsVNJ1tBEj4OwdwbMtMODIq4', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (368, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1NjcxMCwiZXhwIjoxNzU2NTU2NzIwfQ.Hs7suzIMj0uuriyU7FmFpJ4mKZg8HYMmE7dPN492BAI', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (369, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1NzA0OCwiZXhwIjoxNzU2NTU3MDU4fQ.lZBakwTBMNZpw-4F7CJU8n5nljejycD_de5M1l6I8XU', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (370, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1NzA1MywiZXhwIjoxNzU2NTU3MDYzfQ.rYWmOgMQ0kn1bUXEay1zq7q4v08AFmn2U1vexsiUXQ4', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (371, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1NzcyNywiZXhwIjoxNzU2NTU3NzM3fQ.ahC1CKMulvK4rjAeDi8L9YUtmSpZ6xQQvLvI5ILRPkY', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (372, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1Nzc0NiwiZXhwIjoxNzU2NTU3NzU2fQ.maaJT1bC4CmUBAJy8bG2IRNVNm0axHk_4qg_6amSIo0', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (373, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1NjU1Nzc1NSwiZXhwIjoxNzU2NTU3NzY1fQ.JPWeN55RFUghD0_xBpM1KaZt-QOAI_vanHEx6JJ5qhE', 1, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (374, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTU3OTg0LCJleHAiOjE3NTY1NTc5OTR9.8ZUAcA6jERJWENKvhre-ftIseFvaSDSypfDVR5TaxaA', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (375, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2NTU4MjkzLCJleHAiOjE3NTY1NTgzMDN9.YhJv46Uuu9HqG5W7t0xQtn0RZxJ7rjfHoJqslvg1fmM', 1, 0, 1019)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (376, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1NjU1ODMyMSwiZXhwIjoxNzU2NTU4MzMxfQ.UqXVPGx2iIhx4SuljMA9UHAuRV01sRVq1i3QMfGIsYs', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (1366, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1Njc4NDA4NywiZXhwIjoxNzU2Nzg0MDk3fQ.mvPcjTAG3E9Drs0vzDnhjWrKAKrOUW1SxBRk0Zkl6sg', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (1367, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1Njc4NDQwMCwiZXhwIjoxNzU2Nzg0NDEwfQ.rQX0kydZDumyyQLSuwPoxGNTWmbR7m5xhl7okt4qgPs', 1, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (1368, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1Njc4NDY1MCwiZXhwIjoxNzU2Nzg0NjYwfQ.r9nOK6p-wjqiur0I4GDLFYzhZB4xiIVDlZZ2Zk_1l6Y', 0, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (1369, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTc1Njc4NDY1MCwiZXhwIjoxNzU2Nzg0NjYwfQ.r9nOK6p-wjqiur0I4GDLFYzhZB4xiIVDlZZ2Zk_1l6Y', 0, 0, 1018)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (1370, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyQGdtYWlsLmNvbSIsImlhdCI6MTc1Njc4NDcxNywiZXhwIjoxNzU2Nzg0NzI3fQ.ylVaNaJmp9s9LqCF6jiLNwCCHeMEiA3ltbfbW4aAjZM', 0, 0, 1025)
INSERT [dbo].[Token] ([id], [token], [isUsed], [isExpired], [userId]) VALUES (1371, N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNzU2Nzg0NzIyLCJleHAiOjE3NTY3ODQ3MzJ9.WzpEQfD90QjUK9m14usnCDrEdocaIag-wRuTq9etz8s', 0, 0, 1019)
SET IDENTITY_INSERT [dbo].[Token] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON

INSERT [dbo].[User] ([id], [email], [password], [fullName], [phone], [address], [avatarUrl], [role], [status], [createdAt]) VALUES (1, N'1', N'123', N'Alice Nguyen', N'0901234567', N'Hanoi', NULL, 1, 1, CAST(N'2025-06-30T16:26:42.407' AS DateTime))
INSERT [dbo].[User] ([id], [email], [password], [fullName], [phone], [address], [avatarUrl], [role], [status], [createdAt]) VALUES (2, N'2', N'123', N'Bob Tran', N'0907654321', N'HCMC', NULL, 2, 0, CAST(N'2025-06-30T16:26:42.407' AS DateTime))
INSERT [dbo].[User] ([id], [email], [password], [fullName], [phone], [address], [avatarUrl], [role], [status], [createdAt]) VALUES (3, N'luan', N'123', N'Luan', N'123', N'123', NULL, 1, 1, CAST(N'2025-07-01T20:23:09.460' AS DateTime))
INSERT [dbo].[User] ([id], [email], [password], [fullName], [phone], [address], [avatarUrl], [role], [status], [createdAt]) VALUES (4, N'luan2', N'123', N'Minh Nhat', N'08123412', N'Ha noi', NULL, 1, 0, CAST(N'2025-07-03T20:40:07.697' AS DateTime))
INSERT [dbo].[User] ([id], [email], [password], [fullName], [phone], [address], [avatarUrl], [role], [status], [createdAt]) VALUES (5, N'luankhi2004@gmail.com', N'123', N'Nguyễn Đức Luân', N'12345678912', N'555555', NULL, 1, 1, CAST(N'2025-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([id], [email], [password], [fullName], [phone], [address], [avatarUrl], [role], [status], [createdAt]) VALUES (13, N'3', N'123', N'Nguyễn Đức Luân', N'0123456780', N'555555', N'blob:http://localhost:8080/c2cb8836-2022-45c9-a781-1f3c205115b6', 2, 0, CAST(N'2025-08-14T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([id], [email], [password], [fullName], [phone], [address], [avatarUrl], [role], [status], [createdAt]) VALUES (14, N'12323@gmail.com', N'123', N'Nguyễn Đức Luân', N'xx', N'x', N'blob:http://localhost:8080/4554c2da-0cbd-4d8f-b2bb-d0a3ee4ceada', 2, 1, CAST(N'2025-08-14T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([id], [email], [password], [fullName], [phone], [address], [avatarUrl], [role], [status], [createdAt]) VALUES (1015, N'123', N'123', N'Thoai', N'123', N'123', N'blob:http://localhost:8080/18f083e0-7a67-4e68-8737-6d385fe26d3a', 1, 0, CAST(N'2025-08-21T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([id], [email], [password], [fullName], [phone], [address], [avatarUrl], [role], [status], [createdAt]) VALUES (1016, N'eqwe', N'qew', N'ew', N'ewqe', N'eqwe', N'blob:http://localhost:8080/7a801223-67d4-4e47-8278-7315e889d7e3', 1, 0, CAST(N'2025-08-22T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([id], [email], [password], [fullName], [phone], [address], [avatarUrl], [role], [status], [createdAt]) VALUES (1017, N'231@gmail.com', N'1', N'thoaij', N'1', N'1', N'blob:http://localhost:8080/32f13786-1894-4354-8599-fe0faa7d42f2', 1, 0, CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([id], [email], [password], [fullName], [phone], [address], [avatarUrl], [role], [status], [createdAt]) VALUES (1018, N'admin', N'$2a$10$Jra2rC/SGe3DzfUwq7n05.8pRSKSy5uLKvgIQ4YGNKg47d.fHR3ui', N'test filter chain', N'0123456780', N'555555', N'blob:http://localhost:8080/98b29cd3-8654-4455-a7c8-fdc45fd6d730', 1, 1, CAST(N'2025-08-26T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([id], [email], [password], [fullName], [phone], [address], [avatarUrl], [role], [status], [createdAt]) VALUES (1019, N'user', N'$2a$10$1BQgv47d/CiLZqMEa.bm3.smze2tgvB1Ba8Z8NkQZUrisfE4A6y2W', N'admintesting', N'123', N'1231321', N'', 2, 1, CAST(N'2025-08-26T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([id], [email], [password], [fullName], [phone], [address], [avatarUrl], [role], [status], [createdAt]) VALUES (1025, N'user@gmail.com', N'$2a$10$BlBAE/85C3ljz0N7dY7gouEm6MZNsO7cp72H1ciSxcHU6oFK6OCxm', N'user thứ 2', N'123', N'555555AA', N'blob:http://localhost:8080/04bd2119-a8ae-4aa1-ba77-007df1fa5457', 2, 1, CAST(N'2025-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([id], [email], [password], [fullName], [phone], [address], [avatarUrl], [role], [status], [createdAt]) VALUES (1026, N'duc@gmail.com', N'$2a$10$e8P4uTp6WEdy6Mu6/QLYl.HdAjjjJR3pEwswlLNW2X2xY5K1I0Fpa', N'Phạm minh đức', N'01234567811', N'789 Le Loi, Da Nang', N'blob:http://localhost:8080/7850d95f-23cb-441f-941a-c471546d5b97', 2, 1, CAST(N'2025-09-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ClassRoo__45393F2ADA5ED894]    Script Date: 02/09/2025 4:21:32 CH ******/
ALTER TABLE [dbo].[ClassRoom] ADD UNIQUE NONCLUSTERED
(
	[inviteCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__RefreshT__CA90DA7A722C9DE7]    Script Date: 02/09/2025 4:21:32 CH ******/
ALTER TABLE [dbo].[RefreshToken] ADD UNIQUE NONCLUSTERED
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__AB6E6164C88C5926]    Script Date: 02/09/2025 4:21:32 CH ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassRoom] ADD  DEFAULT (getdate()) FOR [createAt]
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[CourseContent] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[EnrollClassRoom] ADD  DEFAULT (getdate()) FOR [enrollAt]
GO
ALTER TABLE [dbo].[EnrollCourse] ADD  DEFAULT (getdate()) FOR [enrollAt]
GO
ALTER TABLE [dbo].[RefreshToken] ADD  DEFAULT ((0)) FOR [isUsed]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD FOREIGN KEY([classRoomId])
REFERENCES [dbo].[ClassRoom] ([id])
GO
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD FOREIGN KEY([createBy])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[AssignmentResult]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentResult_Assignment] FOREIGN KEY([assignmentId])
REFERENCES [dbo].[Assignment] ([id])
GO
ALTER TABLE [dbo].[AssignmentResult] CHECK CONSTRAINT [FK_AssignmentResult_Assignment]
GO
ALTER TABLE [dbo].[AssignmentResult]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentResult_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[AssignmentResult] CHECK CONSTRAINT [FK_AssignmentResult_User]
GO
ALTER TABLE [dbo].[ClassRoom]  WITH CHECK ADD FOREIGN KEY([createBy])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[CourseContent]  WITH CHECK ADD FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[CourseTest]  WITH CHECK ADD FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[CourseTestResult]  WITH CHECK ADD FOREIGN KEY([courseTestId])
REFERENCES [dbo].[CourseTest] ([id])
GO
ALTER TABLE [dbo].[CourseTestResult]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[EnrollClassRoom]  WITH CHECK ADD FOREIGN KEY([classRoomId])
REFERENCES [dbo].[ClassRoom] ([id])
GO
ALTER TABLE [dbo].[EnrollClassRoom]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_RefreshToken_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[RefreshToken] CHECK CONSTRAINT [FK_RefreshToken_User]
GO
ALTER TABLE [dbo].[Token]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
