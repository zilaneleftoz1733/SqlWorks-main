
select top 10 * from [Order Details] 
select * from products where ProductID=51

-- Sql server'da trigger Insert ,Update ve Delete islemlerinden once yada sonra calisana yapilardir.
-- SQl server 2 adet sanal tablo ile calisir. 
-- Yenei gelen kayitlar insedrted tablosunda tutulur. Silinen kayitlar ise deleted tablosunda tutulurlar. 
-- Bu sanal tablolar hafizadadir. Tales sekmesi icerisinde gorunmezler 
-- insert sirasinda olusan kayitlar inserted tablosunda tutulur.
-- Update islemi sirada olusan kayitlar ise , yeni gelen kayit inserted tablosunda
-- silinen kayit yani eski hali deleted tablosunda tutulur. 
-- kayit silme isleminde ise silinen kayitlar deleted tablosunda tutulur.

USE [Northwind]
GO
/****** Object:  Trigger [dbo].[StokKontrol]    Script Date: 27.08.2024 09:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[StokKontrol] 
on [dbo].[Order Details]
After Insert 
as 
Begin 
   --order details tablusuna gelen kayitlari inserted tablosundan alalim.
   -- Quantity alanina gelen kayit products tablosundaki unitsinstok alaniyla kıyaslanmasi 
   declare @productid int ,@quantity int ,@eldekiStok int,@productName nvarchar(40)
   declare @adet as int
   -- sanal inserted tablosundaki kayitlara ulasma 
   select @productid=i.ProductID ,@quantity=i.Quantity   from inserted as i

   -- product tablosuna bakilacak
   select @eldekiStok = UnitsInStock ,@productName= ProductName 
   from Products 
   where ProductID=@productid

   Set @adet =@eldekiStok - @quantity 
  
   if(@adet < 1)
   Begin
	   RAISERROR (N'Istenilen %s %d adet eksik var', -- Message text.
		10, -- Severity,
		1, -- State,
		@productName, -- First argument.
	   @adet); -- Second argument.
	-- Yapilan islemi geri al demek 
	ROLLBACK 
	end

End