-- Tablodaki kayit sayisi 
Select count(*) From Customers






------------------

SELECT CustomerID, year(OrderDate) AS Yil, sum(OrderAmount) AS Ciro
FROM Orders
GROUP BY CustomerID, year(OrderDate)
ORDER BY CustomerID, Yil;

SELECT ProductID, year(OrderDate) AS Yil, sum(Quantity) AS ToplamSatis, sum(OrderAmount) AS Ciro
FROM OrderDetails
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
GROUP BY ProductID, year(OrderDate)
ORDER BY ProductID, Yil;

---------------

--Gruplama 
-- ulkelere gore musteri sayisi nedir
--Burada ulkelere gore gruplayip her biri icin count degeri verecektir
select country Ulke, count(*)  Adet
from Customers
group by country
--ulkelere gore musteri sayisini buyukten kucuge dogru sirali vaziyette getirelim 
select country Ulke, count(*)  Adet
from Customers
group by country
order by Adet desc

--Sehirlere  gore musteri sayisini  buyukten kucuge dogru siralayin
select city Ulke, count(*)  Adet
from Customers
group by city
order by Adet desc
-- Musteri sayisi 2'den  buyuk olan sehirlerin listesi nedir?
-- Burada group by kullanildigindan dolayi having kullanmak gereklidir.
-- Where sarti burada işlemez
select city , count(*)  Adet
from Customers
group by city
HAVING count(*) >2
order by Adet desc

--1996 yilindaki musterilerin verdigi siparis sayisi nedir
select customerID, count(*) Adet
from orders
where year(OrderDate)=1996
group by CustomerID
order by Adet desc

-- 1996 yilindaki kargocularin  taşıdıgı  siparis sayisi nedir
select s.CompanyName, count(*) Adet
from orders o
inner join Shippers s on o.ShipVia =s.ShipperID
where year(OrderDate)=1996
group by s.CompanyName
order by Adet desc
-- 2. Yol
select s.CompanyName, count(*) Adet
from orders o ,Shippers s 
where year(OrderDate)=1996 and s.ShipperID=o.ShipVia
group by s.CompanyName
order by Adet desc


select * from Shippers

-- Ulkelere gore yillar icierisindeki siparis dagilimi nasildir

select ShipCountry,year(orderDate),count(*)Adet
from Orders 
group by ShipCountry,year(orderDate)
order by 1,2 


--müşterilerin yıllalr içerisindeki siparişlerin cirolari nedir
--ürünlerin yıllar içerisindeki satıi adedi ve cirosu nedir



-- ülkelere göre yıllar içerisindeki siparişlerin ciroları nedir
select o.ShipCountry Ulke,year(o.orderDate) Yıl,Sum((od.Quantity*od.UnitPrice)*(1-od.Discount)) Ciro
 from orders o 
 inner join [OrderDetails] od on od.OrderID=o.OrderID
 group by o.shipCountry,year(o.OrderDate)
 order by yil,ciro Desc

