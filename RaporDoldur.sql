USE [TicariPaket]
GO
/****** Object:  StoredProcedure [dbo].[RaporDoldur]    Script Date: 22.10.2024 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[RaporDoldur](@table as varchar(50))
as 
BEGIN

   declare @phone  varchar(15) , 
            @trh  DATETIME,
            @duration varchar(10),
            @aramaSayisi varchar(10),
            @sql nvarchar(max)

  declare cursor_service cursor for 
  select Phone,trh,Duration,AramaSayisi from ServiceReports

open cursor_service 
fetch next from cursor_service into @phone,@trh,@duration,@aramaSayisi
while @@FETCH_STATUS=0
Begin 
select  @duration, @aramaSayisi
  set @sql = 'Update '+@table+' Set Arama'+ cast(day(@trh) as varchar) + '='+@aramaSayisi +    
  ' , Sure'+ cast(day(@trh) as varchar) + '='+ @duration+ ' Where Phone='''+@phone+''' '

print @sql
exec (@sql)
fetch next from cursor_service into @phone,@trh,@duration,@aramaSayisi
End
close cursor_service 
DEALLOCATE cursor_service

End
exec RaporDoldur ##Test
select * from  ##Test