create database quanlydondathang
go 
use quanlydondathang
set dateformat dmy

create table mathang
(
	mamh char(10),
	tenmh varchar(20),
	dvt char(10),
	nuocsx varchar(20)
)

create table nhacc
(
	macc char(10),
	tencc varchar(20),
	diachicc varchar (20)
)

create table cungcap
(
	macc char(10),
	mamh char(10),
	tungay date
)

create table dondh 
(
	madh char(10),
	ngaydh date,
	macc char(10),
	tongtrigia money,
	somh int
)

create table chitiet
(
	madh char(10),
	mamh char(10),
	soluong int,
	dongia money,
	trigia money
)

----------------------------------------------
--cau1 
select *
from dondh 
where tongtrigia>1000000 
	and macc = (select macc 
				from nhacc 
				where tencc='vinamilk')

--cau2
select sum(soluong) 
from chitiet 
where mamh='NH001' 
	and madh in (select madh 
				from dondh 
				where YEAR(ngaydh) =2008 )

--cau3
select  mh.mamh, mh.tenmh 
from  mathang mh join mathang _mh 
on mh.mamh=_mh.mamh
where mh.tenmh='Viet Nam' 
	and _mh.mamh <> 'Trung Quoc'

--cau4
select sum(soluong) as SL , YEAR(ngaydh) as YEAR 
from chitiet join dondh 
on chitiet.madh = dondh.madh 
group by year(ngaydh) 

--cau5
select madh 
from dondh 
where macc = (select macc 
				from nhacc 
				where tencc	= 'bissan')

--cau6
select mamh,tenmh 
from mathang 
where mamh = (select mamh 
				from chitiet 
				where soluong = (select max(soluong) 
									from chitiet 
									where madh in (select madh 
													from dondh 
													where year(ngaydh)=2008)))

--cau7
select *
from nhacc 
where macc in (select macc 
				from cungcap 
				where tungay='1/1/2018' 
					and mamh='MH001')

--cau8 
select sum(tongtrigia) 
from dondh 
where madh=(select madh 
			from chitiet 
			where mamh='MH014') 
				and macc ='NCC007'

--cau9 
select *
from nhacc 
where macc in (select macc 
				from cungcap 
				where mamh in (select mh.mamh 
								from mathang mh join mathang _mh 
								on mh.mamh=_mh.mamh
								where mh.nuocsx='My' 
									and _mh.nuocsx='Korean' ))

--cau10
select sum(soluong) as SL , YEAR(ngaydh) as YEAR 
from chitiet join dondh 
on chitiet.madh = dondh.madh 
group by year(ngaydh) 

--cau11
select mamh 
from chitiet 
where soluong = (select min(soluong)  
				from chitiet 
				where madh in (select madh 
								from dondh 
								where YEAR(ngaydh) =2020))
