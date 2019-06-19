select * from Giohangkh
select * from Khachhang
insert into Giohangkh(Makh,Ngaymua,Tongtien) values (1,N'20190205',200000)
insert into Giohangkh(Makh,Ngaymua,Tongtien) values (2,N'20190105',500000)
insert into Giohangkh(Makh,Ngaymua,Tongtien) values (3,N'20190305',300000)
insert into Giohangkh(Makh,Ngaymua,Tongtien) values (3,N'20190405',10000)
insert into Giohangkh(Makh,Ngaymua,Tongtien) values (2,N'20190405',90000)
insert into Giohangkh(Makh,Ngaymua,Tongtien) values (4,N'20190205',700000)
insert into Giohangkh(Makh,Ngaymua,Tongtien) values (3,N'20190205',100000)
insert into Giohangkh(Makh,Ngaymua,Tongtien) values (4,N'20190505',500000)
insert into Giohangkh(Makh,Ngaymua,Tongtien) values (1,N'20190605',400000)
insert into Giohangkh(Makh,Ngaymua,Tongtien) values (2,N'20190505',600000)
insert into Giohangkh(Makh,Ngaymua,Tongtien) values (3,N'20190605',800000)
insert into Giohangkh(Makh,Ngaymua,Tongtien) values (4,N'20190105',500000)
insert into Giohangkh(Makh,Ngaymua,Tongtien) values (5,N'20190205',100000)
insert into Giohangkh(Makh,Ngaymua,Tongtien) values (6,N'20190305',100000)
SELECT sum(Tongtien) as TongTien 
from Giohangkh 
where YEAR(Ngaymua) = YEAR(GETDATE()) 
group by MONTH(Ngaymua)
order by MONTH(Ngaymua)