
create view deneme (kimsin,nezaman,ne,nekadar)
as
select c.ContactName ,o.OrderDate,p.ProductName,od.UnitPrice from 
Customers as c 
join Orders as o on c.CustomerID=o.CustomerID
join [Order Details] as od on od.OrderID = o.OrderID
join Products as p on p.ProductID=od.ProductID

create view deneme2
as
SELECT   MAX([Order Details].UnitPrice) as maksimum , Customers.ContactName
FROM         Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                         [Order Details] ON Orders.OrderID = [Order Details].OrderID
group BY Customers.ContactName, Customers.CustomerID

select * from deneme2
drop view deneme2

create view deneme4
as
SELECT country,COUNT(country) as mycount 
FROM customers 
GROUP BY country


SELECT country FROM 
deneme4
where mycount in 
(SELECT MIN (mycount) 
FROM deneme4)
order by country




select kimsin,ne ,nezaman from deneme

drop view deneme

create view deneme3
with encryption
as
SELECT   MAX([Order Details].UnitPrice) as maksimum , Customers.ContactName
FROM         Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                         [Order Details] ON Orders.OrderID = [Order Details].OrderID
group BY Customers.ContactName, Customers.CustomerID

drop view deneme3

-----------------------------
go
declare @dene int
set @dene = 5
go
print @dene

------------------------------

CREATE PROCEDURE sp_first	
AS
BEGIN
	select * from Customers
END

sp_first
execute sp_first
exec sp_first

create procedure sp_two
@city nvarchar(15)
as
begin 
select * from Customers where city = @city
end

sp_two 'Berlin'



create procedure sp_nereden_nereye
@city1 varchar(20),
@city2 varchar(20)
as
begin 

SELECT   orders.OrderDate,Products.ProductName
FROM         Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                         [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                         Products ON [Order Details].ProductID = Products.ProductID INNER JOIN
                         Suppliers ON Products.SupplierID = Suppliers.SupplierID

where customers.City = @city1 and Suppliers.City = @city2
end

sp_nereden_nereye 'cork' ,'london'
--- fonksiyonlar

create function test2 
(@gelen varchar(20))
returns varchar(MAX)
as 
begin
	return upper(@gelen)
end


select [dbo].[test2](ContactName) from Customers