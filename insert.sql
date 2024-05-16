insert into adresler 
([MAHALLE],sehir,ilce)
values
('2000 evle','nevşheir','merkez'),
('hede','hödö','aaaaa')

insert into KUTUBHANE 
([AD],[ADRES_NO])
values 
('bizim kütüphane',1)

insert into KUTUBHANE 
([AD],[ADRES_NO])
values 
('sizin kütüphane',1),
('onların kütüphane',2)

truncate table adresler

insert into adresler 
([MAHALLE],sehir,ilce)
values
('a','istanbul','beşiktaş'),
('b','ankara','keçiören'),
('c','izmir','buca')

insert into uyeler 
(ADRES_NO,ad)
values
(3,'tarkan')

insert into uyeler
(ad,soyad,ADRES_NO)
values
('orhan','gencebay',4),
('müslüm','gürses',5)

insert into KITABLAR
(ad,YAYIN_TARIHI)
values
('kelebek', '2023-05-25')

insert into emanet
(ISBN,UYE_ID,KUTUPHANE_ID,EMANET_TARIHI)
values
(1,1,7,'2024-05-3')


insert into emanet
(ISBN,UYE_ID,KUTUPHANE_ID,EMANET_TARIHI)
values
(3,3,8,'2024-05-3 12:30')

insert into emanet
(ISBN,UYE_ID,KUTUPHANE_ID,EMANET_TARIHI)
values
(2,3,8,'2024-05-3 12:30')

INSERT INTO [dbo].[KITABLAR] (ad, [YAYIN_TARIHI]) VALUES
    ('Kitap 1', '2023-01-15'),
    ('Kitap 2', '2022-11-20'),
    ('Kitap 3', '2021-08-05'),
    ('Kitap 4', '2020-03-10'),
    ('Kitap 5', '2019-06-25'),
    ('Kitap 6', '2018-12-01'),
    ('Kitap 7', '2017-04-18'),
    ('Kitap 8', '2016-09-30'),
    ('Kitap 9', '2015-02-12'),
    ('Kitap 10', '2014-07-08');

INSERT INTO [dbo].[KITAP_KUTUPHANE] (KUTUPHANE_ID, ISBN, [MIKTAR]) VALUES (7, 6, 50);
INSERT INTO [dbo].[KITAP_KUTUPHANE] (KUTUPHANE_ID, ISBN, [MIKTAR]) VALUES (8, 6, 30);
INSERT INTO [dbo].[KITAP_KUTUPHANE] (KUTUPHANE_ID, ISBN, [MIKTAR]) VALUES (7, 7, 80);
INSERT INTO [dbo].[KITAP_KUTUPHANE] (KUTUPHANE_ID, ISBN, [MIKTAR]) VALUES (8, 8, 20);
INSERT INTO [dbo].[KITAP_KUTUPHANE] (KUTUPHANE_ID, ISBN, [MIKTAR]) VALUES (8, 7, 60);
INSERT INTO [dbo].[KITAP_KUTUPHANE] (KUTUPHANE_ID, ISBN, [MIKTAR]) VALUES (7, 9, 40);
INSERT INTO [dbo].[KITAP_KUTUPHANE] (KUTUPHANE_ID, ISBN, [MIKTAR]) VALUES (7, 10, 70);
INSERT INTO [dbo].[KITAP_KUTUPHANE] (KUTUPHANE_ID, ISBN, [MIKTAR]) VALUES (7, 11, 10);
INSERT INTO [dbo].[KITAP_KUTUPHANE] (KUTUPHANE_ID, ISBN, [MIKTAR]) VALUES (8, 11, 90);
INSERT INTO [dbo].[KITAP_KUTUPHANE] (KUTUPHANE_ID, ISBN, [MIKTAR]) VALUES (8, 12, 10);
INSERT INTO [dbo].[KITAP_KUTUPHANE] (KUTUPHANE_ID, ISBN, [MIKTAR]) VALUES (8, 13, 10);
INSERT INTO [dbo].[KITAP_KUTUPHANE] (KUTUPHANE_ID, ISBN, [MIKTAR]) VALUES (8, 14, 10);
INSERT INTO [dbo].[KITAP_KUTUPHANE] (KUTUPHANE_ID, ISBN, [MIKTAR]) VALUES (8, 15, 10);

insert into emanet
(ISBN,UYE_ID,KUTUPHANE_ID,EMANET_TARIHI)
values


(1,3,8,'2020-6-30 12:30'),
(2,3,7,'2021-7-15 12:30'),
(3,3,7,'2022-8-16 12:30'),
(4,3,8,'2023-9-17 12:30'),
(5,1,8,'2024-05-18 12:30'),
(6,1,8,'2019-10-19 12:30'),
(7,1,8,'2020-11-20 12:30'),
(8,1,8,'2021-12-30 12:30'),
(9,2,7,'2022-3-3 12:30'),
(10,2,7,'2023-4-1 12:30'),
(11,2,7,'2024-11-2 12:30'),
(12,2,8,'2018-05-3 12:30'),
(13,2,8,'2019-12-3 12:30'),
(14,1,8,'2020-05-1 12:30'),
(15,1,8,'2021-6-2 12:30'),
(1,2,7,'2022-7-3 12:30'),
(2,3,7,'2023-8-1 12:30'),
(3,2,7,'2024-9-1 12:30'),
(4,2,8,'2021-10-2 12:30'),
(5,3,8,'2022-05-3 12:30')


INSERT INTO KATEGORI (AD) VALUES ('Roman');
INSERT INTO KATEGORI (AD) VALUES ('Bilim Kurgu');
INSERT INTO KATEGORI (AD) VALUES ('Tarih');
INSERT INTO KATEGORI (AD) VALUES ('Klasik');
INSERT INTO KATEGORI (AD) VALUES ('Biyografi');
INSERT INTO KATEGORI (AD) VALUES ('Korku');
INSERT INTO KATEGORI (AD) VALUES ('Çocuk Kitapları');
INSERT INTO KATEGORI (AD) VALUES ('Drama');

insert into [dbo].[KITAB_KATEGORI] ([KATEGORI_ID],[ISBN]) values 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(1,9),
(2,10),
(3,11),
(4,12),
(5,13),
(6,14),
(7,15),
(8,1),
(1,2),
(2,3),
(3,4),
(4,5),
(5,6),
(6,7),
(1,8)


delete from EMANET where EMANET_ID = 1

update UYELER set AD ='şinasi' , SOYAD ='aaaa' where UYE_ID = 2
---------------------------------------------------------------
-- select [sütun isimler] from [tablo isimleri] where [hangi satırlar]

select * from OUR_library.dbo.KUTUBHANE

select [OUR_library].[dbo].[KUTUBHANE].[ad] from OUR_library.dbo.KUTUBHANE

select [AD],[SOYAD] from [OUR_library].[dbo].[UYELER]

select [AD] as 'nam',[SOYAD] from [OUR_library].[dbo].[UYELER]

select * from KUTUBHANE
select * from ADRESLER
select * from KUTUBHANE, ADRESLER
select TEL from UYELER where ad = 'tarkan'


select distinct ShipCountry from Orders where Freight >15
select count(distinct ShipCountry) from Orders where Freight >15
select count(*) from Orders where Freight >=15 and  Freight <=30
select count(*) from Orders where Freight between 15 and 30
select * from orders
select * from orders where CustomerID in ('VINET','TOMSP','HANAR')


select * from customers
select customerid from Customers where Country = 'germany'
select count(*) from orders where CustomerID in (select CustomerID from Customers where Country = 'germany') and Freight between 15 and 30
select * from Customers where ContactName like 'a%'


select count(distinct country) from Customers 
select count(customerID) from Customers where Country = 'GErmany'