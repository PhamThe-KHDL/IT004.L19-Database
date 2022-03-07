create database quanlythevanhoi
go
use quanlythevanhoi
set dateformat dmy

create table quocgia
(
	maqg int ,
	tenqg varchar(20),
	chauluc varchar(20),
	dientich int
)
create table thevanhoi
(
	Matvh int ,
	tentvh varchar(20),
	maqg int,
	nam int
)

create table vandongvien
(
	mavdv int ,
	hoten varchar(20),
	ngaysinh date,
	gioitinh char(10),
	quoctich char(20)
)

create table noidungthi
(
	mandt int ,
	tenndt varchar(20),
	ghichu varchar(20),
)

create table thamgia
(
	mavdv int ,
	mandt int ,
	matvh int ,
	huychuong char(10)
)

insert into vandongvien values ('002','helen','20/4/1989','nu','UK')
insert into vandongvien values ('001','John','10/1/1988','nam','UK')
insert into vandongvien values ('003','osaka','17/3/1990','nu','JA')
insert into vandongvien values ('004','ronaldo','1/3/1990','nam','BR')

insert into thevanhoi values ('01','bojing 2008','CH','2008')
insert into thevanhoi values ('02','london 2012','UK','2012')
insert into thevanhoi values ('03','rio 2016','BR','2016')
insert into thevanhoi values ('04','tokyo 2020','JA','2020')

insert into noidungthi (mandt,tenndt)values ('1','dien kinh') 
insert into noidungthi (mandt,tenndt)values ('2','ban cung') 
insert into noidungthi (mandt,tenndt)values ('3','nhay cau') 
insert into noidungthi (mandt,tenndt)values ('4','ban sung') 

insert into thamgia values ('001','1','1','0')
insert into thamgia values ('001','2','1','1')
insert into thamgia values ('001','4','2','2')
insert into thamgia values ('002','1','1','2')
insert into thamgia values ('002','3','1','2')

insert into quocgia values ('CH','trung quoc','chau a','100000')
insert into quocgia values ('UK','anh quoc','chau au','50000')
insert into quocgia values ('BR','braziu','chau my','40000')
insert into quocgia values ('JA','nhat ban','chau a','1000')
-----------------------------------------------------------------------

--cau 1
select *
from vandongvien 
where quoctich='UK' 
order by hoten
--cau2
select *
from vandongvien 
where mavdv in (select mavdv 
				from thamgia join thevanhoi 
				on thamgia.matvh=thevanhoi.Matvh 
				where mandt='2' and tentvh='tokyo 2020')
--cau3 

select sum(huychuong) 
from thamgia join thevanhoi 
on thamgia.matvh=thevanhoi.Matvh
where mavdv in (select mavdv 
				from vandongvien 
				where quoctich='JA') 

--cau4
select * 
from vandongvien 
where mavdv in (select mavdv 
				from thamgia tg1 join thamgia tg2 
				on tg1.matvh=tg2.matvh
				where tg1.mandt='100m boi ngua' 
					and tg2.mandt='200m tu do')

--cau5
select *
from vandongvien 
where gioitinh='nu' 
	and quoctich='UK' 
	and mavdv in (select mavdv 
					from thamgia join thevanhoi 
					on thamgia.matvh=thevanhoi.Matvh
					where nam >='2008')

--cau6
select *
from vandongvien 
where mavdv in (select mavdv 
				from thamgia join thevanhoi 
				on thamgia.matvh=thevanhoi.Matvh 
				where tentvh='rio 2016' 
					and huychuong >=2)

--cau7
select * 
from vandongvien 
where mavdv in (select mavdv 
				from thamgia 
				where mandt='1' 
					and matvh='3' )

--cau8 
select huychuong,hoten 
from thamgia join vandongvien 
on thamgia.mavdv=vandongvien.mavdv 
where thamgia.matvh='2'
--cau9 
select * 
from vandongvien 
where mavdv in (select distinct tg1.mavdv 
				from thamgia tg1 join thamgia tg2 
				on tg1.mavdv=tg2.mavdv
				where tg1.mandt='100m boi ngua' 
				and tg2.mandt <>'200m tu do')

--cau10
select *
from vandongvien 
where gioitinh='nam' 
	and quoctich='GR' 
		and mavdv in	(select mavdv 
						from thamgia 
						where matvh >='2')

--cau11
select * 
from vandongvien 
where mavdv in (select mavdv 
				from thamgia 
				where huychuong >=2 
					and mandt ='1')