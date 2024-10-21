--select * from ServiceReports

-- Rapor Tablosunun olusturulmasi
declare @PhoneNumber varchar(20) ,@sayac int
set @sayac=1
declare MyPhone cursor for --Cursor Tanimlamasi
select PhoneNumber from IvrPhone
-- Cursor Acilimi 
open MyPhone 
Fetch next from MyPhone into @PhoneNumber
while @@FETCH_STATUS=0
begin 

while @sayac <=31
BEGIN

insert into ##Rapor (Phone,Gun,Arama,Sure)
Values (@PhoneNumber,@sayac,0,0)

set @sayac = @sayac +1
End
--print @PhoneNumber
Fetch next from MyPhone into @PhoneNumber
End


close MyPhone-- Cursor Kapatilir
DEALLOCATE MyPhone-- Hafizadan atilir








--ServiceReports tablosundaki kayitlarin uzerinde gecilmesi
-- declare MyService cursor  for 
-- select Phone,trh,duration,AramaSayisi from ServiceReports
--delete from ##Rapor









