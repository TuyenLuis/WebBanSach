USE [master]
GO
/****** Object:  Database [QuanLyBanSach]    Script Date: 4/24/2019 7:15:35 AM ******/
ALTER DATABASE [QuanLyBanSach] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyBanSach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyBanSach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyBanSach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyBanSach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyBanSach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyBanSach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyBanSach] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyBanSach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyBanSach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyBanSach] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyBanSach] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyBanSach]
GO
/****** Object:  Table [dbo].[Chinhanh]    Script Date: 4/24/2019 7:15:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chinhanh](
	[Macn] [int] IDENTITY(1,1) NOT NULL,
	[Tencn] [nvarchar](100) NULL,
	[Diachi] [nvarchar](100) NULL,
	[Sdt] [varchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Hinh] [nvarchar](200) NULL,
 CONSTRAINT [PK_Chinhanh] PRIMARY KEY CLUSTERED 
(
	[Macn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 4/24/2019 7:15:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGioHang](
	[ChitietgiohangID] [int] IDENTITY(1,1) NOT NULL,
	[GiohangkhID] [int] NULL,
	[Masach] [int] NULL,
	[Soluong] [int] NULL,
	[Thanhtien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietGioHang] PRIMARY KEY CLUSTERED 
(
	[ChitietgiohangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chude]    Script Date: 4/24/2019 7:15:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chude](
	[Macd] [int] IDENTITY(1,1) NOT NULL,
	[Tenchude] [nvarchar](100) NULL,
	[Key] [varchar](30) NULL,
 CONSTRAINT [PK_Chude] PRIMARY KEY CLUSTERED 
(
	[Macd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Giohangkh]    Script Date: 4/24/2019 7:15:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giohangkh](
	[GiohangkhID] [int] IDENTITY(1,1) NOT NULL,
	[Makh] [int] NULL,
	[Ngaymua] [smalldatetime] NULL,
	[Tongtien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Giohangkh] PRIMARY KEY CLUSTERED 
(
	[GiohangkhID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Khachhang]    Script Date: 4/24/2019 7:15:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Khachhang](
	[Makh] [int] IDENTITY(1,1) NOT NULL,
	[Hotenkh] [nvarchar](100) NULL,
	[Diachikh] [nvarchar](100) NULL,
	[Dienthoaikh] [varchar](20) NULL,
	[Tendn] [nvarchar](50) NULL,
	[Matkhau] [nvarchar](100) NULL,
	[Ngaysinh] [smalldatetime] NULL,
	[Gioitinh] [bit] NULL,
	[Email] [nvarchar](100) NULL,
	[Quyen] [int] NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[Makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 4/24/2019 7:15:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LienHe](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Hoten] [nvarchar](50) NULL,
	[Phone] [varchar](13) NULL,
	[Email] [varchar](100) NULL,
	[Noidung] [nvarchar](max) NULL,
 CONSTRAINT [PK_LienHe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nhaxuatban]    Script Date: 4/24/2019 7:15:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhaxuatban](
	[Manxb] [int] IDENTITY(1,1) NOT NULL,
	[Tennxb] [nvarchar](100) NULL,
 CONSTRAINT [PK_Nhaxuatban] PRIMARY KEY CLUSTERED 
(
	[Manxb] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sach]    Script Date: 4/24/2019 7:15:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[Masach] [int] IDENTITY(1,1) NOT NULL,
	[Tensach] [nvarchar](200) NULL,
	[Dongia] [decimal](18, 0) NULL,
	[Donvitinh] [nvarchar](10) NULL,
	[Mota] [ntext] NULL,
	[Hinhminhhoa] [nvarchar](200) NULL,
	[Macd] [int] NULL,
	[Manxb] [int] NULL,
	[Ngaycapnhat] [smalldatetime] NULL,
	[Matacgia] [int] NULL,
	[Soluong] [int] NULL,
	[Giakm] [decimal](18, 0) NULL,
	[Motangangon] [ntext] NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[Masach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tacgia]    Script Date: 4/24/2019 7:15:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tacgia](
	[Matacgia] [int] IDENTITY(1,1) NOT NULL,
	[Tentacgia] [nvarchar](100) NULL,
 CONSTRAINT [PK_Tacgia] PRIMARY KEY CLUSTERED 
(
	[Matacgia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Chude] ON 

INSERT [dbo].[Chude] ([Macd], [Tenchude], [Key]) VALUES (1, N'Tất cả', N'sgk stn skh sk')
INSERT [dbo].[Chude] ([Macd], [Tenchude], [Key]) VALUES (2, N'Sách giáo khoa', N'sgk')
INSERT [dbo].[Chude] ([Macd], [Tenchude], [Key]) VALUES (3, N'Sách thiếu nhi', N'stn')
INSERT [dbo].[Chude] ([Macd], [Tenchude], [Key]) VALUES (4, N'Sách khoa học', N'skh')
INSERT [dbo].[Chude] ([Macd], [Tenchude], [Key]) VALUES (5, N'Sách khác', N'sk')
SET IDENTITY_INSERT [dbo].[Chude] OFF
SET IDENTITY_INSERT [dbo].[Khachhang] ON 

INSERT [dbo].[Khachhang] ([Makh], [Hotenkh], [Diachikh], [Dienthoaikh], [Tendn], [Matkhau], [Ngaysinh], [Gioitinh], [Email], [Quyen]) VALUES (1, N'Tuyền Luis', N'Đại Học Bôn Ba', N'0963566703', N'TheFirstCustomer', N'123456', CAST(N'1998-06-16 00:00:00' AS SmallDateTime), 0, N'a5lhp.swift@gmail.com', 2)
INSERT [dbo].[Khachhang] ([Makh], [Hotenkh], [Diachikh], [Dienthoaikh], [Tendn], [Matkhau], [Ngaysinh], [Gioitinh], [Email], [Quyen]) VALUES (2, N'Nguyễn Văn Minh', N'Cổ Nhuế Bắc Từ Liêm - Hà Nội', N'0325942121', N'mjnk9xw', N'minh29041998', CAST(N'1998-04-29 00:00:00' AS SmallDateTime), 0, N'minhnguyen998vp@gmail.com', 2)
INSERT [dbo].[Khachhang] ([Makh], [Hotenkh], [Diachikh], [Dienthoaikh], [Tendn], [Matkhau], [Ngaysinh], [Gioitinh], [Email], [Quyen]) VALUES (3, N'minh', NULL, NULL, N'admin', N'admin', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Khachhang] OFF
SET IDENTITY_INSERT [dbo].[LienHe] ON 

INSERT [dbo].[LienHe] ([ID], [Hoten], [Phone], [Email], [Noidung]) VALUES (1, N'Nguyễn Văn Minh', N'0325942121', N'minhnguyen998vp@gmail.com', N' Check Liên hệ')
SET IDENTITY_INSERT [dbo].[LienHe] OFF
SET IDENTITY_INSERT [dbo].[Nhaxuatban] ON 

INSERT [dbo].[Nhaxuatban] ([Manxb], [Tennxb]) VALUES (1, N'Khang Việt')
INSERT [dbo].[Nhaxuatban] ([Manxb], [Tennxb]) VALUES (2, N'Minh Long')
INSERT [dbo].[Nhaxuatban] ([Manxb], [Tennxb]) VALUES (3, N'Nhân Văn')
INSERT [dbo].[Nhaxuatban] ([Manxb], [Tennxb]) VALUES (4, N'Mc Book')
INSERT [dbo].[Nhaxuatban] ([Manxb], [Tennxb]) VALUES (5, N'NXB Giáo Dục')
INSERT [dbo].[Nhaxuatban] ([Manxb], [Tennxb]) VALUES (6, N'NXB Kim Đồng')
INSERT [dbo].[Nhaxuatban] ([Manxb], [Tennxb]) VALUES (7, N'Thành Nghĩa')
INSERT [dbo].[Nhaxuatban] ([Manxb], [Tennxb]) VALUES (8, N'Minh Thắng')
INSERT [dbo].[Nhaxuatban] ([Manxb], [Tennxb]) VALUES (9, N'Kinh Tế')
INSERT [dbo].[Nhaxuatban] ([Manxb], [Tennxb]) VALUES (10, N'Sách Hoa Hồng')
INSERT [dbo].[Nhaxuatban] ([Manxb], [Tennxb]) VALUES (11, N'NXB Trẻ')
INSERT [dbo].[Nhaxuatban] ([Manxb], [Tennxb]) VALUES (12, N'ZenBook')
SET IDENTITY_INSERT [dbo].[Nhaxuatban] OFF
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1008, N'Toán tiểu học lớp 5', CAST(20000 AS Decimal(18, 0)), N'đ', N'Toán lớp 5', N'gk.jpg', 2, 3, CAST(N'2019-04-01 00:00:00' AS SmallDateTime), 3, 12, NULL, NULL)
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1009, N'Hóa học', CAST(21000 AS Decimal(18, 0)), N'đ', N'Hóa học', N'gk3.jpg', 2, 3, CAST(N'2019-04-01 00:00:00' AS SmallDateTime), 3, 12, NULL, NULL)
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1010, N'Vật lý', CAST(22000 AS Decimal(18, 0)), N'đ', N'Vật lý', N'gk4.jpg', 2, 3, CAST(N'2019-04-01 00:00:00' AS SmallDateTime), 3, 12, NULL, NULL)
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1011, N'Fire and Fury', CAST(50000 AS Decimal(18, 0)), N'đ', N'Sách khoa học', N'kkk.jpg', 4, 3, CAST(N'2019-04-01 00:00:00' AS SmallDateTime), 3, 12, NULL, NULL)
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1012, N'Ngữ văn', CAST(50000 AS Decimal(18, 0)), N'đ', N'Sách giáo khoa', N'gk5.jpg', 2, 4, CAST(N'2019-04-01 00:00:00' AS SmallDateTime), 1, 20, NULL, NULL)
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1013, N'Thuật tư tưởng', CAST(275000 AS Decimal(18, 0)), N'đ', N'Sách khoa học', N'k.jpg', 3, 5, CAST(N'2019-06-01 00:00:00' AS SmallDateTime), 2, 40, NULL, NULL)
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1014, N'Giao lưu nền văn hóa Việt Nam Nhật Bản', CAST(500000 AS Decimal(18, 0)), N'đ', N'Khoa học', N'kk.jpg', 4, 5, CAST(N'2019-01-01 00:00:00' AS SmallDateTime), 3, 30, NULL, NULL)
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1015, N'Cooki mẹ tạp dề', CAST(36700 AS Decimal(18, 0)), N'đ', N'hhhh', N't.jpg', 3, 1, CAST(N'2019-08-02 00:00:00' AS SmallDateTime), 1, 22, NULL, NULL)
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1016, N'Hành trình tri thức của ', CAST(42000 AS Decimal(18, 0)), N'đ', N'gjfghkgh', N'kkkkk.jpg', 5, 2, CAST(N'2019-02-03 00:00:00' AS SmallDateTime), 3, 10, NULL, NULL)
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1017, N'Những đứa con của bóng tối', CAST(120000 AS Decimal(18, 0)), N'đ', N'Tại sao những người trẻ phương Tây nhìn trưởng thành và tự chủ hơn rất nhiều so với những người trẻ Việt Nam? Câu trả lời có lẽ nằm ở chỗ: Các nước phát triển lấy giáo dục tự chủ cho con em mình làm mục tiêu hàng đầu, họ dạy cho học sinh biết suy nghĩ phải học như thế nào để tiến đến thành nhân, trở thành con người tự chủ. 
Chúng ta đang giáo dục con em mình thế nào trong gia đình và nhà trường? Phải chăng là quá coi trọng sự truyền đạt các tri thức giáo khoa một chiều, mà hệ quả là dẫn đến sự thụ động. Trong khi đó, phương Tây họ coi phương pháp học, cách thức tổ chức việc học là một trong những yếu tố cần thiết và quan trọng hàng đầu trong việc giáo dục con em. 
Chúng ta có thể học nền giáo dục phương Tây bằng nhiều cách: mời chuyên gia nước ngoài về; tiếp thu những công nghệ giáo dục tiên tiến qua con đường giao lưu, trao đổi văn hóa-giáo dục; nghiên cứu so sánh các nền giáo dục để biết chúng ta đang ở đâu, đi đúng đường, lạc đường hay nhầm đường?… Một trong những cách học hiệu quả và ít tốn kém có lẽ là học từ sách, bằng cách tìm dịch những cuốn sách hay (của phương Tây) ứng dụng thực tế cho các lứa tuổi học sinh, cho phụ huynh và giáo viên mà cuốn sách Học thế nào bây giờ? là một trong những cuốn đầu tiên do Dự án Kid’s Books triển khai. 
Bằng một lối viết phù hợp với lứa tuổi, qua cuốn sách Học thế nào bây giờ?, Giáo sư Giordan André, Đại học Genève - Thụy Sĩ, đã đề cập và phân tích những chủ đề hết sức cần thiết cho việc học như: học hiểu về não bộ, học tự chủ, học ghi chép, học quản lý thời gian, v.v… 
Cuốn sách giải thích cho học sinh những thái độ nên có, cách thức và phương pháp tổ chức việc học tập ở nhà cũng như ở trường... Học sinh sẽ tìm thấy trong cuốn sách những lời khuyên hữu ích giúp bản thân thành công hơn trên con đường học tập. 
Cuốn sách cũng là một người bạn tốt của phụ huynh và giáo viên, giúp họ bình tĩnh nhìn lại việc dạy và học của bản thân cũng như việc học của con em mình. 
Tóm lại, Học thế nào bây giờ? là cuốn sách rất thiết thực cho tất cả học sinh cũng như phụ huynh trong việc hỗ trợ con cái học tập. Cuốn sách là cẩm nang quý giúp học sinh Việt Nam trong cuộc sống và trong việc học tập hằng ngày.', N'test.jpg', 2, 1, CAST(N'2019-04-02 00:00:00' AS SmallDateTime), 1, 12, CAST(10000 AS Decimal(18, 0)), N'Học thế nào bây giờ - Chiến Lược Phát Triển Bản Thân Và Thành Công Trong Việc Học - Dành Cho Học Sinh Cấp II')
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1018, N'Truyện ngắn hay 2018', CAST(120000 AS Decimal(18, 0)), N'đ', N'Tại sao những người trẻ phương Tây nhìn trưởng thành và tự chủ hơn rất nhiều so với những người trẻ Việt Nam? Câu trả lời có lẽ nằm ở chỗ: Các nước phát triển lấy giáo dục tự chủ cho con em mình làm mục tiêu hàng đầu, họ dạy cho học sinh biết suy nghĩ phải học như thế nào để tiến đến thành nhân, trở thành con người tự chủ. 
Chúng ta đang giáo dục con em mình thế nào trong gia đình và nhà trường? Phải chăng là quá coi trọng sự truyền đạt các tri thức giáo khoa một chiều, mà hệ quả là dẫn đến sự thụ động. Trong khi đó, phương Tây họ coi phương pháp học, cách thức tổ chức việc học là một trong những yếu tố cần thiết và quan trọng hàng đầu trong việc giáo dục con em. 
Chúng ta có thể học nền giáo dục phương Tây bằng nhiều cách: mời chuyên gia nước ngoài về; tiếp thu những công nghệ giáo dục tiên tiến qua con đường giao lưu, trao đổi văn hóa-giáo dục; nghiên cứu so sánh các nền giáo dục để biết chúng ta đang ở đâu, đi đúng đường, lạc đường hay nhầm đường?… Một trong những cách học hiệu quả và ít tốn kém có lẽ là học từ sách, bằng cách tìm dịch những cuốn sách hay (của phương Tây) ứng dụng thực tế cho các lứa tuổi học sinh, cho phụ huynh và giáo viên mà cuốn sách Học thế nào bây giờ? là một trong những cuốn đầu tiên do Dự án Kid’s Books triển khai. 
Bằng một lối viết phù hợp với lứa tuổi, qua cuốn sách Học thế nào bây giờ?, Giáo sư Giordan André, Đại học Genève - Thụy Sĩ, đã đề cập và phân tích những chủ đề hết sức cần thiết cho việc học như: học hiểu về não bộ, học tự chủ, học ghi chép, học quản lý thời gian, v.v… 
Cuốn sách giải thích cho học sinh những thái độ nên có, cách thức và phương pháp tổ chức việc học tập ở nhà cũng như ở trường... Học sinh sẽ tìm thấy trong cuốn sách những lời khuyên hữu ích giúp bản thân thành công hơn trên con đường học tập. 
Cuốn sách cũng là một người bạn tốt của phụ huynh và giáo viên, giúp họ bình tĩnh nhìn lại việc dạy và học của bản thân cũng như việc học của con em mình. 
Tóm lại, Học thế nào bây giờ? là cuốn sách rất thiết thực cho tất cả học sinh cũng như phụ huynh trong việc hỗ trợ con cái học tập. Cuốn sách là cẩm nang quý giúp học sinh Việt Nam trong cuộc sống và trong việc học tập hằng ngày.', N'-truyen-ngan-hay-2018_94009_1.jpg', 2, 1, CAST(N'2019-04-02 00:00:00' AS SmallDateTime), 1, 12, CAST(10000 AS Decimal(18, 0)), N'Học thế nào bây giờ - Chiến Lược Phát Triển Bản Thân Và Thành Công Trong Việc Học - Dành Cho Học Sinh Cấp II')
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1019, N'3 phút thiền', CAST(120000 AS Decimal(18, 0)), N'đ', N'Tại sao những người trẻ phương Tây nhìn trưởng thành và tự chủ hơn rất nhiều so với những người trẻ Việt Nam? Câu trả lời có lẽ nằm ở chỗ: Các nước phát triển lấy giáo dục tự chủ cho con em mình làm mục tiêu hàng đầu, họ dạy cho học sinh biết suy nghĩ phải học như thế nào để tiến đến thành nhân, trở thành con người tự chủ. 
Chúng ta đang giáo dục con em mình thế nào trong gia đình và nhà trường? Phải chăng là quá coi trọng sự truyền đạt các tri thức giáo khoa một chiều, mà hệ quả là dẫn đến sự thụ động. Trong khi đó, phương Tây họ coi phương pháp học, cách thức tổ chức việc học là một trong những yếu tố cần thiết và quan trọng hàng đầu trong việc giáo dục con em. 
Chúng ta có thể học nền giáo dục phương Tây bằng nhiều cách: mời chuyên gia nước ngoài về; tiếp thu những công nghệ giáo dục tiên tiến qua con đường giao lưu, trao đổi văn hóa-giáo dục; nghiên cứu so sánh các nền giáo dục để biết chúng ta đang ở đâu, đi đúng đường, lạc đường hay nhầm đường?… Một trong những cách học hiệu quả và ít tốn kém có lẽ là học từ sách, bằng cách tìm dịch những cuốn sách hay (của phương Tây) ứng dụng thực tế cho các lứa tuổi học sinh, cho phụ huynh và giáo viên mà cuốn sách Học thế nào bây giờ? là một trong những cuốn đầu tiên do Dự án Kid’s Books triển khai. 
Bằng một lối viết phù hợp với lứa tuổi, qua cuốn sách Học thế nào bây giờ?, Giáo sư Giordan André, Đại học Genève - Thụy Sĩ, đã đề cập và phân tích những chủ đề hết sức cần thiết cho việc học như: học hiểu về não bộ, học tự chủ, học ghi chép, học quản lý thời gian, v.v… 
Cuốn sách giải thích cho học sinh những thái độ nên có, cách thức và phương pháp tổ chức việc học tập ở nhà cũng như ở trường... Học sinh sẽ tìm thấy trong cuốn sách những lời khuyên hữu ích giúp bản thân thành công hơn trên con đường học tập. 
Cuốn sách cũng là một người bạn tốt của phụ huynh và giáo viên, giúp họ bình tĩnh nhìn lại việc dạy và học của bản thân cũng như việc học của con em mình. 
Tóm lại, Học thế nào bây giờ? là cuốn sách rất thiết thực cho tất cả học sinh cũng như phụ huynh trong việc hỗ trợ con cái học tập. Cuốn sách là cẩm nang quý giúp học sinh Việt Nam trong cuộc sống và trong việc học tập hằng ngày.', N'3-phut-thien_95889_1.jpg', 2, 1, CAST(N'2019-04-02 00:00:00' AS SmallDateTime), 1, 12, CAST(10000 AS Decimal(18, 0)), N'Học thế nào bây giờ - Chiến Lược Phát Triển Bản Thân Và Thành Công Trong Việc Học - Dành Cho Học Sinh Cấp II')
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1020, N'365 ngày hoàng đạo Song Tử', CAST(120000 AS Decimal(18, 0)), N'đ', N'Tại sao những người trẻ phương Tây nhìn trưởng thành và tự chủ hơn rất nhiều so với những người trẻ Việt Nam? Câu trả lời có lẽ nằm ở chỗ: Các nước phát triển lấy giáo dục tự chủ cho con em mình làm mục tiêu hàng đầu, họ dạy cho học sinh biết suy nghĩ phải học như thế nào để tiến đến thành nhân, trở thành con người tự chủ. 
Chúng ta đang giáo dục con em mình thế nào trong gia đình và nhà trường? Phải chăng là quá coi trọng sự truyền đạt các tri thức giáo khoa một chiều, mà hệ quả là dẫn đến sự thụ động. Trong khi đó, phương Tây họ coi phương pháp học, cách thức tổ chức việc học là một trong những yếu tố cần thiết và quan trọng hàng đầu trong việc giáo dục con em. 
Chúng ta có thể học nền giáo dục phương Tây bằng nhiều cách: mời chuyên gia nước ngoài về; tiếp thu những công nghệ giáo dục tiên tiến qua con đường giao lưu, trao đổi văn hóa-giáo dục; nghiên cứu so sánh các nền giáo dục để biết chúng ta đang ở đâu, đi đúng đường, lạc đường hay nhầm đường?… Một trong những cách học hiệu quả và ít tốn kém có lẽ là học từ sách, bằng cách tìm dịch những cuốn sách hay (của phương Tây) ứng dụng thực tế cho các lứa tuổi học sinh, cho phụ huynh và giáo viên mà cuốn sách Học thế nào bây giờ? là một trong những cuốn đầu tiên do Dự án Kid’s Books triển khai. 
Bằng một lối viết phù hợp với lứa tuổi, qua cuốn sách Học thế nào bây giờ?, Giáo sư Giordan André, Đại học Genève - Thụy Sĩ, đã đề cập và phân tích những chủ đề hết sức cần thiết cho việc học như: học hiểu về não bộ, học tự chủ, học ghi chép, học quản lý thời gian, v.v… 
Cuốn sách giải thích cho học sinh những thái độ nên có, cách thức và phương pháp tổ chức việc học tập ở nhà cũng như ở trường... Học sinh sẽ tìm thấy trong cuốn sách những lời khuyên hữu ích giúp bản thân thành công hơn trên con đường học tập. 
Cuốn sách cũng là một người bạn tốt của phụ huynh và giáo viên, giúp họ bình tĩnh nhìn lại việc dạy và học của bản thân cũng như việc học của con em mình. 
Tóm lại, Học thế nào bây giờ? là cuốn sách rất thiết thực cho tất cả học sinh cũng như phụ huynh trong việc hỗ trợ con cái học tập. Cuốn sách là cẩm nang quý giúp học sinh Việt Nam trong cuộc sống và trong việc học tập hằng ngày.', N'365-ngay-hoang-dao-song-tu-tai-ban-2018-_90680_1.jpg', 2, 1, CAST(N'2019-04-02 00:00:00' AS SmallDateTime), 1, 12, CAST(10000 AS Decimal(18, 0)), N'Học thế nào bây giờ - Chiến Lược Phát Triển Bản Thân Và Thành Công Trong Việc Học - Dành Cho Học Sinh Cấp II')
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1021, N'Con nít con nôi', CAST(120000 AS Decimal(18, 0)), N'đ', N'Tại sao những người trẻ phương Tây nhìn trưởng thành và tự chủ hơn rất nhiều so với những người trẻ Việt Nam? Câu trả lời có lẽ nằm ở chỗ: Các nước phát triển lấy giáo dục tự chủ cho con em mình làm mục tiêu hàng đầu, họ dạy cho học sinh biết suy nghĩ phải học như thế nào để tiến đến thành nhân, trở thành con người tự chủ. 
Chúng ta đang giáo dục con em mình thế nào trong gia đình và nhà trường? Phải chăng là quá coi trọng sự truyền đạt các tri thức giáo khoa một chiều, mà hệ quả là dẫn đến sự thụ động. Trong khi đó, phương Tây họ coi phương pháp học, cách thức tổ chức việc học là một trong những yếu tố cần thiết và quan trọng hàng đầu trong việc giáo dục con em. 
Chúng ta có thể học nền giáo dục phương Tây bằng nhiều cách: mời chuyên gia nước ngoài về; tiếp thu những công nghệ giáo dục tiên tiến qua con đường giao lưu, trao đổi văn hóa-giáo dục; nghiên cứu so sánh các nền giáo dục để biết chúng ta đang ở đâu, đi đúng đường, lạc đường hay nhầm đường?… Một trong những cách học hiệu quả và ít tốn kém có lẽ là học từ sách, bằng cách tìm dịch những cuốn sách hay (của phương Tây) ứng dụng thực tế cho các lứa tuổi học sinh, cho phụ huynh và giáo viên mà cuốn sách Học thế nào bây giờ? là một trong những cuốn đầu tiên do Dự án Kid’s Books triển khai. 
Bằng một lối viết phù hợp với lứa tuổi, qua cuốn sách Học thế nào bây giờ?, Giáo sư Giordan André, Đại học Genève - Thụy Sĩ, đã đề cập và phân tích những chủ đề hết sức cần thiết cho việc học như: học hiểu về não bộ, học tự chủ, học ghi chép, học quản lý thời gian, v.v… 
Cuốn sách giải thích cho học sinh những thái độ nên có, cách thức và phương pháp tổ chức việc học tập ở nhà cũng như ở trường... Học sinh sẽ tìm thấy trong cuốn sách những lời khuyên hữu ích giúp bản thân thành công hơn trên con đường học tập. 
Cuốn sách cũng là một người bạn tốt của phụ huynh và giáo viên, giúp họ bình tĩnh nhìn lại việc dạy và học của bản thân cũng như việc học của con em mình. 
Tóm lại, Học thế nào bây giờ? là cuốn sách rất thiết thực cho tất cả học sinh cũng như phụ huynh trong việc hỗ trợ con cái học tập. Cuốn sách là cẩm nang quý giúp học sinh Việt Nam trong cuộc sống và trong việc học tập hằng ngày.', N'76171_con-nit-con-noi-kiddie-kiddo-song-ngu-viet-anh-phien-ban-li-xi-tet_75993_1.jpg', 2, 1, CAST(N'2019-04-02 00:00:00' AS SmallDateTime), 1, 12, CAST(10000 AS Decimal(18, 0)), N'Học thế nào bây giờ - Chiến Lược Phát Triển Bản Thân Và Thành Công Trong Việc Học - Dành Cho Học Sinh Cấp II')
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1022, N'Bí quyết kinh doanh của Shark Mark Cuban', CAST(120000 AS Decimal(18, 0)), N'đ', N'Tại sao những người trẻ phương Tây nhìn trưởng thành và tự chủ hơn rất nhiều so với những người trẻ Việt Nam? Câu trả lời có lẽ nằm ở chỗ: Các nước phát triển lấy giáo dục tự chủ cho con em mình làm mục tiêu hàng đầu, họ dạy cho học sinh biết suy nghĩ phải học như thế nào để tiến đến thành nhân, trở thành con người tự chủ. 
Chúng ta đang giáo dục con em mình thế nào trong gia đình và nhà trường? Phải chăng là quá coi trọng sự truyền đạt các tri thức giáo khoa một chiều, mà hệ quả là dẫn đến sự thụ động. Trong khi đó, phương Tây họ coi phương pháp học, cách thức tổ chức việc học là một trong những yếu tố cần thiết và quan trọng hàng đầu trong việc giáo dục con em. 
Chúng ta có thể học nền giáo dục phương Tây bằng nhiều cách: mời chuyên gia nước ngoài về; tiếp thu những công nghệ giáo dục tiên tiến qua con đường giao lưu, trao đổi văn hóa-giáo dục; nghiên cứu so sánh các nền giáo dục để biết chúng ta đang ở đâu, đi đúng đường, lạc đường hay nhầm đường?… Một trong những cách học hiệu quả và ít tốn kém có lẽ là học từ sách, bằng cách tìm dịch những cuốn sách hay (của phương Tây) ứng dụng thực tế cho các lứa tuổi học sinh, cho phụ huynh và giáo viên mà cuốn sách Học thế nào bây giờ? là một trong những cuốn đầu tiên do Dự án Kid’s Books triển khai. 
Bằng một lối viết phù hợp với lứa tuổi, qua cuốn sách Học thế nào bây giờ?, Giáo sư Giordan André, Đại học Genève - Thụy Sĩ, đã đề cập và phân tích những chủ đề hết sức cần thiết cho việc học như: học hiểu về não bộ, học tự chủ, học ghi chép, học quản lý thời gian, v.v… 
Cuốn sách giải thích cho học sinh những thái độ nên có, cách thức và phương pháp tổ chức việc học tập ở nhà cũng như ở trường... Học sinh sẽ tìm thấy trong cuốn sách những lời khuyên hữu ích giúp bản thân thành công hơn trên con đường học tập. 
Cuốn sách cũng là một người bạn tốt của phụ huynh và giáo viên, giúp họ bình tĩnh nhìn lại việc dạy và học của bản thân cũng như việc học của con em mình. 
Tóm lại, Học thế nào bây giờ? là cuốn sách rất thiết thực cho tất cả học sinh cũng như phụ huynh trong việc hỗ trợ con cái học tập. Cuốn sách là cẩm nang quý giúp học sinh Việt Nam trong cuộc sống và trong việc học tập hằng ngày.', N'america-shark-tank-ren-luyen-y-chi-chien-thang-cung-shark-mark-cuban_93708_1.jpg', 2, 1, CAST(N'2019-04-02 00:00:00' AS SmallDateTime), 1, 12, CAST(10000 AS Decimal(18, 0)), N'Học thế nào bây giờ - Chiến Lược Phát Triển Bản Thân Và Thành Công Trong Việc Học - Dành Cho Học Sinh Cấp II')
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1023, N'Những "mẹo" thích nghi tài tình blahhhhhhhhhhhhhhhhhhhhhhhhhhh', CAST(120000 AS Decimal(18, 0)), N'đ', N'Tại sao những người trẻ phương Tây nhìn trưởng thành và tự chủ hơn rất nhiều so với những người trẻ Việt Nam? Câu trả lời có lẽ nằm ở chỗ: Các nước phát triển lấy giáo dục tự chủ cho con em mình làm mục tiêu hàng đầu, họ dạy cho học sinh biết suy nghĩ phải học như thế nào để tiến đến thành nhân, trở thành con người tự chủ. 
Chúng ta đang giáo dục con em mình thế nào trong gia đình và nhà trường? Phải chăng là quá coi trọng sự truyền đạt các tri thức giáo khoa một chiều, mà hệ quả là dẫn đến sự thụ động. Trong khi đó, phương Tây họ coi phương pháp học, cách thức tổ chức việc học là một trong những yếu tố cần thiết và quan trọng hàng đầu trong việc giáo dục con em. 
Chúng ta có thể học nền giáo dục phương Tây bằng nhiều cách: mời chuyên gia nước ngoài về; tiếp thu những công nghệ giáo dục tiên tiến qua con đường giao lưu, trao đổi văn hóa-giáo dục; nghiên cứu so sánh các nền giáo dục để biết chúng ta đang ở đâu, đi đúng đường, lạc đường hay nhầm đường?… Một trong những cách học hiệu quả và ít tốn kém có lẽ là học từ sách, bằng cách tìm dịch những cuốn sách hay (của phương Tây) ứng dụng thực tế cho các lứa tuổi học sinh, cho phụ huynh và giáo viên mà cuốn sách Học thế nào bây giờ? là một trong những cuốn đầu tiên do Dự án Kid’s Books triển khai. 
Bằng một lối viết phù hợp với lứa tuổi, qua cuốn sách Học thế nào bây giờ?, Giáo sư Giordan André, Đại học Genève - Thụy Sĩ, đã đề cập và phân tích những chủ đề hết sức cần thiết cho việc học như: học hiểu về não bộ, học tự chủ, học ghi chép, học quản lý thời gian, v.v… 
Cuốn sách giải thích cho học sinh những thái độ nên có, cách thức và phương pháp tổ chức việc học tập ở nhà cũng như ở trường... Học sinh sẽ tìm thấy trong cuốn sách những lời khuyên hữu ích giúp bản thân thành công hơn trên con đường học tập. 
Cuốn sách cũng là một người bạn tốt của phụ huynh và giáo viên, giúp họ bình tĩnh nhìn lại việc dạy và học của bản thân cũng như việc học của con em mình. 
Tóm lại, Học thế nào bây giờ? là cuốn sách rất thiết thực cho tất cả học sinh cũng như phụ huynh trong việc hỗ trợ con cái học tập. Cuốn sách là cẩm nang quý giúp học sinh Việt Nam trong cuộc sống và trong việc học tập hằng ngày.', N'test2.jpg', 2, 1, CAST(N'2019-04-02 00:00:00' AS SmallDateTime), 1, 12, CAST(100000 AS Decimal(18, 0)), N'Học thế nào bây giờ - Chiến Lược Phát Triển Bản Thân Và Thành Công Trong Việc Học - Dành Cho Học Sinh Cấp II')
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1024, N'Những "mẹo" thích nghi tài tình blahhhhhhhhhhhhhhhhhhhhhhhhhhh', CAST(120000 AS Decimal(18, 0)), N'đ', N'Tại sao những người trẻ phương Tây nhìn trưởng thành và tự chủ hơn rất nhiều so với những người trẻ Việt Nam? Câu trả lời có lẽ nằm ở chỗ: Các nước phát triển lấy giáo dục tự chủ cho con em mình làm mục tiêu hàng đầu, họ dạy cho học sinh biết suy nghĩ phải học như thế nào để tiến đến thành nhân, trở thành con người tự chủ. 
Chúng ta đang giáo dục con em mình thế nào trong gia đình và nhà trường? Phải chăng là quá coi trọng sự truyền đạt các tri thức giáo khoa một chiều, mà hệ quả là dẫn đến sự thụ động. Trong khi đó, phương Tây họ coi phương pháp học, cách thức tổ chức việc học là một trong những yếu tố cần thiết và quan trọng hàng đầu trong việc giáo dục con em. 
Chúng ta có thể học nền giáo dục phương Tây bằng nhiều cách: mời chuyên gia nước ngoài về; tiếp thu những công nghệ giáo dục tiên tiến qua con đường giao lưu, trao đổi văn hóa-giáo dục; nghiên cứu so sánh các nền giáo dục để biết chúng ta đang ở đâu, đi đúng đường, lạc đường hay nhầm đường?… Một trong những cách học hiệu quả và ít tốn kém có lẽ là học từ sách, bằng cách tìm dịch những cuốn sách hay (của phương Tây) ứng dụng thực tế cho các lứa tuổi học sinh, cho phụ huynh và giáo viên mà cuốn sách Học thế nào bây giờ? là một trong những cuốn đầu tiên do Dự án Kid’s Books triển khai. 
Bằng một lối viết phù hợp với lứa tuổi, qua cuốn sách Học thế nào bây giờ?, Giáo sư Giordan André, Đại học Genève - Thụy Sĩ, đã đề cập và phân tích những chủ đề hết sức cần thiết cho việc học như: học hiểu về não bộ, học tự chủ, học ghi chép, học quản lý thời gian, v.v… 
Cuốn sách giải thích cho học sinh những thái độ nên có, cách thức và phương pháp tổ chức việc học tập ở nhà cũng như ở trường... Học sinh sẽ tìm thấy trong cuốn sách những lời khuyên hữu ích giúp bản thân thành công hơn trên con đường học tập. 
Cuốn sách cũng là một người bạn tốt của phụ huynh và giáo viên, giúp họ bình tĩnh nhìn lại việc dạy và học của bản thân cũng như việc học của con em mình. 
Tóm lại, Học thế nào bây giờ? là cuốn sách rất thiết thực cho tất cả học sinh cũng như phụ huynh trong việc hỗ trợ con cái học tập. Cuốn sách là cẩm nang quý giúp học sinh Việt Nam trong cuộc sống và trong việc học tập hằng ngày.', N'test2.jpg', 2, 1, CAST(N'2019-04-03 00:00:00' AS SmallDateTime), 1, 12, CAST(100000 AS Decimal(18, 0)), N'Học thế nào bây giờ - Chiến Lược Phát Triển Bản Thân Và Thành Công Trong Việc Học - Dành Cho Học Sinh Cấp II')
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1025, N'Bạn bè tôi vẫn ngỏm cả rồi', CAST(36000 AS Decimal(18, 0)), N'đ', N'Tại sao những người trẻ phương Tây nhìn trưởng thành và tự chủ hơn rất nhiều so với những người trẻ Việt Nam? Câu trả lời có lẽ nằm ở chỗ: Các nước phát triển lấy giáo dục tự chủ cho con em mình làm mục tiêu hàng đầu, họ dạy cho học sinh biết suy nghĩ phải học như thế nào để tiến đến thành nhân, trở thành con người tự chủ. 
Chúng ta đang giáo dục con em mình thế nào trong gia đình và nhà trường? Phải chăng là quá coi trọng sự truyền đạt các tri thức giáo khoa một chiều, mà hệ quả là dẫn đến sự thụ động. Trong khi đó, phương Tây họ coi phương pháp học, cách thức tổ chức việc học là một trong những yếu tố cần thiết và quan trọng hàng đầu trong việc giáo dục con em. 
Chúng ta có thể học nền giáo dục phương Tây bằng nhiều cách: mời chuyên gia nước ngoài về; tiếp thu những công nghệ giáo dục tiên tiến qua con đường giao lưu, trao đổi văn hóa-giáo dục; nghiên cứu so sánh các nền giáo dục để biết chúng ta đang ở đâu, đi đúng đường, lạc đường hay nhầm đường?… Một trong những cách học hiệu quả và ít tốn kém có lẽ là học từ sách, bằng cách tìm dịch những cuốn sách hay (của phương Tây) ứng dụng thực tế cho các lứa tuổi học sinh, cho phụ huynh và giáo viên mà cuốn sách Học thế nào bây giờ? là một trong những cuốn đầu tiên do Dự án Kid’s Books triển khai. 
Bằng một lối viết phù hợp với lứa tuổi, qua cuốn sách Học thế nào bây giờ?, Giáo sư Giordan André, Đại học Genève - Thụy Sĩ, đã đề cập và phân tích những chủ đề hết sức cần thiết cho việc học như: học hiểu về não bộ, học tự chủ, học ghi chép, học quản lý thời gian, v.v… 
Cuốn sách giải thích cho học sinh những thái độ nên có, cách thức và phương pháp tổ chức việc học tập ở nhà cũng như ở trường... Học sinh sẽ tìm thấy trong cuốn sách những lời khuyên hữu ích giúp bản thân thành công hơn trên con đường học tập. 
Cuốn sách cũng là một người bạn tốt của phụ huynh và giáo viên, giúp họ bình tĩnh nhìn lại việc dạy và học của bản thân cũng như việc học của con em mình. 
Tóm lại, Học thế nào bây giờ? là cuốn sách rất thiết thực cho tất cả học sinh cũng như phụ huynh trong việc hỗ trợ con cái học tập. Cuốn sách là cẩm nang quý giúp học sinh Việt Nam trong cuộc sống và trong việc học tập hằng ngày.', N'ban-be-toi-van-ngom-ca-roi_91155_1.jpg', 2, 1, CAST(N'2019-04-03 00:00:00' AS SmallDateTime), 1, 12, NULL, N'Học thế nào bây giờ - Chiến Lược Phát Triển Bản Thân Và Thành Công Trong Việc Học - Dành Cho Học Sinh Cấp II')
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1026, N'Chân trời của hình ảnh', CAST(960000 AS Decimal(18, 0)), N'đ', N'Tại sao những người trẻ phương Tây nhìn trưởng thành và tự chủ hơn rất nhiều so với những người trẻ Việt Nam? Câu trả lời có lẽ nằm ở chỗ: Các nước phát triển lấy giáo dục tự chủ cho con em mình làm mục tiêu hàng đầu, họ dạy cho học sinh biết suy nghĩ phải học như thế nào để tiến đến thành nhân, trở thành con người tự chủ. 
Chúng ta đang giáo dục con em mình thế nào trong gia đình và nhà trường? Phải chăng là quá coi trọng sự truyền đạt các tri thức giáo khoa một chiều, mà hệ quả là dẫn đến sự thụ động. Trong khi đó, phương Tây họ coi phương pháp học, cách thức tổ chức việc học là một trong những yếu tố cần thiết và quan trọng hàng đầu trong việc giáo dục con em. 
Chúng ta có thể học nền giáo dục phương Tây bằng nhiều cách: mời chuyên gia nước ngoài về; tiếp thu những công nghệ giáo dục tiên tiến qua con đường giao lưu, trao đổi văn hóa-giáo dục; nghiên cứu so sánh các nền giáo dục để biết chúng ta đang ở đâu, đi đúng đường, lạc đường hay nhầm đường?… Một trong những cách học hiệu quả và ít tốn kém có lẽ là học từ sách, bằng cách tìm dịch những cuốn sách hay (của phương Tây) ứng dụng thực tế cho các lứa tuổi học sinh, cho phụ huynh và giáo viên mà cuốn sách Học thế nào bây giờ? là một trong những cuốn đầu tiên do Dự án Kid’s Books triển khai. 
Bằng một lối viết phù hợp với lứa tuổi, qua cuốn sách Học thế nào bây giờ?, Giáo sư Giordan André, Đại học Genève - Thụy Sĩ, đã đề cập và phân tích những chủ đề hết sức cần thiết cho việc học như: học hiểu về não bộ, học tự chủ, học ghi chép, học quản lý thời gian, v.v… 
Cuốn sách giải thích cho học sinh những thái độ nên có, cách thức và phương pháp tổ chức việc học tập ở nhà cũng như ở trường... Học sinh sẽ tìm thấy trong cuốn sách những lời khuyên hữu ích giúp bản thân thành công hơn trên con đường học tập. 
Cuốn sách cũng là một người bạn tốt của phụ huynh và giáo viên, giúp họ bình tĩnh nhìn lại việc dạy và học của bản thân cũng như việc học của con em mình. 
Tóm lại, Học thế nào bây giờ? là cuốn sách rất thiết thực cho tất cả học sinh cũng như phụ huynh trong việc hỗ trợ con cái học tập. Cuốn sách là cẩm nang quý giúp học sinh Việt Nam trong cuộc sống và trong việc học tập hằng ngày.', N'chan-troi-cua-dien-anh_75167_2.jpg', 2, 1, CAST(N'2019-04-03 00:00:00' AS SmallDateTime), 1, 12, CAST(690000 AS Decimal(18, 0)), N'Học thế nào bây giờ - Chiến Lược Phát Triển Bản Thân Và Thành Công Trong Việc Học - Dành Cho Học Sinh Cấp II')
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1027, N'Cô bé chim gõ kiến', CAST(66000 AS Decimal(18, 0)), N'đ', N'Tại sao những người trẻ phương Tây nhìn trưởng thành và tự chủ hơn rất nhiều so với những người trẻ Việt Nam? Câu trả lời có lẽ nằm ở chỗ: Các nước phát triển lấy giáo dục tự chủ cho con em mình làm mục tiêu hàng đầu, họ dạy cho học sinh biết suy nghĩ phải học như thế nào để tiến đến thành nhân, trở thành con người tự chủ. 
Chúng ta đang giáo dục con em mình thế nào trong gia đình và nhà trường? Phải chăng là quá coi trọng sự truyền đạt các tri thức giáo khoa một chiều, mà hệ quả là dẫn đến sự thụ động. Trong khi đó, phương Tây họ coi phương pháp học, cách thức tổ chức việc học là một trong những yếu tố cần thiết và quan trọng hàng đầu trong việc giáo dục con em. 
Chúng ta có thể học nền giáo dục phương Tây bằng nhiều cách: mời chuyên gia nước ngoài về; tiếp thu những công nghệ giáo dục tiên tiến qua con đường giao lưu, trao đổi văn hóa-giáo dục; nghiên cứu so sánh các nền giáo dục để biết chúng ta đang ở đâu, đi đúng đường, lạc đường hay nhầm đường?… Một trong những cách học hiệu quả và ít tốn kém có lẽ là học từ sách, bằng cách tìm dịch những cuốn sách hay (của phương Tây) ứng dụng thực tế cho các lứa tuổi học sinh, cho phụ huynh và giáo viên mà cuốn sách Học thế nào bây giờ? là một trong những cuốn đầu tiên do Dự án Kid’s Books triển khai. 
Bằng một lối viết phù hợp với lứa tuổi, qua cuốn sách Học thế nào bây giờ?, Giáo sư Giordan André, Đại học Genève - Thụy Sĩ, đã đề cập và phân tích những chủ đề hết sức cần thiết cho việc học như: học hiểu về não bộ, học tự chủ, học ghi chép, học quản lý thời gian, v.v… 
Cuốn sách giải thích cho học sinh những thái độ nên có, cách thức và phương pháp tổ chức việc học tập ở nhà cũng như ở trường... Học sinh sẽ tìm thấy trong cuốn sách những lời khuyên hữu ích giúp bản thân thành công hơn trên con đường học tập. 
Cuốn sách cũng là một người bạn tốt của phụ huynh và giáo viên, giúp họ bình tĩnh nhìn lại việc dạy và học của bản thân cũng như việc học của con em mình. 
Tóm lại, Học thế nào bây giờ? là cuốn sách rất thiết thực cho tất cả học sinh cũng như phụ huynh trong việc hỗ trợ con cái học tập. Cuốn sách là cẩm nang quý giúp học sinh Việt Nam trong cuộc sống và trong việc học tập hằng ngày.', N'cho-doi-thien-su-co-be-chim-go-kien_95941_1.jpg', 2, 1, CAST(N'2019-04-03 00:00:00' AS SmallDateTime), 1, 12, NULL, N'Học thế nào bây giờ - Chiến Lược Phát Triển Bản Thân Và Thành Công Trong Việc Học - Dành Cho Học Sinh Cấp II')
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1028, N'Thế giới của em trai', CAST(8000 AS Decimal(18, 0)), N'đ', N'Tại sao những người trẻ phương Tây nhìn trưởng thành và tự chủ hơn rất nhiều so với những người trẻ Việt Nam? Câu trả lời có lẽ nằm ở chỗ: Các nước phát triển lấy giáo dục tự chủ cho con em mình làm mục tiêu hàng đầu, họ dạy cho học sinh biết suy nghĩ phải học như thế nào để tiến đến thành nhân, trở thành con người tự chủ. 
Chúng ta đang giáo dục con em mình thế nào trong gia đình và nhà trường? Phải chăng là quá coi trọng sự truyền đạt các tri thức giáo khoa một chiều, mà hệ quả là dẫn đến sự thụ động. Trong khi đó, phương Tây họ coi phương pháp học, cách thức tổ chức việc học là một trong những yếu tố cần thiết và quan trọng hàng đầu trong việc giáo dục con em. 
Chúng ta có thể học nền giáo dục phương Tây bằng nhiều cách: mời chuyên gia nước ngoài về; tiếp thu những công nghệ giáo dục tiên tiến qua con đường giao lưu, trao đổi văn hóa-giáo dục; nghiên cứu so sánh các nền giáo dục để biết chúng ta đang ở đâu, đi đúng đường, lạc đường hay nhầm đường?… Một trong những cách học hiệu quả và ít tốn kém có lẽ là học từ sách, bằng cách tìm dịch những cuốn sách hay (của phương Tây) ứng dụng thực tế cho các lứa tuổi học sinh, cho phụ huynh và giáo viên mà cuốn sách Học thế nào bây giờ? là một trong những cuốn đầu tiên do Dự án Kid’s Books triển khai. 
Bằng một lối viết phù hợp với lứa tuổi, qua cuốn sách Học thế nào bây giờ?, Giáo sư Giordan André, Đại học Genève - Thụy Sĩ, đã đề cập và phân tích những chủ đề hết sức cần thiết cho việc học như: học hiểu về não bộ, học tự chủ, học ghi chép, học quản lý thời gian, v.v… 
Cuốn sách giải thích cho học sinh những thái độ nên có, cách thức và phương pháp tổ chức việc học tập ở nhà cũng như ở trường... Học sinh sẽ tìm thấy trong cuốn sách những lời khuyên hữu ích giúp bản thân thành công hơn trên con đường học tập. 
Cuốn sách cũng là một người bạn tốt của phụ huynh và giáo viên, giúp họ bình tĩnh nhìn lại việc dạy và học của bản thân cũng như việc học của con em mình. 
Tóm lại, Học thế nào bây giờ? là cuốn sách rất thiết thực cho tất cả học sinh cũng như phụ huynh trong việc hỗ trợ con cái học tập. Cuốn sách là cẩm nang quý giúp học sinh Việt Nam trong cuộc sống và trong việc học tập hằng ngày.', N'cho-doi-thien-su-the-gioi-cua-em-trai_95942_1.jpg', 2, 1, CAST(N'2019-04-03 00:00:00' AS SmallDateTime), 1, 12, NULL, N'Học thế nào bây giờ - Chiến Lược Phát Triển Bản Thân Và Thành Công Trong Việc Học - Dành Cho Học Sinh Cấp II')
INSERT [dbo].[Sach] ([Masach], [Tensach], [Dongia], [Donvitinh], [Mota], [Hinhminhhoa], [Macd], [Manxb], [Ngaycapnhat], [Matacgia], [Soluong], [Giakm], [Motangangon]) VALUES (1029, N'Chú hải cẩu hạnh phúc', CAST(32000 AS Decimal(18, 0)), N'đ', N'Tại sao những người trẻ phương Tây nhìn trưởng thành và tự chủ hơn rất nhiều so với những người trẻ Việt Nam? Câu trả lời có lẽ nằm ở chỗ: Các nước phát triển lấy giáo dục tự chủ cho con em mình làm mục tiêu hàng đầu, họ dạy cho học sinh biết suy nghĩ phải học như thế nào để tiến đến thành nhân, trở thành con người tự chủ. 
Chúng ta đang giáo dục con em mình thế nào trong gia đình và nhà trường? Phải chăng là quá coi trọng sự truyền đạt các tri thức giáo khoa một chiều, mà hệ quả là dẫn đến sự thụ động. Trong khi đó, phương Tây họ coi phương pháp học, cách thức tổ chức việc học là một trong những yếu tố cần thiết và quan trọng hàng đầu trong việc giáo dục con em. 
Chúng ta có thể học nền giáo dục phương Tây bằng nhiều cách: mời chuyên gia nước ngoài về; tiếp thu những công nghệ giáo dục tiên tiến qua con đường giao lưu, trao đổi văn hóa-giáo dục; nghiên cứu so sánh các nền giáo dục để biết chúng ta đang ở đâu, đi đúng đường, lạc đường hay nhầm đường?… Một trong những cách học hiệu quả và ít tốn kém có lẽ là học từ sách, bằng cách tìm dịch những cuốn sách hay (của phương Tây) ứng dụng thực tế cho các lứa tuổi học sinh, cho phụ huynh và giáo viên mà cuốn sách Học thế nào bây giờ? là một trong những cuốn đầu tiên do Dự án Kid’s Books triển khai. 
Bằng một lối viết phù hợp với lứa tuổi, qua cuốn sách Học thế nào bây giờ?, Giáo sư Giordan André, Đại học Genève - Thụy Sĩ, đã đề cập và phân tích những chủ đề hết sức cần thiết cho việc học như: học hiểu về não bộ, học tự chủ, học ghi chép, học quản lý thời gian, v.v… 
Cuốn sách giải thích cho học sinh những thái độ nên có, cách thức và phương pháp tổ chức việc học tập ở nhà cũng như ở trường... Học sinh sẽ tìm thấy trong cuốn sách những lời khuyên hữu ích giúp bản thân thành công hơn trên con đường học tập. 
Cuốn sách cũng là một người bạn tốt của phụ huynh và giáo viên, giúp họ bình tĩnh nhìn lại việc dạy và học của bản thân cũng như việc học của con em mình. 
Tóm lại, Học thế nào bây giờ? là cuốn sách rất thiết thực cho tất cả học sinh cũng như phụ huynh trong việc hỗ trợ con cái học tập. Cuốn sách là cẩm nang quý giúp học sinh Việt Nam trong cuộc sống và trong việc học tập hằng ngày.', N'chu-hai-cau-hanh-phuc_95946_1.jpg', 2, 1, CAST(N'2019-04-03 00:00:00' AS SmallDateTime), 1, 12, CAST(28000 AS Decimal(18, 0)), N'Học thế nào bây giờ - Chiến Lược Phát Triển Bản Thân Và Thành Công Trong Việc Học - Dành Cho Học Sinh Cấp II')
SET IDENTITY_INSERT [dbo].[Sach] OFF
SET IDENTITY_INSERT [dbo].[Tacgia] ON 

INSERT [dbo].[Tacgia] ([Matacgia], [Tentacgia]) VALUES (1, N'Trần Thị Thu Thủy')
INSERT [dbo].[Tacgia] ([Matacgia], [Tentacgia]) VALUES (2, N'Nhiều tác giả')
INSERT [dbo].[Tacgia] ([Matacgia], [Tentacgia]) VALUES (3, N'Trang Anh')
INSERT [dbo].[Tacgia] ([Matacgia], [Tentacgia]) VALUES (4, N'Nguyễn Anh Vũ')
INSERT [dbo].[Tacgia] ([Matacgia], [Tentacgia]) VALUES (5, N'Hà Vũ Anh')
INSERT [dbo].[Tacgia] ([Matacgia], [Tentacgia]) VALUES (6, N'The Windy')
INSERT [dbo].[Tacgia] ([Matacgia], [Tentacgia]) VALUES (7, N'Đại Lợi')
INSERT [dbo].[Tacgia] ([Matacgia], [Tentacgia]) VALUES (8, N'Trần Văn Sáu')
INSERT [dbo].[Tacgia] ([Matacgia], [Tentacgia]) VALUES (9, N'Nguyễn Tú Phương ')
INSERT [dbo].[Tacgia] ([Matacgia], [Tentacgia]) VALUES (10, N'Mai Lan Hương')
INSERT [dbo].[Tacgia] ([Matacgia], [Tentacgia]) VALUES (11, N'Bộ Giáo Dục Và Đào Tạo')
INSERT [dbo].[Tacgia] ([Matacgia], [Tentacgia]) VALUES (12, N'Nhóm Sư Phạm')
SET IDENTITY_INSERT [dbo].[Tacgia] OFF
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietGioHang_Giohangkh] FOREIGN KEY([GiohangkhID])
REFERENCES [dbo].[Giohangkh] ([GiohangkhID])
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_ChiTietGioHang_Giohangkh]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietGioHang_Sach] FOREIGN KEY([Masach])
REFERENCES [dbo].[Sach] ([Masach])
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_ChiTietGioHang_Sach]
GO
ALTER TABLE [dbo].[Giohangkh]  WITH CHECK ADD  CONSTRAINT [FK_Giohangkh_Khachhang] FOREIGN KEY([Makh])
REFERENCES [dbo].[Khachhang] ([Makh])
GO
ALTER TABLE [dbo].[Giohangkh] CHECK CONSTRAINT [FK_Giohangkh_Khachhang]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_Chude] FOREIGN KEY([Macd])
REFERENCES [dbo].[Chude] ([Macd])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_Chude]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_Nhaxuatban] FOREIGN KEY([Manxb])
REFERENCES [dbo].[Nhaxuatban] ([Manxb])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_Nhaxuatban]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_Tacgia] FOREIGN KEY([Matacgia])
REFERENCES [dbo].[Tacgia] ([Matacgia])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_Tacgia]
GO
USE [master]
GO
ALTER DATABASE [QuanLyBanSach] SET  READ_WRITE 
GO
