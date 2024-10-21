
-- Stored Procedure Uretilmesi
create PROCEDURE UlkerinYillaraGoreCiroDagilimi(@yil int)
AS
Begin
select o.ShipCountry Ulke,year(o.OrderDate) Yil,Sum((od.Quantity * od.UnitPrice)*(1-od.Discount)) Ciro
from orders o 
inner join [Order Details] od on od.OrderID =o.OrderID
where year(o.OrderDate) = @yil
group by  o.ShipCountry ,year(o.OrderDate)
order by yil,ciro DESC
End

exec UlkerinYillaraGoreCiroDagilimi 1997


-- Shipper tablosuna Crud islemleri cin gerekli procedurleri yaziniz.
-- Insert , Update , delete
Select * from Shippers

create PROCEDURE 
Shipper_Insert(@companyName varchar(40), @phone as varchar(24))
as 
BEGIN

insert into Shippers (CompanyName,Phone)
VALUEs (@companyName,@phone)

End 




alter procedure Shipper_Update(@shipperID int 
,@companyName varchar(40)
,@phone varchar(24))
as 
BEGIN
if(@shipperID<=0)
Begin TRY
  return RAISERROR ('ShipperId 0 dan buyuk olmalidir',16,1)
End try
if(@companyName is null)
Begin try
 return RAISERROR ('Company Name null olamaz',16,1)
End TRY
update Shippers 
set CompanyName=@companyName,Phone=@phone 
Where ShipperID =@shipperID

END
select * from Shippers
exec Shipper_Update 0 ,abc,123

create procedure Shipper_Delete()
