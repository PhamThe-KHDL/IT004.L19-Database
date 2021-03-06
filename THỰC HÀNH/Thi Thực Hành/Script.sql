create database QLDO
go
use QLDO

if exists	(select * from SysObjects where name = 'PHIEU_GIA_HAN')	drop table PHIEU_GIA_HAN
if exists	(select * from SysObjects where name = 'PHIEU_THU')		drop table PHIEU_THU
if exists	(select * from SysObjects where name = 'CT_PDK')		drop table CT_PDK
if exists	(select * from SysObjects where name = 'DIA_OC')		drop table DIA_OC
if exists	(select * from SysObjects where name = 'LOAI_DIA_OC')	drop table LOAI_DIA_OC
if exists	(select * from SysObjects where name = 'DICH_VU')		drop table DICH_VU
if exists	(select * from SysObjects where name = 'PHIEU_DANG_KY')	drop table PHIEU_DANG_KY
if exists	(select * from SysObjects where name = 'NGUOI_BAN')		drop table NGUOI_BAN



--------------TAO BANG----------------
create table NGUOI_BAN
(
	MaNB	char(9) not null,
	HoTen	nvarchar(50),
	DiaChi	nvarchar(50),
	SoDT	char(10),
	primary key(MaNB)
)
create table LOAI_DIA_OC
(
	MaLDO	int not null,
	TenLDO	nvarchar(50),
	primary key(MaLDO)
)
create table DIA_OC
(
	MaDO	char(9) not null,
	So		varchar(10),
	Duong	nvarchar(30),
	Phuong	varchar(3),
	Quan	varchar(3),
	DTDat	real,
	DTXD	real,
	Huong	nvarchar(10),
	ViTri	nvarchar(20),
	MoTa	nvarchar(100),
	MaLDO	int,
	primary key(MaDO)
)
create table DICH_VU
(
	MaDV	int not null,
	TenDV	nvarchar(50),
	TienDV	money,
	primary key(MaDV)
)
create table PHIEU_DANG_KY
(
	MaPDK		char(10) not null,
	NgayDK		datetime,
	TongSoDV	int,
	TongTien	money,
	MaNB		char(9),
	primary key(MaPDK)
)
create table CT_PDK
(
	MaPDK	char(10) not null,
	MaDO	char(9) not null,
	MaDV	int not null,
	TuNgay	datetime,
	DenNgay	datetime,
	SoTien	money,
	primary key(MaPDK,MaDO,MaDV)
)
create table PHIEU_THU
(
	MaPT	char(10) not null,
	MaPDK	char(10),
	NgayThu	datetime,
	LanThu	int,
	SoTien	money,
	MaPTGoc	char(10),
	primary key(MaPT)
)
create table PHIEU_GIA_HAN
(
	MaPGH	char(10) not null,
	MaPDK	char(10),
	MaDO	char(9),
	MaDV	int,
	NgayGiaHang	datetime,
	TuNgay	datetime,
	DenNgay	datetime,
	primary key(MaPGH)
)
-----------KHOA NGOAI--------------
alter table DIA_OC add
	constraint FK_MaLDO foreign key(MaLDO) references LOAI_DIA_OC(MaLDO)

alter table PHIEU_DANG_KY add
	constraint FK_MaNB foreign key(MaNB) references NGUOI_BAN(MaNB)

alter table CT_PDK add
	constraint FK_MaPDK foreign key(MaPDK) references PHIEU_DANG_KY(MaPDK),
	constraint FK_MADO foreign key(MaDO) references DIA_OC(MaDO),
	constraint FK_MADV foreign key(MaDV) references DICH_VU(MaDV)

alter table PHIEU_THU add
	constraint FK_MaPDK_PT foreign key(MaPDK) references PHIEU_DANG_KY(MaPDK),
	constraint FK_MAPTGOC foreign key(MaPTGoc) references PHIEU_THU(MaPT)

alter table PHIEU_GIA_HAN add
	constraint FK_CT_PDK foreign key (MaPDK,MaDO,MaDV)references CT_PDK(MaPDK,MaDO,MaDV)


-----------THEM DU LIEU--------------
insert into NGUOI_BAN
values('111222333',N'Nguyễn Tường Vân',N'330/2 Lê Hồng Phong Quận 5','8111222')
insert into NGUOI_BAN
values('222333444',N'Trần Thanh Tùng',N'111 Trương Định Quận 3','8222333')
insert into NGUOI_BAN
values('333444555',N'Nguyễn Ngọc Nga',N'315 An Dương Vương Quận 5','8333444')

insert into LOAI_DIA_OC
values(1,N'Nhà và đất')
insert into LOAI_DIA_OC
values(2,N'Đất')

insert into DIA_OC
values('DO111','731',N'Trần Hưng Đạo','7','1',1000,800,N'Đông',N'Mặt tiền',null,1)
insert into DIA_OC
values('DO222','638',N'Nguyễn Văn Cừ','5','5',500,450,N'Tây',N'Mặt tiền',null,2)
insert into DIA_OC
values('DO333','332/1',N'Nguyễn Thái Học','9','1',100,100,N'Nam',N'Hẻm',null,1)
insert into DIA_OC
values('DO444','980',N'Lê Hồng Phong','4','5',450,450,N'Bắc',N'Mặt tiền',null,2)
insert into DIA_OC
values('DO555','111/45',N'Trương Định','10','3',85,85,N'Đông Nam',N'Hẻm',null,1)

insert into DICH_VU
values(1,N'Tờ bướm quảng cáo 200 tờ','200,000')
insert into DICH_VU
values(2,N'Tờ bướm quảng cáo 100 tờ','100,000')
insert into DICH_VU
values(3,N'Quảng cáo trên báo','300,000')

insert into PHIEU_DANG_KY
values('PDK111','5/1/2006',1,'1,040,000','111222333')
insert into PHIEU_DANG_KY
values('PDK222','10/19/2006',2,'600,000','222333444')
insert into PHIEU_DANG_KY
values('PDK333','9/7/2006',3,'1,000,000','333444555')

insert into CT_PDK
values('PDK111','DO111',1,'5/5/2006','7/5/2006','400,000')
insert into CT_PDK
values('PDK222','DO222',1,'11/1/2006','12/31/2006','400,000')
insert into CT_PDK
values('PDK222','DO333',2,'11/1/2006','12/31/2006','200,000')
insert into CT_PDK
values('PDK333','DO444',1,'9/15/2006','10/15/2006','200,000')
insert into CT_PDK
values('PDK333','DO444',2,'9/15/2006','10/15/2006','100,000')
insert into CT_PDK
values('PDK333','DO555',3,'9/15/2006','10/15/2006','300,000')

insert into PHIEU_THU
values('PT111','PDK111','5/1/2006',1,'400,000',null)
insert into PHIEU_THU
values('PT222','PDK222','10/19/2006',1,'400,000',null)
insert into PHIEU_THU
values('PT333',null,'12/15/2006',2,'200,000','PT222')
insert into PHIEU_THU
values('PT444',null,'7/5/2006',2,'320,000','PT111')
insert into PHIEU_THU
values('PT555',null,'11/1/2006',3,'320,000','PT111')
insert into PHIEU_THU
values('PT666','PDK333','9/7/2006',1,'600,000',null)
insert into PHIEU_THU
values('PT777',null,'11/15/2006',2,'400,000','PT666')

insert into PHIEU_GIA_HAN
values('PGH111','PDK111','DO111',1,'7/5/2006','7/5/2006','9/5/2006')
insert into PHIEU_GIA_HAN
values('PGH222','PDK111','DO111',1,'11/1/2006','11/1/2006','12/31/2006')
insert into PHIEU_GIA_HAN
values('PGH444','PDK333','DO444',1,'11/15/2006','11/15/2006','12/15/2006')
insert into PHIEU_GIA_HAN
values('PGH555','PDK333','DO555',3,'11/15/2006','11/15/2006','12/15/2006')
