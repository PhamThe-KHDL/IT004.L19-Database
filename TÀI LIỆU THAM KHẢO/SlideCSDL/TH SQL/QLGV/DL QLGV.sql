Use QLGV
set dateformat dmy
create database QLGV
CREATE TABLE HOCVIEN
(
	MAHV		char(5)PRIMARY KEY,
	HO		varchar(40),
	TEN		varchar(10),
	NGSINH	smalldatetime,
	GIOITINH	varchar(3),
	NOISINH	varchar(40),
	MALOP	char(3)
)
alter table HOCVIEN add constraint FK_HV_LOP FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)

CREATE TABLE LOP
(
	MALOP	char(3)PRIMARY KEY,
	TENLOP	varchar(40),
	TRGLOP	char(5)FOREIGN KEY REFERENCES HOCVIEN(MAHV),
	SISO		tinyint,
	MAGVCN	char(4)
)
CREATE TABLE KHOA
(
	MAKHOA	varchar(4) PRIMARY KEY,
	TENKHOA	varchar(40),
	NGTLAP	smalldatetime,
	TRGKHOA	char(4)
)
CREATE TABLE MONHOC
(
	MAMH		varchar(10)PRIMARY KEY,
	TENMH	varchar(40),
	TCLT		tinyint,
	TCTH		tinyint,
	MAKHOA	varchar(4)FOREIGN KEY REFERENCES KHOA(MAKHOA)
)
CREATE TABLE DIEUKIEN
(
	MAMH			varchar(10)FOREIGN KEY REFERENCES MONHOC(MAMH),
	MAMH_TRUOC	varchar(10)FOREIGN KEY REFERENCES MONHOC(MAMH),
	CONSTRAINT PK_DIEUKIEN PRIMARY KEY (MAMH,MAMH_TRUOC)
)
CREATE TABLE GIAOVIEN
(
	MAGV		char(4)PRIMARY KEY,
	HOTEN	varchar(40),
	HOCVI	varchar(10),
	HOCHAM	varchar(10),
	GIOITINH	varchar(3),
	NGSINH	smalldatetime,
	NGVL		smalldatetime,
	HESO		numeric(4,2),
	MUCLUONG	money,
	MAKHOA	varchar(4)FOREIGN KEY REFERENCES KHOA(MAKHOA)
)
CREATE TABLE GIANGDAY
(
	MALOP	char(3)FOREIGN KEY REFERENCES LOP(MALOP),
	MAMH		varchar(10)FOREIGN KEY REFERENCES MONHOC(MAMH),
	MAGV		char(4)FOREIGN KEY REFERENCES GIAOVIEN(MAGV),
	HOCKY	tinyint,
	NAM		smallint,
	TUNGAY	smalldatetime,
	DENNGAY	smalldatetime,
	CONSTRAINT PK_GIANGDAY PRIMARY KEY (MALOP,MAMH)
)
CREATE TABLE KETQUATHI
(
	MAHV		char(5)FOREIGN KEY REFERENCES HOCVIEN(MAHV),
	MAMH		varchar(10)FOREIGN KEY REFERENCES MONHOC(MAMH),
	LANTHI	tinyint,
	NGTHI	smalldatetime,
	DIEM		numeric(4,2),
	KQUA		varchar(10),
	CONSTRAINT PK_KETQUATHI PRIMARY KEY (MAHV,MAMH,LANTHI)
)

---Khoa
insert into KHOA values('KHMT','Khoa hoc may tinh','7/6/2005','GV01')
insert into KHOA values('HTTT','He thong thong tin','7/6/2005','GV02')
insert into KHOA values('CNPM','Cong nghe phan mem','7/6/2005','GV04')
insert into KHOA values('MTT','Mang va truyen thong','20/10/2005','GV03')
insert into KHOA values('KTMT','Ky thuat may tinh','20/12/2005','')

--Giao vien

insert into GIAOVIEN values('GV01','Ho Thanh Son','PTS','GS','Nam','2/5/1950','11/1/2004',5.00,2250000,'KHMT')
insert into GIAOVIEN values('GV02','Tran Tam Thanh','TS','PGS','Nam','17/12/1965','20/4/2004',4.50,2025000,'HTTT')
insert into GIAOVIEN values('GV03','Do Nghiem Phung','TS','GS','Nu','1/8/1950','23/9/2004',4.00,1800000,'CNPM')
insert into GIAOVIEN values('GV04','Tran Nam Son','TS','PGS','Nam','22/2/1961','12/1/2005',4.50,2025000,'KTMT')
insert into GIAOVIEN values('GV05','Mai Thanh Danh','ThS','GV','Nam','12/3/1958','12/1/2005',3.00,1350000,'HTTT')
insert into GIAOVIEN values('GV06','Tran Doan Hung','TS','GV','Nam','11/3/1953','12/1/2005',4.50,2025000,'KHMT')
insert into GIAOVIEN values('GV07','Nguyen Minh Tien','ThS','GV','Nam','23/11/1971','1/3/2005',4.00,1800000,'KHMT')
insert into GIAOVIEN values('GV08','Le Thi Tran','KS','','Nu','26/3/1974','1/3/2005',1.69,760500,'KHMT')
insert into GIAOVIEN values('GV09','Nguyen To Lan','ThS','GV','Nu','31/12/1966','1/3/2005',4.00,1800000,'HTTT')
insert into GIAOVIEN values('GV10','Le Tran Anh Loan','KS','','Nu','17/7/1972','1/3/2005',1.86,837000,'CNPM')
insert into GIAOVIEN values('GV11','Ho Thanh Tung','CN','GV','Nam','12/1/1980','15/5/2005',2.67,1201500,'MTT')
insert into GIAOVIEN values('GV12','Tran Van Anh','CN','','Nu','29/3/1981','15/5/2005',1.69,760500,'CNPM')
insert into GIAOVIEN values('GV13','Nguyen Linh Dan','CN','','Nu','23/5/1980','15/5/2005',1.69,760500,'KTMT')
insert into GIAOVIEN values('GV14','Truong Minh Chau','ThS','GV','Nu','30/11/1976','15/5/2005',3.00,1350000,'MTT')
insert into GIAOVIEN values('GV15','Le Ha Thanh','ThS','GV','Nam','4/5/1978','15/5/2005',3.00,1350000,'KHMT')


--Mon hoc
insert into MONHOC values('THDC','Tin hoc dai cuong',4,1,'KHMT')
insert into MONHOC values('CTRR','Cau truc roi rac',5,0,'KHMT')
insert into MONHOC values('CSDL','Co so du lieu',3,1,'HTTT')
insert into MONHOC values('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT')
insert into MONHOC values('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT')
insert into MONHOC values('DHMT','Do hoa may tinh',3,1,'KHMT')
insert into MONHOC values('KTMT','Kien truc may tinh',3,0,'KTMT')
insert into MONHOC values('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT')
insert into MONHOC values('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT')
insert into MONHOC values('HDH','He dieu hanh',4,0,'KTMT')
insert into MONHOC values('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM')
insert into MONHOC values('LTCFW','Lap trinh C for win',3,1,'CNPM')
insert into MONHOC values('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')

--Lop
insert into LOP values('K11','Lop 1 khoa 1','K1108',11,'GV07')
insert into LOP values('K12','Lop 2 khoa 1','K1205',12,'GV09')
insert into LOP values('K13','Lop 3 khoa 1','K1305',12,'GV14')


--Hoc vien
insert into HOCVIEN values('K1101','Nguyen Van','A','27/1/1986','Nam','TpHCM','K11')
insert into HOCVIEN values('K1102','Tran Ngoc','Han','14/3/1986','Nu','Kien Giang','K11')
insert into HOCVIEN values('K1103','Ha Duy','Lap','18/4/1986','Nam','Nghe An','K11')
insert into HOCVIEN values('K1104','Tran Ngoc','Linh','30/3/1986','Nu','Tay Ninh','K11')
insert into HOCVIEN values('K1105','Tran Minh','Long','27/2/1986','Nam','TpHCM','K11')
insert into HOCVIEN values('K1106','Le Nhat','Minh','24/1/1986','Nam','TpHCM','K11')
insert into HOCVIEN values('K1107','Nguyen Nhu','Nhut','27/1/1986','Nam','Ha Noi','K11')
insert into HOCVIEN values('K1108','Nguyen Manh','Tam','27/2/1986','Nam','Kien Giang','K11')
insert into HOCVIEN values('K1109','Phan Thi Thanh','Tam','27/1/1986','Nu','Vinh Long','K11')
insert into HOCVIEN values('K1110','Le Hoai','Thuong','5/2/1986','Nu','Can Tho','K11')
insert into HOCVIEN values('K1111','Le Ha','Vinh','25/12/1986','Nam','Vinh Long','K11')
insert into HOCVIEN values('K1201','Nguyen Van','B','11/2/1986','Nam','TpHCM','K12')
insert into HOCVIEN values('K1202','Nguyen Thi Kim','Duyen','18/1/1986','Nu','TpHCM','K12')
insert into HOCVIEN values('K1203','Tran Thi Kim','Duyen','17/9/1986','Nu','TpHCM','K12')
insert into HOCVIEN values('K1204','Truong My','Hanh','19/5/1986','Nu','Dong Nai','K12')
insert into HOCVIEN values('K1205','Nguyen Thanh','Nam','17/4/1986','Nam','TpHCM','K12')
insert into HOCVIEN values('K1206','Nguyen Thi Truc','Thanh','4/3/1986','Nu','Kien Giang','K12')
insert into HOCVIEN values('K1207','Tran Thi Bich','Thuy','8/2/1986','Nu','Nghe An','K12')
insert into HOCVIEN values('K1208','Huynh Thi Kim','Trieu','8/4/1986','Nu','Tay Ninh','K12')
insert into HOCVIEN values('K1209','Pham Thanh','Trieu','23/2/1986','Nam','TpHCM','K12')
insert into HOCVIEN values('K1210','Ngo Thanh','Tuan','14/2/1986','Nam','TpHCM','K12')
insert into HOCVIEN values('K1211','Do Thi','Xuan','9/3/1986','Nu','Ha Noi','K12')
insert into HOCVIEN values('K1212','Le Thi Phi','Yen','12/3/1986','Nu','TpHCM','K12')
insert into HOCVIEN values('K1301','Nguyen Thi Kim','Cuc','9/6/1986','Nu','Kien Giang','K13')
insert into HOCVIEN values('K1302','Truong Thi My','Hien','18/3/1986','Nu','Nghe An','K13')
insert into HOCVIEN values('K1303','Le Duc','Hien','21/3/1986','Nam','Tay Ninh','K13')
insert into HOCVIEN values('K1304','Le Quang','Hien','18/4/1986','Nam','TpHCM','K13')
insert into HOCVIEN values('K1305','Le Thi','Huong','27/3/1986','Nu','TpHCM','K13')
insert into HOCVIEN values('K1306','Nguyen Thai','Huu','30/3/1986','Nam','Ha Noi','K13')
insert into HOCVIEN values('K1307','Tran Minh','Man','28/5/1986','Nam','TpHCM','K13')
insert into HOCVIEN values('K1308','Nguyen Hieu','Nghia','8/4/1986','Nam','Kien Giang','K13')
insert into HOCVIEN values('K1309','Nguyen Trung','Nghia','18/1/1987','Nam','Nghe An','K13')
insert into HOCVIEN values('K1310','Tran Thi Hong','Tham','22/4/1986','Nu','Tay Ninh','K13')
insert into HOCVIEN values('K1311','Tran Minh','Thuc','4/4/1986','Nam','TpHCM','K13')
insert into HOCVIEN values('K1312','Nguyen Thi Kim','Yen','7/9/1986','Nu','TpHCM','K13')


--Giang day
insert into GIANGDAY values('K11','THDC','GV07',1,2006,'2/1/2006','12/5/2006')
insert into GIANGDAY values('K12','THDC','GV06',1,2006,'2/1/2006','12/5/2006')
insert into GIANGDAY values('K13','THDC','GV15',1,2006,'2/1/2006','12/5/2006')
insert into GIANGDAY values('K11','CTRR','GV02',1,2006,'9/1/2006','17/5/2006')
insert into GIANGDAY values('K12','CTRR','GV02',1,2006,'9/1/2006','17/5/2006')
insert into GIANGDAY values('K13','CTRR','GV08',1,2006,'9/1/2006','17/5/2006')
insert into GIANGDAY values('K11','CSDL','GV05',2,2006,'1/6/2006','15/7/2006')
insert into GIANGDAY values('K12','CSDL','GV09',2,2006,'1/6/2006','15/7/2006')
insert into GIANGDAY values('K13','CTDLGT','GV15',2,2006,'1/6/2006','15/7/2006')
insert into GIANGDAY values('K13','CSDL','GV05',3,2006,'1/8/2006','15/12/2006')
insert into GIANGDAY values('K13','DHMT','GV07',3,2006,'1/8/2006','15/12/2006')
insert into GIANGDAY values('K11','CTDLGT','GV15',3,2006,'1/8/2006','15/12/2006')
insert into GIANGDAY values('K12','CTDLGT','GV15',3,2006,'1/8/2006','15/12/2006')
insert into GIANGDAY values('K11','HDH','GV04',1,2007,'2/1/2007','18/2/2007')
insert into GIANGDAY values('K12','HDH','GV04',1,2007,'2/1/2007','20/3/2007')
insert into GIANGDAY values('K11','DHMT','GV07',1,2007,'18/2/2007','20/3/2007')


--Dieu kien
insert into DIEUKIEN values('CSDL','CTRR')
insert into DIEUKIEN values('CSDL','CTDLGT')
insert into DIEUKIEN values('CTDLGT','THDC')
insert into DIEUKIEN values('PTTKTT','THDC')
insert into DIEUKIEN values('PTTKTT','CTDLGT')
insert into DIEUKIEN values('DHMT','THDC')
insert into DIEUKIEN values('LTHDT','THDC')
insert into DIEUKIEN values('PTTKHTTT','CSDL')


--Ket qua thi

insert into KETQUATHI values('K1101','CSDL',1,'20/7/2006',10.00,'Dat')
insert into KETQUATHI values('K1101','CTDLGT',1,'28/12/2006',9.00,'Dat')
insert into KETQUATHI values('K1101','THDC',1,'20/5/2006',9.00,'Dat')
insert into KETQUATHI values('K1101','CTRR',1,'13/5/2006',9.50,'Dat')
insert into KETQUATHI values('K1102','CSDL',1,'20/7/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1102','CSDL',2,'27/7/2006',4.25,'Khong Dat')
insert into KETQUATHI values('K1102','CSDL',3,'10/8/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1102','CTDLGT',1,'28/12/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1102','CTDLGT',2,'5/1/2007',4.00,'Khong Dat')
insert into KETQUATHI values('K1102','CTDLGT',3,'15/1/2007',6.00,'Dat')
insert into KETQUATHI values('K1102','THDC',1,'20/5/2006',5.00,'Dat')
insert into KETQUATHI values('K1102','CTRR',1,'13/5/2006',7.00,'Dat')
insert into KETQUATHI values('K1103','CSDL',1,'20/7/2006',3.50,'Khong Dat')
insert into KETQUATHI values('K1103','CSDL',2,'27/7/2006',8.25,'Dat')
insert into KETQUATHI values('K1103','CTDLGT',1,'28/12/2006',7.00,'Dat')
insert into KETQUATHI values('K1103','THDC',1,'20/5/2006',8.00,'Dat')
insert into KETQUATHI values('K1103','CTRR',1,'13/5/2006',6.50,'Dat')
insert into KETQUATHI values('K1104','CSDL',1,'20/7/2006',3.75,'Khong Dat')
insert into KETQUATHI values('K1104','CTDLGT',1,'28/12/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1104','THDC',1,'20/5/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1104','CTRR',1,'13/5/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1104','CTRR',2,'20/5/2006',3.50,'Khong Dat')
insert into KETQUATHI values('K1104','CTRR',3,'30/6/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1201','CSDL',1,'20/7/2006',6.00,'Dat')
insert into KETQUATHI values('K1201','CTDLGT',1,'28/12/2006',5.00,'Dat')
insert into KETQUATHI values('K1201','THDC',1,'20/5/2006',8.50,'Dat')
insert into KETQUATHI values('K1201','CTRR',1,'13/5/2006',9.00,'Dat')
insert into KETQUATHI values('K1202','CSDL',1,'20/7/2006',8.00,'Dat')
insert into KETQUATHI values('K1202','CTDLGT',1,'28/12/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTDLGT',2,'5/1/2007',5.00,'Dat')
insert into KETQUATHI values('K1202','THDC',1,'20/5/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','THDC',2,'27/5/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTRR',1,'13/5/2006',3.00,'Khong Dat')

insert into KETQUATHI values('K1202','CTRR',2,'20/5/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTRR',3,'30/6/2006',6.25,'Dat')
insert into KETQUATHI values('K1203','CSDL',1,'20/7/2006',9.25,'Dat')
insert into KETQUATHI values('K1203','CTDLGT',1,'28/12/2006',9.50,'Dat')
insert into KETQUATHI values('K1203','THDC',1,'20/5/2006',10.00,'Dat')
insert into KETQUATHI values('K1203','CTRR',1,'13/5/2006',10.00,'Dat')
insert into KETQUATHI values('K1204','CSDL',1,'20/7/2006',8.50,'Dat')
insert into KETQUATHI values('K1204','CTDLGT',1,'28/12/2006',6.75,'Dat')
insert into KETQUATHI values('K1204','THDC',1,'20/5/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1204','CTRR',1,'13/5/2006',6.00,'Dat')
insert into KETQUATHI values('K1301','CSDL',1,'20/12/2006',4.25,'Khong Dat')
insert into KETQUATHI values('K1301','CTDLGT',1,'25/7/2006',8.00,'Dat')
insert into KETQUATHI values('K1301','THDC',1,'20/5/2006',7.75,'Dat')
insert into KETQUATHI values('K1301','CTRR',1,'13/5/2006',8.00,'Dat')
insert into KETQUATHI values('K1302','CSDL',1,'20/12/2006',6.75,'Dat')
insert into KETQUATHI values('K1302','CTDLGT',1,'25/7/2006',5.00,'Dat')
insert into KETQUATHI values('K1302','THDC',1,'20/5/2006',8.00,'Dat')
insert into KETQUATHI values('K1302','CTRR',1,'13/5/2006',8.50,'Dat')
insert into KETQUATHI values('K1303','CSDL',1,'20/12/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1303','CTDLGT',1,'25/7/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1303','CTDLGT',2,'7/8/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1303','CTDLGT',3,'15/8/2006',4.25,'Khong Dat')
insert into KETQUATHI values('K1303','THDC',1,'20/5/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1303','CTRR',1,'13/5/2006',3.25,'Khong Dat')
insert into KETQUATHI values('K1303','CTRR',2,'20/5/2006',5.00,'Dat')
insert into KETQUATHI values('K1304','CSDL',1,'20/12/2006',7.75,'Dat')
insert into KETQUATHI values('K1304','CTDLGT',1,'25/7/2006',9.75,'Dat')
insert into KETQUATHI values('K1304','THDC',1,'20/5/2006',5.50,'Dat')
insert into KETQUATHI values('K1304','CTRR',1,'13/5/2006',5.00,'Dat')
insert into KETQUATHI values('K1305','CSDL',1,'20/12/2006',9.25,'Dat')
insert into KETQUATHI values('K1305','CTDLGT',1,'25/7/2006',10.00,'Dat')
insert into KETQUATHI values('K1305','THDC',1,'20/5/2006',8.00,'Dat')
insert into KETQUATHI values('K1305','CTRR',1,'13/5/2006',10.00,'Dat')