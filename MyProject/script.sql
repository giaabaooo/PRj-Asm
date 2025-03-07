USE [SE1937_Database]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2/26/2025 5:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[did] [int] NOT NULL,
	[dname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2/26/2025 5:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[eid] [int] NOT NULL,
	[ename] [varchar](150) NOT NULL,
	[did] [int] NOT NULL,
	[managerid] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 2/26/2025 5:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[fid] [int] NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveRequest]    Script Date: 2/26/2025 5:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveRequest](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](150) NOT NULL,
	[reason] [varchar](max) NOT NULL,
	[from] [date] NOT NULL,
	[to] [date] NOT NULL,
	[createdby] [varchar](150) NOT NULL,
	[status] [tinyint] NOT NULL,
	[createddate] [datetime] NOT NULL,
 CONSTRAINT [PK_LeaveRequest] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 2/26/2025 5:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[rid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Feature] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2/26/2025 5:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2/26/2025 5:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[id] [int] NOT NULL,
	[name] [varchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[dob] [date] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Role]    Script Date: 2/26/2025 5:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role](
	[username] [varchar](150) NOT NULL,
	[rid] [int] NOT NULL,
 CONSTRAINT [PK_User_Role] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/26/2025 5:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [nvarchar](150) NOT NULL,
	[eid] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Departments] ([did], [dname]) VALUES (1, N'Director')
INSERT [dbo].[Departments] ([did], [dname]) VALUES (2, N'IT')
INSERT [dbo].[Departments] ([did], [dname]) VALUES (3, N'Accounting')
INSERT [dbo].[Departments] ([did], [dname]) VALUES (4, N'Sale')
GO
INSERT [dbo].[Employees] ([eid], [ename], [did], [managerid]) VALUES (1, N'Ngo Tung Son', 2, NULL)
INSERT [dbo].[Employees] ([eid], [ename], [did], [managerid]) VALUES (2, N'mr A', 2, 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [managerid]) VALUES (3, N'mr B', 2, 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [managerid]) VALUES (4, N'mr D', 2, 2)
GO
INSERT [dbo].[Features] ([fid], [url]) VALUES (1, N'/student/create')
INSERT [dbo].[Features] ([fid], [url]) VALUES (2, N'/student/update')
INSERT [dbo].[Features] ([fid], [url]) VALUES (3, N'/student/delete')
INSERT [dbo].[Features] ([fid], [url]) VALUES (4, N'/leaverequest/create')
INSERT [dbo].[Features] ([fid], [url]) VALUES (5, N'/leaverequest/findbydept')
GO
SET IDENTITY_INSERT [dbo].[LeaveRequest] ON 

INSERT [dbo].[LeaveRequest] ([rid], [title], [reason], [from], [to], [createdby], [status], [createddate]) VALUES (1, N'Don Xin Nghi Phep', N'xxx', CAST(N'2025-02-13' AS Date), CAST(N'2025-02-27' AS Date), N'sonnt', 0, CAST(N'2025-02-26T16:16:07.583' AS DateTime))
INSERT [dbo].[LeaveRequest] ([rid], [title], [reason], [from], [to], [createdby], [status], [createddate]) VALUES (2, N'AAA', N'BBBB', CAST(N'2025-03-01' AS Date), CAST(N'2025-03-08' AS Date), N'sonnt', 0, CAST(N'2025-02-26T16:25:16.100' AS DateTime))
INSERT [dbo].[LeaveRequest] ([rid], [title], [reason], [from], [to], [createdby], [status], [createddate]) VALUES (3, N'XXXXXXXXXXX', N'BBBB', CAST(N'2025-03-14' AS Date), CAST(N'2025-03-29' AS Date), N'sonnt', 0, CAST(N'2025-02-26T16:25:29.877' AS DateTime))
INSERT [dbo].[LeaveRequest] ([rid], [title], [reason], [from], [to], [createdby], [status], [createddate]) VALUES (4, N'111111111', N'11111', CAST(N'2025-02-21' AS Date), CAST(N'2025-03-01' AS Date), N'mra', 0, CAST(N'2025-02-26T16:26:05.840' AS DateTime))
INSERT [dbo].[LeaveRequest] ([rid], [title], [reason], [from], [to], [createdby], [status], [createddate]) VALUES (5, N'93939939393939', N'393939939393', CAST(N'2025-02-26' AS Date), CAST(N'2025-02-28' AS Date), N'mrb', 0, CAST(N'2025-02-26T16:26:37.703' AS DateTime))
SET IDENTITY_INSERT [dbo].[LeaveRequest] OFF
GO
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 1)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 2)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 3)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 4)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 5)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 1)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 2)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 4)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 5)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (3, 1)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (3, 4)
GO
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (1, N'boss')
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (2, N'team leader')
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (3, N'staff')

GO
INSERT [dbo].[Student] ([id], [name], [gender], [dob]) VALUES (1, N'Mr A', 1, CAST(N'2004-04-07' AS Date))
INSERT [dbo].[Student] ([id], [name], [gender], [dob]) VALUES (2, N'Ms C', 0, CAST(N'2002-09-15' AS Date))
INSERT [dbo].[Student] ([id], [name], [gender], [dob]) VALUES (3, N'Mr D', 1, CAST(N'1997-11-13' AS Date))
GO
INSERT [dbo].[User_Role] ([username], [rid]) VALUES (N'mra', 3)
INSERT [dbo].[User_Role] ([username], [rid]) VALUES (N'mrb', 2)
INSERT [dbo].[User_Role] ([username], [rid]) VALUES (N'mrc', 3)
INSERT [dbo].[User_Role] ([username], [rid]) VALUES (N'mrd', 3)
INSERT [dbo].[User_Role] ([username], [rid]) VALUES (N'bao', 1)
GO
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'mra', N'123', N'Mr A', 2)
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'mrb', N'123', N'Mr B', 3)
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'mrc', N'123', N'Mr C', 4)
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'bao', N'123', N'Gia Bao', 1)
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([did])
REFERENCES [dbo].[Departments] ([did])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([managerid])
REFERENCES [dbo].[Employees] ([eid])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[LeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequest_Users] FOREIGN KEY([createdby])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[LeaveRequest] CHECK CONSTRAINT [FK_LeaveRequest_Users]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Features] FOREIGN KEY([fid])
REFERENCES [dbo].[Features] ([fid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Features]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Roles] FOREIGN KEY([rid])
REFERENCES [dbo].[Roles] ([rid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Roles]
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_Roles] FOREIGN KEY([rid])
REFERENCES [dbo].[Roles] ([rid])
GO
ALTER TABLE [dbo].[User_Role] CHECK CONSTRAINT [FK_User_Role_Roles]
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_Users] FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[User_Role] CHECK CONSTRAINT [FK_User_Role_Users]
GO
