/* SQL - structured query language
	1 DDL - data definition language
		- create 
		- drop
		- alter
		- truncate

	2 DML - data manupulation language
		- insert
		- delete
		- update
		- select ***
*/

--insert into [tablo ismi] ([veri girilecek sütunların listesi]) values ([veriler])
-- date  ->> 10.11.2026 2026-11-10
-- time  ->> 12:15:252, 12:15
-- datetime ->> 10.11.2026 12:15
insert into kitablar (ad, tarih, ISBN) values ('pinokyo','2000','11111111')
insert into kitablar values ('22222222','hede hödö','2021-2-5')
insert into [library].[dbo].[kitablar] (ISBN,ad) values ('33333333','veri tabanı yönetim sistemleri') 
insert into "library".[dbo].[kitablar] (ISBN,ad) values ('33333333','veri tabanı yönetim sistemleri') 
insert into .dbo.kitablar (ISBN,ad) values ('33333333','veri tabanı yönetim sistemleri') 
--insert into [bizim kitablar]

insert into kitap_kategori values (17,'33333333')
insert into kategori values ('cuma sabahı')
--insert into kategori values (20,'cuma sabahı') bu hata verir. Identity olduğu için

insert into emanet 
(ISBN,uye_no,kutuphane_no,emanet_tarihi)
values
('33333333',4,2,'10.04.2026 2:03'),
('11111111',1,5,'01.05.2026 12:03'),
('22222222',2,1,'04.05.2026 11:03'),
('33333333',4,2,'10.04.2026 2:03')


-- veri silme

delete from kitablar -- bütün veriler silinir
delete from kitablar where ISBN = '11111111'-- hata verdi çünkü ???
delete from emanet where ISBN = '11111111'
delete from emanet where emanet_no = 360

delete from emanet
truncate table emanet


-- veri güncelleme - update
update emanet set teslim_tarihi = '2026-05-20 15:00' where emanet_no = 1

update kitablar set ad = 'felan fıstık'


