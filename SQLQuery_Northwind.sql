-- Select
-- ANSI Standartı 

Select ContactName Adi, CompanyName SirketAdi, City Sehir from Customers

Select * from Customers where City = 'Berlin'

Select * from Products where CategoryID = 1 or CategoryID = 3

Select * from Products where CategoryID = 1 and UnitPrice >= 10

--ascending --descending

Select * from Products order by CategoryID, ProductName asc 

Select * from Products where CategoryID = 2 order by UnitPrice desc 

-- count ile kaç eleman olduğunu bulma
Select * from Products
Select count(*) from Products
Select count(*) from Products where CategoryID = 2

--group by
Select CategoryID,count(*) from products group by CategoryID
--10'dan küçük katagoriler için  - Katagoriyi filtreler
Select CategoryID,count(*) from products group by CategoryID having count(*) < 10
-- Adet bazında bakmak için
Select CategoryID,count(*) from products where UnitPrice > 20 group by CategoryID

-- JOIN, INNER JOIN - Inner join iki tabloda eşleşenleri getirir
-- Referanslanan ID'nin gerçek ismini yazdıralım DTO = Data Transformation Object
Select Products.ProductID, Products.ProductName, Products.UnitPrice, Categories.CategoryName 
from Products  inner join Categories 
on Products.CategoryID = Categories.CategoryID
where UnitPrice > 10

-- left join - solda olup sağda olmayanları da getir
Select * from Products left join [Order Details]
on Products.ProductID = [Order Details].ProductID
-- müşterilerden order oluşturmamışları listeleyelim
Select * from Customers c left join Orders o 
on c.CustomerID = o.CustomerID
where o.CustomerID is null

-- Çoklu inner join
Select * from Products p inner join [Order Details] od 
on p.ProductID = od.ProductID
inner join Orders o
on o.OrderID = od.OrderID
