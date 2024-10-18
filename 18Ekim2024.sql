--stored prosedure
create Procedure UlkelerinYillaraGoreDagilimi(@yil,int)
AS
Begin
select o.ShipCountry Ulke,year(o.orderDate) Yil,Sum((od.Quantity*od.UnitPrice)*(1-od.Discount)) Ciro
 from orders o 
 inner join [OrderDetails] od on od.OrderID=o.OrderID
 group by o.shipCountry,year(o.OrderDate)
 order by yil,ciro Desc
End
exec UlkelerinYillaraGoreDagilimi 1997
-----shipper tablosuna crud işlemler için gerekli prodecurleri yazınız 
---ınsert update delete create
-- Insert procedure for shipper table
CREATE PROCEDURE InsertShipper
    @CompanyName NVARCHAR(100),
    @Phone NVARCHAR(20)
AS
BEGIN
    INSERT INTO Shipper (CompanyName, Phone)
    VALUES (@CompanyName, @Phone)
END

-- Update procedure for shipper table
CREATE PROCEDURE UpdateShipper
    @ShipperID INT,
    @CompanyName NVARCHAR(100),
    @Phone NVARCHAR(20)
AS
BEGIN
    UPDATE Shipper
    SET CompanyName = @CompanyName,
        Phone = @Phone
    WHERE ShipperID = @ShipperID
END

-- Delete procedure for shipper table
CREATE PROCEDURE DeleteShipper
    @ShipperID INT
AS
BEGIN
    DELETE FROM Shipper
    WHERE ShipperID = @ShipperID
END

-- Select procedure for shipper table
CREATE PROCEDURE SelectShippers
AS
BEGIN
    SELECT * FROM Shipper
END