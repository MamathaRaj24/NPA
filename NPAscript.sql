USE [master]
GO
/****** Object:  Database [NPA]    Script Date: 14/04/20 13:28:04 ******/
CREATE DATABASE [NPA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NPA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NPA.mdf' , SIZE = 26624KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NPA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NPA_log.ldf' , SIZE = 149696KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NPA] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NPA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NPA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NPA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NPA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NPA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NPA] SET ARITHABORT OFF 
GO
ALTER DATABASE [NPA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NPA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NPA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NPA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NPA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NPA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NPA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NPA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NPA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NPA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NPA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NPA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NPA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NPA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NPA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NPA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NPA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NPA] SET RECOVERY FULL 
GO
ALTER DATABASE [NPA] SET  MULTI_USER 
GO
ALTER DATABASE [NPA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NPA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NPA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NPA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [NPA]
GO
/****** Object:  UserDefinedTableType [dbo].[Experience]    Script Date: 14/04/20 13:28:04 ******/
CREATE TYPE [dbo].[Experience] AS TABLE(
	[Post_Name] [varchar](50) NULL,
	[Exp] [bigint] NULL,
	[Sector] [varchar](10) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PostItems]    Script Date: 14/04/20 13:28:04 ******/
CREATE TYPE [dbo].[PostItems] AS TABLE(
	[Section] [int] NULL,
	[Item] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[Qualification]    Script Date: 14/04/20 13:28:04 ******/
CREATE TYPE [dbo].[Qualification] AS TABLE(
	[Qualification_Code] [int] NULL,
	[Percentage_Marks] [numeric](5, 2) NULL,
	[Year_of_Passing] [int] NULL,
	[University] [varchar](75) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Edu]    Script Date: 14/04/20 13:28:04 ******/
CREATE TYPE [dbo].[TVP_Edu] AS TABLE(
	[Exam] [varchar](50) NULL,
	[Board] [varchar](250) NULL,
	[Yearp] [varchar](10) NULL,
	[Marks] [varchar](10) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_EmpLeave]    Script Date: 14/04/20 13:28:04 ******/
CREATE TYPE [dbo].[TVP_EmpLeave] AS TABLE(
	[LeaveType] [int] NULL,
	[FromDate] [date] NULL,
	[FromType] [char](10) NULL,
	[ToDate] [date] NULL,
	[ToType] [char](10) NULL,
	[nod] [decimal](3, 1) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Family]    Script Date: 14/04/20 13:28:04 ******/
CREATE TYPE [dbo].[TVP_Family] AS TABLE(
	[Name] [varchar](50) NULL,
	[Relation] [varchar](10) NULL,
	[DateofBirth] [date] NULL,
	[Dependent] [bit] NULL,
	[GovtEmp] [bit] NULL,
	[Nominee] [bit] NULL,
	[NomineePercentage] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_HolidayDetails]    Script Date: 14/04/20 13:28:04 ******/
CREATE TYPE [dbo].[TVP_HolidayDetails] AS TABLE(
	[HolidayDate] [varchar](10) NULL,
	[HolidayType] [varchar](10) NULL,
	[Description] [varchar](10) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_HolidayDetails_EX]    Script Date: 14/04/20 13:28:04 ******/
CREATE TYPE [dbo].[TVP_HolidayDetails_EX] AS TABLE(
	[HolidayDate] [varchar](10) NULL,
	[HolidayType] [varchar](10) NULL,
	[Description] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_LB]    Script Date: 14/04/20 13:28:04 ******/
CREATE TYPE [dbo].[TVP_LB] AS TABLE(
	[LeaveType] [int] NULL,
	[balance] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_LeaveDetails]    Script Date: 14/04/20 13:28:04 ******/
CREATE TYPE [dbo].[TVP_LeaveDetails] AS TABLE(
	[LeaveType] [int] NULL,
	[EmployeeCode] [bigint] NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[PHDay_Frm] [numeric](2, 1) NULL,
	[PHDay_To] [numeric](2, 1) NULL,
	[Param1] [varchar](50) NULL,
	[Param2] [varchar](50) NULL,
	[Param3] [varchar](50) NULL,
	[Param4] [varchar](50) NULL,
	[Param5] [varchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_LinkOfcrs]    Script Date: 14/04/20 13:28:04 ******/
CREATE TYPE [dbo].[TVP_LinkOfcrs] AS TABLE(
	[Empid] [varchar](50) NULL,
	[Forwording_Officer] [varchar](50) NULL,
	[Recommended_Officer] [varchar](50) NULL,
	[Sanction_Authority] [varchar](50) NULL,
	[Link_Officer] [varchar](50) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[NoofReportOfc]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[NoofReportOfc] 
(
	@EmpCode varchar(10)
)
RETURNS int
AS
BEGIN
	declare @i int=1,@tempemp varchar(50)=@EmpCode,@TMPCODE VARCHAR(50)=NULL,@cnt int=0
	while(@i!=0)
	BEGIN
	set  @TMPCODE=(select ReportingOfficer from PA_Dtls_Users where empid=@tempemp)
	set @tempemp=@TMPCODE
		if(isnull(@tempemp,0)=0)
		begin
				set @i=0
				break
		end
		ELSE
		BEGIN
				SET @cnt=@cnt+1;
		END
		
	END
	return @cnt
END
GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[Split]  
(  
 @RowData nvarchar(MAX),  
 @SplitOn nvarchar(5)  
)    
RETURNS @RtnValue table   
(  
 Id int identity(1,1),  
 Data nvarchar(100)  
)   
AS    
BEGIN   
 Declare @Cnt int  
 Set @Cnt = 1  
  
 While (Charindex(@SplitOn,@RowData)>0)  
 Begin  
  Insert Into @RtnValue (data)  
  Select   
   Data = ltrim(rtrim(Substring(@RowData,1,Charindex(@SplitOn,@RowData)-1)))  
  
  Set @RowData = Substring(@RowData,Charindex(@SplitOn,@RowData)+1,len(@RowData))  
  Set @Cnt = @Cnt + 1  
 End  
   
 Insert Into @RtnValue (data)  
 Select Data = ltrim(rtrim(@RowData))  
  
 Return  
END



GO
/****** Object:  Table [dbo].[PA_Dlts_Recruitmt_Dtls]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dlts_Recruitmt_Dtls](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Application_Id] [varchar](50) NOT NULL,
	[Post_ID] [int] NULL,
	[Name] [varchar](100) NULL,
	[FName] [varchar](100) NULL,
	[DOB] [datetime] NULL,
	[Caste] [int] NULL,
	[Nationality] [int] NULL,
	[Religion] [int] NULL,
	[Gender] [char](1) NULL,
	[Address] [varchar](255) NULL,
	[PAddress] [varchar](255) NULL,
	[Mobile] [nvarchar](10) NULL,
	[Email] [nvarchar](100) NULL,
	[IpAddress] [varchar](15) NULL,
	[AppliedDt] [datetime] NULL,
	[status] [char](1) NULL,
 CONSTRAINT [PK_PA_Dlts_RecruitmentDtls] PRIMARY KEY CLUSTERED 
(
	[Application_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_CombiLeave]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_CombiLeave](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NULL,
	[CombiLeave] [int] NULL,
	[Entryby] [int] NULL,
	[Entrydt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_EmpEducation]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_EmpEducation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[Exam] [varchar](50) NOT NULL,
	[Board_University] [varchar](250) NOT NULL,
	[YearOfPassing] [varchar](10) NOT NULL,
	[Marks] [varchar](10) NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_EmpLeave]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_EmpLeave](
	[ApplicationId] [varchar](50) NOT NULL,
	[EmpId] [int] NOT NULL,
	[LeaveType] [char](1) NOT NULL,
	[Reason] [varchar](250) NOT NULL,
	[NoDays] [decimal](3, 1) NOT NULL,
	[Prefix] [varchar](50) NULL,
	[Postfix] [varchar](50) NULL,
	[StationLeave] [bit] NOT NULL,
	[StnLvAddress] [varchar](100) NULL,
	[Remarks] [varchar](250) NULL,
	[EntryOn] [datetime] NOT NULL,
	[EntryIP] [varchar](50) NOT NULL,
	[FOId] [int] NULL,
	[FOUpdatedOn] [datetime] NULL,
	[FOStatus] [char](1) NULL,
	[FORemarks] [varchar](250) NULL,
	[FOIP] [varchar](50) NULL,
	[ROId] [int] NULL,
	[ROUpdatedOn] [datetime] NULL,
	[ROStatus] [char](1) NULL,
	[RORemarks] [varchar](250) NULL,
	[ROIP] [varchar](50) NULL,
	[SOId] [int] NULL,
	[SOUpdatedOn] [datetime] NULL,
	[SOStatus] [char](1) NULL,
	[SORemarks] [varchar](250) NULL,
	[SOIP] [varchar](50) NULL,
	[FileType] [varchar](10) NULL,
	[FileName] [varchar](50) NULL,
	[FileContent] [varbinary](max) NULL,
	[Status] [int] NOT NULL,
	[CancellationReasons] [varchar](250) NULL,
 CONSTRAINT [PK_PA_Dtls_EmpLeave_1] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_EmpLeave_Old]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_EmpLeave_Old](
	[EmpCode] [int] NOT NULL,
	[LeaveType] [int] NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[LeaveType_SC] [char](1) NULL,
	[Noofdays] [numeric](3, 1) NULL,
	[P_HdayFrm] [numeric](2, 1) NULL,
	[P_HdayTo] [numeric](2, 1) NULL,
	[Sation_leave] [bit] NULL,
	[Address_Leave] [varchar](75) NULL,
	[Reason] [varchar](250) NULL,
	[Remarks] [varchar](250) NULL,
	[CL_Remarks] [varchar](250) NULL,
	[Leave_Entrydate] [datetime] NULL,
	[Status] [char](2) NULL,
	[NoofApprovals] [int] NULL,
	[Approvedby] [varchar](10) NULL,
	[Approveddt] [datetime] NULL,
	[Approv_AdminId] [varchar](10) NULL,
	[AdminApprovedt] [datetime] NULL,
	[PendingAt] [varchar](10) NULL,
	[Remaeks_Leave] [varchar](250) NULL,
 CONSTRAINT [PK_PA_Dtls_EmpLeave] PRIMARY KEY CLUSTERED 
(
	[EmpCode] ASC,
	[LeaveType] ASC,
	[FromDate] ASC,
	[ToDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_EmpLeave_Track]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_EmpLeave_Track](
	[EmpCode] [int] NOT NULL,
	[LeaveType] [int] NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[LeaveType_SC] [char](1) NULL,
	[Noofdays] [numeric](3, 1) NULL,
	[P_HdayFrm] [numeric](2, 1) NULL,
	[P_HdayTo] [numeric](2, 1) NULL,
	[Sation_leave] [bit] NULL,
	[Address_Leave] [varchar](75) NULL,
	[Reason] [varchar](250) NULL,
	[Remarks] [varchar](250) NULL,
	[Leave_Entrydate] [datetime] NULL,
	[Status] [char](2) NULL,
	[Approvedby] [varchar](10) NULL,
	[Approveddt] [datetime] NULL,
	[TimeStamp] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_EmpReg]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_EmpReg](
	[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[EmpCode] [varchar](50) NOT NULL,
	[EmpName] [varchar](150) NULL,
	[SurName] [varchar](25) NULL,
	[EmpFname] [varchar](150) NULL,
	[Nationality] [int] NULL,
	[Gender] [char](1) NULL,
	[MotherName] [varchar](150) NULL,
	[DOB] [date] NULL,
	[Community] [varchar](2) NULL,
	[Religion] [varchar](2) NULL,
	[MotherTng] [varchar](50) NULL,
	[MrgStatus] [varchar](10) NULL,
	[DifferentAbled] [bit] NULL,
	[Disabilty_Percentage] [varchar](10) NULL,
	[IdentMarkOne] [varchar](150) NULL,
	[IdentMarkTwo] [varchar](150) NULL,
	[HomeSate] [varchar](3) NULL,
	[HomeDistrict] [varchar](10) NULL,
	[LTCHomeTown] [varchar](50) NULL,
	[NearRailStation] [varchar](100) NULL,
	[StateCode] [int] NULL,
	[DistCode] [int] NULL,
	[Address] [varchar](max) NULL,
	[PinCode] [varchar](6) NULL,
	[PerStateCode] [int] NULL,
	[PerDistCode] [int] NULL,
	[PerAddress] [varchar](max) NULL,
	[PerPinCode] [varchar](6) NULL,
	[Email] [varchar](70) NULL,
	[phone] [varchar](12) NULL,
	[Mobile] [varchar](10) NULL,
	[Aadhar] [varchar](12) NULL,
	[PanNo] [varchar](10) NULL,
	[DeptCode] [varchar](10) NULL,
	[UserID] [varchar](10) NULL,
	[IpAddress] [varchar](20) NULL,
	[LoggedInUserId] [bigint] NULL,
	[LoggedInDt] [datetime] NULL,
	[UpdatedUserId] [bigint] NULL,
	[UpdatedDt] [datetime] NULL,
	[PhfileNm] [varchar](50) NULL,
	[PhfileSize] [varchar](15) NULL,
	[PhfileType] [varchar](10) NULL,
	[Phcontent] [varbinary](max) NULL,
	[SigfileNme] [varchar](50) NULL,
	[SigfileSizee] [varchar](15) NULL,
	[SigfileTypee] [varchar](10) NULL,
	[Sigcontentt] [varbinary](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_PA_Dtls_EmpReg] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__PA_Dtls___7DA847CA77106D3A] UNIQUE NONCLUSTERED 
(
	[EmpCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_ExceptionLog]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_ExceptionLog](
	[Logid] [bigint] IDENTITY(1,1) NOT NULL,
	[ExceptionMsg] [varchar](100) NULL,
	[ExceptionType] [varchar](100) NULL,
	[ExceptionSource] [nvarchar](max) NULL,
	[ExceptionURL] [varchar](100) NULL,
	[Logdate] [datetime] NULL,
	[LoggedInUser] [varchar](255) NULL,
	[IpAddress] [varchar](20) NULL,
 CONSTRAINT [PK_PA_Dtls_ExceptionLog] PRIMARY KEY CLUSTERED 
(
	[Logid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_Family]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_Family](
	[EmpID] [int] NOT NULL,
	[MemberID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberName] [varchar](50) NOT NULL,
	[Relation] [varchar](20) NOT NULL,
	[DateofBirth] [date] NULL,
	[Dependent] [bit] NULL,
	[GovtEmp] [bit] NULL,
	[Nominee] [bit] NULL,
	[NomineePercentage] [int] NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
 CONSTRAINT [PK_PA_Dtls_Family] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_Joining]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_Joining](
	[ApplicationId] [varchar](50) NOT NULL,
	[EmpId] [int] NOT NULL,
	[LeaveType] [char](1) NOT NULL,
	[Leave_Type] [int] NOT NULL,
	[Joining_FromDate] [date] NOT NULL,
	[Joining_FromType] [char](10) NULL,
	[FileType] [varchar](10) NULL,
	[FileName] [varchar](50) NULL,
	[FileContent] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_LeaveBalance]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_LeaveBalance](
	[EmpId] [varchar](10) NOT NULL,
	[LeaveTypeId] [int] NOT NULL,
	[AsOnDate] [date] NOT NULL,
	[LeaveBalance] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [int] NOT NULL,
	[AddedIP] [varchar](50) NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedIP] [varchar](50) NULL,
	[Freezed] [bit] NOT NULL,
 CONSTRAINT [PK_PA_Dtls_LeaveBalance] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC,
	[LeaveTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_LeaveDetails]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_LeaveDetails](
	[ApplicationId] [varchar](50) NOT NULL,
	[LeaveType] [int] NOT NULL,
	[FromDate] [date] NOT NULL,
	[FromType] [char](10) NULL,
	[ToDate] [date] NOT NULL,
	[LeaveExtensionDt] [date] NULL,
	[ToType] [char](10) NULL,
	[Nod] [decimal](3, 1) NULL,
	[ExtendedNod] [int] NULL,
	[CancelFrm] [datetime] NULL,
	[CancelTo] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_LeaveDetails_Hst]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_LeaveDetails_Hst](
	[ApplicationId] [varchar](50) NOT NULL,
	[LeaveType] [int] NOT NULL,
	[FromDate] [date] NOT NULL,
	[FromType] [char](10) NULL,
	[ToDate] [date] NOT NULL,
	[ToType] [char](10) NULL,
	[Nod] [decimal](3, 1) NULL,
	[CancelFrm] [datetime] NULL,
	[CancelTo] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_LeaveStatus]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_LeaveStatus](
	[Application_ID] [varchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[StatusDate] [datetime] NOT NULL,
	[CancelType] [char](1) NULL,
	[LeaveType] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_login]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_login](
	[Sno] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](250) NULL,
	[Password] [varchar](250) NULL,
	[Role] [int] NULL,
	[CreatedDt] [datetime] NULL,
	[IP] [varchar](255) NULL,
	[code] [bigint] NULL,
	[Active] [bit] NULL,
	[Type] [varchar](20) NULL,
	[addedby] [varchar](50) NULL,
	[updateddt] [datetime] NULL,
	[updatedby] [varchar](50) NULL,
	[updatedIP] [varchar](20) NULL,
	[reset_by] [varchar](50) NULL,
	[reset_IP] [varchar](20) NULL,
	[reset_cnt] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_Post]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[PostName] [varchar](150) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[PostType] [int] NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NOT NULL,
	[qualification] [int] NOT NULL,
	[Exp] [bit] NOT NULL,
	[ExpDetails] [varchar](250) NULL,
	[PhotoSig] [bit] NOT NULL,
	[Disclaimer] [varchar](250) NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [int] NOT NULL,
	[AddedIP] [varchar](50) NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedIP] [varchar](50) NULL,
 CONSTRAINT [PK_PA_Dtls_Application] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_PostItems]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_PostItems](
	[PostID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[ItemId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_Recruitmt_Exp]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_Recruitmt_Exp](
	[Application_Id] [varchar](50) NOT NULL,
	[Post_Name] [varchar](50) NULL,
	[Exp] [bigint] NULL,
	[Sector] [varchar](10) NULL,
	[Entry_Dt] [datetime] NULL,
	[EntryBy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_Recruitmt_Qual]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_Recruitmt_Qual](
	[Application_Id] [varchar](50) NOT NULL,
	[Qualification_Code] [int] NULL,
	[Percentage_Marks] [numeric](5, 2) NULL,
	[Year_of_Passing] [int] NULL,
	[University] [varchar](75) NULL,
	[Entry_Dt] [datetime] NULL,
	[EntryBy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_Recruitmt_Uploads]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_Recruitmt_Uploads](
	[Application_Id] [varchar](50) NOT NULL,
	[Post_ID] [int] NULL,
	[PhfileNm] [varchar](50) NULL,
	[PhfileSize] [varchar](15) NULL,
	[PhfileType] [varchar](10) NULL,
	[Phcontent] [varbinary](max) NULL,
	[SigfileNme] [varchar](50) NULL,
	[SigfileSizee] [varchar](15) NULL,
	[SigfileType] [varchar](10) NULL,
	[Sigcontent] [varbinary](max) NULL,
	[Entry_Dt] [datetime] NULL,
	[EntryBy] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_UserLoginStatus]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_UserLoginStatus](
	[Sno] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[LoginDateAndTime] [datetime] NULL,
	[IpAddress] [nvarchar](150) NULL,
	[Status] [nvarchar](20) NULL,
	[LogOutDateAndTime] [datetime] NULL,
 CONSTRAINT [PK_Dtls_UserLoginStatus] PRIMARY KEY CLUSTERED 
(
	[Sno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_Users]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_Users](
	[Section] [int] NULL,
	[Empid] [varchar](50) NOT NULL,
	[ReportingOfficer] [varchar](50) NOT NULL,
	[EffectiveFrom] [date] NULL,
	[EffectiveTo] [date] NULL,
	[Forwording_Officer] [varchar](50) NULL,
	[Recommended_Officer] [varchar](50) NULL,
	[Sanction_Authority] [varchar](50) NULL,
	[Link_Officer] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedIP] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Dtls_Users_Hst]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Dtls_Users_Hst](
	[Section] [int] NULL,
	[Empid] [int] NOT NULL,
	[ReportingOfficer] [bigint] NOT NULL,
	[Forwording_Officer] [int] NULL,
	[Recommended_Officer] [int] NULL,
	[Sanction_Authority] [int] NULL,
	[Link_Officer] [int] NULL,
	[EffectiveFrom] [varchar](15) NULL,
	[EffectiveTo] [varchar](25) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedIP] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_AddItems]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_AddItems](
	[SectionID] [int] NOT NULL,
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_PA_Mst_AddItems] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_AppliSection]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_AppliSection](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[SectionName] [varchar](50) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[InsertDt] [datetime] NOT NULL,
	[UpdatedDt] [datetime] NULL,
	[DispalyOrder] [int] NULL,
 CONSTRAINT [PK_PA_Mst_AppliSection] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Caste]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Caste](
	[CasteCode] [nvarchar](2) NULL,
	[CasteName] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Class]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Class](
	[Class_Code] [int] IDENTITY(1,1) NOT NULL,
	[Class_Name] [varchar](20) NULL,
	[Dept_Code] [int] NULL,
	[User_Type] [varchar](4) NULL,
 CONSTRAINT [PK_Class_Master] PRIMARY KEY CLUSTERED 
(
	[Class_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Contribution]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Contribution](
	[Contribution_Code] [int] IDENTITY(1,1) NOT NULL,
	[Contribution_Name] [nvarchar](20) NULL,
	[Dept_Code] [int] NULL,
	[User_Type] [varchar](4) NULL,
 CONSTRAINT [PK_Contribution_Master] PRIMARY KEY CLUSTERED 
(
	[Contribution_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_CurrentPosting]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_CurrentPosting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[StateCode] [int] NOT NULL,
	[DistCode] [int] NOT NULL,
	[OfficeName] [varchar](100) NOT NULL,
	[DesignationID] [int] NOT NULL,
	[FromDate] [date] NOT NULL,
	[ToDate] [varchar](15) NOT NULL,
	[SectionID] [int] NULL,
	[LoggedUser] [varchar](50) NULL,
	[InsertDate] [datetime] NULL,
	[UpdatedDt] [datetime] NULL,
	[IpAddress] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Designations]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Designations](
	[DesignationID] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [varchar](50) NOT NULL,
	[Cadre] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [int] NOT NULL,
	[AddedIP] [varchar](50) NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedIP] [varchar](50) NULL,
 CONSTRAINT [PK_PA_Mst_Designations] PRIMARY KEY CLUSTERED 
(
	[DesignationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Discipline]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Discipline](
	[Discipline_Code] [int] IDENTITY(1,1) NOT NULL,
	[Discipline_Name] [varchar](20) NULL,
	[LoggedIn_Dt] [date] NULL,
 CONSTRAINT [PK_Discipline_Master] PRIMARY KEY CLUSTERED 
(
	[Discipline_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_District]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_District](
	[StateCode] [int] NOT NULL,
	[DistCode] [int] NOT NULL,
	[DistCode_LG] [int] NOT NULL,
	[DistName] [varchar](100) NULL,
	[Active] [bit] NULL,
	[AddedBy] [varchar](50) NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_PA_Mst_District] PRIMARY KEY CLUSTERED 
(
	[DistCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DistCode_LG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DistCode_LG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Divisions]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Divisions](
	[DivisionCode] [int] NOT NULL,
	[DivisionName] [varchar](50) NULL,
	[DistCode] [int] NOT NULL,
 CONSTRAINT [PK_LB_Mst_Divisions] PRIMARY KEY CLUSTERED 
(
	[DivisionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Education]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Education](
	[Qualification_Code] [int] NOT NULL,
	[Discipline_Code] [int] NOT NULL,
	[University] [nvarchar](50) NULL,
	[yearOfPass] [date] NULL,
	[LoggedIn_Dt] [datetime] NULL,
	[DepCode] [nvarchar](10) NULL,
	[StateCode] [varchar](10) NULL,
	[Loggedin_User] [varchar](50) NULL,
	[UpdatedDt] [datetime] NULL,
	[IpAddress] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Employee]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Employee](
	[EmployeeCode] [varchar](10) NOT NULL,
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](50) NOT NULL,
	[Gender] [char](1) NULL,
	[MobileNumber] [varchar](10) NULL,
	[email] [varchar](100) NULL,
	[EmpAddress] [varchar](300) NULL,
	[Active] [bit] NOT NULL,
	[AddedBy] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[Dob] [datetime] NULL,
	[DOJService] [datetime] NULL,
	[DOJCurrrentPosition] [datetime] NULL,
	[PanNo] [nvarchar](10) NULL,
	[DesignationTOJ] [nvarchar](50) NULL,
	[CurrentDesignation] [nvarchar](50) NULL,
	[TempAdd] [nvarchar](100) NULL,
	[PermAdd] [nvarchar](100) NULL,
	[Father_HusbandName] [nvarchar](50) NULL,
	[Qualification] [nvarchar](50) NULL,
	[Community] [nvarchar](2) NULL,
	[ExServiceMan] [nvarchar](2) NULL,
	[DifferentlyAbled] [nvarchar](2) NULL,
	[Disability] [int] NULL,
	[StateCode] [int] NULL,
	[NoofRepOfc] [int] NULL,
	[martial_status] [char](1) NULL,
	[children] [int] NULL,
	[Forwording_Officer] [varchar](10) NULL,
	[Recommended_Officer] [varchar](10) NULL,
	[Sanction_Authority] [varchar](10) NULL,
	[Link_Officer] [varchar](10) NULL,
 CONSTRAINT [PK_PA_Mst_Employee_1] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_EmployeeType]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_EmployeeType](
	[EmpType_Code] [int] NULL,
	[EmpType_Name] [varchar](20) NULL,
	[Dep_Code] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Holiday]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Holiday](
	[Hid] [int] IDENTITY(1,1) NOT NULL,
	[HolidayYear] [varchar](5) NOT NULL,
	[HolidayMonth] [varchar](2) NOT NULL,
	[HolidayDate] [varchar](25) NOT NULL,
	[HolidayType] [varchar](10) NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[Addedby] [varchar](50) NOT NULL,
	[Added_On] [datetime] NULL,
	[Updatedby] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[Ip] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Intialjoing]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Intialjoing](
	[EmpId] [int] NOT NULL,
	[StateCode] [int] NOT NULL,
	[OfficeName] [varchar](50) NOT NULL,
	[Designation_Code] [int] NOT NULL,
	[DOJ] [date] NOT NULL,
	[OrdNum] [varchar](50) NULL,
	[OrdDate] [date] NULL,
	[ApointgAuthority] [varchar](50) NULL,
	[ModeOfRec] [varchar](50) NULL,
	[OfficerType] [varchar](3) NOT NULL,
	[PayCommision_Code] [int] NULL,
	[PayScale] [varchar](10) NULL,
	[BasicPay] [varchar](10) NULL,
	[EmpType_Code] [varchar](10) NULL,
	[Class_Code] [varchar](10) NULL,
	[DeductionType] [varchar](10) NULL,
	[IpAddress] [varchar](15) NULL,
	[LoggedIn_Dt] [datetime] NULL,
	[UpdatedDt] [datetime] NULL,
	[LoggedinUser] [varchar](50) NULL,
	[Dept] [varchar](4) NULL,
	[DistCode] [varchar](10) NULL,
 CONSTRAINT [PK_PA_Mst_Intialjoing] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_LeaveTypes]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_LeaveTypes](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[ApplicableFor] [char](6) NOT NULL,
	[AppliesFor] [char](20) NOT NULL,
	[No_leaves] [int] NOT NULL,
	[MaxAt_A_Time] [int] NOT NULL,
	[LinkedWithBirth] [bit] NOT NULL,
	[NoC_Considered] [int] NULL,
	[LeavedAtEachBirth] [int] NULL,
	[MinLeaves] [int] NULL,
	[YrEndStatus] [char](1) NOT NULL,
	[RequiresJoining] [bit] NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Extended] [bit] NULL,
 CONSTRAINT [PK_PA_Mst_LeaveTypes] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_NomineeDetails]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_NomineeDetails](
	[Contribution_Code] [int] NULL,
	[Empcode] [varchar](10) NULL,
	[NomineeNm] [varchar](30) NULL,
	[Relation] [varchar](20) NULL,
	[DOJ] [date] NULL,
	[Percentage] [varchar](10) NULL,
	[NomAddress] [varchar](300) NULL,
	[GurdainNm] [varchar](20) NULL,
	[Address] [varchar](300) NULL,
	[Dep_Code] [varchar](10) NULL,
	[IpAddress] [varchar](15) NULL,
	[LoggedIn_Dt] [datetime] NULL,
	[UpdatedDt] [datetime] NULL,
	[User] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Office]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Office](
	[Office_Code] [int] IDENTITY(1,1) NOT NULL,
	[Office_Name] [varchar](50) NULL,
	[Dep_Code] [varchar](10) NULL,
 CONSTRAINT [PK_Office_Master] PRIMARY KEY CLUSTERED 
(
	[Office_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_PayCommision]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_PayCommision](
	[PayCommision_Code] [int] IDENTITY(1,1) NOT NULL,
	[PayCommision_Name] [varchar](30) NULL,
	[Dep_Code] [varchar](10) NULL,
 CONSTRAINT [PK_PayCommisionMaster] PRIMARY KEY CLUSTERED 
(
	[PayCommision_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_PostType]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_PostType](
	[PostTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PostTypeName] [varchar](50) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[InsertDt] [datetime] NOT NULL,
	[UpdatedDt] [datetime] NULL,
 CONSTRAINT [PK_PA_Mst_PostType] PRIMARY KEY CLUSTERED 
(
	[PostTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Qualification]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Qualification](
	[Qualification_Code] [int] IDENTITY(1,1) NOT NULL,
	[Qualification_Name] [varchar](20) NULL,
	[LoggedIn_Dt] [date] NULL,
 CONSTRAINT [PK_Mst_Qualification] PRIMARY KEY CLUSTERED 
(
	[Qualification_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Relation]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Relation](
	[RelationId] [int] IDENTITY(1,1) NOT NULL,
	[Relation] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PA_Mst_Relation] PRIMARY KEY CLUSTERED 
(
	[RelationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Roles]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Roles](
	[Role_Id] [int] NOT NULL,
	[RoleName] [varchar](50) NULL,
 CONSTRAINT [PK_LB_Mst_Roles] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Sections]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Sections](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[SectionName] [varchar](50) NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [int] NOT NULL,
	[AddedIP] [varchar](50) NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedIP] [varchar](50) NULL,
 CONSTRAINT [PK_PA_Mst_Sections] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_State]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_State](
	[StateCode] [int] IDENTITY(37,1) NOT NULL,
	[State] [varchar](50) NULL,
	[AddedBy] [varchar](50) NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_LB_Mst_State] PRIMARY KEY CLUSTERED 
(
	[StateCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_Status]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_Status](
	[StatusID] [int] NOT NULL,
	[StatusName] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Mst_TransferDetails]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Mst_TransferDetails](
	[DesignationFrom] [nchar](10) NULL,
	[OfficeFrom] [nvarchar](50) NULL,
	[DesignationTo] [nvarchar](50) NULL,
	[OfficeTo] [nvarchar](50) NULL,
	[DOJ] [date] NULL,
	[OrderDt] [date] NULL,
	[OrderNum] [nvarchar](20) NULL,
	[Transfer] [nvarchar](50) NULL,
	[Dep_Code] [nvarchar](10) NULL,
	[IpAddress] [nvarchar](20) NULL,
	[LoggedIn_Dt] [datetime] NULL,
	[UpdatedDt] [datetime] NULL,
	[Logged_User] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PA_Upld_LeaveDoc]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PA_Upld_LeaveDoc](
	[EmpCode] [int] NOT NULL,
	[LeaveType] [int] NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[Leave_Doc] [varbinary](max) NULL,
	[Entrydate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PA_Dtls_EmpEducation] ADD  CONSTRAINT [DF_PA_Dtls_EmpEducation_AddedOn]  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[PA_Dtls_EmpLeave] ADD  CONSTRAINT [DF_PA_Dtls_EmpLeave_EntryOn]  DEFAULT (getdate()) FOR [EntryOn]
GO
ALTER TABLE [dbo].[PA_Dtls_EmpReg] ADD  CONSTRAINT [DF_PA_Dtls_EmpReg_LoggedInDt]  DEFAULT (getdate()) FOR [LoggedInDt]
GO
ALTER TABLE [dbo].[PA_Dtls_Family] ADD  CONSTRAINT [DF_PA_Dtls_Family_AddedOn]  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[PA_Dtls_LeaveBalance] ADD  CONSTRAINT [DF_PA_Dtls_LeaveBalance_AddedOn]  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[PA_Dtls_LeaveBalance] ADD  CONSTRAINT [DF_PA_Dtls_LeaveBalance_Freezed]  DEFAULT ((0)) FOR [Freezed]
GO
ALTER TABLE [dbo].[PA_Dtls_LeaveStatus] ADD  CONSTRAINT [DF_PA_Dtls_LeaveStatus_StatusDate]  DEFAULT (getdate()) FOR [StatusDate]
GO
ALTER TABLE [dbo].[PA_Dtls_login] ADD  CONSTRAINT [DF_PA_Dtls_login_CreatedDt]  DEFAULT (getdate()) FOR [CreatedDt]
GO
ALTER TABLE [dbo].[PA_Dtls_Post] ADD  CONSTRAINT [DF_PA_Dtls_Application_AddedOn]  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[PA_Mst_AddItems] ADD  CONSTRAINT [DF_PA_Mst_AddItems_AddedOn]  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[PA_Mst_AppliSection] ADD  CONSTRAINT [DF_PA_Mst_AppliSection_InsertDt]  DEFAULT (getdate()) FOR [InsertDt]
GO
ALTER TABLE [dbo].[PA_Mst_Designations] ADD  CONSTRAINT [DF_PA_Mst_Designations_AddedOn]  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[PA_Mst_District] ADD  CONSTRAINT [DF_LB_Mst_District_AddedOn]  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[PA_Mst_Employee] ADD  CONSTRAINT [DF_PA_Mst_Employee_AddedOn]  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[PA_Mst_Holiday] ADD  CONSTRAINT [DF_PA_Mst_Holiday_Added_On]  DEFAULT (getdate()) FOR [Added_On]
GO
ALTER TABLE [dbo].[PA_Mst_Intialjoing] ADD  CONSTRAINT [DF_PA_Mst_Intialjoing_LoggedIn_Dt]  DEFAULT (getdate()) FOR [LoggedIn_Dt]
GO
ALTER TABLE [dbo].[PA_Mst_LeaveTypes] ADD  CONSTRAINT [DF_PA_Mst_LeaveTypes_AddedOn]  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[PA_Mst_PostType] ADD  CONSTRAINT [DF_PA_Mst_PostType_InsertDt]  DEFAULT (getdate()) FOR [InsertDt]
GO
ALTER TABLE [dbo].[PA_Mst_Sections] ADD  CONSTRAINT [DF_PA_Mst_Sections_AddedOn]  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[PA_Mst_State] ADD  CONSTRAINT [DF_LB_Mst_State_AddedOn]  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[PA_Dtls_EmpEducation]  WITH CHECK ADD  CONSTRAINT [FK_PA_Dtls_EmpEducation_PA_Dtls_EmpReg] FOREIGN KEY([EmpId])
REFERENCES [dbo].[PA_Dtls_EmpReg] ([Employee_ID])
GO
ALTER TABLE [dbo].[PA_Dtls_EmpEducation] CHECK CONSTRAINT [FK_PA_Dtls_EmpEducation_PA_Dtls_EmpReg]
GO
ALTER TABLE [dbo].[PA_Dtls_EmpLeave]  WITH CHECK ADD  CONSTRAINT [FK_PA_Dtls_EmpLeave_PA_Dtls_EmpReg] FOREIGN KEY([EmpId])
REFERENCES [dbo].[PA_Dtls_EmpReg] ([Employee_ID])
GO
ALTER TABLE [dbo].[PA_Dtls_EmpLeave] CHECK CONSTRAINT [FK_PA_Dtls_EmpLeave_PA_Dtls_EmpReg]
GO
ALTER TABLE [dbo].[PA_Dtls_Family]  WITH CHECK ADD  CONSTRAINT [FK_PA_Dtls_Family_PA_Dtls_Family] FOREIGN KEY([EmpID])
REFERENCES [dbo].[PA_Dtls_EmpReg] ([Employee_ID])
GO
ALTER TABLE [dbo].[PA_Dtls_Family] CHECK CONSTRAINT [FK_PA_Dtls_Family_PA_Dtls_Family]
GO
ALTER TABLE [dbo].[PA_Dtls_LeaveDetails]  WITH CHECK ADD  CONSTRAINT [FK_PA_Dtls_LeaveDetails_PA_Dtls_EmpLeave] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[PA_Dtls_EmpLeave] ([ApplicationId])
GO
ALTER TABLE [dbo].[PA_Dtls_LeaveDetails] CHECK CONSTRAINT [FK_PA_Dtls_LeaveDetails_PA_Dtls_EmpLeave]
GO
ALTER TABLE [dbo].[PA_Dtls_PostItems]  WITH CHECK ADD  CONSTRAINT [FK_PA_Dtls_AppliItems_PA_Dtls_Application] FOREIGN KEY([PostID])
REFERENCES [dbo].[PA_Dtls_Post] ([PostID])
GO
ALTER TABLE [dbo].[PA_Dtls_PostItems] CHECK CONSTRAINT [FK_PA_Dtls_AppliItems_PA_Dtls_Application]
GO
ALTER TABLE [dbo].[PA_Dtls_PostItems]  WITH CHECK ADD  CONSTRAINT [FK_PA_Dtls_AppliItems_PA_Mst_AddItems] FOREIGN KEY([ItemId])
REFERENCES [dbo].[PA_Mst_AddItems] ([ItemID])
GO
ALTER TABLE [dbo].[PA_Dtls_PostItems] CHECK CONSTRAINT [FK_PA_Dtls_AppliItems_PA_Mst_AddItems]
GO
ALTER TABLE [dbo].[PA_Dtls_PostItems]  WITH CHECK ADD  CONSTRAINT [FK_PA_Dtls_AppliItems_PA_Mst_AppliSection] FOREIGN KEY([SectionID])
REFERENCES [dbo].[PA_Mst_AppliSection] ([SectionID])
GO
ALTER TABLE [dbo].[PA_Dtls_PostItems] CHECK CONSTRAINT [FK_PA_Dtls_AppliItems_PA_Mst_AppliSection]
GO
ALTER TABLE [dbo].[PA_Dtls_Recruitmt_Exp]  WITH CHECK ADD FOREIGN KEY([Application_Id])
REFERENCES [dbo].[PA_Dlts_Recruitmt_Dtls] ([Application_Id])
GO
ALTER TABLE [dbo].[PA_Dtls_Recruitmt_Qual]  WITH CHECK ADD  CONSTRAINT [FK__PA_Dtls_R__Appli__5669C4BE] FOREIGN KEY([Application_Id])
REFERENCES [dbo].[PA_Dlts_Recruitmt_Dtls] ([Application_Id])
GO
ALTER TABLE [dbo].[PA_Dtls_Recruitmt_Qual] CHECK CONSTRAINT [FK__PA_Dtls_R__Appli__5669C4BE]
GO
ALTER TABLE [dbo].[PA_Dtls_Recruitmt_Uploads]  WITH CHECK ADD FOREIGN KEY([Application_Id])
REFERENCES [dbo].[PA_Dlts_Recruitmt_Dtls] ([Application_Id])
GO
ALTER TABLE [dbo].[PA_Mst_AddItems]  WITH CHECK ADD  CONSTRAINT [FK_PA_Mst_AddItems_PA_Mst_AppliSection] FOREIGN KEY([SectionID])
REFERENCES [dbo].[PA_Mst_AppliSection] ([SectionID])
GO
ALTER TABLE [dbo].[PA_Mst_AddItems] CHECK CONSTRAINT [FK_PA_Mst_AddItems_PA_Mst_AppliSection]
GO
ALTER TABLE [dbo].[PA_Mst_CurrentPosting]  WITH CHECK ADD  CONSTRAINT [FK_PA_Mst_CurrentPosting_PA_Dtls_EmpReg] FOREIGN KEY([EmpId])
REFERENCES [dbo].[PA_Dtls_EmpReg] ([Employee_ID])
GO
ALTER TABLE [dbo].[PA_Mst_CurrentPosting] CHECK CONSTRAINT [FK_PA_Mst_CurrentPosting_PA_Dtls_EmpReg]
GO
ALTER TABLE [dbo].[PA_Mst_CurrentPosting]  WITH CHECK ADD  CONSTRAINT [FK_PA_Mst_CurrentPosting_PA_Mst_Designations] FOREIGN KEY([DesignationID])
REFERENCES [dbo].[PA_Mst_Designations] ([DesignationID])
GO
ALTER TABLE [dbo].[PA_Mst_CurrentPosting] CHECK CONSTRAINT [FK_PA_Mst_CurrentPosting_PA_Mst_Designations]
GO
ALTER TABLE [dbo].[PA_Mst_CurrentPosting]  WITH CHECK ADD  CONSTRAINT [FK_PA_Mst_CurrentPosting_PA_Mst_District] FOREIGN KEY([DistCode])
REFERENCES [dbo].[PA_Mst_District] ([DistCode])
GO
ALTER TABLE [dbo].[PA_Mst_CurrentPosting] CHECK CONSTRAINT [FK_PA_Mst_CurrentPosting_PA_Mst_District]
GO
ALTER TABLE [dbo].[PA_Mst_CurrentPosting]  WITH CHECK ADD  CONSTRAINT [FK_PA_Mst_CurrentPosting_PA_Mst_State] FOREIGN KEY([StateCode])
REFERENCES [dbo].[PA_Mst_State] ([StateCode])
GO
ALTER TABLE [dbo].[PA_Mst_CurrentPosting] CHECK CONSTRAINT [FK_PA_Mst_CurrentPosting_PA_Mst_State]
GO
ALTER TABLE [dbo].[PA_Mst_Intialjoing]  WITH CHECK ADD  CONSTRAINT [FK_PA_Mst_Intialjoing_PA_Dtls_EmpReg] FOREIGN KEY([EmpId])
REFERENCES [dbo].[PA_Dtls_EmpReg] ([Employee_ID])
GO
ALTER TABLE [dbo].[PA_Mst_Intialjoing] CHECK CONSTRAINT [FK_PA_Mst_Intialjoing_PA_Dtls_EmpReg]
GO
ALTER TABLE [dbo].[PA_Mst_Intialjoing]  WITH CHECK ADD  CONSTRAINT [FK_PA_Mst_Intialjoing_PA_Mst_Designations] FOREIGN KEY([Designation_Code])
REFERENCES [dbo].[PA_Mst_Designations] ([DesignationID])
GO
ALTER TABLE [dbo].[PA_Mst_Intialjoing] CHECK CONSTRAINT [FK_PA_Mst_Intialjoing_PA_Mst_Designations]
GO
ALTER TABLE [dbo].[PA_Mst_Intialjoing]  WITH CHECK ADD  CONSTRAINT [FK_PA_Mst_Intialjoing_PA_Mst_PayCommision] FOREIGN KEY([PayCommision_Code])
REFERENCES [dbo].[PA_Mst_PayCommision] ([PayCommision_Code])
GO
ALTER TABLE [dbo].[PA_Mst_Intialjoing] CHECK CONSTRAINT [FK_PA_Mst_Intialjoing_PA_Mst_PayCommision]
GO
/****** Object:  StoredProcedure [dbo].[ApplicationPost_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ApplicationPost_IUDR]
@PostID INT=NULL,
@PostName VARCHAR(50)=NULL,
@PostDesc VARCHAR(MAX)=NULL,
@PostTypeID INT=NULL,
@user INT=NULL,
@Action CHAR(5)
AS
BEGIN
SET NOCOUNT ON;

 IF(@Action='I')
BEGIN
	INSERT INTO PA_Mst_Application  (PostName,PostDescription,PostTypeID,InsertedBy)  VALUES(@PostName,@PostDesc,@PostTypeID,@user)
END

IF(@Action='R')
BEGIN
	SELECT 	P.PostName,P.PostDescription,P.PostID,P.PostTypeID,T.PostTypeName FROM  PA_Mst_Application P 
	INNER JOIN PA_Mst_PostType T ON T.PostTypeID=P.PostTypeID
	WHERE (P.PostTypeID=@PostTypeID	 OR @PostTypeID =''  )
END


IF(@Action='U')
BEGIN
	UPDATE PA_Mst_Application SET PostName=@PostName,PostDescription=@PostDesc,UpdatedDt=GETDATE() WHERE PostID=@PostID
END

IF(@Action='D')
BEGIN
	DELETE FROM PA_Mst_Application WHERE PostID=@PostID
END

END
GO
/****** Object:  StoredProcedure [dbo].[ApplicationSection_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ApplicationSection_IUDR]
@SectionID INT=NULL,
@SectionName VARCHAR(50)=NULL,
@User INT=NULL,
@Action CHAR(5)
AS
BEGIN
SET NOCOUNT ON;

 
IF(@Action='I')
BEGIN
	IF EXISTS(SELECT 1 FROM PA_Mst_AppliSection WHERE SectionName=@SectionName )
		SELECT 'SectionName already exists'
	ELSE
		INSERT INTO PA_Mst_AppliSection(SectionName,InsertedBy) VALUES(@SectionName,@User)
END

IF(@Action='R')
	SELECT SectionID,SectionName FROM PA_Mst_AppliSection --WHERE Department=@Dept


IF(@Action='U')
	UPDATE PA_Mst_AppliSection SET SectionName=@SectionName,UpdatedDt=GETDATE() WHERE SectionID=@SectionID


IF(@Action='D')
	DELETE FROM PA_Mst_AppliSection WHERE SectionID=@SectionID


END
GO
/****** Object:  StoredProcedure [dbo].[ApplyPost_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ApplyPost_IUDR]
@Id	bigint	=NULL,
@Application_Id	varchar(50)	=NULL,
@Post_ID	int	=NULL,
@Name	varchar(100)=NULL,
@FName	varchar(100)=NULL,
@DOB	datetime	=NULL,
@Caste	int	=NULL,
@Nationality	int=NULL,
@Religion	int	=NULL,
@Gender	char(1)	=NULL,
@Address	varchar(255)	=NULL,
@PAddress	varchar(255)	=NULL,
@Mobile	nvarchar(10)=NULL,
@Email	nvarchar(100)=NULL,
@IpAddress	varchar(15)=NULL,

@PhfileNm	varchar(50)=NULL,
@PhfileSize	varchar(15)	=NULL,
@PhfileType	varchar(10)=NULL,
@Phcontent	varbinary(MAX)	=NULL,
@SigfileNme	varchar(50)	=NULL,
@SigfileSizee	varchar(15)=NULL,
@SigfileType	varchar(10)	=NULL,
@Sigcontent	varbinary(MAX)	=NULL,
@EntryBy	int	=NULL,

@TVPE Experience Readonly,
@TVPQ Qualification Readonly,
@Action Char(10)
AS
BEGIN  
BEGIN TRY  
BEGIN TRANSACTION  

DECLARE @AplId VARCHAR(50),@maxId int,@Sysdate datetime=getdate()

IF(@ACTION='I')
BEGIN
	set @maxId=(select isnull(max(Id),0) from PA_Dlts_Recruitmt_Dtls)
	
	SET @AplId=Convert(varchar,@Post_ID)+'/'+UPPER ( CONVERT(CHAR(3),@Sysdate, 0))+'/'+CONVERT(VARCHAR, YEAR(@Sysdate))+'/'+Convert(varchar,(@maxId+1))
	INSERT INTO PA_Dlts_Recruitmt_Dtls(Application_Id,Post_ID,Name,FName,DOB,Caste,Nationality,Religion,Gender,Address,PAddress,Mobile,Email,IpAddress,AppliedDt) 
	VALUES(@AplId,@Post_ID,@Name,@FName,@DOB,@Caste,@Nationality,@Religion,@Gender,@Address,@PAddress,@Mobile,@Email,@IpAddress,@Sysdate)

	INSERT INTO PA_Dtls_Recruitmt_Uploads(Application_Id,PhfileNm,PhfileSize,PhfileType,Phcontent,SigfileNme,SigfileSizee,SigfileType,Sigcontent,Entry_Dt,EntryBy) 
	VALUES(@AplId,@PhfileNm,@PhfileSize,@PhfileType,@Phcontent,@SigfileNme,@SigfileSizee,@SigfileType,@Sigcontent,@Sysdate,@EntryBy)

	insert into PA_Dtls_Recruitmt_Qual (Application_Id,Qualification_Code,Percentage_Marks,Year_of_Passing,University,Entry_Dt,EntryBy)
	select @AplId,Qualification_Code,Percentage_Marks,Year_of_Passing,University,@Sysdate,@EntryBy from @TVPQ

	insert into PA_Dtls_Recruitmt_Exp(Application_Id,Post_Name,Exp,Sector,Entry_Dt,EntryBy)
	select @AplId,Post_Name,Exp,Sector,@Sysdate,@EntryBy from @TVPE

	select 'Details Submitted Successfully'

END
IF(@ACTION='RB')/* Get Application details by Post Id */
BEGIN
	select Application_Id,Post_ID,P.PostName,Name,FName,Convert(varchar(10),DOB,103) as DOB,C.CasteName, CASE WHEN RD.Gender=1 THEN 'MALE' ELSE 'FEMALE' END AS Gender
	from PA_Dlts_Recruitmt_Dtls RD
	INNER JOIN PA_Dtls_Post P ON P.PostID=RD.Post_ID
	INNER JOIN PA_Mst_Caste C ON C.CasteCode=RD.Caste
	 where Post_ID=@Post_ID and rd.status is null

	
END
IF(@ACTION='RQED')/* Get Application qualification, expereince and documents by Post Id and Application Id*/
BEGIN
	select Application_Id,Post_ID,P.PostName,Name,FName,Convert(varchar(10),DOB,103) as DOB,C.CasteName, CASE WHEN RD.Gender=1 THEN 'MALE' ELSE 'FEMALE' END AS Gender,
	CASE WHEN RD.Nationality=1 THEN 'Indian' ELSE 'Others' END AS Nationality,rd.Mobile,rd.Email
	from PA_Dlts_Recruitmt_Dtls RD
	INNER JOIN PA_Dtls_Post P ON P.PostID=RD.Post_ID
	INNER JOIN PA_Mst_Caste C ON C.CasteCode=RD.Caste
	 where Post_ID=@Post_ID and rd.Application_Id=@Application_Id

	Select RQ.Application_Id,rq.Qualification_Code,q.Qualification_Name,Percentage_Marks,Year_of_Passing,University 
	from PA_Dtls_Recruitmt_Qual RQ 
	inner join PA_Dlts_Recruitmt_Dtls RD ON RD.Application_Id=RQ.Application_Id
	inner join PA_Mst_Qualification Q ON q.Qualification_Code=rq.Qualification_Code
	WHERE RD.Post_ID=@Post_ID and rd.Application_Id=@Application_Id

	Select RE.Application_Id,Post_Name,Exp,Sector 
	from PA_Dtls_Recruitmt_Exp RE 
	inner join PA_Dlts_Recruitmt_Dtls RD ON RD.Application_Id=RE.Application_Id
	WHERE RD.Post_ID=@Post_ID and rd.Application_Id=@Application_Id

	Select RU.Application_Id,PhfileNm,PhfileType,Phcontent,SigfileNme,SigfileType, Sigcontent
	from PA_Dtls_Recruitmt_Uploads RU 
	inner join PA_Dlts_Recruitmt_Dtls RD ON RD.Application_Id=RU.Application_Id
	WHERE RD.Post_ID=@Post_ID and rd.Application_Id=@Application_Id
END
COMMIT  
END TRY  
BEGIN CATCH  
ROLLBACK TRANSACTION;  
DECLARE @ErrMsg nvarchar(4000), @ErrSeverity INT  
SELECT @ErrMsg = ERROR_MESSAGE(),  
@ErrSeverity = ERROR_SEVERITY()  

RAISERROR(@ErrMsg, @ErrSeverity, 1)  
END CATCH 
end
GO
/****** Object:  StoredProcedure [dbo].[CurrentPosting_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CurrentPosting_IUDR]
@Id            int=NULL,
@Emp_Code      int=Null,
@StateCode     int=NULL,
@DistCode      int=NULL, 
@OfficeName    varchar(100)=NULL, 
@DesignationID int=NULL, 
@FromDate      DATE=NULL, 
@ToDate        varchar(15)=NULL, 
@SectionID     int=NULL, 
@LoggedIn_Dt   Datetime=null,
@IpAddress     VARCHAR(20)=NULL,
@user          varchar(50)=NULL,
@Action        char(2)=NULL
AS
BEGIN
IF(@Action='I')
BEGIN
	IF EXISTS (SELECT 1 FROM PA_Mst_CurrentPosting WHERE EmpId=@Emp_Code AND @ToDate <>'Till Now' AND( ( CONVERT(DATE,FromDate) <= CONVERT(DATE,@FromDate)  AND CONVERT(DATE,@FromDate) <= CONVERT(DATE,ToDate))))
		SELECT 'This Period Already Exists 1'
	ELSE
	BEGIN
		IF EXISTS (SELECT 1 FROM PA_Mst_CurrentPosting WHERE EmpId=@Emp_Code AND @ToDate <>'Till Now' AND ( ( CONVERT(DATE,FromDate) <= CONVERT(DATE,@ToDate)  AND CONVERT(DATE,@ToDate) <= CONVERT(DATE,ToDate))))
			SELECT 'This Period Already Exists 2'
		ELSE
		BEGIN
			IF EXISTS (SELECT 1 FROM PA_Mst_CurrentPosting WHERE EmpId=@Emp_Code AND @ToDate = 'Till Now' AND (CONVERT(DATE,@FromDate) <= CONVERT(DATE,FromDate)))
				SELECT 'This Period Already Exists 3'
			ELSE			
				INSERT INTO PA_Mst_CurrentPosting (EmpId,StateCode,DistCode,OfficeName,DesignationID,FromDate,ToDate,SectionID,InsertDate,LoggedUser,IpAddress)		  
				VALUES(@Emp_Code,@StateCode,@DistCode,@OfficeName,@DesignationID,@FromDate,@ToDate,@SectionID,GETDATE(),@user,@IpAddress)
		END
	END
END

IF(@Action='R')
BEGIN	       
	SELECT M.Id,M.EmpId,E.EmpName,M.StateCode,S.State,M.DistCode,D.DistName,M.OfficeName,M.DesignationID,G.Designation,
	CONVERT(VARCHAR, M.FromDate,126) AS FromDate,CONVERT(VARCHAR, M.ToDate,106) AS ToDate,
	M.SectionID,C.SectionName
	FROM  PA_Mst_CurrentPosting M	
	INNER JOIN PA_Dtls_EmpReg E ON E.Employee_ID=M.EmpId
	INNER JOIN PA_Mst_State S ON S.StateCode=M.StateCode	 
	INNER JOIN PA_Mst_District D ON D.DistCode=M.DistCode		  
	INNER JOIN PA_Mst_Designations G ON G.DesignationID=M.DesignationID
	LEFT JOIN PA_Mst_Sections C ON C.SectionID=M.SectionID
	WHERE M.EmpId=@Emp_Code ORDER BY FromDate
END

IF(@Action='U')
BEGIN	       
       UPDATE PA_Mst_CurrentPosting SET StateCode=@StateCode
	   ,DistCode=@DistCode
	   ,OfficeName=@OfficeName
	   ,DesignationID=@DesignationID
	   ,SectionID=@SectionID
	   ,FromDate=@FromDate
	   ,ToDate=@ToDate
	   ,LoggedUser=@user
	   ,UpdatedDt=GETDATE()
	   ,IpAddress=@IpAddress
       WHERE Id=@Id 
END

IF(@Action='D')
BEGIN	       
       DELETE FROM  PA_Mst_CurrentPosting 
       WHERE Id=@Id
END
   
END







GO
/****** Object:  StoredProcedure [dbo].[Designation_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		A.MAMATHA
-- Create date: 3/7/2019
-- Description:	DESIGNATION MASTER
-- =============================================
CREATE PROCEDURE [dbo].[Designation_IUDR]
@DesignationID INT=NULL,
@Desig VARCHAR(50)=NULL,
@cadre INT=null,
@User INT=NULL,
@AddedIP varchar(50)=NULL,

@Action CHAR(5)
AS
BEGIN
	SET NOCOUNT ON;

  
IF(@Action='I')
BEGIN
	IF EXISTS(SELECT 1 FROM PA_Mst_Designations WHERE Designation=@Desig AND Cadre=@cadre )
		SELECT 'Designation already exists'
	ELSE
		INSERT INTO PA_Mst_Designations(Designation,Cadre,AddedBy,AddedIP,AddedOn) VALUES(@Desig,@cadre,@User,@AddedIP,GETDATE())
END

IF(@Action='R')
	SELECT DesignationID,Designation,Cadre FROM PA_Mst_Designations WHERE (@DesignationID IS NULL OR DesignationID=@DesignationID or @DesignationID=0) ORDER BY Cadre


IF(@Action='U')
	UPDATE PA_Mst_Designations SET Designation=@Desig, Cadre=@cadre,UpdatedOn=GETDATE(),UpdatedBy=@User,UpdatedIP=@AddedIP WHERE DesignationID=@DesignationID

IF(@Action='D')
	DELETE FROM PA_Mst_Designations WHERE DesignationID=@DesignationID


END


GO
/****** Object:  StoredProcedure [dbo].[District_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		A.Mamatha
-- Create date: 30/9/2019
-- Description:	DISTRICT IUDR
--EXEC District_IUDR 37,0,'test1','admin','I'
-- =============================================
CREATE PROCEDURE [dbo].[District_IUDR]
@statecode int=null,
@distcode int=null,
@distcode_LG int=null,
@DistName varchar(50)=null,
@user varchar(15)=null,
@action varchar(1)
AS
BEGIN
	SET NOCOUNT ON;
DECLARE @MaxId varchar(10), @DIST INT
IF(@action='I')
BEGIN
	IF EXISTS (SELECT * FROM PA_Mst_District WHERE StateCode=@statecode AND DistName=@DistName)
		SELECT 'District Name Already Exists'
	ELSE
		BEGIN
			IF(EXISTS(SELECT 1 FROM PA_Mst_District WHERE StateCode=@statecode))
			BEGIN
				SET @MaxId=(SELECT top 1 DistCode FROM PA_Mst_District WHERE StateCode=@statecode ORDER BY DistCode  DESC)
				SET @DIST= @MaxId+1					
			END
				ELSE
					SELECT @DIST=CAST(CAST(@statecode AS varchar)+'01' AS INT)		
			--SELECT @DIST
			INSERT INTO PA_Mst_District(StateCode,DistCode,DistCode_LG,DistName,AddedBy,Active) VALUES (@statecode, @DIST,@distcode_LG, @DistName,@user,'1')
		END
END

IF(@action='R')
BEGIN
	SELECT DistCode,DistName,DistCode_LG,S.State,S.StateCode,Active FROM PA_Mst_District D
	INNER JOIN PA_Mst_State S ON S.StateCode=D.StateCode
	 WHERE D.StateCode=@statecode 
		
END

IF(@action='U')
BEGIN
	UPDATE PA_Mst_District SET DistName=@DistName,DistCode_LG=@distcode_LG, UpdatedOn=GETDATE() WHERE StateCode=@statecode AND DistCode=@distcode
		
END

IF(@action='D')
BEGIN
	DELETE FROM PA_Mst_District WHERE StateCode=@statecode AND DistCode=@distcode
		
END




END


GO
/****** Object:  StoredProcedure [dbo].[EducationMaster_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EducationMaster_IUDR]
@Qualification_Code int=NULL,
@Discipline_Code int=NULL, 
@University VARCHAR(50)=NULL,
@yearOfPass Date=NULL,
@LoggedIn_Dt Datetime=NULL, 
@DepCode varchar(20)=NULL,
@StateCode VARCHAR(10)=NULL,
@IpAddress VARCHAR(20)=NULL,
@user varchar(10)=NULL,
@Action char(2)=NULL
 
AS

BEGIN

IF(@Action='I')

BEGIN
	     INSERT INTO PA_Mst_Education
           (Qualification_Code, Discipline_Code,University,yearOfPass,LoggedIn_Dt,IpAddress,Loggedin_User) 
		   
		   VALUES(@Qualification_Code, @Discipline_Code,@University,@yearOfPass,GETDATE(),@IpAddress,@user)  

	END
IF(@Action='R')

  BEGIN
	       
		   Select M.Qualification_Code,D.Qualification_Name,O.Discipline_Name,M.Discipline_Code,M.University,
		   CONVERT(VARCHAR, M.yearOfPass,103) AS yearOfPass
		   from  PA_Mst_Education M
		   INNER JOIN PA_Mst_Qualification D ON D.Qualification_Code=M.Qualification_Code
		   INNER JOIN PA_Mst_Discipline O ON O.Discipline_Code=M.Discipline_Code 

   END
	--IF(@Action='U')

 --   BEGIN
	       
	--	   UPDATE Dtls_Employee SET EmpName=@EmpName,FatherName=@FName,EmpType=@EmpType,Gender=@Gender,Qualification=@Qualification,dob=@DOB,
	--	                            category=@Category,Aadhar=@Aadhar,Pan=@Pan,mobile=@Mobile,mailid=@MailId,address=@Address,PinCode=@PinCode,
	--								StateCode=@StateCode,DistCode=@DistCode,MandCode=@MandCode,EmpPhotoName=@EmpPhotoName,EmpPhotoContent=@EmpPhotoContent,
	--								EmpPhotoExt=@EmpPhotoExt,DifferentlyAbled=@DifferentlyAble,DisabilityPercent=@Disability,DesignationCode=@Desig,
	--								DOJ=@DOJ,Branch=@Branch,BankCode=@BankCode,IFSCCode=@IFSCCode,AccountNo=@AccNo,BasicSalary=@CurrentSalary,
	--								LastIncrementDt=@LastIncrementDt,ScaleofPay=@ScaleofPay,UAN=@UAN,EPFNumber=@EPFNumber,GPFNo=@GPFNo,
	--								ESINumber=@ESINumber,DeptCode=@DeptCode,IpAddress=@IpAddress,UpdatedUserId=@UserId,UpdatedDt=@SysDate

	--								WHERE EmpCode=@EmpCode

	--								select 'Data Updated successfully'

									

 --  END
  

END










GO
/****** Object:  StoredProcedure [dbo].[EmpEdu_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		A.MAMATHA
-- Create date: 07/01/2019
-- Description:	Emp Education DETAILS
-- =============================================
CREATE PROCEDURE [dbo].[EmpEdu_IUDR]
@Empid int=NULL,
@Exam varchar(50)=NULL,
@Board varchar(250)=NULL,
@Yearp varchar(10)=NULL,
@Marks varchar(10)=NULL,
@user BIGINT=NULL,
@E TVP_Edu READONLY,
@Action CHAR(5)

AS
BEGIN
	SET NOCOUNT ON;
IF(@Action='I')
	INSERT INTO PA_Dtls_EmpEducation (EmpId ,Exam ,Board_University ,YearOfPassing ,Marks ,AddedBy)
	SELECT @Empid, Exam, Board ,Yearp,  Marks, @user FROM @E

IF(@Action='R')

	SELECT Id,Q.Qualification_Name,Exam,Board_University,YearOfPassing,Marks FROM PA_Dtls_EmpEducation E
	INNER JOIN PA_Mst_Qualification Q ON Q.Qualification_Code=e.Exam
	 WHERE EmpId=@Empid 

IF(@Action='U')
	UPDATE PA_Dtls_EmpEducation SET Exam=@Exam ,Board_University=@Board ,YearOfPassing=@Yearp ,Marks=@Marks,
	UpdatedOn=GETDATE(), UpdatedBy=@user WHERE Id=@Empid

IF(@Action='D')
	DELETE FROM PA_Dtls_EmpEducation WHERE Id=@Empid AND Exam=@Exam

END
GO
/****** Object:  StoredProcedure [dbo].[EmpLeave_Details]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		A.MAMATHA
-- Create date: 04/10/2019
-- Description:	LEAVE TYPES
-- =============================================
CREATE PROCEDURE [dbo].[EmpLeave_Details]
@EmpCode VARCHAR(10)=NULL,
@LeaveType INT=NULL,
@LeaveType_SC CHAR(1)=NULL,
@FromDate DATETIME=NULL,
@ToDate DATETIME=NULL,
@P_HdayFrm NUMERIC(2,1)=NULL,
@P_HdayTo NUMERIC(2,1)=NULL,
@Sation_leave int=NULL,
@Address_Leave VARCHAR(75)=NULL,
@Remarks VARCHAR(250)=NULL,
@CL_Remarks varchar(250)=NULL,
@Approvedby INT=NULL,
@Approveddt datetime=null,
@Leave_Doc varbinary(max)=null,
@User BIGINT=NULL,
@Reason varchar(250)=NULL,
@MaxLeaves INT=NULL,
@Noofdays NUMERIC(3,1)=NULL,
@Status varchar(2)=NULL,
@PendingAt varchar(10)=NULL,
@TVP_LeaveDetails TVP_LeaveDetails READONLY,
@Action CHAR(5)='SI'
AS
BEGIN
BEGIN TRY  
BEGIN TRANSACTION 
	SET NOCOUNT ON;
	declare @SysDate datetime=Getdate(),@LeaveBalance int=NULL,@MaxLeaveDays int=NULL
IF(@Action='SI')
BEGIN	
		IF(EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave_Old WHERE  EmpCode=@EmpCode AND FromDate IN (SELECT FromDate FROM @TVP_LeaveDetails)))
			SELECT '0' AS Flag,'Leave already applied for selected dates' as Msg
		ELSE
		BEGIN   

			INSERT INTO PA_Dtls_EmpLeave_Old (EmpCode,LeaveType,LeaveType_SC,FromDate,ToDate,Noofdays,P_HdayFrm,P_HdayTo,Sation_leave,Address_Leave,Reason,Remarks,CL_Remarks,Status,Leave_Entrydate,PendingAt)
			SELECT @EmpCode,LeaveType,@LeaveType_SC,FromDate,ToDate,CASE when PHDay_Frm= 0.5 and PHDay_To= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-PHDay_Frm-PHDay_To) 
			ELSE case when PHDay_Frm= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-PHDay_Frm)
			ELSE CASE when PHDay_To= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-PHDay_To) 
			else (DATEDIFF(day,FromDate,ToDate)+1) end END END,PHDay_Frm,PHDay_To,@Sation_leave,@Address_Leave,@Reason,@Remarks,@CL_Remarks,'F',@SysDate,@PendingAt FROM @TVP_LeaveDetails
			
			INSERT INTO PA_Upld_LeaveDoc(EmpCode,LeaveType,FromDate,ToDate,Leave_Doc,Entrydate)
			SELECT @EmpCode,LeaveType,FromDate,ToDate,@Leave_Doc,@SysDate FROM @TVP_LeaveDetails

			SELECT '1' AS Flag,'Submitted Successfully' as Msg  
		END
END
IF(@Action='SR')/* Get Leave Details under eporting officer */
BEGIN	
		SELECT E.EmployeeCode,E.EmployeeName,d.Designation,Convert(varchar,l.FromDate,103) as frmdt,
		CASE when P_HdayFrm= 0.5 and P_HdayTo= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayFrm-P_HdayTo) 
			ELSE case when P_HdayFrm= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayFrm)
			ELSE CASE when P_HdayTo= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayTo) 
			else (DATEDIFF(day,FromDate,ToDate)+1) end END END as noofdays,
		Convert(varchar,l.ToDate,103) as todt,case when P_HdayFrm=0.5 then 'Half day' else 'Full day' end as P_HdayFrm,
		L.LeaveType,LT.TypeName,
		case when P_HdayTo=0.5 then 'Half day' else 'Full day' end as P_HdayTo,'1' as Flag,L.Status
		 FROM PA_Dtls_EmpLeave_Old L
		INNER JOIN PA_Mst_Employee E ON E.EmployeeCode=L.EmpCode
		INNER JOIN PA_Mst_Designations D ON D.DesignationID=E.CurrentDesignation
		INNER JOIN PA_Mst_LeaveTypes LT ON LT.TypeID=L.LeaveType
		 --WHERE EmpCode IN (SELECT  EmpCode FROM PA_Dtls_Users WHERE ReportingOfficer=@EmpCode) AND ISNULL(L.Approvedby,'0') <> @EmpCode or ISNULL(L.Approvedby,'0')='0'
		 WHERE ISNULL(L.PendingAt,'0') IN (@EmpCode)   --AND ISNULL(L.Approvedby,'0') <> @EmpCode
		 and ISNULL(l.NoofApprovals,0)<=e.NoofRepOfc and l.Status in (select data from dbo.split('E,A',','))
END
IF(@Action='FR')/* Get Leave Details for final approval */
BEGIN	
		SELECT E.EmployeeCode,E.EmployeeName,d.Designation,Convert(varchar,l.FromDate,103) as frmdt,
		CASE when P_HdayFrm= 0.5 and P_HdayTo= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayFrm-P_HdayTo) 
			ELSE case when P_HdayFrm= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayFrm)
			ELSE CASE when P_HdayTo= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayTo) 
			else (DATEDIFF(day,FromDate,ToDate)+1) end END END as noofdays,
		Convert(varchar,l.ToDate,103) as todt,case when P_HdayFrm=0.5 then 'Half day' else 'Full day' end as P_HdayFrm,
		L.LeaveType,LT.TypeName,
		case when P_HdayTo=0.5 then 'Half day' else 'Full day' end as P_HdayTo,
		CASE WHEN L.Status ='A' THEN '0' else '1'  end as Flag,L.Status
		 FROM PA_Dtls_EmpLeave_Old L
		INNER JOIN PA_Mst_Employee E ON E.EmployeeCode=L.EmpCode
		INNER JOIN PA_Mst_Designations D ON D.DesignationID=E.CurrentDesignation
		INNER JOIN PA_Mst_LeaveTypes LT ON LT.TypeID=L.LeaveType
		 WHERE l.Status in (select data from dbo.split(@Status,','))
END
IF(@Action='SA')/* Approval of Leave  */  
BEGIN	
		insert into PA_Dtls_EmpLeave_Track(EmpCode,LeaveType,FromDate,ToDate,LeaveType_SC,Noofdays,P_HdayFrm,P_HdayTo,Sation_leave,Address_Leave,Reason,
											Remarks,Leave_Entrydate,Status,Approvedby,Approveddt,TimeStamp)
		select EmpCode,LeaveType,FromDate,ToDate,LeaveType_SC,Noofdays,P_HdayFrm,P_HdayTo,Sation_leave,Address_Leave,Reason,
											Remarks,Leave_Entrydate,Status,Approvedby,Approveddt,@SysDate from PA_Dtls_EmpLeave_Old where EmpCode=@EmpCode
		if(@Status='F')
		begin
			update PA_Dtls_EmpLeave_Old  set status=@Status, Approv_AdminId=@User,AdminApprovedt=@SysDate where EmpCode=@EmpCode and status='A' AND LeaveType=@LeaveType

			UPDATE PA_Dtls_LeaveBalance SET LeaveBalance=LeaveBalance-@Noofdays, UpdatedOn=GETDATE()	WHERE EmpId=@EmpCode AND LeaveTypeId=@LeaveType
		end
		ELSE
			update PA_Dtls_EmpLeave_Old  set status=@Status,NoofApprovals=isnull(NoofApprovals,0)+1,PendingAt=@PendingAt, Approvedby=@User,Approveddt=@SysDate where EmpCode=@EmpCode
			and status NOT IN ('C','R','F') AND LeaveType=@LeaveType
			select 'Updated Successfully'
        if(@Status='R')
		begin
			update PA_Dtls_EmpLeave_Old  set status=@Status, Approv_AdminId=@User,AdminApprovedt=@SysDate where EmpCode=@EmpCode and status='A' AND LeaveType=@LeaveType

			UPDATE PA_Dtls_LeaveBalance SET LeaveBalance=LeaveBalance-@Noofdays, UpdatedOn=GETDATE()	WHERE EmpId=@EmpCode AND LeaveTypeId=@LeaveType
		end
		ELSE
			update PA_Dtls_EmpLeave_Old  set status=@Status,NoofApprovals=isnull(NoofApprovals,0)+1,PendingAt=@PendingAt, Approvedby=@User,Approveddt=@SysDate where EmpCode=@EmpCode
			and status NOT IN ('C','R','F') AND LeaveType=@LeaveType
		select 'Updated Successfully'
		  if(@Status='S')
		begin
			update PA_Dtls_EmpLeave_Old  set status=@Status, Approv_AdminId=@User,AdminApprovedt=@SysDate where EmpCode=@EmpCode and status='A' AND LeaveType=@LeaveType

			UPDATE PA_Dtls_LeaveBalance SET LeaveBalance=LeaveBalance-@Noofdays, UpdatedOn=GETDATE()	WHERE EmpId=@EmpCode AND LeaveTypeId=@LeaveType
		end
		ELSE
			update PA_Dtls_EmpLeave_Old  set status=@Status,NoofApprovals=isnull(NoofApprovals,0)+1,PendingAt=@PendingAt, Approvedby=@User,Approveddt=@SysDate where EmpCode=@EmpCode
			and status NOT IN ('C','R','F') AND LeaveType=@LeaveType
		select 'Updated Successfully'
END 
IF(@Action='LD')/* Individual Leave Details  */  
BEGIN	
		SELECT E.EmployeeCode,E.EmployeeName,d.Designation,Convert(varchar,l.FromDate,103) as frmdt,
		CASE when P_HdayFrm= 0.5 and P_HdayTo= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayFrm-P_HdayTo) 
		ELSE case when P_HdayFrm= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayFrm)
		ELSE CASE when P_HdayTo= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayTo) 
		else (DATEDIFF(day,FromDate,ToDate)+1) end END END as noofdays,
		Convert(varchar,l.ToDate,103) as todt,case when P_HdayFrm=0.5 then 'Half day' else 'Full day' end as P_HdayFrm,
		case when P_HdayTo=0.5 then 'Half day' else 'Full day' end as P_HdayTo,
		CASE WHEN Status ='E' THEN 'Pending For Approval'
		when Status = 'A' THEN 'Approved by '+RE.EmployeeName
		WHEN Status='F' THEN 'Leave Sanctioned' end as Status,
		 CASE WHEN L.Status ='F' THEN '0' else '1'  end as Flag
		 FROM PA_Dtls_EmpLeave_Old L
		INNER JOIN PA_Mst_Employee E ON E.EmployeeCode=L.EmpCode
		LEFT OUTER JOIN PA_Mst_Employee RE ON RE.EmployeeCode=L.Approvedby
		INNER JOIN PA_Mst_Designations D ON D.DesignationID=E.CurrentDesignation
		 WHERE EmpCode =@EmpCode  and Status!='C'
		 order by L.Status
END 
IF(@Action='CL')/* Cancel Leave  */  
BEGIN	
		insert into PA_Dtls_EmpLeave_Track(EmpCode,LeaveType,FromDate,ToDate,LeaveType_SC,Noofdays,P_HdayFrm,P_HdayTo,Sation_leave,Address_Leave,Reason,
											Remarks,Leave_Entrydate,Status,Approvedby,Approveddt,TimeStamp)
		select EmpCode,LeaveType,FromDate,ToDate,LeaveType_SC,Noofdays,P_HdayFrm,P_HdayTo,Sation_leave,Address_Leave,Reason,
											Remarks,Leave_Entrydate,Status,Approvedby,Approveddt,@SysDate from PA_Dtls_EmpLeave_Old where EmpCode=@EmpCode
		update PA_Dtls_EmpLeave_Old  set status=@Status, Approvedby=NULL,Approveddt=NULL where EmpCode=@EmpCode		

		select 'Updated Successfully'
END 
IF(@Action='LB')/* Get Leave Balance and MaxLeaves at a time details  */  
BEGIN	
		
		SELECT lt.MaxAt_A_Time,lb.LeaveBalance FROM PA_Mst_LeaveTypes LT
		INNER JOIN PA_Dtls_LeaveBalance LB ON LB.LeaveTypeId=LT.TypeID
		where lb.EmpId=@EmpCode and lb.LeaveTypeId=@LeaveType and LB.LeaveBalance>0

END 
COMMIT  
END TRY  
BEGIN CATCH  
ROLLBACK TRANSACTION;  
DECLARE @ErrMsg nvarchar(4000), @ErrSeverity INT  
SELECT @ErrMsg = ERROR_MESSAGE(),  
@ErrSeverity = ERROR_SEVERITY()  
RAISERROR(@ErrMsg, @ErrSeverity, 1)  
END CATCH 
END
GO
/****** Object:  StoredProcedure [dbo].[EmpLeave_Details_TEST]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		A.MAMATHA
-- Create date: 04/10/2019
-- Description:	LEAVE TYPES
-- =============================================
CREATE PROCEDURE [dbo].[EmpLeave_Details_TEST]
@EmpCode VARCHAR(10)=NULL,
@LeaveType INT=NULL,
@LeaveType_SC CHAR(1)=NULL,
@FromDate DATETIME=NULL,
@ToDate DATETIME=NULL,
@P_HdayFrm NUMERIC(2,1)=NULL,
@P_HdayTo NUMERIC(2,1)=NULL,
@Sation_leave int=NULL,
@Address_Leave VARCHAR(75)=NULL,
@Remarks VARCHAR(250)=NULL,
@CL_Remarks varchar(250)=NULL,
@Approvedby INT=NULL,
@Approveddt datetime=null,
@Leave_Doc varbinary(max)=null,
@User BIGINT=NULL,
@Reason varchar(250)=NULL,
@MaxLeaves INT=NULL,
@Noofdays NUMERIC(3,1)=NULL,
@Status varchar(2)=NULL,
@PendingAt varchar(10)=NULL,
@TVP_LeaveDetails TVP_LeaveDetails READONLY,
@Action CHAR(5)='SI'
AS
BEGIN
BEGIN TRY  
BEGIN TRANSACTION 
	SET NOCOUNT ON;
	declare @SysDate datetime=Getdate(),@LeaveBalance int=NULL,@MaxLeaveDays int=NULL
IF(@Action='SI')
BEGIN	
		IF(EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave WHERE  EmpCode=@EmpCode AND FromDate IN (SELECT FromDate FROM @TVP_LeaveDetails)))
			SELECT '0' AS Flag,'Leave already applied for selected dates' as Msg
		ELSE
		BEGIN   

			INSERT INTO PA_Dtls_EmpLeave (EmpCode,LeaveType,LeaveType_SC,FromDate,ToDate,Noofdays,P_HdayFrm,P_HdayTo,Sation_leave,Address_Leave,Reason,Remarks,CL_Remarks,Status,Leave_Entrydate,PendingAt)
			SELECT @EmpCode,LeaveType,@LeaveType_SC,FromDate,ToDate,CASE when PHDay_Frm= 0.5 and PHDay_To= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-PHDay_Frm-PHDay_To) 
			ELSE case when PHDay_Frm= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-PHDay_Frm)
			ELSE CASE when PHDay_To= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-PHDay_To) 
			else (DATEDIFF(day,FromDate,ToDate)+1) end END END,PHDay_Frm,PHDay_To,@Sation_leave,@Address_Leave,@Reason,@Remarks,@CL_Remarks,'F',@SysDate,@PendingAt FROM @TVP_LeaveDetails
			
			INSERT INTO PA_Upld_LeaveDoc(EmpCode,LeaveType,FromDate,ToDate,Leave_Doc,Entrydate)
			SELECT @EmpCode,LeaveType,FromDate,ToDate,@Leave_Doc,@SysDate FROM @TVP_LeaveDetails

			SELECT '1' AS Flag,'Submitted Successfully' as Msg  
		END
END
IF(@Action='SR')/* Get Leave Details under eporting officer */
BEGIN	
		SELECT E.EmployeeCode,E.EmployeeName,d.Designation,Convert(varchar,l.FromDate,103) as frmdt,
		CASE when P_HdayFrm= 0.5 and P_HdayTo= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayFrm-P_HdayTo) 
			ELSE case when P_HdayFrm= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayFrm)
			ELSE CASE when P_HdayTo= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayTo) 
			else (DATEDIFF(day,FromDate,ToDate)+1) end END END as noofdays,
		Convert(varchar,l.ToDate,103) as todt,case when P_HdayFrm=0.5 then 'Half day' else 'Full day' end as P_HdayFrm,
		L.LeaveType,LT.TypeName,
		case when P_HdayTo=0.5 then 'Half day' else 'Full day' end as P_HdayTo,'1' as Flag,L.Status
		 FROM PA_Dtls_EmpLeave L
		INNER JOIN PA_Mst_Employee E ON E.EmployeeCode=L.EmpCode
		INNER JOIN PA_Mst_Designations D ON D.DesignationID=E.CurrentDesignation
		INNER JOIN PA_Mst_LeaveTypes LT ON LT.TypeID=L.LeaveType
		 --WHERE EmpCode IN (SELECT  EmpCode FROM PA_Dtls_Users WHERE ReportingOfficer=@EmpCode) AND ISNULL(L.Approvedby,'0') <> @EmpCode or ISNULL(L.Approvedby,'0')='0'
		 WHERE ISNULL(L.PendingAt,'0') IN (@EmpCode)   AND ISNULL(L.Approvedby,'0') <> @EmpCode
		 and ISNULL(l.NoofApprovals,0)<=e.NoofRepOfc and l.Status in (select data from dbo.split('R,F,S',','))
END
IF(@Action='FR')/* Get Leave Details for final approval */
BEGIN	
		SELECT E.EmployeeCode,E.EmployeeName,d.Designation,Convert(varchar,l.FromDate,103) as frmdt,
		CASE when P_HdayFrm= 0.5 and P_HdayTo= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayFrm-P_HdayTo) 
			ELSE case when P_HdayFrm= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayFrm)
			ELSE CASE when P_HdayTo= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayTo) 
			else (DATEDIFF(day,FromDate,ToDate)+1) end END END as noofdays,
		Convert(varchar,l.ToDate,103) as todt,case when P_HdayFrm=0.5 then 'Half day' else 'Full day' end as P_HdayFrm,
		L.LeaveType,LT.TypeName,
		case when P_HdayTo=0.5 then 'Half day' else 'Full day' end as P_HdayTo,
		CASE WHEN L.Status ='A' THEN '0' else '1'  end as Flag,L.Status
		 FROM PA_Dtls_EmpLeave L
		INNER JOIN PA_Mst_Employee E ON E.EmployeeCode=L.EmpCode
		INNER JOIN PA_Mst_Designations D ON D.DesignationID=E.CurrentDesignation
		INNER JOIN PA_Mst_LeaveTypes LT ON LT.TypeID=L.LeaveType
		 WHERE l.Status in (select data from dbo.split(@Status,','))
END
IF(@Action='SA')/* Approval of Leave  */  
BEGIN	
		insert into PA_Dtls_EmpLeave_Track(EmpCode,LeaveType,FromDate,ToDate,LeaveType_SC,Noofdays,P_HdayFrm,P_HdayTo,Sation_leave,Address_Leave,Reason,
											Remarks,Leave_Entrydate,Status,Approvedby,Approveddt,TimeStamp)
		select EmpCode,LeaveType,FromDate,ToDate,LeaveType_SC,Noofdays,P_HdayFrm,P_HdayTo,Sation_leave,Address_Leave,Reason,
											Remarks,Leave_Entrydate,Status,Approvedby,Approveddt,@SysDate from PA_Dtls_EmpLeave where EmpCode=@EmpCode

											update PA_Dtls_EmpLeave  set status=@Status, Approv_AdminId=@User,AdminApprovedt=@SysDate,PendingAt=@PendingAt,Remaeks_Leave=@Remarks  where EmpCode=@EmpCode AND LeaveType=@LeaveType
		--if(@Status='F')
		--begin
		--	update PA_Dtls_EmpLeave  set status=@Status, Approv_AdminId=@User,AdminApprovedt=@SysDate where EmpCode=@EmpCode and status='A' AND LeaveType=@LeaveType

		--	UPDATE PA_Dtls_LeaveBalance SET LeaveBalance=LeaveBalance-@Noofdays, UpdatedOn=GETDATE()	WHERE EmpId=@EmpCode AND LeaveTypeId=@LeaveType
		--end
		--ELSE
		--	update PA_Dtls_EmpLeave  set status=@Status,NoofApprovals=isnull(NoofApprovals,0)+1,PendingAt=@PendingAt, Approvedby=@User,Approveddt=@SysDate where EmpCode=@EmpCode
		--	and status NOT IN ('C','R','F') AND LeaveType=@LeaveType
		--	select 'Updated Successfully'
  --      if(@Status='R')
		--begin
		--	update PA_Dtls_EmpLeave  set status=@Status, Approv_AdminId=@User,AdminApprovedt=@SysDate where EmpCode=@EmpCode and status='A' AND LeaveType=@LeaveType

		--	UPDATE PA_Dtls_LeaveBalance SET LeaveBalance=LeaveBalance-@Noofdays, UpdatedOn=GETDATE()	WHERE EmpId=@EmpCode AND LeaveTypeId=@LeaveType
		--end
		--ELSE
		--	update PA_Dtls_EmpLeave  set status=@Status,NoofApprovals=isnull(NoofApprovals,0)+1,PendingAt=@PendingAt, Approvedby=@User,Approveddt=@SysDate where EmpCode=@EmpCode
		--	and status NOT IN ('C','R','F') AND LeaveType=@LeaveType
		--select 'Updated Successfully'
		--  if(@Status='S')
		--begin
		--	update PA_Dtls_EmpLeave  set status=@Status, Approv_AdminId=@User,AdminApprovedt=@SysDate where EmpCode=@EmpCode and status='A' AND LeaveType=@LeaveType

		--	UPDATE PA_Dtls_LeaveBalance SET LeaveBalance=LeaveBalance-@Noofdays, UpdatedOn=GETDATE()	WHERE EmpId=@EmpCode AND LeaveTypeId=@LeaveType
		--end
		--ELSE
		--	update PA_Dtls_EmpLeave  set status=@Status,NoofApprovals=isnull(NoofApprovals,0)+1,PendingAt=@PendingAt, Approvedby=@User,Approveddt=@SysDate where EmpCode=@EmpCode
		--	and status NOT IN ('C','R','F') AND LeaveType=@LeaveType
		select 'Updated Successfully'
END 
IF(@Action='LD')/* Individual Leave Details  */  
BEGIN	
		SELECT E.EmployeeCode,E.EmployeeName,d.Designation,Convert(varchar,l.FromDate,103) as frmdt,
		CASE when P_HdayFrm= 0.5 and P_HdayTo= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayFrm-P_HdayTo) 
		ELSE case when P_HdayFrm= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayFrm)
		ELSE CASE when P_HdayTo= 0.5 then ((DATEDIFF(day,FromDate,ToDate)+1)-P_HdayTo) 
		else (DATEDIFF(day,FromDate,ToDate)+1) end END END as noofdays,
		Convert(varchar,l.ToDate,103) as todt,case when P_HdayFrm=0.5 then 'Half day' else 'Full day' end as P_HdayFrm,
		case when P_HdayTo=0.5 then 'Half day' else 'Full day' end as P_HdayTo,
		CASE WHEN Status ='F' THEN 'Pending For Approval' 
		when Status = 'R' THEN 'Approved by '+RE.EmployeeName
		WHEN Status='A' THEN 'Leave Sanctioned' end as Status,
		 CASE WHEN L.Status ='A' THEN '0' else '1'  end as Flag
		 FROM PA_Dtls_EmpLeave L
		INNER JOIN PA_Mst_Employee E ON E.EmployeeCode=L.EmpCode
		LEFT OUTER JOIN PA_Mst_Employee RE ON RE.EmployeeCode=L.Approvedby
		INNER JOIN PA_Mst_Designations D ON D.DesignationID=E.CurrentDesignation
		 WHERE EmpCode =@EmpCode  and Status!='C'
		 order by L.Status
END 
IF(@Action='CL')/* Cancel Leave  */  
BEGIN	
		insert into PA_Dtls_EmpLeave_Track(EmpCode,LeaveType,FromDate,ToDate,LeaveType_SC,Noofdays,P_HdayFrm,P_HdayTo,Sation_leave,Address_Leave,Reason,
											Remarks,Leave_Entrydate,Status,Approvedby,Approveddt,TimeStamp)
		select EmpCode,LeaveType,FromDate,ToDate,LeaveType_SC,Noofdays,P_HdayFrm,P_HdayTo,Sation_leave,Address_Leave,Reason,
											Remarks,Leave_Entrydate,Status,Approvedby,Approveddt,@SysDate from PA_Dtls_EmpLeave where EmpCode=@EmpCode
		update PA_Dtls_EmpLeave  set status=@Status, Approvedby=NULL,Approveddt=NULL where EmpCode=@EmpCode		

		select 'Updated Successfully'
END 
IF(@Action='LB')/* Get Leave Balance and MaxLeaves at a time details  */  
BEGIN	
		
		SELECT lt.MaxAt_A_Time,lb.LeaveBalance FROM PA_Mst_LeaveTypes LT
		INNER JOIN PA_Dtls_LeaveBalance LB ON LB.LeaveTypeId=LT.TypeID
		where lb.EmpId=@EmpCode and lb.LeaveTypeId=@LeaveType

END 
COMMIT  
END TRY  
BEGIN CATCH  
ROLLBACK TRANSACTION;  
DECLARE @ErrMsg nvarchar(4000), @ErrSeverity INT  
SELECT @ErrMsg = ERROR_MESSAGE(),  
@ErrSeverity = ERROR_SEVERITY()  
RAISERROR(@ErrMsg, @ErrSeverity, 1)  
END CATCH 
END
GO
/****** Object:  StoredProcedure [dbo].[EmpLeave_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		A.MAMATHA
-- Create date: 29/01/2020
-- Description:	APPLY LEAVE
-- =============================================



CREATE PROCEDURE [dbo].[EmpLeave_IUDR] 
@ApplicationId	 VARCHAR(50)=NULL,
@EmpType		CHAR(3)=NULL,
@EmpCode     VARCHAR(50)=NULL,
@EmpId       INT=NULL,
@TestDay      DATE=NULL,
@LeaveType   CHAR(1)=NULL,
@Leave_Type CHAR(1)=NULL,
@Reason      VARCHAR(150)=NULL,
@Nod         DECIMAL(3,1)=NULL,
@Prefix      VARCHAR(50)=NULL,
@Postfix     VARCHAR(50)=NULL,
@StnLv       BIT=NULL,
@StnLvAddress VARCHAR(100)=NULL,
@Rmrks       VARCHAR(250)=NULL,
@FileType	 varchar(10)	=NULL,
@FileName	 varchar(50)	=NULL,
@FileContent	  varbinary(MAX)	=NULL,
@IP               VARCHAR(50)=NULL,
@Tvp TVP_EmpLeave READONLY,
@Status         INT=NULL,
@OfficerStatus   CHAR(1)=NULL,
@CancelFrm date=NULL,
@FromDate date=NULL,
@ToDate  date=NULL,
@Joining_FromDate  datetime=NULL,
@Joining_FromType  datetime=NULL,
@CancelTo date=NULL,
@Flag CHAR(1)=NULL,
@Action   CHAR(15)
AS
BEGIN

BEGIN TRY  
BEGIN TRANSACTION 

	SET NOCOUNT ON;
DECLARE @AplId VARCHAR(50),@Aid VARCHAR(50), @N INT

IF(@Action='LB')/* Get Leave Balance and MaxLeaves at a time details  */  
BEGIN	
	SELECT lt.MaxAt_A_Time,lb.LeaveBalance FROM PA_Mst_LeaveTypes LT
	INNER JOIN PA_Dtls_LeaveBalance LB ON LB.LeaveTypeId=LT.TypeID
	where lb.EmpId=@EmpId and lb.LeaveTypeId=@LeaveType and LB.LeaveBalance>0
END 



IF(@Action='I')
BEGIN
	SET @AplId=@EmpCode+'/'+UPPER ( CONVERT(CHAR(3), GETDATE(), 0))+'/'+CONVERT(VARCHAR, YEAR(GETDATE()))+'/'
	IF EXISTS (SELECT 1 FROM PA_Dtls_EmpLeave WHERE EmpId=@EmpId)
	BEGIN
		--SELECT @Aid= ApplicationId FROM PA_Dtls_EmpLeave WHERE EmpId=@EmpId
		set  @Aid=(select  top 1 ApplicationId FROM PA_Dtls_EmpLeave WHERE EmpId=@EmpId order by EntryOn desc) 
		SELECT @N= CAST( SUBSTRING(@Aid,LEN(@AplId)+1,LEN(@Aid)-LEN(@AplId)) AS INT) FROM PA_Dtls_EmpLeave WHERE EmpId=@EmpId 
		SET @AplId= @AplId+ CAST(@N+1 AS VARCHAR)
	END
	ELSE
		SET @AplId= @AplId+'1'


	INSERT INTO PA_Dtls_EmpLeave (ApplicationId ,EmpId ,LeaveType ,Reason ,NoDays ,Prefix ,Postfix ,StationLeave, StnLvAddress ,Remarks,FileType,FileName,FileContent,EntryIP,Status)
	VALUES( @AplId, @EmpId,@LeaveType, @Reason, @Nod, @Prefix, @Postfix, @StnLv ,@StnLvAddress, @Rmrks,@FileType,@FileName,@FileContent,@IP,'1')
		
	INSERT INTO PA_Dtls_LeaveDetails (ApplicationId ,LeaveType ,FromDate ,FromType ,ToDate ,ToType,Nod)
	SELECT @AplId, LeaveType,FromDate,FromType,ToDate,ToType,nod FROM @Tvp		

	INSERT INTO PA_Dtls_LeaveStatus(Application_ID,Status) VALUES(@AplId,1)
END


IF(@Action='CHK')
BEGIN
	IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Forwording_Officer=@EmpId  AND Recommended_Officer <> @EmpId AND Sanction_Authority <> @EmpId)
		SELECT 'FO' AS TYPE
	ELSE IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Recommended_Officer=@EmpId AND Forwording_Officer <> @EmpId AND Sanction_Authority <> @EmpId)
		SELECT 'RO' AS TYPE
	ELSE IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Sanction_Authority=@EmpId AND Forwording_Officer <> @EmpId AND Recommended_Officer<> @EmpId)
		SELECT 'SO' AS TYPE
END

IF(@Action='CHKDAY')
BEGIN
	SELECT 1 FROM PA_Dtls_EmpLeave L INNER JOIN PA_Dtls_LeaveDetails T ON  L.ApplicationId=T.ApplicationId
	WHERE EmpId=@EmpId AND CAST(@TestDay AS DATE) BETWEEN CAST(FromDate AS DATE) AND CAST(ToDate AS DATE)
END

IF(@Action='FODATA')
BEGIN
	IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Forwording_Officer=@EmpId )
		IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave L INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID WHERE Status IN (1) AND U.Forwording_Officer=@EmpId )
			SELECT distinct L.ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,NoDays,
			CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'FO' AS TYPE--,ld.LeaveType,TypeName
			FROM PA_Dtls_EmpLeave L
			--inner join  PA_Dtls_LeaveDetails ld on ld.ApplicationId=L.ApplicationId and ld.LeaveType=L.Leave_Type
			INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
			INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
		    --left join PA_Mst_LeaveTypes lp on lp.TypeID=ld.LeaveType
			WHERE Status=1 AND U.Forwording_Officer=@EmpId
END


IF(@Action='RODATA')
BEGIN  
	IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Recommended_Officer=@EmpId )
		IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave L INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID WHERE Status IN (2) AND U.Recommended_Officer=@EmpId )
			SELECT distinct L.ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,NoDays,
			CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'RO' AS TYPE--,ld.LeaveType,TypeName
			FROM PA_Dtls_EmpLeave L
			--inner join  PA_Dtls_LeaveDetails ld on ld.ApplicationId=L.ApplicationId and ld.LeaveType=L.Leave_Type
			INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
			INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
			--left join PA_Mst_LeaveTypes lp on lp.TypeID=ld.LeaveType
			WHERE Status=2 AND U.Recommended_Officer=@EmpId
END

IF(@Action='SODATA')
BEGIN
	IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Sanction_Authority=@EmpId)
		IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave L INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID WHERE Status IN (4) AND U.Sanction_Authority=@EmpId )
			SELECT distinct L.ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,NoDays,
			CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'SO' AS TYPE--,ld.LeaveType,TypeName
			FROM PA_Dtls_EmpLeave L
			--inner join  PA_Dtls_LeaveDetails ld on ld.ApplicationId=L.ApplicationId and ld.LeaveType=L.Leave_Type
			INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
			INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
			--left join PA_Mst_LeaveTypes lp on lp.TypeID=ld.LeaveType
			WHERE Status=4 AND U.Sanction_Authority=@EmpId
END

IF(@Action='FODATA_C')
BEGIN
	IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Forwording_Officer=@EmpId )
			SELECT l.ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,ld.Nod as NoDays,
			CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'FOC' AS TYPE,Convert(varchar(10),ld.CancelFrm,103) as CancelFrm,
			Convert(varchar(10),ld.CancelTo,103) as CancelTo,Convert(varchar(10),ld.FromDate,103) as FromDate,
			Convert(varchar(10),ld.ToDate,103) as ToDate,ld.LeaveType,TypeName
			FROM PA_Dtls_EmpLeave L
			inner join  PA_Dtls_LeaveDetails ld on ld.ApplicationId=l.ApplicationId --and ld.LeaveType=L.Leave_Type
			INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
			INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
			left join PA_Mst_LeaveTypes lp on lp.TypeID=ld.LeaveType
			WHERE Status=10 AND U.Forwording_Officer=@EmpId
END

IF(@Action='RODATA_R')
BEGIN
	IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Recommended_Officer=@EmpId )
			SELECT l.ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,ld.Nod as NoDays,
			CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'ROC' AS TYPE,Convert(varchar(10),ld.CancelFrm,103) as CancelFrm,
			Convert(varchar(10),ld.CancelTo,103) as CancelTo,Convert(varchar(10),ld.FromDate,103) as FromDate,
			Convert(varchar(10),ld.ToDate,103) as ToDate,ld.LeaveType,TypeName
			FROM PA_Dtls_EmpLeave L
			inner join  PA_Dtls_LeaveDetails ld on ld.ApplicationId=l.ApplicationId --and ld.LeaveType=L.Leave_Type
			INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
			INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
			left join PA_Mst_LeaveTypes lp on lp.TypeID=ld.LeaveType
			WHERE Status=11 AND U.Recommended_Officer=@EmpId
END

IF(@Action='SODATA_S')
BEGIN
	IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Sanction_Authority=@EmpId )
			SELECT l.ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,ld.Nod as NoDays,
			CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'SOC' AS TYPE,Convert(varchar(10),ld.CancelFrm,103) as CancelFrm,
			Convert(varchar(10),ld.CancelTo,103) as CancelTo,Convert(varchar(10),ld.FromDate,103) as FromDate,
			Convert(varchar(10),ld.ToDate,103) as ToDate,ld.LeaveType,TypeName
			FROM PA_Dtls_EmpLeave L
			inner join  PA_Dtls_LeaveDetails ld on ld.ApplicationId=l.ApplicationId --and ld.LeaveType=L.Leave_Type
			INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
			INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
			left join PA_Mst_LeaveTypes lp on lp.TypeID=ld.LeaveType
			WHERE Status=12 AND U.Sanction_Authority=@EmpId
END

IF(@Action='DATA')
BEGIN
IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Forwording_Officer=@EmpId )
	BEGIN
		IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave L INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID WHERE Status=1 AND U.Forwording_Officer=@EmpId )
			SELECT ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,NoDays,
			CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'FO' AS TYPE
			FROM PA_Dtls_EmpLeave L
			INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
			INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
			WHERE Status=1 AND U.Forwording_Officer=@EmpId
		ELSE IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Recommended_Officer=@EmpId )
		BEGIN
			IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave L INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID WHERE Status=4 AND U.Recommended_Officer=@EmpId )
				SELECT ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,NoDays,
				CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'RO' AS TYPE
				FROM PA_Dtls_EmpLeave L
				INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
				INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
				WHERE Status=4 AND U.Recommended_Officer=@EmpId
		END
		ELSE IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Sanction_Authority=@EmpId )
		BEGIN
			IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave L INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID WHERE Status=6 AND U.Sanction_Authority=@EmpId )
				SELECT ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,NoDays,
				CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'SO' AS TYPE
				FROM PA_Dtls_EmpLeave L
				INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
				INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
				WHERE Status=6 AND U.Sanction_Authority=@EmpId
		END
	END
END
IF(@Action='VIEW')
BEGIN
	SELECT EmpCode+' - '+ EmpName AS Emp,Designation, CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,
	Reason, NoDays, T.LeaveType,LT.TypeName,CONVERT(VARCHAR,T.FromDate,103) AS FromDate,FromType,CONVERT(VARCHAR,T.ToDate,103) AS ToDate,ToType,t.Nod,
	CASE WHEN StationLeave='1' THEN 'YES' ELSE 'NO' END AS StationLeave, StnLvAddress,Prefix,Postfix, FileType,FileName,FileContent,Remarks, FORemarks, RORemarks, SORemarks,Status
	,isnull(CONVERT(VARCHAR,T.CancelFrm,103),'-') AS CancelFrm,isnull(CONVERT(VARCHAR,T.CancelTo,103),'-') AS CancelTo,
	  isnull(CONVERT(VARCHAR,T.LeaveExtensionDt,103),'-') AS LeaveExtensionDt,isnull(ExtendedNod,'-') as ExtendedNod
	FROM PA_Dtls_EmpLeave L
	INNER JOIN PA_Dtls_LeaveDetails T ON L.ApplicationId=T.ApplicationId --and T.LeaveType=L.Leave_Type
	INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
	INNER JOIN PA_Mst_CurrentPosting P ON L.EmpId=P.EmpId AND P.ToDate='Till Now'
	INNER JOIN PA_Mst_Designations D ON P.DesignationID=D.DesignationID
	INNER JOIN PA_Mst_LeaveTypes LT ON T.LeaveType=LT.TypeID
	WHERE L.ApplicationId=@ApplicationId AND Status=@Status 
END

IF(@Action='OfcrActn')
BEGIN
	IF(@EmpType='FO')
		UPDATE PA_Dtls_EmpLeave SET FOId=@EmpId, FOUpdatedOn=GETDATE(),FOStatus=@OfficerStatus, FORemarks=@Rmrks,FOIP=@IP,Status=@Status WHERE ApplicationId=@ApplicationId-- and Leave_Type=@LeaveType

	IF(@EmpType='RO')
		UPDATE PA_Dtls_EmpLeave SET ROId=@EmpId, ROUpdatedOn=GETDATE(),ROStatus=@OfficerStatus, RORemarks=@Rmrks,ROIP=@IP,Status=@Status WHERE ApplicationId=@ApplicationId

	IF(@EmpType='SO')
		UPDATE PA_Dtls_EmpLeave SET SOId=@EmpId, SOUpdatedOn=GETDATE(),SOStatus=@OfficerStatus, SORemarks=@Rmrks,SOIP=@IP,Status=@Status WHERE ApplicationId=@ApplicationId
		
	INSERT INTO PA_Dtls_LeaveStatus(Application_ID,Status) VALUES(@ApplicationId,@Status)

	IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave  WHERE ApplicationId=@ApplicationId AND Status=6)
	BEGIN
		UPDATE B SET LeaveBalance=LeaveBalance-T.Nod  FROM PA_Dtls_LeaveBalance B 
		INNER JOIN PA_Dtls_EmpLeave L ON B.EmpId=L.EmpId
		INNER JOIN PA_Dtls_LeaveDetails T ON L.ApplicationId=T.ApplicationId AND B.LeaveTypeId=T.LeaveType
		where l.ApplicationId=@ApplicationId
	END
	
END

IF(@Action='OfcrActnC')
BEGIN
	IF(@EmpType='FOC')
		UPDATE PA_Dtls_EmpLeave SET Status=@Status WHERE ApplicationId=@ApplicationId-- and Leave_Type=@LeaveType

	IF(@EmpType='ROC')
		UPDATE PA_Dtls_EmpLeave SET Status=@Status WHERE ApplicationId=@ApplicationId

	IF(@EmpType='SOC')
	BEGIN
		UPDATE PA_Dtls_EmpLeave SET Status=@Status WHERE ApplicationId=@ApplicationId

		UPDATE PA_Dtls_LeaveDetails SET Nod=(Nod-(DATEDIFF(DAY,CancelFrm,CancelTo)+1)) WHERE ApplicationId=@ApplicationId

	END
	INSERT INTO PA_Dtls_LeaveStatus(Application_ID,Status) VALUES(@ApplicationId,@Status)

	 IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave  WHERE ApplicationId=@ApplicationId AND Status=13)
	BEGIN
		UPDATE B SET LeaveBalance=LeaveBalance+(DATEDIFF(DAY,T.CancelFrm,T.CancelTo)+1) FROM PA_Dtls_LeaveBalance B 
		INNER JOIN PA_Dtls_EmpLeave L ON B.EmpId=L.EmpId
		INNER JOIN PA_Dtls_LeaveDetails T ON L.ApplicationId=T.ApplicationId AND B.LeaveTypeId=T.LeaveType
		where l.ApplicationId=@ApplicationId
	END
END
IF(@Action='OfcrActnE')
BEGIN
	IF(@EmpType='FOE')
		UPDATE PA_Dtls_EmpLeave SET Status=@Status WHERE ApplicationId=@ApplicationId-- and Leave_Type=@LeaveType

	IF(@EmpType='ROE')
		UPDATE PA_Dtls_EmpLeave SET Status=@Status WHERE ApplicationId=@ApplicationId

	IF(@EmpType='SOE')
	BEGIN
		UPDATE PA_Dtls_EmpLeave SET Status=@Status WHERE ApplicationId=@ApplicationId

	END
	INSERT INTO PA_Dtls_LeaveStatus(Application_ID,Status) VALUES(@ApplicationId,@Status)

	 IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave  WHERE ApplicationId=@ApplicationId AND Status=17)
	BEGIN
		UPDATE B SET LeaveBalance=LeaveBalance-T.ExtendedNod  FROM PA_Dtls_LeaveBalance B 
		INNER JOIN PA_Dtls_EmpLeave L ON B.EmpId=L.EmpId
		INNER JOIN PA_Dtls_LeaveDetails T ON L.ApplicationId=T.ApplicationId AND B.LeaveTypeId=T.LeaveType
		where l.ApplicationId=@ApplicationId
	END
END


IF(@Action='EV')
BEGIN
	SELECT L.ApplicationId,NoDays as NoDays,CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType
	--Convert(varchar,FromDate,103) as FD, 	Convert(varchar,ToDate,103) as TD,TypeID,TypeName
	 FROM PA_Dtls_EmpLeave L
	--INNER JOIN PA_Dtls_LeaveDetails T ON L.ApplicationId=T.ApplicationId --and l.Leave_Type=t.LeaveType
	--left join PA_Mst_LeaveTypes lp on lp.TypeID=T.LeaveType
	WHERE  EmpId=@EmpId 
	--SELECT ApplicationId,NoDays,CASE WHEN LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType  FROM PA_Dtls_EmpLeave WHERE EmpId=@EmpId
END

IF(@Action='VIEWlV')
BEGIN
	SELECT LeaveType,TypeName,CONVERT(VARCHAR,FromDate,103) AS FromDate ,FromType,
	CONVERT(VARCHAR,ToDate,103)AS ToDate,ToType,Nod,ExtendedNod,CancelFrm,CancelTo 
	FROM PA_Dtls_LeaveDetails L INNER JOIN PA_Mst_LeaveTypes T ON L.LeaveType=T.TypeID WHERE ApplicationId=@ApplicationId
END

IF(@Action='VS')
	SELECT StatusName, StatusName, CONVERT(VARCHAR,StatusDate,103) AS StatusUpdatedOn
	FROM PA_Dtls_LeaveStatus T INNER JOIN PA_Mst_Status S ON T.Status=S.StatusID
	WHERE Application_ID=@ApplicationId


IF(@Action='CG')
BEGIN
	SELECT L.ApplicationId,t.Nod as NoDays,CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,Convert(varchar,FromDate,103) as FD, 
	Convert(varchar,ToDate,103) as TD,TypeID,TypeName,L.Status
	 FROM PA_Dtls_EmpLeave L
	INNER JOIN PA_Dtls_LeaveDetails T ON L.ApplicationId=T.ApplicationId 
	left join PA_Mst_LeaveTypes lp on lp.TypeID=T.LeaveType
	WHERE  EmpId=@EmpId AND  Status in (1,2,4,6) --AND CAST(FromDate AS DATE) > CAST(GETDATE() AS DATE)
END 

IF(@Action='CANCEL_A')
BEGIN
			UPDATE L SET L.Status=10 FROM  PA_Dtls_EmpLeave L 
		INNER JOIN PA_Dtls_LeaveDetails LD ON LD.ApplicationId=L.ApplicationId --AND L.Leave_Type=LD.LeaveType
		WHERE L.ApplicationId=@ApplicationId AND LD.LeaveType=@LeaveType	
		INSERT INTO PA_Dtls_LeaveStatus(Application_ID,CancelType,Status,LeaveType) VALUES(@ApplicationId,@Flag,10,@LeaveType)

		--insert into  PA_Dtls_LeaveDetails_Hst select *  from PA_Dtls_LeaveDetails where ApplicationId=@ApplicationId	
	
		--UPDATE PA_Dtls_LeaveDetails SET FromDate=CancelFrm,ToDate=CancelTo WHERE ApplicationId=@ApplicationId	
	 
END

IF(@Action='CANCEL_R')
BEGIN
		UPDATE L SET L.Status=11 FROM  PA_Dtls_EmpLeave L 
		INNER JOIN PA_Dtls_LeaveDetails LD ON LD.ApplicationId=L.ApplicationId --AND L.Leave_Type=LD.LeaveType
		WHERE L.ApplicationId=@ApplicationId AND LD.LeaveType=@LeaveType	
		INSERT INTO PA_Dtls_LeaveStatus(Application_ID,CancelType,Status,LeaveType) VALUES(@ApplicationId,@Flag,11,@LeaveType)
		
		--insert into  PA_Dtls_LeaveDetails_Hst select *  from PA_Dtls_LeaveDetails where ApplicationId=@ApplicationId	
	
		--UPDATE PA_Dtls_LeaveDetails SET FromDate=CancelFrm,ToDate=CancelTo WHERE ApplicationId=@ApplicationId	
	 
END

IF(@Action='CANCEL_S')
BEGIN
		UPDATE L SET L.Status=12 FROM  PA_Dtls_EmpLeave L 
		INNER JOIN PA_Dtls_LeaveDetails LD ON LD.ApplicationId=L.ApplicationId --AND L.Leave_Type=LD.LeaveType
		WHERE L.ApplicationId=@ApplicationId AND LD.LeaveType=@LeaveType	

		INSERT INTO PA_Dtls_LeaveStatus(Application_ID,CancelType,Status,LeaveType) VALUES(@ApplicationId,@Flag,12,@LeaveType)

		--insert into  PA_Dtls_LeaveDetails_Hst select *  from PA_Dtls_LeaveDetails where ApplicationId=@ApplicationId	
	
		UPDATE PA_Dtls_LeaveDetails SET FromDate=CancelFrm,ToDate=CancelTo WHERE ApplicationId=@ApplicationId	
	 

END

IF(@Action='CANCEL')
BEGIN
	UPDATE L SET L.Status= @Status FROM  PA_Dtls_EmpLeave L 
	INNER JOIN PA_Dtls_LeaveDetails LD ON LD.ApplicationId=L.ApplicationId --AND L.Leave_Type=LD.LeaveType
	WHERE L.ApplicationId=@ApplicationId AND LD.LeaveType=@LeaveType	
		 
	INSERT INTO PA_Dtls_LeaveStatus(Application_ID,CancelType,Status,LeaveType) VALUES(@ApplicationId,@Flag,@Status,@LeaveType)

	IF(@Flag='P')
		UPDATE PA_Dtls_LeaveDetails SET CancelFrm=@CancelFrm,CancelTo=@CancelTo 
		WHERE ApplicationId=@ApplicationId AND LeaveType=@LeaveType
	ELSE	
		UPDATE PA_Dtls_LeaveDetails SET CancelFrm=FromDate,CancelTo=ToDate WHERE ApplicationId=@ApplicationId	 
END

IF(@Action='JOIN')
BEGIN
	SELECT  E.ApplicationId,CASE WHEN E.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,T.LeaveType,LT.TypeName,Prefix,Postfix,
	CONVERT(VARCHAR,T.FromDate,103) AS FromDate,CONVERT(VARCHAR,T.ToDate,103) AS ToDate from PA_Dtls_EmpLeave E
	INNER JOIN PA_Dtls_LeaveDetails T ON E.ApplicationId=T.ApplicationId --and T.LeaveType=E.Leave_Type
	INNER JOIN PA_Mst_LeaveTypes LT ON T.LeaveType=LT.TypeID
	WHERE status IN (6,17) AND EmpId=@EmpId and LT.RequiresJoining=1 and e.LeaveType='S'
END



IF(@Action='JOIN_S')
BEGIN
	INSERT INTO PA_Dtls_Joining(ApplicationId,EmpId,LeaveType,Leave_Type,Joining_FromDate,Joining_FromType,FileType,FileName,FileContent) 
	VALUES(@ApplicationId,@EmpId,@LeaveType,@Leave_Type,@Joining_FromDate,@Joining_FromType,@FileType,@FileName,@FileContent)

	UPDATE PA_Dtls_EmpLeave SET Status=18 WHERE EmpId=@EmpId and ApplicationId=@ApplicationId 
END

IF(@Action='LvExtend')
BEGIN
	SELECT  E.ApplicationId,CASE WHEN E.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,T.LeaveType,LT.TypeName,Prefix,Postfix,
	CONVERT(VARCHAR,T.FromDate,103) AS FromDate,CONVERT(VARCHAR,T.ToDate,103) AS ToDate,lt.MaxAt_A_Time,lb.LeaveBalance,'' as nol from PA_Dtls_EmpLeave E
	INNER JOIN PA_Dtls_LeaveDetails T ON E.ApplicationId=T.ApplicationId --and T.LeaveType=E.Leave_Type
	INNER JOIN PA_Mst_LeaveTypes LT ON T.LeaveType=LT.TypeID
	left outer join (select * from  PA_Dtls_LeaveBalance where LeaveBalance>0) lb on LB.LeaveTypeId=LT.TypeID and lb.EmpId=e.EmpId
	WHERE status=6 and E.EmpId=@EmpId AND LT.Extended=1
END
IF(@Action='EX')
BEGIN
	UPDATE PA_Dtls_LeaveDetails SET LeaveExtensionDt=@ToDate, ExtendedNod=@Nod WHERE ApplicationId=@ApplicationId
	UPDATE PA_Dtls_EmpLeave SET Status=@Status WHERE ApplicationId=@ApplicationId
	INSERT INTO PA_Dtls_LeaveStatus(Application_ID,Status,StatusDate)VALUES(@ApplicationId,@Status,GETDATE())

	select 'Updated Successfully'
END
IF(@Action='EXDATA_FO')
BEGIN
IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Forwording_Officer=@EmpId )
	BEGIN
		IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave L INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID WHERE Status=14 AND U.Forwording_Officer=@EmpId )
			SELECT ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,NoDays,
			CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'FOE' AS TYPE
			FROM PA_Dtls_EmpLeave L
			INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
			INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
			WHERE Status=14 AND U.Forwording_Officer=@EmpId
	END
END
IF(@Action='EXDATA_RO')
BEGIN
IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Recommended_Officer=@EmpId )
		BEGIN
			IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave L INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID WHERE Status=15 AND U.Recommended_Officer=@EmpId )
				SELECT ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,NoDays,
				CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'ROE' AS TYPE
				FROM PA_Dtls_EmpLeave L
				INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
				INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
				WHERE Status=15 AND U.Recommended_Officer=@EmpId
		END
END
IF(@Action='EXDATA_SO')
BEGIN
IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Sanction_Authority=@EmpId )
		BEGIN
			IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave L INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID WHERE Status=16 AND U.Sanction_Authority=@EmpId )
				SELECT ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,NoDays,
				CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'SOE' AS TYPE
				FROM PA_Dtls_EmpLeave L
				INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
				INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
				WHERE Status=16 AND U.Sanction_Authority=@EmpId
		END
	END

IF(@Action='EXDATA')
BEGIN
IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Forwording_Officer=@EmpId )
	BEGIN
		IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave L INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID WHERE Status=14 AND U.Forwording_Officer=@EmpId )
			SELECT ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,NoDays,
			CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'FOE' AS TYPE
			FROM PA_Dtls_EmpLeave L
			INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
			INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
			WHERE Status=14 AND U.Forwording_Officer=@EmpId
		ELSE IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Recommended_Officer=@EmpId )
		BEGIN
			IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave L INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID WHERE Status=15 AND U.Recommended_Officer=@EmpId )
				SELECT ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,NoDays,
				CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'ROE' AS TYPE
				FROM PA_Dtls_EmpLeave L
				INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
				INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
				WHERE Status=15 AND U.Recommended_Officer=@EmpId
		END
		ELSE IF EXISTS (SELECT 1 FROM PA_Dtls_Users_Hst WHERE Sanction_Authority=@EmpId )
		BEGIN
			IF EXISTS(SELECT 1 FROM PA_Dtls_EmpLeave L INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID WHERE Status=17 AND U.Sanction_Authority=@EmpId )
				SELECT ApplicationId,L.EmpId,EmpCode+' - '+ EmpName AS Emp,NoDays,
				CASE WHEN L.LeaveType='S' THEN 'SINGLE' ELSE 'COMBINATION' END AS lvType,L.Status,'SOE' AS TYPE
				FROM PA_Dtls_EmpLeave L
				INNER JOIN PA_Dtls_Users_Hst U ON L.EmpId=U.Empid
				INNER JOIN PA_Dtls_EmpReg R ON L.EmpId=R.Employee_ID
				WHERE Status=17 AND U.Sanction_Authority=@EmpId
		END
	END
END


                                                                   
COMMIT  
END TRY  
BEGIN CATCH  
ROLLBACK TRANSACTION;  
DECLARE @ErrMsg nvarchar(4000), @ErrSeverity INT  
SELECT @ErrMsg = ERROR_MESSAGE(),  
@ErrSeverity = ERROR_SEVERITY()  

RAISERROR(@ErrMsg, @ErrSeverity, 1)  
END CATCH  
END

GO
/****** Object:  StoredProcedure [dbo].[Employee_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Employee_IUDR] 
@Empid varchar(10)=NULL,
@EmpCode varchar(50)=NULL,
@EmpName varchar(75)=NULL, 
@SurName VARCHAR(50)=NULL,
@FName varchar(75)=NULL,
@Nationality VARCHAR(50)=NULL, 
@Gender VARCHAR(10)=NULL,
@MotherName VARCHAR(75)=NULL,
@Qualification varchar(30)=NULL,
@DOB Date=NULL,
@Community INT=NULL,
@Religion INT=NULL,
@MotherTng VARCHAR(50)=NULL,
@MrgStatus VARCHAR(10)=NULL,
@DifferentlyAble bit=NULL,
@Disability_Percent int= NULL,
@IdentMarkOne VARCHAR(150)=NULL,
@IdentMarkTwo VARCHAR(150)=NULL,
@HStateCode int=NULL,
@HDistCode int=NULL,
@LtcHometown varchar(25)=null,
@Aadhar varchar(12)=NULL,
@Pan varchar(10)=NULL,
@Mobile varchar(10)=NULL,
@MailId varchar(50)=NULL,
@Address varchar(MAX)=NULL,
@StateCode int=NULL,
@DistCode int=NULL, 
@PinCode VARCHAR(6)=NULL,
@PAddress VARCHAR(MAX)=NULL,
@PStateCode int=NULL,
@PDistCode int=NULL,
@PPinCode VARCHAR(6)=NULL,
@Phone VARCHAR(10)=NULL, 
@PhfileNm varchar(50)=Null,
@PhfileSize varchar(15) =Null,
@PhfileType varchar(10) =Null,
@Phcontent varbinary(MAX) =Null,
@SigfileNme varchar(50) =Null,
@SigfileSizee varchar(15) =Null,
@SigfileTypee varchar(10) =Null,
@Sigcontentt varbinary(MAX) =Null,
@IpAddress VARCHAR(20)=NULL,
@NearRailStation VARCHAR(10)=NULL,
@Action char(10)=NULL, 
@User varchar(10)=NULL,
@Active bit=null,
@F TVP_Family READONLY  


AS

BEGIN

IF(@Action='I')
BEGIN
	INSERT INTO dbo.PA_Dtls_EmpReg(EmpCode,EmpName,SurName,EmpFname,Nationality,Gender,MotherName,DOB,Community,Religion,MotherTng,MrgStatus,DifferentAbled,Disabilty_Percentage
	,IdentMarkOne,IdentMarkTwo,HomeSate,HomeDistrict,LTCHomeTown,NearRailStation,StateCode,DistCode,Address,PinCode,PerStateCode,PerDistCode,PerAddress,PerPinCode,Email,phone
	,Mobile,Aadhar,PanNo,IpAddress,LoggedInUserId,PhfileNm,PhfileSize,PhfileType,Phcontent,SigfileNme,SigfileSizee,SigfileTypee,Sigcontentt,Active)

     VALUES (@EmpCode, @EmpName, @SurName, @FName,@Nationality, @Gender, @MotherName,@DOB,@Community,@Religion, @MotherTng,@MrgStatus,@DifferentlyAble,@Disability_Percent,
	 @IdentMarkOne,@IdentMarkTwo,@HStateCode, @HDistCode,@LtcHometown, @NearRailStation, @StateCode, @DistCode, @Address, @PinCode, @PStateCode, @PDistCode,@PAddress,@PPinCode,@MailId,@Phone,
	 @Mobile,@Aadhar,@Pan,@IpAddress, @User,@PhfileNm,@PhfileSize,@PhfileType,@Phcontent,@SigfileNme,@SigfileSizee,@SigfileTypee,@Sigcontentt,'1')
END


IF(@Action='U') 
BEGIN 
    UPDATE PA_Dtls_EmpReg SET MrgStatus=@MrgStatus,DifferentAbled=@DifferentlyAble,LTCHomeTown=@LtcHometown,NearRailStation=@NearRailStation, 
    StateCode=@StateCode,DistCode=@DistCode, PinCode=@PinCode,IpAddress=@IpAddress,UpdatedUserId=@User,UpdatedDt=GETDATE() WHERE Employee_ID=@Empid	
END


IF(@Action='R')
BEGIN   
    SELECT Employee_ID,MrgStatus,DifferentAbled,NearRailStation,LTCHomeTown,NearRailStation,
	StateCode,DistCode as DistCode,PinCode,	
	EmpCode,EmpName,EmpFname,MotherName,MotherTng,NearRailStation,Mobile,Aadhar,PanNo,Email,PerPinCode,
    PhfileNm,PhfileSize,PhfileType,Phcontent,SigfileNme,SigfileSizee,SigfileTypee,Sigcontentt FROM  PA_Dtls_EmpReg  
	WHERE (Employee_ID=@Empid  OR @Empid IS NULL )
END
IF(@Action='UE')
BEGIN   
  UPDATE PA_Dtls_EmpReg SET  EmpCode=@EmpCode,EmpName=@EmpName,SurName=@SurName,EmpFname=@FName,Nationality=@Nationality,Gender=@Gender,MotherName=@MotherName,DOB=@DOB,Community=@Community,
	Religion=@Religion,MotherTng=@MotherTng,MrgStatus=@MrgStatus,DifferentAbled=@DifferentlyAble,Disabilty_Percentage=@Disability_Percent,
	IdentMarkOne=@IdentMarkOne,IdentMarkTwo=@IdentMarkTwo,HomeSate=@HStateCode,HomeDistrict=@HDistCode,LTCHomeTown=@LtcHometown,NearRailStation=@NearRailStation,StateCode=@StateCode,
	DistCode=@DistCode,Address=@Address,PinCode=@PinCode,PerStateCode=@PStateCode,PerDistCode=@PDistCode,PerAddress=@PAddress,PerPinCode=@PPinCode,Email=@MailId,phone=@Phone
	,Mobile=@Mobile,Aadhar=@Aadhar,PanNo=@Pan,IpAddress=@IpAddress,LoggedInUserId=@User,PhfileNm=@PhfileNm,PhfileSize=@PhfileSize,PhfileType=@PhfileType,Phcontent=@Phcontent,
	SigfileNme=@SigfileNme,SigfileSizee=@SigfileSizee,SigfileTypee=@SigfileTypee,Sigcontentt=@Sigcontentt,Active=@Active WHERE EmpCode=@EmpCode


END
IF(@Action='R1')
BEGIN   
    SELECT DISTINCT E.Employee_ID,E.EmpCode,E.EmpName,E.SurName,E.Nationality,E.Gender,E.MotherName,E.EmpFname,CONVERT(VARCHAR, DOB,103) AS DOB,E.Community,C.CasteName,E.Religion,E.MotherTng,E.MrgStatus,E.DifferentAbled
	,E.Disabilty_Percentage,E.IdentMarkOne,E.IdentMarkTwo,E.HomeSate,S.State,E.HomeDistrict,D.DistName,E.LTCHomeTown,E.NearRailStation,E.StateCode,E.DistCode,E.Address,
	E.PinCode,E.PerStateCode,E.PerDistCode,E.PerAddress,E.PerPinCode,E.Email,E.phone,E.Mobile,E.Aadhar,E.PanNo,
    E.PhfileNm,E.PhfileSize,E.PhfileType,E.Phcontent,E.SigfileNme,E.SigfileSizee,E.SigfileTypee,E.Sigcontentt,
	CASE WHEN E.Nationality='1' THEN 'INDIAN' ELSE 'OTHERS' END AS Nationalitys,
	CASE WHEN E.Gender='1' THEN 'MALE' ELSE 'FEMALE' END AS GENDER,
	CASE WHEN E.Religion='1' THEN 'HINDU'  
	     WHEN E.Religion='2' THEN 'CHRISTAIN'
		 WHEN E.Religion='3' THEN 'MUSLIM'
		 WHEN E.Religion='4' THEN 'OTHERS' END AS RELIGION
	 FROM  PA_Dtls_EmpReg E
	INNER JOIN PA_Mst_State S ON S.StateCode=E.StateCode
	INNER JOIN  PA_Mst_District D ON D.DistCode=E.DistCode AND D.StateCode=E.StateCode
	INNER JOIN  PA_Mst_Caste C on c.CasteCode=E.Community  
	WHERE (Employee_ID=@Empid  OR @Empid IS NULL )
END

IF(@Action='Empcode')
BEGIN 
    SELECT Employee_ID,(EmpName+'-'+EmpCode)as EmpoyeeName FROM PA_Dtls_EmpReg  
END

IF(@Action='Family')
BEGIN
	INSERT INTO PA_Dtls_Family(EmpID,MemberName,Relation,DateofBirth,Dependent ,GovtEmp,Nominee,NomineePercentage,AddedBy)
	SELECT @Empid, Name, Relation,DateofBirth,Dependent,GovtEmp,Nominee,NomineePercentage,@User FROM @F
END

IF(@Action='ED')/*Employee Leave Balance and Reporting Officers list*/
BEGIN
	SELECT '1' as Flag, B.EmpId,E.EmpName,LeaveTypeId, TypeName,LeaveBalance FROM PA_Dtls_LeaveBalance B 
	INNER JOIN PA_Mst_LeaveTypes T ON B.LeaveTypeId=T.TypeID
	INNER JOIN PA_Dtls_EmpReg E ON B.EmpId=E.Employee_ID
	WHERE (E.Employee_ID=@EmpCode OR @EmpCode IS NULL)

	
	SELECT '2' as Flag,E.EmpCode,E.Employee_ID,E.EmpName,D.Designation,E.PhfileNm,E.PhfileSize,E.PhfileType,E.Phcontent,
	H.Forwording_Officer,F.Phcontent,F.EmpName AS FO,
	H.Recommended_Officer,RC.Phcontent AS RecPhoto,RC.EmpName AS RO,
	H.Sanction_Authority,ST.Phcontent AS SanPhoto,ST.EmpName AS SO  	
	FROM PA_Dtls_EmpReg E WITH (NOLOCK)   
	INNER JOIN PA_Dtls_Users_Hst H ON H.Empid=E.Employee_ID
	INNER JOIN PA_Mst_CurrentPosting R ON R.EmpId=E.Employee_ID AND R.ToDate='Till Now'
	INNER JOIN PA_Mst_Designations D ON D.DesignationID=R.DesignationID
	INNER JOIN PA_Dtls_EmpReg F ON H.Forwording_Officer=F.Employee_ID
	INNER JOIN PA_Dtls_EmpReg RC ON H.Recommended_Officer=RC.Employee_ID
	INNER JOIN PA_Dtls_EmpReg ST ON H.Sanction_Authority=ST.Employee_ID
	WHERE E.Employee_ID IN (SELECT DATA FROM DBO.Split(@EmpCode,',')) 	
END

END
GO
/****** Object:  StoredProcedure [dbo].[Employee_IUDR_Old]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		A.MAMATHA
-- Create date: 7/3/2019
-- Description:	EMPLOYEE IUDR
-- =============================================
CREATE PROCEDURE [dbo].[Employee_IUDR_Old]
@EmpID INT=NULL,
@EmpCode VARCHAR(10)=NULL,
@Name VARCHAR(50)=NULL,
@Mobile VARCHAR(10)=NULL,
@Email VARCHAR(50)=NULL,
@Gender VARCHAR(6)=NULL,
@Dob date=NULL,
@EmpAddress VARCHAR(300)=NULL,
@Active BIT=NULL,
@User INT=NULL,
@Action CHAR(5),
@DOJService date=NULL,
@DOJCurrrentPosition date=NULL,
@Community nvarchar(2)=null,
@ExServiceMan  nvarchar(2)=null,
@Disability int=null,
@StateCode int=null,
@Father_HusbandName nvarchar (50)=null,
@Qualification nvarchar (50)=null,
@TempAdd nvarchar(100)=null,
@PermAdd nvarchar(100)=null,
@DesignationTOJ nvarchar(50)=null,
@CurrentDesignation nvarchar(50)=null,
@DifferentlyAbled  nvarchar(2)=null,
@PanNo nvarchar (10)=null,
@martial_status char(1)=null,
@children int=null,
@PhotoName [varchar](max)=NULL,
@PhotoContent [varbinary] (max)=NULL
AS
BEGIN
	SET NOCOUNT ON;

IF(@Action='I')
BEGIN
	IF EXISTS(SELECT 1 FROM PA_Mst_Employee WHERE EmployeeCode=@EmpCode )  
	begin
		SELECT 'This employee code already exists'
		return
	end
    else IF EXISTS( SELECT 1 FROM PA_Dtls_EmpPhoto WHERE EmpCode=@EmpCode)
	begin
	  SELECT 'This employee code already exists'
	  return
	  end
	ELSE
		--INSERT INTO PA_Mst_Employee(EmployeeCode,EmployeeName,MobileNumber,email,Gender,Dob,EmpAddress,Active,AddedBy)
		--VALUES(@EmpCode,@Name, @Mobile,@Email,@Gender,@Dob,@EmpAddress,@Active,@User)

		insert into PA_Mst_Employee (EmployeeCode,EmployeeName,Gender,dob,AddedBy,active,DOJService,DOJCurrrentPosition,Community,ExServiceMan,Disability,StateCode,Father_HusbandName,Qualification,DesignationTOJ,CurrentDesignation,DifferentlyAbled,PanNo,email,TempAdd,PermAdd,MobileNumber,martial_status,children)
		values(@EmpCode,@Name,@Gender,@Dob,@User,@Active,@DOJService,@DOJCurrrentPosition,@Community,@ExServiceMan,@Disability,@StateCode,@Father_HusbandName,@Qualification,@DesignationTOJ,@CurrentDesignation,@DifferentlyAbled,@PanNo,@Email,@TempAdd,@PermAdd,@Mobile,@martial_status,@children)	
		
		insert into PA_Dtls_EmpPhoto (EmpCode,PhotoName,PhotoContent,AddedOn,AddedBy)
		values (@EmpCode,@PhotoName,@PhotoContent,GETDATE(),@User)
END								  


IF(@Action='R')
BEGIN
	SELECT EmployeeCode as EmpID,EmployeeName,Gender,CASE WHEN Gender='M'  THEN 'Male'  ELSE 'FEMALE'  END AS Gen,convert(varchar, DOJService, 103)as DOJService,convert(varchar, DOJCurrrentPosition, 103)as DOJCurrrentPosition,Community,ExServiceMan,Disability,StateCode,
	Father_HusbandName,Qualification,DesignationTOJ , D.Designation AS DTOJ,CurrentDesignation,T.Designation AS DesgCurrent,T.Cadre ,DifferentlyAbled,PanNo,
	email,TempAdd,PermAdd,MobileNumber,convert(varchar,Dob,103) as Dob ,Active,CASE WHEN Active='1'  THEN 'YES'  ELSE 'NO'  END AS A,PhotoContent,PhotoName,martial_status,children,Community,ExServiceMan    
	FROM PA_Mst_Employee E INNER JOIN PA_Mst_Designations D ON E.DesignationTOJ=D.DesignationID
	INNER JOIN PA_Mst_Designations T ON E.CurrentDesignation=T.DesignationID
	left join PA_Dtls_EmpPhoto ep on ep.EmpCode=e.EmployeeCode
	WHERE  ( EmpID=@EmpID OR @EmpID =0)
END
--IF(@Action='R2')
--	SELECT EmpID,EmployeeCode,EmployeeName,Gender,AddedBy,convert(varchar,DOJService,103) as DOJService,convert(varchar,DOJCurrrentPosition,103) as DOJCurrrentPosition,
--	Community,ExServiceMan,Disability,StateCode,
--	Father_HusbandName,Qualification,DesignationTOJ,CurrentDesignation,DifferentlyAbled,PanNo,email,TempAdd,PermAdd,MobileNumber,convert(varchar,Dob,103) as Dob ,
--	Active,CASE WHEN Active='0'  THEN 'TRUE'  ELSE 'FALSE'  END AS A  FROM PA_Mst_Employee 
--	WHERE EmpID=@EmpID
IF(@Action='R1')
BEGIN
	SELECT EmpID,EmployeeCode,EmployeeName,Gender,AddedBy,
	DOJService,DOJCurrrentPosition,Community,ExServiceMan,Disability,StateCode,
	Father_HusbandName,Qualification,DesignationTOJ,CurrentDesignation,DifferentlyAbled,PanNo,
	email,TempAdd,PermAdd,MobileNumber,convert(varchar,Dob,103) as Dob ,Active,CASE WHEN Active='0'  THEN 'TRUE'  ELSE 'FALSE'  END AS A  FROM PA_Mst_Employee  
	WHERE  employeecode NOT IN (SELECT Empid FROM PA_Dtls_Users)
END
IF(@Action='U')
BEGIN
	--UPDATE PA_Mst_Employee SET EmployeeName=@Name, email=@Email,Gender=@Gender,Dob=@Dob,EmpAddress=@EmpAddress, MobileNumber=@Mobile ,Active=@Active,UpdatedOn=GETDATE() WHERE EmpID=@EmpID
	
	UPDATE PA_Mst_Employee SET EmployeeName=@Name, email=@Email,Gender=@Gender,Dob=@Dob,EmpAddress=@EmpAddress, MobileNumber=@Mobile ,Active=@Active,
	EmployeeCode=@EmpCode,DOJService=@DOJService,DOJCurrrentPosition=@DOJCurrrentPosition,Community=@Community,ExServiceMan=@ExServiceMan,Disability=@Disability,StateCode=@StateCode,
   Father_HusbandName=@Father_HusbandName,Qualification=@Qualification,DesignationTOJ=@DesignationTOJ,CurrentDesignation=@CurrentDesignation,DifferentlyAbled=@DifferentlyAbled,PanNo=@PanNo,
   TempAdd=@TempAdd,PermAdd=@PermAdd,UpdatedOn=GETDATE() WHERE employeecode=@EmpID
   update PA_Dtls_EmpPhoto set PhotoName=@PhotoName,PhotoContent=@PhotoContent,UpdatedOn=GETDATE(),UpdatedBy=@User where EmpCode=@EmpID
   SELECT 1 as flag, 'Updated Successfully' as Msg
END
  
IF(@Action='D')
begin
	if(exists(select 1 from PA_Dtls_Users where Empid=@EmpID))
	begin
		SELECT 0 as flag, 'Cant Delete as Employee map with reporting officer' as Msg
	end
	else
	begin
		DELETE FROM PA_Mst_Employee WHERE EmployeeCode=@EmpID
		DELETE FROM PA_Dtls_EmpPhoto WHERE EmpCode=@EmpID
		SELECT 1 as flag, 'Deleted Successfully' as Msg
	end
end   
IF(@Action='ED')/*Employee Leave Balance and Reporting Officers list*/
begin
	SELECT '1' as Flag, B.EmpId,EmployeeName,LeaveTypeId, TypeName,LeaveBalance FROM PA_Dtls_LeaveBalance B 
	INNER JOIN PA_Mst_LeaveTypes T ON B.LeaveTypeId=T.TypeID
	INNER JOIN PA_Mst_Employee E ON B.EmpId=E.EmployeeCode
	WHERE (B.EmpId=@EmpCode OR @EmpCode IS NULL)
	
	declare @i int=1,@tempemp varchar(50)=@EmpCode,@TMPCODE VARCHAR(50)=NULL,@list varchar(50)=NULL
	while(@i!=0)
	BEGIN
	set  @TMPCODE=(select ReportingOfficer from PA_Dtls_Users where empid=@tempemp)
	set @tempemp=@TMPCODE
		if(isnull(@tempemp,0)=0)
		begin
				set @i=0
				break
		end
		ELSE
		BEGIN
				SET @list=CASE WHEN  ISNULL(@list,'')='' THEN @tempemp ELSE ISNULL(@list,'')+','+@tempemp END
		END
		
	END
	
	SELECT '2' as Flag,E.EmployeeName,D.Designation FROM PA_MST_EMPLOYEE E WITH (NOLOCK)
	INNER JOIN PA_Mst_Designations D ON D.DesignationID=E.CurrentDesignation
	WHERE E.EmployeeCode IN (SELECT DATA FROM DBO.Split(@list,','))

end
END


GO
/****** Object:  StoredProcedure [dbo].[ExceptionLoggingToDataBase]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbo].[ExceptionLoggingToDataBase]  
(  
@ExceptionMsg varchar(100)=null,  
@ExceptionType varchar(100)=null,  
@ExceptionSource nvarchar(max)=null,  
@ExceptionURL varchar(100)=null  ,
@UserName VARCHAR(255) = null,
@IPAddress VARCHAR(20) = null
)  
AS  
BEGIN  
INSERT INTO PA_Dtls_ExceptionLog  (  ExceptionMsg ,  ExceptionType,   ExceptionSource,  ExceptionURL,  Logdate,LoggedInUser,IpAddress  )  
SELECT  @ExceptionMsg,  @ExceptionType,  @ExceptionSource,  @ExceptionURL,  getdate()  ,@UserName,@IPAddress
END  



GO
/****** Object:  StoredProcedure [dbo].[Family_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		A.MAMATHA
-- Create date: 07/01/2019
-- Description:	FAMILY DETAILS
-- =============================================
CREATE PROCEDURE [dbo].[Family_IUDR]
@Empid int=NULL,
@MemberId INT=NULL,
@MemberName VARCHAR(50)=NULL,
@Relation VARCHAR(20)=NULL,
@DOB DATE=NULL,
@Dependent BIT=NULL,
@GovtEmp BIT=NULL,
@Nominee BIT=NULL,
@NomPer INT=NULL,
@user BIGINT=NULL,
@F TVP_Family READONLY,
@Action CHAR(5)
AS
BEGIN
	SET NOCOUNT ON;

IF(@Action='I')
BEGIN
	INSERT INTO PA_Dtls_Family(EmpID,MemberName,Relation,DateofBirth,Dependent ,GovtEmp,Nominee,NomineePercentage,AddedBy)
	SELECT @Empid, Name, Relation,DateofBirth,Dependent,GovtEmp,Nominee,NomineePercentage,@user FROM @F
END

IF(@Action='R')
	SELECT MemberID,MemberName,Relation,DateofBirth,Dependent ,GovtEmp,Nominee,NomineePercentage
	FROM PA_Dtls_Family WHERE EmpID=@Empid


IF(@Action='U')
	UPDATE PA_Dtls_Family SET MemberName=@MemberName,Relation=@Relation,DateofBirth=@DOB,Dependent=@Dependent ,GovtEmp=@GovtEmp,Nominee=@Nominee,
	NomineePercentage=@NomPer, UpdatedOn=GETDATE(), UpdatedBy=@user	 WHERE EmpID=@Empid AND MemberID=@MemberId

IF(@Action='D')
	DELETE FROM PA_Dtls_Family WHERE EmpID=@Empid AND MemberID=@MemberId
END
GO
/****** Object:  StoredProcedure [dbo].[GetDetails]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		A.MAMATHA
-- Create date: 04/10/2019
-- Description:	COMMON 
-- =============================================
CREATE PROCEDURE [dbo].[GetDetails]
@id INT=NULL,
@Action CHAR(10)
AS
BEGIN
	SET NOCOUNT ON;

IF(@Action='ROLE')
	SELECT Role_Id, RoleName FROM PA_Mst_Roles WHERE Role_Id NOT IN (1,20)

IF(@Action='CST')
	SELECT CasteCode, CasteName FROM PA_Mst_Caste

IF(@Action = 'R')
	SELECT m.Qualification_Code,Qualification_Name	FROM PA_Mst_Qualification M


IF(@Action = 'D')
	SELECT Discipline_Code,Discipline_Name	FROM PA_Mst_Discipline

IF(@Action='CR') 
	Select  Contribution_Code, Contribution_Name  from  PA_Mst_Contribution 	 
  

IF(@Action='Ofc')
	Select Office_Code,Office_Name  from  PA_Mst_Office  
  
IF(@Action='Cls')
	Select Class_Code,Class_Name   from  PA_Mst_Class 							
  

IF(@Action='Emptype')
	Select EmpType_Code,EmpType_Name  from  PA_Mst_EmployeeType  
 

IF(@Action='Paycm')
	Select PayCommision_Code,PayCommision_Name   from  PA_Mst_PayCommision 						

  
    
 END  


GO
/****** Object:  StoredProcedure [dbo].[GetLocations]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetLocations] 
@state varchar(2)='36',
@dist varchar(5)=null,
@mand varchar(5)=null,
@divname varchar(50)=null,
@divcode INT=null,
@action char(5)
AS
BEGIN

IF(@action='S')
BEGIN
	SELECT StateCode,State from PA_Mst_State ORDER BY State
END


IF(@action='D')
BEGIN
	SELECT DistCode, DistName from PA_Mst_District where StateCode=@state order by DistName
END



END























GO
/****** Object:  StoredProcedure [dbo].[GetLoginDetails]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetLoginDetails] 
@username NVARCHAR(255)=null,
@newpwd varchar(100)=null,
@updatedUSer varchar(50)=null,
@role int=null,
@updt_ip varchar(50)=null,
@spcode bigint=null,
@action char(1)='R'
AS    
BEGIN 
IF(@action='R')
BEGIN
	--SELECT l.UserName,l.Sno,l.Password,	l.code,l.Role,r.RoleName,
	--E.CurrentDesignation AS DesigId,U.Empid,U.Section,U.Type,EmployeeName,D.Designation,SectionName
	--FROM  PA_Dtls_login l 
	--LEFT JOIN PA_Mst_Roles r ON l.Role=r.role_id	
	--LEFT JOIN PA_Dtls_Users U ON L.code=U.UserID
	--LEFT JOIN PA_Mst_Employee E ON U.Empid=E.EmpID
	--LEFT JOIN PA_Mst_Designations D ON E.CurrentDesignation=D.Designation
	--LEFT JOIN PA_Mst_Sections S ON U.Section=S.SectionID
	--WHERE L.UserName=@username	

	--SELECT l.UserName,l.Sno,l.Password,	l.code,l.Role,r.RoleName,
	--E.CurrentDesignation AS DesigId,l.code as Empid,E.EmployeeName,D.Designation,S.SectionName,S.SectionID,E.MobileNumber,E.email,Gender,E.Forwording_Officer,E.Sanction_Authority,E.Recommended_Officer,E.Link_Officer,
	--CASE WHEN L.Type='GT' THEN 'Gezetted'
	--WHEN L.Type='NGO' THEN 'Non Gezetted'
	--WHEN L.Type = NULL OR L.Type='' THEN '' END AS Type,u.ReportingOfficer
	--FROM (SELECT * FROM  PA_Dtls_login WHERE UserName='101' ) L 
	--LEFT OUTER JOIN PA_Mst_Employee E ON l.code=E.EmployeeCode
	--LEFT OUTER JOIN PA_Mst_Roles r ON l.Role=r.role_id
	--LEFT OUTER JOIN PA_Dtls_Users U ON U.Empid=L.CODE
	--LEFT OUTER JOIN PA_Mst_Sections S ON S.SectionID=U.Section	
	--LEFT OUTER JOIN PA_Mst_Designations D ON E.CurrentDesignation=D.DesignationID	
	
SELECT  l.UserName,l.Sno,l.Password,l.code,l.Role,r.RoleName,
	l.code as Empid,E.EmpCode,E.EmpName,S.SectionName,S.SectionID,E.Mobile,E.email,Gender,C.DesignationID,D.Designation,
	CASE WHEN L.Type='GT' THEN 'Gezetted'
	WHEN L.Type='NGO' THEN 'Non Gezetted'
	WHEN L.Type = NULL OR L.Type='' THEN '' END AS Type,U.ReportingOfficer,U.Forwording_Officer,
	U.Recommended_Officer,U.ReportingOfficer,U.Sanction_Authority,U.Link_Officer
	FROM (SELECT * FROM  PA_Dtls_login WHERE UserName=@username ) L 
	LEFT OUTER JOIN PA_Dtls_EmpReg E ON l.code=E.Employee_ID	
	LEFT OUTER JOIN PA_Mst_Roles r ON l.Role=r.role_id
	LEFT OUTER JOIN PA_Dtls_Users U ON U.Empid=L.CODE
	LEFT OUTER JOIN PA_Mst_Sections S ON S.SectionID=U.Section	
	LEFT OUTER JOIN PA_Mst_CurrentPosting C ON E.Employee_ID=C.EmpId AND C.ToDate='Till Now'
	LEFT OUTER JOIN PA_Mst_Designations D ON D.DesignationID=C.DesignationID
		
END  

IF(@action='U')
BEGIN
DECLARE @updateddate datetime=getDate()
	UPDATE PA_Dtls_login SET Password=@newpwd,updateddt=@updateddate,updatedIP=@updt_ip  WHERE UserName=@username
	SELECT 'Updated'
END

IF(@action='S')
BEGIN
	UPDATE PA_Dtls_login set Password='6B4C8CBCB6B66F050C12D6A0203C58A8BC6D36E5A8C28B74111681F7AECE378A',
	reset_by=@updatedUSer,reset_IP=@updt_ip, reset_cnt=reset_cnt+1 WHERE UserName=@username 
	SELECT 'Password Reset'
END 

IF(@action='C')
BEGIN
	SELECT UserName FROM PA_Dtls_login WHERE UserName=@username
END  

IF(@action='G')
BEGIN
	SELECT UserName FROM PA_Dtls_login WHERE Role=@role
END  

IF(@action='T')
BEGIN
	SELECT UserName FROM PA_Dtls_login WHERE code=@spcode
END  

IF(@action='A')
BEGIN
	SELECT UserName FROM PA_Dtls_login WHERE  Role=@role
END

END





GO
/****** Object:  StoredProcedure [dbo].[Holidays_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date:  
-- Description:	Holidays  
-- =============================================
CREATE PROCEDURE [dbo].[Holidays_IUDR]
@Hid INT=0,
@Hyear VARCHAR(50)=NULL,
@Hmonth VARCHAR(6)=NULL,
@User INT=NULL,
@ip varchar(10)=NULL,
@TvpHoliday [TVP_HolidayDetails_EX] READONLY,
@FromDate VARCHAR(25)=NULL,
@ToDate VARCHAR(25)=NULL,
@Action CHAR(5)
AS
BEGIN
BEGIN TRY  
BEGIN TRANSACTION 
	SET NOCOUNT ON;

IF(@Action='I')
BEGIN	
	Delete from PA_Mst_Holiday WHERE HolidayYear=@Hyear and HolidayMonth=@Hmonth
				
	INSERT INTO PA_Mst_Holiday (HolidayYear,HolidayMonth,HolidayDate,HolidayType,Description,Addedby,IP)
	SELECT @Hyear,@Hmonth,HolidayDate,HolidayType,Description,@User,@ip FROM @TvpHoliday
END


IF(@Action='R') 
	SELECT Hid,HolidayYear,HolidayMonth,HolidayDate,HolidayType,Description FROM PA_Mst_Holiday where HolidayYear=@Hyear AND HolidayMonth=@Hmonth

IF(@Action='U')
	--UPDATE PA_Mst_LeaveTypes SET ApplicableFor=@Appli,AppliesFor =@AppliesFor,No_leaves=@Nol,MaxAt_A_Time=@Max, UpdatedOn=GETDATE(),UpdatedBy=@User  WHERE TypeID=@typeId


IF(@Action='D')
	DELETE FROM PA_Mst_Holiday WHERE Hid=@Hid


IF(@Action='Pfix')	
   SELECT HolidayDate FROM PA_Mst_Holiday WHERE  
   CONVERT(date,HolidayDate ,103)>= DATEADD(DAY,-2,CONVERT(date,@FromDate ,103))
   AND CONVERT(date,HolidayDate ,103) < CONVERT(date,@FromDate ,103)


IF(@Action='Pofix')	
   SELECT HolidayDate FROM PA_Mst_Holiday WHERE  
   CONVERT(date,HolidayDate ,103)<= DATEADD(DAY,2,CONVERT(date,@ToDate ,103))
   AND CONVERT(date,HolidayDate ,103) > CONVERT(date,@ToDate ,103)

IF(@Action='CHK')
	SELECT 1,Description FROM PA_Mst_Holiday WHERE CONVERT(date,HolidayDate ,103)=@FromDate AND  HolidayType='GT'

IF(@Action='RS')
	SELECT 1 FROM PA_Mst_Holiday WHERE CONVERT(date,HolidayDate ,103)=@FromDate AND  HolidayType='RS'

 
COMMIT  
END TRY  
BEGIN CATCH  
ROLLBACK TRANSACTION;  
DECLARE @ErrMsg nvarchar(4000), @ErrSeverity INT  
SELECT @ErrMsg = ERROR_MESSAGE(),  
@ErrSeverity = ERROR_SEVERITY()  
RAISERROR(@ErrMsg, @ErrSeverity, 1)  
END CATCH 
END

GO
/****** Object:  StoredProcedure [dbo].[IntialjoiningMaster_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IntialjoiningMaster_IUDR]
@EmpId INT=NULL,
@State VARCHAR(10)=NULL,
@Office VARCHAR(50)=NULL,
@Designation INT=NULL, 
@DOJ date=NULL,
@OrdNum VARCHAR(50)=NULL,
@OrderDate date=NULL,
@ApointgAuthority VARCHAR(50)=NULL,
@ModeOfRec VARCHAR(50)=NULL,
@OfficerType CHAR(3)=NULL,
@PayCommision_Code INT=NULL,
@PayScale VARCHAR(50)=NULL,
@BasicPay VARCHAR(50)=NULL,
@IpAddress VARCHAR(20)=NULL,
@User INT=NULL,
@Action char(2)=NULL
AS
BEGIN
IF(@Action='I')
BEGIN
	IF EXISTS (SELECT 1 FROM PA_Mst_Intialjoing WHERE EmpId=@EmpId)
		SELECT 'Intital Joining Details Already added for this Employee'
	ELSE
		INSERT INTO PA_Mst_Intialjoing (EmpId ,StateCode ,OfficeName ,Designation_Code ,DOJ ,OrdNum ,OrdDate ,ApointgAuthority ,ModeOfRec ,OfficerType ,PayCommision_Code ,PayScale ,BasicPay,LoggedinUser)
		VALUES (@EmpId, @State, @Office, @Designation, @DOJ, @OrdNum, @OrderDate, @ApointgAuthority, @ModeOfRec, @OfficerType, @PayCommision_Code, @PayScale, @BasicPay, @User)		
END

IF(@Action='R')
	SELECT StateCode ,OfficeName ,Designation_Code ,CONVERT(DATE, DOJ ,103 )AS DOJ ,OrdNum ,OrdDate ,ApointgAuthority ,ModeOfRec ,OfficerType ,PayCommision_Code ,PayScale ,BasicPay 
	FROM PA_Mst_Intialjoing WHERE EmpId=@EmpId

IF(@Action='U')
	UPDATE PA_Mst_Intialjoing SET StateCode=@State ,OfficeName =@Office,Designation_Code=@Designation ,DOJ =@DOJ,OrdNum =@OrdNum,OrdDate =@OrderDate,
	ApointgAuthority=@ApointgAuthority ,ModeOfRec=@ModeOfRec ,OfficerType=@OfficerType ,PayCommision_Code =@PayCommision_Code,PayScale=@PayScale ,
	BasicPay=@BasicPay,	UpdatedDt=GETDATE() WHERE EmpId=@EmpId


Select * from PA_Dtls_EmpReg
Select * from PA_Mst_Intialjoing

END
	








GO
/****** Object:  StoredProcedure [dbo].[ItemInSection_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC ItemInSection_IUDR '','','','','R'
CREATE PROCEDURE [dbo].[ItemInSection_IUDR]
@SectionID INT=NULL,
@ItemName VARCHAR(50)=NULL,
@ItemId INT=Null,
@user INT=NULL,
@Action CHAR(5)
AS
BEGIN
SET NOCOUNT ON;

 
IF(@Action='I')
BEGIN
	INSERT INTO PA_Mst_AddItems  (SectionID,ItemName,AddedBy)  VALUES(@SectionID,@ItemName,@user)
END

IF(@Action='R')
BEGIN
	SELECT 	I.SectionID,I.ItemID,I.ItemName,S.SectionName FROM  PA_Mst_AddItems I INNER JOIN PA_Mst_AppliSection S ON S.SectionID=I.SectionID	
	WHERE (I.SectionID=@SectionID	 OR @SectionID =''  )
END


IF(@Action='U')
BEGIN
	UPDATE PA_Mst_AddItems SET ItemName=@ItemName,UpdatedOn=GETDATE() WHERE ItemID=@ItemId
END

IF(@Action='D')
BEGIN
	DELETE FROM PA_Mst_AddItems WHERE ItemID=@ItemId
END

END
GO
/****** Object:  StoredProcedure [dbo].[LeaveBalance_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		A.MAMATHA
-- Create date: 11/10/2019
-- Description:	Leave Balance
--EXEC LeaveBalance_IUDR 1003,0,0,'2015-01-31',NULL,0,'1','VIEW'
-- =============================================
CREATE PROCEDURE [dbo].[LeaveBalance_IUDR] 
@EmpID INT=NULL,
@LeaveType INT=NULL,
@LeaveBalance INT=NULL,
@AsOnDate DATE=NULL,
@Tvp TVP_LB READONLY,
@user INT=NULL,
@IP VARCHAR(25)=NULL,
@Action CHAR(5)
AS
BEGIN
SET NOCOUNT ON;
DECLARE @Appli VARCHAR(50)=NULL;

IF(@Action='EMP')
	SELECT Employee_ID,EmpName+'-'+EmpCode as Emp FROM PA_Dtls_EmpReg --WHERE Employee_ID NOT IN (SELECT EmpId FROM PA_Dtls_LeaveBalance)


IF(@Action='VIEW')
BEGIN
	SELECT @Appli=(SELECT  CASE WHEN Gender='F' THEN 'Both,Female' ELSE 'Both,Male' END FROM PA_Dtls_EmpReg WHERE Employee_ID=@EmpID)
	SELECT TypeID, TypeName,CASE WHEN YrEndStatus='L' THEN CAST(No_leaves AS VARCHAR) ELSE CAST( No_leaves AS VARCHAR)+'+' END AS NOL
	FROM PA_Mst_LeaveTypes	WHERE ApplicableFor IN (SELECT data FROM dbo.Split('Both,Male',',')) --AND YrEndStatus NOT IN('L')
	--FROM PA_Mst_LeaveTypes	WHERE ApplicableFor IN (SELECT data FROM dbo.Split('Both,Female',','))
END

IF(@Action='I')
BEGIN
	INSERT INTO PA_Dtls_LeaveBalance(EmpId,AsOnDate,LeaveTypeId,LeaveBalance,AddedBy,AddedIP)
	                         SELECT @EmpID, @AsOnDate,T.LeaveType, T.balance,@user,@IP FROM @Tvp T
END

IF(@Action='R')
BEGIN
	SELECT B.EmpId,EmpName,LeaveTypeId, TypeName,LeaveBalance FROM PA_Dtls_LeaveBalance B 
	INNER JOIN PA_Mst_LeaveTypes T ON B.LeaveTypeId=T.TypeID
	INNER JOIN PA_Dtls_EmpReg E ON B.EmpId=E.Employee_ID
	WHERE ( B.EmpId=@EmpID OR @EmpID IS NULL)
	--GROUP BY B.EmpId, EmpName,TypeName
END

IF(@Action='U')
BEGIN
	UPDATE PA_Dtls_LeaveBalance SET LeaveBalance=@LeaveBalance, UpdatedOn=GETDATE(), UpdatedIP=@IP 	WHERE EmpId=@EmpID AND LeaveTypeId=@LeaveType
END

IF(@Action='D')
BEGIN
	DELETE FROM PA_Dtls_LeaveBalance WHERE EmpId=@EmpID AND LeaveTypeId=@LeaveType
END

END
GO
/****** Object:  StoredProcedure [dbo].[LeaveType_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		A.MAMATHA
-- Create date: 04/10/2019
-- Description:	LEAVE TYPES
-- =============================================
CREATE PROCEDURE [dbo].[LeaveType_IUDR]
@typeId INT=0,
@EmpId INT=NULL,
@TypeName VARCHAR(50)=NULL,
@Appli VARCHAR(6)=NULL,
@Nol INT=NULL,
@User INT=NULL,
@AppliesFor CHAR(20)=NULL,
@Max INT=NULL,
@link BIT=NULL,
@Noc INT=NULL,
@lvsEach INT=NULL,
@MinLvs INT=NULL,
@YrEndStatus CHAR(1)=NULL,
@TVP_LB_TVP [TVP_LB] READONLY,
@Extended BIT=NULL,
@RequiresJoining BIT=NULL,
@Action CHAR(5)
AS
BEGIN
BEGIN TRY  
BEGIN TRANSACTION 
	SET NOCOUNT ON;

IF(@Action='I')
BEGIN
	IF EXISTS (SELECT 1 FROM PA_Mst_LeaveTypes WHERE TypeName=@TypeName)
		SELECT 'LEAVE TYPE ALREADY EXISTS'
	ELSE
		INSERT INTO PA_Mst_LeaveTypes (TypeName  ,ApplicableFor,AppliesFor ,No_leaves, MaxAt_A_Time ,LinkedWithBirth,NoC_Considered,LeavedAtEachBirth,MinLeaves,YrEndStatus ,AddedBy,RequiresJoining,Extended)
		VALUES (@TypeName, @Appli,@AppliesFor, @Nol,@Max,@link, @Noc,@lvsEach,@MinLvs, @YrEndStatus, @User,@RequiresJoining,@Extended)
END

IF(@Action='R')
	SELECT TypeID, TypeName  ,ApplicableFor , AppliesFor  ,No_leaves, MaxAt_A_Time,
	CASE WHEN LinkedWithBirth='1' THEN 'YES' ELSE 'NO' END AS LinkedWithBirth,CASE WHEN RequiresJoining='1' THEN 'YES' ELSE 'NO' END AS RequiresJoining,CASE WHEN Extended='1' THEN 'YES' ELSE 'NO' END AS Extended,
	NoC_Considered,LeavedAtEachBirth,MinLeaves,
	CASE WHEN YrEndStatus='A' THEN 'APPENDS' ELSE 'LAPSES' END AS YrEndStatus 
	FROM PA_Mst_LeaveTypes	WHERE (TypeID=@typeId or @typeId=0)


IF(@Action='U')
	UPDATE PA_Mst_LeaveTypes SET ApplicableFor=@Appli,AppliesFor =@AppliesFor,No_leaves=@Nol,MaxAt_A_Time=@Max, 
	LinkedWithBirth=@link,NoC_Considered=@Noc,LeavedAtEachBirth=@lvsEach,MinLeaves=@MinLvs,YrEndStatus=@YrEndStatus,
	UpdatedOn=GETDATE(),UpdatedBy=@User,RequiresJoining=@RequiresJoining,Extended=@Extended  WHERE TypeID=@typeId


IF(@Action='D')
	DELETE FROM PA_Mst_LeaveTypes WHERE TypeID=@typeId


IF(@Action='CMI')
BEGIN		
	DELETE from PA_Dtls_CombiLeave where  TypeId=@typeId 
	INSERT INTO PA_Dtls_CombiLeave (TypeId  ,CombiLeave,Entryby,Entrydt)
	SELECT @typeId, LeaveType,@User, GETDATE() FROM @TVP_LB_TVP
END


IF(@Action='CMR')
BEGIN
	SELECT distinct L.TypeID, L.TypeName,ISNULL(CL.CombiLeave,0) AS ExistCML
	FROM  (SELECT * FROM PA_Mst_LeaveTypes)  L
	LEFT OUTER JOIN (SELECT * FROM PA_Dtls_CombiLeave WHERE TypeID=@typeId) CL ON L.TypeID=CL.CombiLeave 
END

IF(@Action='CHK')
	SELECT CombiLeave, TypeName FROM PA_Dtls_CombiLeave C INNER JOIN PA_Mst_LeaveTypes T ON C.CombiLeave=T.TypeID WHERE C.TypeId=@typeId

IF(@Action='CML')
BEGIN
	SELECT CombiLeave AS TypeID,L.TypeName FROM PA_Dtls_CombiLeave C
	INNER JOIN PA_Mst_LeaveTypes L ON C.CombiLeave=L.TypeId WHERE C.TypeID=@typeId
END


IF(@Action='GR') /*Based on Gender Get Leave Types*/
BEGIN
	--SET @Appli=CASE WHEN @Appli='F' THEN 'Both,Female' ELSE 'Both  ' END
	SELECT TypeID, TypeName,B.LeaveBalance FROM PA_Mst_LeaveTypes L
	INNER JOIN PA_Dtls_LeaveBalance B ON L.TypeID=B.LeaveTypeId
	where B.EmpId=@EmpId AND B.LeaveBalance>0 
END


COMMIT  
END TRY  
BEGIN CATCH  
ROLLBACK TRANSACTION;  
DECLARE @ErrMsg nvarchar(4000), @ErrSeverity INT  
SELECT @ErrMsg = ERROR_MESSAGE(),  
@ErrSeverity = ERROR_SEVERITY()  
RAISERROR(@ErrMsg, @ErrSeverity, 1)  
END CATCH 
END



GO
/****** Object:  StoredProcedure [dbo].[NomineeMaster_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NomineeMaster_IUDR]
@Contribution_Code VARCHAR(10)=NULL,
@Empcode VARCHAR(10)=NULL, 
@NomineeNm VARCHAR(50)=NULL,
@Relation VARCHAR(50)=NULL,
@DOJ date=NULL, 
@Percentage varchar(20)=NULL,
@NomAddress varchar(200)=NULL,
@GurdainNm varchar(20)=NULL,
@Address VARCHAR(200)=NULL,
@LoggedIn_Dt Datetime=null,
@DepCode VARCHAR(10)=NULL,
@IpAddress VARCHAR(20)=NULL,
@Action char(2)=NULL
AS
BEGIN
IF(@Action='I')
BEGIN
		INSERT INTO PA_Mst_NomineeDetails
           (Contribution_Code,Empcode,NomineeNm,Relation,DOJ,Percentage,NomAddress,GurdainNm,Address, LoggedIn_Dt,IpAddress)
		 
    VALUES(@Contribution_Code,@Empcode,@NomineeNm,@Relation,@DOJ,@Percentage,@NomAddress,@GurdainNm,@Address,
	GETDATE(),@IpAddress)
	END

IF(@Action='R')

  BEGIN
	       
		   Select M.Contribution_Code,M.Empcode,D.Contribution_Name,M.NomineeNm,M.Relation,M.Percentage,M.NomAddress,M.GurdainNm,M.Address,
		   CONVERT(VARCHAR, M.DOJ,103) AS DOJ
		   from  PA_Mst_NomineeDetails M 
		   INNER JOIN PA_Mst_Contribution D ON D.Contribution_Code=M.Contribution_Code		   																
   END
   IF(@Action='R2')

  BEGIN
	       
		   Select M.Contribution_Code,M.Contribution_Name
		   from  PA_Mst_Contribution M							

   END
   END

 
	--IF(@Action='U')

 --   BEGIN
	       
	--	   UPDATE Dtls_Employee SET EmpName=@EmpName,FatherName=@FName,EmpType=@EmpType,Gender=@Gender,Qualification=@Qualification,dob=@DOB,
	--	                            category=@Category,Aadhar=@Aadhar,Pan=@Pan,mobile=@Mobile,mailid=@MailId,address=@Address,PinCode=@PinCode,
	--								StateCode=@StateCode,DistCode=@DistCode,MandCode=@MandCode,EmpPhotoName=@EmpPhotoName,EmpPhotoContent=@EmpPhotoContent,
	--								EmpPhotoExt=@EmpPhotoExt,DifferentlyAbled=@DifferentlyAble,DisabilityPercent=@Disability,DesignationCode=@Desig,
	--								DOJ=@DOJ,Branch=@Branch,BankCode=@BankCode,IFSCCode=@IFSCCode,AccountNo=@AccNo,BasicSalary=@CurrentSalary,
	--								LastIncrementDt=@LastIncrementDt,ScaleofPay=@ScaleofPay,UAN=@UAN,EPFNumber=@EPFNumber,GPFNo=@GPFNo,
	--								ESINumber=@ESINumber,DeptCode=@DeptCode,IpAddress=@IpAddress,UpdatedUserId=@UserId,UpdatedDt=@SysDate

	--								WHERE EmpCode=@EmpCode

	--								select 'Data Updated successfully'

									

 --  END










GO
/****** Object:  StoredProcedure [dbo].[Post_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		A.MAMATHA
-- Create date: 28/01/2020
-- Description:	Post_IUDR
-- =============================================
CREATE PROCEDURE [dbo].[Post_IUDR]
@PostID INT=NULL,
@PostName VARCHAR(150)=NULL,
@Desc VARCHAR(MAX)=NULL,
@PostType INT=NULL,
@EFrom	DATE=NULL,
@ETo	DATE=NULL,
@Qual INT=NULL,
@Exp BIT=NULL,
@ExpDet VARCHAR(250)=NULL,
@Photosig BIT=NULL,
@Discl VARCHAR(250)=NULL,
@User INT=NULL,
@IP VARCHAR(30)=NULL,
@T PostItems READONLY,
@Action CHAR(10)
AS
BEGIN
	SET NOCOUNT ON;
DECLARE @NewId INT

IF(@Action='I')
BEGIN
	INSERT INTO PA_Dtls_Post(PostName,Description,PostType,EffectiveFrom,EffectiveTo,qualification,Exp,ExpDetails,PhotoSig,Disclaimer,AddedBy,AddedIP)
	VALUES(@PostName, @Desc,@PostType,@EFrom,@ETo, @Qual, @Exp, @ExpDet,@Photosig,@Discl,@User,@IP)

	SELECT @NewId= SCOPE_IDENTITY()
	
	INSERT INTO dbo.PA_Dtls_PostItems(PostID,SectionID,ItemId) SELECT @NewId, Section,Item FROM @T
END
 

IF(@Action='R')
BEGIN
	SELECT A.PostID,PostName ,I.SectionID,SectionName,I.ItemId,ItemName,DispalyOrder
	FROM  PA_Dtls_PostItems I
	INNER JOIN PA_Dtls_Post A on I.PostID=A.PostID
	INNER JOIN PA_Mst_AppliSection S on S.SectionID=I.SectionID
	INNER JOIN PA_Mst_AddItems M ON M.ItemID=I.ItemId AND S.SectionID=M.SectionID
	WHERE I.PostID=@PostID 
END


IF(@Action='T')
	SELECT PostID,PostName FROM PA_Dtls_Post


IF(@Action='NOTICE')
BEGIN
	SELECT PostID, PostName, Description FROM PA_Dtls_Post WHERE CAST(GETDATE() AS DATE) BETWEEN CAST(EffectiveFrom AS DATE) AND CAST(EffectiveTo AS DATE)
	
END

END
GO
/****** Object:  StoredProcedure [dbo].[PostRecruitment_IR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PostRecruitment_IR] 
@Id	bigint='',
@Application_Id	varchar(50)	=NULL,
@Post_ID	int	='',
@Name	varchar(100)=NULL,
@FName	varchar(100)=NULL,
@DOB	datetime=NULL,
@Caste	int	='',
@Nationality	int	='',
@Religion	int	='',
@Gender	char(1)	=NULL,
@Address	varchar(255)=NULL,
@PAddress	varchar(255)=NULL,
@Mobile	nvarchar(10)=NULL,
@Email	nvarchar(100)=NULL,
@IpAddress	varchar(15)=NULL,
@Action Char(1)
AS

IF(@Action='I')
BEGIN

	INSERT INTO PA_Dlts_Recruitmt_Dtls(Post_ID,Name,FName,DOB,Caste,Nationality,Religion,Gender,Address,PAddress,Mobile,Email,IpAddress,AppliedDt) 
	                           VALUES(@Post_ID,@Name,@FName,@DOB,@Caste,@Nationality,@Religion,@Gender,@Address,@PAddress,@Mobile,@Email,@IpAddress,GETDATE())

END

GO
/****** Object:  StoredProcedure [dbo].[Qualification_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Qualification_IUDR]
@Qualification_Code	int='',
@Qualification_Name	varchar(20)	=null,
@Action varchar(1)
AS

IF(@Action='R')
BEGIN	
	SELECT * FROM PA_Mst_Qualification
END

IF(@Action='I')
BEGIN
  INSERT INTO PA_Mst_Qualification(Qualification_Name) VALUES(@Qualification_Name)
END

IF(@Action='D')
BEGIN
 DELETE FROM PA_Mst_Qualification WHERE Qualification_Code=@Qualification_Code
END

IF(@Action='U')
BEGIN
  UPDATE PA_Mst_Qualification SET Qualification_Name=@Qualification_Name  WHERE Qualification_Code=@Qualification_Code
END

GO
/****** Object:  StoredProcedure [dbo].[Section_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		A.MAMATHA
-- Create date: 3/7/2019
-- Description:	Section_IUDR
-- =============================================
CREATE PROCEDURE [dbo].[Section_IUDR]
@SectionID INT=NULL,
@Section VARCHAR(50)=NULL,
@User INT=NULL,
@IP varchar(50)=NULL,
@Action CHAR(5)
AS
BEGIN
	SET NOCOUNT ON;

  
IF(@Action='I')
BEGIN
	IF EXISTS(SELECT 1 FROM PA_Mst_Sections WHERE SectionName=@Section )
		SELECT 'Section already exists'
	ELSE
		INSERT INTO PA_Mst_Sections(SectionName,AddedBy,AddedIP,AddedOn) VALUES(@Section,@User,@IP,GETDATE())
END

IF(@Action='R')
	SELECT SectionID,SectionName FROM PA_Mst_Sections --WHERE Department=@Dept


IF(@Action='U')
	UPDATE PA_Mst_Sections SET SectionName=@Section,UpdatedOn=GETDATE(),UpdatedBy=@User, UpdatedIP=@IP WHERE SectionID=@SectionID

IF(@Action='D')
	DELETE FROM PA_Mst_Sections WHERE SectionID=@SectionID


END


GO
/****** Object:  StoredProcedure [dbo].[State_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		A.Mamatha
-- Create date: 30/9/2019
-- Description:	State IUDR
-- =============================================
CREATE PROCEDURE [dbo].[State_IUDR]
@statecode varchar(2)=null,
@stateName varchar(50)=null,
@user varchar(15)=null,
@action varchar(1)
AS
BEGIN
	SET NOCOUNT ON;

IF(@action='I')
BEGIN
	IF EXISTS (SELECT * FROM PA_Mst_State WHERE State=@stateName)
		SELECT 'State Name Already Exists'
	ELSE
		INSERT INTO PA_Mst_State (State,AddedBy) VALUES (@stateName,@user)
END


IF(@action='R')
BEGIN
	SELECT StateCode,State FROM PA_Mst_State WHERE (StateCode=@statecode OR @statecode=0) ORDER BY State
		
END


IF(@action='U')
BEGIN
	UPDATE PA_Mst_State SET State=@stateName, UpdatedOn=GETDATE() WHERE StateCode=@statecode 
		
END



IF(@action='D')
BEGIN
	DELETE FROM PA_Mst_State WHERE StateCode=@statecode 
		
END

END


GO
/****** Object:  StoredProcedure [dbo].[TransferMasterDetails_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TransferMasterDetails_IUDR]
@DesignationFrom VARCHAR(50)=NULL,
@OfficeFrom VARCHAR(50)=NULL, 
@DesignationTo VARCHAR(50)=NULL,
@OfficeTo VARCHAR(50)=NULL,
@DOJ date=NULL, 
@OrderDt date=NULL, 
@OrderNum VARCHAR(50)=NULL,
@Transfer VARCHAR(50)=NULL,
@LoggedIn_Dt Datetime=null,
@DepCode VARCHAR(10)=NULL,
@IpAddress VARCHAR(20)=NULL,
@user VARCHAR(50)=NULL,
@Action char(2)=NULL
AS
BEGIN
IF(@Action='I')
BEGIN
		INSERT INTO PA_Mst_TransferDetails
           (DesignationFrom,OfficeFrom,DesignationTo,OfficeTo,DOJ,OrderDt,OrderNum,Transfer,
		  LoggedIn_Dt,IpAddress,Logged_User)
			VALUES(@DesignationFrom,@OfficeFrom,@DesignationTo,@OfficeTo,@DOJ,@OrderDt,@OrderNum,@Transfer,
			GETDATE(),@IpAddress,@user)
	END

	IF(@Action='R')

  BEGIN
	       
		   Select M.DesignationFrom,M.OfficeFrom,M.DesignationTo,M.OfficeTo,M.OrderNum,M.Transfer,
		   CONVERT(VARCHAR, M.OrderDt,103) AS OrderDt,CONVERT(VARCHAR, M.DOJ,103) AS DOJ
		   from  PA_Mst_TransferDetails M 
		   	   																
   END
  
   END

 
	--IF(@Action='U')

 --   BEGIN
	       
	--	   UPDATE Dtls_Employee SET EmpName=@EmpName,FatherName=@FName,EmpType=@EmpType,Gender=@Gender,Qualification=@Qualification,dob=@DOB,
	--	                            category=@Category,Aadhar=@Aadhar,Pan=@Pan,mobile=@Mobile,mailid=@MailId,address=@Address,PinCode=@PinCode,
	--								StateCode=@StateCode,DistCode=@DistCode,MandCode=@MandCode,EmpPhotoName=@EmpPhotoName,EmpPhotoContent=@EmpPhotoContent,
	--								EmpPhotoExt=@EmpPhotoExt,DifferentlyAbled=@DifferentlyAble,DisabilityPercent=@Disability,DesignationCode=@Desig,
	--								DOJ=@DOJ,Branch=@Branch,BankCode=@BankCode,IFSCCode=@IFSCCode,AccountNo=@AccNo,BasicSalary=@CurrentSalary,
	--								LastIncrementDt=@LastIncrementDt,ScaleofPay=@ScaleofPay,UAN=@UAN,EPFNumber=@EPFNumber,GPFNo=@GPFNo,
	--								ESINumber=@ESINumber,DeptCode=@DeptCode,IpAddress=@IpAddress,UpdatedUserId=@UserId,UpdatedDt=@SysDate

	--								WHERE EmpCode=@EmpCode

	--								select 'Data Updated successfully'

									

 --  END










GO
/****** Object:  StoredProcedure [dbo].[TypeOfPost_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TypeOfPost_IUDR]
@PostTypeID INT=NULL,
@PostTypeName VARCHAR(50)=NULL,
@User INT=NULL,
@Action CHAR(5)
AS
BEGIN
SET NOCOUNT ON;

 
IF(@Action='I')
BEGIN
	IF EXISTS(SELECT 1 FROM PA_Mst_PostType WHERE PostTypeName=@PostTypeName )
		SELECT 'Post Type Name already exists'
	ELSE
		INSERT INTO PA_Mst_PostType(PostTypeName,InsertedBy) VALUES(@PostTypeName,@User)
END

IF(@Action='R')
	SELECT PostTypeID,PostTypeName FROM PA_Mst_PostType 


IF(@Action='U')
	UPDATE PA_Mst_PostType SET PostTypeName=@PostTypeName,UpdatedDt=GETDATE() WHERE PostTypeID=@PostTypeID


IF(@Action='D')
	DELETE FROM PA_Mst_PostType WHERE PostTypeID=@PostTypeID


END
GO
/****** Object:  StoredProcedure [dbo].[User_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		A.MAMATHA
-- Create date: 03/10/2019
-- Description:	ADD USER
-- =============================================
CREATE PROCEDURE [dbo].[User_IUDR]
@Role INT=NULL,
@Section INT=NULL,
@Empid INT=NULL,
@Active BIT=NULL,
@User bigint=NULL,
@IP VARCHAR(25)=NULL,
@empcode VARCHAR(50)=NULL,
@DesigId int=NULL,
@TVP_LinkOfficers  TVP_LinkOfcrs READONLY,
@Action CHAR(5)
AS
BEGIN
	SET NOCOUNT ON;
BEGIN TRY  
BEGIN TRANSACTION 
	DECLARE @UserCode BIGINT,@SysDate datetime=getdate();

IF(@Action='I')
BEGIN	
	IF(EXISTS(SELECT 1 FROM PA_Dtls_login WHERE UserName=@empcode))
		SELECT 'User Name Already Exist...Try Onther One'
	ELSE
	BEGIN
		INSERT INTO PA_Dtls_login (UserName,Password ,Role,Active,IP,code,addedby) VALUES 
		(@empcode, '6B4C8CBCB6B66F050C12D6A0203C58A8BC6D36E5A8C28B74111681F7AECE378A', @Role,@Active, @IP, @Empid, @User)

	END
END

IF(@Action = 'R')
BEGIN
	SELECT  L.SNO AS UserID, L.UserName,Role_Id,RoleName,E.EmpName,l.code,
	CASE WHEN l.Active='1' THEN 'YES' ELSE 'NO' END AS Active	FROM PA_Dtls_login L 
	INNER JOIN PA_Mst_Roles R ON L.Role=R.Role_Id 	
	INNER JOIN PA_Dtls_EmpReg E ON E.Employee_ID=L.code
END



IF(@Action='EMP')
BEGIN
	SELECT EmployeeCode as  EmpID, EmployeeName FROM PA_Mst_Employee WHERE EmpID <> 3 
END


IF(@Action='RPRT')
BEGIN
    SELECT R.EmpCode,EmpId,R.EmpName + ' ('+Designation+')' as EmployeeName FROM PA_Dtls_EmpReg R 
	INNER JOIN PA_Mst_CurrentPosting C ON R.Employee_ID=C.EmpId
	INNER JOIN PA_Mst_Designations D ON C.DesignationID=D.DesignationID 
	WHERE ToDate='Till Now'
	--WHERE D.Cadre < @cadre
	--SELECT U.Empid, EmployeeName FROM PA_Dtls_Users U	
	--INNER JOIN PA_Mst_Employee E ON U.Empid=E.EmpID
	--INNER JOIN PA_Mst_Designations D ON E.CurrentDesignation=D.DesignationID
	--WHERE D.Cadre = (@cadre-1) AND ( U.Section=@Section OR U.Section=1017)--1017
END


IF(@Action = 'C')
BEGIN		
	IF EXISTS(SELECT 1 FROM PA_Dtls_login WHERE UserName=@empcode)
		SELECT 'UserName Already Exists'
END


IF(@Action='U')
BEGIN
	UPDATE PA_Dtls_login SET Active=@Active,updateddt=GETDATE(),UpdatedBy=@User,UpdatedIP=@IP WHERE sno=@User
END

IF(@Action='D')
BEGIN
	DELETE FROM PA_Dtls_login WHERE sno=@User
END



IF(@Action = 'EG')
BEGIN		
	SELECT  R.Employee_ID,EmpName, EmpCode,C.DesignationID,Designation,'' AS Forwording_Officer
	,'' AS Recommended_Officer,'' AS Sanction_Authority,'' AS Link_Officer FROM PA_Dtls_EmpReg R 
	INNER JOIN PA_Mst_CurrentPosting C ON R.Employee_ID=C.EmpId
	INNER JOIN PA_Mst_Designations D ON C.DesignationID=D.DesignationID 
	WHERE ( D.DesignationID =@DesigId OR @DesigId =0 )AND ToDate='Till Now' 
	AND EmpId NOT IN (SELECT EmpId FROM PA_Dtls_Users_Hst)
	ORDER BY EmpCode
END


IF(@Action = 'RM')
BEGIN		
	SELECT  R.Employee_ID,EmpName, EmpCode,C.DesignationID,Designation, Forwording_Officer,Recommended_Officer,Sanction_Authority,Link_Officer	FROM PA_Dtls_EmpReg R 
	INNER JOIN PA_Dtls_Users_Hst H ON R.Employee_ID=H.Empid
	INNER JOIN PA_Mst_CurrentPosting C ON R.Employee_ID=C.EmpId
	INNER JOIN PA_Mst_Designations D ON C.DesignationID=D.DesignationID 
	WHERE H.Empid=@Empid  AND ToDate='TillNow'
END

IF(@Action = 'LO')
BEGIN		
	INSERT INTO PA_Dtls_Users_Hst (Empid,ReportingOfficer,Forwording_Officer,Recommended_Officer,Sanction_Authority,Link_Officer,UpdatedOn,UpdatedBy,UpdatedIP)
	                       SELECT T.Empid,0,T.Forwording_Officer,T.Recommended_Officer,T.Sanction_Authority,T.Link_Officer,GETDATE(),@User,@IP FROM @TVP_LinkOfficers T
	
END

--IF(@Action = 'UM')
--BEGIN		
--	INSERT INTO PA_Dtls_Users_Hst select U.* from PA_Dtls_Users U 
--	INNER JOIN @TVP_MapReportOfc T ON T.EmployeeCode=U.Empid

--	delete U from  PA_Dtls_Users U 
--	INNER JOIN @TVP_MapReportOfc T ON T.EmployeeCode=U.Empid

--	INSERT INTO PA_Dtls_Users(Section,Empid,ReportingOfficer,EffectiveFrom,EffectiveTo,UpdatedOn,UpdatedBy,UpdatedIP)
--	SELECT Param1,employeecode,Param2,FromDate,ToDate,@SysDate,@User,@IP  FROM @TVP_MapReportOfc 

--	update E SET E.NoofRepOfc=dbo.NoofReportOfc(t.employeecode) from  PA_Mst_Employee E 
--	INNER JOIN @TVP_MapReportOfc T ON T.EmployeeCode=e.EmployeeCode
--END


--IF(@Action = 'LO')
--BEGIN		
--	INSERT INTO PA_Dtls_Users_Hst select U.* from PA_Dtls_Users U 
--	INNER JOIN @TVP_MapReportOfc T ON T.EmployeeCode=U.Empid

--	delete U from  PA_Dtls_Users U 
--	INNER JOIN @TVP_MapReportOfc T ON T.EmployeeCode=U.Empid

--	INSERT INTO PA_Dtls_Users(Section,Empid,ReportingOfficer,Forwording_Officer,Recommended_Officer,Sanction_Authority,Link_Officer,UpdatedOn,UpdatedBy,UpdatedIP)
--	                     SELECT Param1,employeecode,Param2,Param3,Param4,Param5,LeaveType,@SysDate,@User,@IP  FROM @TVP_MapReportOfc 

	
--	update E SET  Forwording_Officer=t.Param3,Recommended_Officer=t.Param4,Sanction_Authority=t.Param5,
--	Link_Officer=t.LeaveType from  PA_Mst_Employee E 
--	INNER JOIN @TVP_MapReportOfc T ON T.EmployeeCode=e.EmployeeCode
--END

COMMIT  
END TRY  
BEGIN CATCH  
	ROLLBACK TRANSACTION;  
	DECLARE @ErrMsg nvarchar(4000), @ErrSeverity INT  
	SELECT @ErrMsg = ERROR_MESSAGE(),  
	@ErrSeverity = ERROR_SEVERITY()  
	RAISERROR(@ErrMsg, @ErrSeverity, 1)  
END CATCH  
END
GO
/****** Object:  StoredProcedure [dbo].[UserLoginStatus_IU]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*  

 AUTHOR: <AUTHOR,SAILAJA>      
 CREATE DATE: 30/9/2019      
 DESCRIPTION: <PROCEDURE TO INSERT AND UPDATE USER LOGIN STATUS >

 SELECT * FROM Dtls_UserLoginStatus
 SELECT * FROM Login

 EXEC UserLoginStatus_IU
 */  
 
create PROCEDURE [dbo].[UserLoginStatus_IU]
(
@UserId nvarchar(15) ='',
@Login_or_LogoutDateAndTime datetime='',
@IpAddress nvarchar(150)='',
@Status nvarchar(20)='',
@Action CHAR(1)='',
@LoginSno_toUpdate BIGINT=0,
@LoginSno INT    OUTPUT
)
AS
BEGIN
		IF(@Action = 'I')
		BEGIN
			INSERT INTO PA_Dtls_UserLoginStatus(UserId,LoginDateAndTime,IpAddress,status) 
			VALUES(@UserId,@Login_or_LogoutDateAndTime,@IpAddress,@Status)

			SELECT @LoginSno = SCOPE_IDENTITY()
			RETURN  SELECT @LoginSno 
		END
		IF(@Action = 'U')
		BEGIN
			UPDATE PA_Dtls_UserLoginStatus SET status=@Status,LogOutDateAndTime=@Login_or_LogoutDateAndTime 
			WHERE Sno=@LoginSno_toUpdate

			RETURN 1
		END

		RETURN 0
END





GO
/****** Object:  StoredProcedure [dbo].[Zone_IUDR]    Script Date: 14/04/20 13:28:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Zone_IUDR]
@Zonecode int=null,
@zonename varchar(50)=null,
@user varchar(50)=null,
@state int=null,
@dept int=null,
@action char(5)
AS
BEGIN
	
	SET NOCOUNT ON;

IF(@action='I')
BEGIN
	IF EXISTS(SELECT ZoneName FROM PA_Mst_Zone WHERE ZoneName=@zonename AND State=@state AND Department=@dept)
		SELECT 'ALREADY EXISTS'
	ELSE
		INSERT INTO PA_Mst_Zone (ZoneName, AddedBy, State, Department) VALUES(@zonename, @user, @state, @dept)
END


IF(@action='R')
BEGIN
	SELECT ZoneName,ZoneId FROM PA_Mst_Zone WHERE State=@state AND Department=@dept
END

--Rajesh
IF(@action='R1')
BEGIN
	SELECT ZoneId,ZoneName FROM PA_Mst_Zone 
END

IF(@action='U')
BEGIN
	UPDATE PA_Mst_Zone SET ZoneName=@zonename, Update_Dt=GETDATE() WHERE State=@state AND Department=@dept AND ZoneId=@Zonecode
END

IF(@action='D')
BEGIN
	DELETE FROM PA_Mst_Zone WHERE State=@state AND Department=@dept  AND ZoneId=@Zonecode
END

END


GO
USE [master]
GO
ALTER DATABASE [NPA] SET  READ_WRITE 
GO
