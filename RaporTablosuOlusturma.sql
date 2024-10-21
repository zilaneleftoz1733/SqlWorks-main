create procedure RaporTablosuHazirla (@tableName nvarchar(50))
as 
Begin 

declare @sql nvarchar(max) ,@sayac as int

set @sayac=1
set @sql = 'Create Table ##'+@tableName+ '(id int Identity(1,1) ,Phone varchar(20),'
while @sayac <=31
BEGIN

   set @sql = @sql +' Arama'+ Cast(@sayac as nvarchar(2)) 
    + ' int ,Sure'+Cast(@sayac as nvarchar(2)) + ' int '
    if(@sayac<31) 
    Begin 
     set @sql = @sql + ','
    End 
    Else
    Begin  
      set @sql = @sql + ')'
    End

set @sayac = @sayac +1
End

select @sql 
exec (@sql) -- Degiskenleri exec ederken mutlaka parantez icerisinde yazilmasi gerekiyor



declare @phone varchar(20)

declare cursor_ivrPhone CURSOR for  -- Cursor Tanimlamasi 
select PhoneNumber from IvrPhone

open cursor_ivrPhone
FETCH next from cursor_ivrPhone into @phone
while @@FETCH_STATUS=0
Begin 

set @sql = 'insert into ##' +@tableName+ '(Phone) values ('+@phone+')'
exec (@sql)
FETCH next from cursor_ivrPhone into @phone
End
CLOSE cursor_ivrPhone
DEALLOCATE cursor_ivrPhone
--drop table ##Rapor2
End
--select * from ##Rapor2