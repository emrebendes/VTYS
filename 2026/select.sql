/*SQL
	DDL
	DML
		insert
		delete
		update
		select
*/

-- select SÜTUNLAR from TABLO İSİMLERİ WHERE SATIR ŞARTLARI 
use library 
select * from yazar
select ad, soyad from yazar
select soyad, ad from yazar
select library.dbo.yazar.ad, library.dbo.yazar.soyad from library.dbo.yazar
select * from yazar where ad = 'elif'
use NORTHWND

select * from Customers
select Country from Customers 
select distinct Country from customers
select distinct Region from customers
select distinct Country , city from customers where Country like 'a%'
select count(distinct Country) from customers
select count(Country) from customers
-- where şartları

select * from Customers where country ='UK'
select * from Products
select * from Products where UnitPrice >= 53
select * from Products where UnitPrice < 5
select * from Products where UnitPrice between 10 and 13
select * from Customers where country <> 'UK'
select * from Customers where country != 'UK'
select * from Customers where not country = 'UK'
select * from Customers where country = 'UK' or country =  'USA' and country = 'germany'
select * from Customers where country in ('UK', 'USA', 'germany')

select * from Customers where country = 'UK' and ContactName = 'Thomas Hardy' 
select * from Customers where  ContactName like 'a%' or ContactName like 'b%' 
select * from Customers where  ContactName like '%ale%'
select * from Customers where  ContactName like '%r'
select * from Customers where  ContactName like 'a________'
select * from Customers where city like 'l____n'
select * from Customers where  ContactName like '[bsf]%'
select * from Customers where  ContactName like '[a-d]%'

select * from customers order by ContactName desc

select * from Products where UnitPrice >= 53 order by UnitsInStock , CategoryID 

select * from Customers order by country, city

select * from Customers order by country desc, city

select address, Fax from customers where  fax is not null order by address 

select min(UnitPrice) as minimum, max(UnitPrice) as [tablunun maksimumu],
avg(UnitPrice) as "tablonun ortalaması",count(UnitPrice) as "ürün sayısı",
sum(UnitPrice) as [toplam fiyat miktarı],
sum(UnitPrice)/COUNT(UnitPrice) as kendi_ortalama_hesanım from Products


select shipname from (select * from orders where CustomerID in 
(select CustomerID from Customers where Country = 'UK')) as bizim_tablo
where ShipName like 'A%'


use  library
-- doğal birleştirme
select u.ad, u.soyad, a.il 
from uyeler as u, adres as a 
where a.adres_no = u.adres_no 
--kaç farklı şehirde üye bulunmakta??

select count(distinct(a.il))
from uyeler as u, adres as a 
where a.adres_no = u.adres_no

--her şehirde kaç üye bulunmakta?
select a.il,count(*) as "üye sayısı"
from uyeler as u, adres as a 
where a.adres_no = u.adres_no 
group by a.il
-- aşağıdaki iki cümle hatalı çünkü ....
select a.il,count(*), u.ad
from uyeler as u, adres as a 
where a.adres_no = u.adres_no 
group by a.il

select a.il,u.ad
from uyeler as u, adres as a 
where a.adres_no = u.adres_no 
group by a.il

--her şehirde kaç üye bulunmakta? sonuçları üye sayısına göre sıralayınız.
select a.il,count(*) as "üye sayısı"
from uyeler as u, adres as a 
where a.adres_no = u.adres_no 
group by a.il
order by "üye sayısı"

select a.il,count(*) as "üye sayısı"
from uyeler as u, adres as a 
where a.adres_no = u.adres_no 
group by a.il
order by count(*) desc

-- en çok üye olan il 

select top(1) a.il,count(*) as "üye sayısı"
from uyeler as u, adres as a 
where a.adres_no = u.adres_no 
group by a.il
order by count(*) desc

select top(1) a.il
from uyeler as u, adres as a 
where a.adres_no = u.adres_no 
group by a.il
order by count(*) desc

--üye sayısı 5 den büyük iller

select a.il,count(*) as "üye sayısı"
from uyeler as u, adres as a 
where a.adres_no = u.adres_no 
group by a.il
having count(*) > 5
order by count(*) desc

-- en çok üyeye sahip ilk 5 il

select top(5) a.il,count(*) as "üye sayısı"
from uyeler as u, adres as a 
where a.adres_no = u.adres_no 
group by a.il
order by count(*) desc

-- inner join

select * from
uyeler inner join adres
on uyeler.adres_no=adres.adres_no
/* ASLINDA DOĞAL BİRLEŞTİRME İLE AYNI !!!!!!
select *
from uyeler as u, adres as a 
where a.adres_no = u.adres_no 
*/
select * from
uyeler as u inner join adres as a
on u.adres_no=a.adres_no

select * from
uyeler as u join adres as a
on u.adres_no=a.adres_no
where il = 'ankara'

select u.ad,u.soyad,a.il,e.emanet_tarihi from
uyeler as u join adres as a
on u.adres_no=a.adres_no
join emanet as e
on e.uye_no = u.uye_no

select u.ad,u.soyad,a.il,e.emanet_tarihi,k.ad from
uyeler as u join adres as a
on u.adres_no=a.adres_no
join emanet as e
on e.uye_no = u.uye_no
join kitablar as k
on k.ISBN=e.ISBN
--ankara ilinde en çok okunan kitap ismi
select top(1) k.ad from
uyeler as u join adres as a
on u.adres_no=a.adres_no
join emanet as e
on e.uye_no = u.uye_no
join kitablar as k
on k.ISBN=e.ISBN
where  il = 'ankara'
group by k.ad
order by count(k.ad) desc


select count(distinct(k.ad)) as [okunan farklı kitapların sayısı],count(k.ad) as [toplam okuma sayısı] from
uyeler as u join adres as a
on u.adres_no=a.adres_no
join emanet as e
on e.uye_no = u.uye_no
join kitablar as k
on k.ISBN=e.ISBN
where  il = 'ankara'

-- left join
select * from
adres as a left join uyeler as u 
on a.adres_no = u.adres_no 

-- right join

--bu sorgu tasarımdann dolayı inner join ile aynı sonuç verir
select * from
adres as a right join uyeler as u 
on a.adres_no = u.adres_no 

--bu ise yukarıdaki lest join ile aynı sonucu getirir
select * from
uyeler as u right join  adres as a 
on a.adres_no = u.adres_no 

-- full join
select * from
uyeler as u full join  adres as a 
on a.adres_no = u.adres_no 

-- union 
select ad from uyeler
select ad from yazar

select ad from uyeler
union
select ad from yazar

select ad from uyeler
union all
select ad from yazar
order by ad
--view lar

create view uye_kitap
as
select u.ad as "uye ad",u.soyad,a.il,e.emanet_tarihi,k.ad from
uyeler as u join adres as a
on u.adres_no=a.adres_no
join emanet as e
on e.uye_no = u.uye_no
join kitablar as k
on k.ISBN=e.ISBN

select * from uye_kitap





