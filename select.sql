
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

select * from Orders order by OrderID DEsc

select ShipCountry as 'ülke',min(Freight) as 'minimum', max(Freight) as 'maksimum',
avg([Freight]) as 'ortalama' ,sum(Freight) as 'toplam', count(Freight) as 'adet' 
from Orders group by ShipCountry order by ülke desc

select shipCountry from Orders group by ShipCountry having  avg(Freight)>100 
select ShipCountry from Orders where EmployeeID = 5 group by ShipCountry having avg(Freight)>100

select max(adet) from (select ShipCountry as 'ülke',min(Freight) as 'minimum', max(Freight) as 'maksimum',
avg([Freight]) as 'ortalama' ,sum(Freight) as 'toplam', count(Freight) as 'adet' 
from Orders group by ShipCountry) as benimTablom

select top 2 * from Customers where CompanyName like 'a__%'

select * from Orders order by ShipCountry

select shipCountry, avg(Freight)  from Orders group by ShipCountry order by avg(Freight) desc
--nakliye ücretinin ortalaması maksimum olan ülke bilgisini dönderecek SQL komutu
-- 1. çözüm
select top 1 shipCountry  from Orders group by ShipCountry order by avg(Freight) desc
-- 2. çözüm
select shipCountry from Orders group by ShipCountry having max(avg(Freight)) = avg(Freight)

select  ShipCountry from 
(select ShipCountry, avg(Freight) as ort from Orders group by ShipCountry) as deneme 
order by ort desc
 -- 3. çözüm
select  ShipCountry from 
(select ShipCountry, avg(Freight) as ort from Orders group by ShipCountry) as deneme 
where ort in (select top 1 avg(Freight) as ort from Orders group by ShipCountry order by ort desc)

-- 4. çözüm
select  ShipCountry from 
(select ShipCountry, avg(Freight) as ort from Orders group by ShipCountry) as deneme 
where ort in 
(select max(ort) from 
(select ShipCountry, avg(Freight) as ort from Orders group by ShipCountry) as deneme)

-- maksimum müşterisi olan ülke

SELECT country FROM 
(SELECT country,COUNT(country) as mycount 
FROM customers 
GROUP BY country) as deneme
where mycount in 
(SELECT MIN (mycount) 
FROM (SELECT country,COUNT(country) as mycount 
FROM customers 
GROUP BY country) as deneme) 
order by country

select count(*) from customers
select count(*) from orders
select count(*) from customers,Orders
select 91*830
-- doğal birleştime
select count(*) from customers,Orders where Customers.CustomerID = Orders.CustomerID

select customers.ContactName, customers.city, customers.country, Orders.OrderDate, Orders.ShipCity 
from customers,Orders where Customers.CustomerID = Orders.CustomerID

select c.ContactName, c.city, c.country, o.OrderDate, o.ShipCity 
from customers as c,Orders as o where c.CustomerID = o.CustomerID

select c.ContactName as 'müsteri adı', c.city as [müsteri şehri], 
c.country as 'müşteri ülkesi', o.OrderDate as 'şipariş tarihi', o.ShipCity as 'ürün nereden spiriş edildi? '
from customers c,Orders  o where c.CustomerID = o.CustomerID

select c.ContactName, c.city, c.country, o.OrderDate, o.ShipCity 
from customers as c join Orders as o on c.CustomerID = o.CustomerID

select c.ContactName, c.city, c.country, o.OrderDate, o.ShipCity 
from customers as c join Orders as o on c.CustomerID = o.CustomerID
where c.City<>o.ShipCity

select c.ContactName, c.city, c.country, o.OrderDate, o.ShipCity 
from customers as c,Orders as o where c.CustomerID = o.CustomerID and c.City<>o.ShipCity

select c.ContactName, c.country, o.OrderDate, od.UnitPrice, p.ProductName,p.UnitPrice
from customers as c join Orders as o on c.CustomerID = o.CustomerID
join [Order Details] as od on o.OrderID = od.OrderID
join Products as p on p.ProductID = od.ProductID

select count (*)
from customers as c join Orders as o on c.CustomerID = o.CustomerID
join [Order Details] as od on o.OrderID = od.OrderID
join Products as p on p.ProductID = od.ProductID


select c.ContactName, c.city, c.country, o.OrderDate, o.ShipCity 
from Customers as c left join Orders as o on o.CustomerID=c.CustomerID

select c.ContactName, c.city, c.country, o.OrderDate, o.ShipCity 
from Orders as o left join Customers as c  on o.CustomerID=c.CustomerID


select c.ContactName, c.city, c.country, o.OrderDate, o.ShipCity 
from Orders as o right join Customers as c  on o.CustomerID=c.CustomerID


select count(*) 
from Customers as c left join Orders as o on o.CustomerID=c.CustomerID

select count(*) 
from Orders as o left join Customers as c  on o.CustomerID=c.CustomerID

select count(*) 
from Orders as o right join Customers as c  on o.CustomerID=c.CustomerID

select count(*) 
from Orders as o right join Customers as c  on o.CustomerID=c.CustomerID
where o.OrderID is null


select 
(select count(*) 
from Orders as o right join Customers as c  on o.CustomerID=c.CustomerID)-
(select count(*) 
from Orders as o left join Customers as c  on o.CustomerID=c.CustomerID)

select 'emre'


select c.ContactName, c.city, c.country, o.OrderDate, o.ShipCity 
from Orders as o full outer join Customers as c  on o.CustomerID=c.CustomerID

select country from Suppliers

select country from Customers

select country from Suppliers
union
select country from Customers

select country from Suppliers
union all
select country from Customers

select country from Suppliers
intersect
select country from Customers

select country from Suppliers
except
select country from Customers

