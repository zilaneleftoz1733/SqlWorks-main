-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================

-- =============================================
-- Author:		Ercan
-- Create date: 18.10.2024
-- Description:	ServiceReports Tablosuan Kayit Atar
-- =============================================
Create TRIGGER dbo.AddServiceReportsYeni 
   ON  dbo.IvrLog
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- insert sirasinda sanal bir tablo olusur.
	-- bu tablonun ismi inserted 'dir. 
	-- Update sirasinda ise birde deleted tablosu olusur
-- Inserted tablosundan gelen bilgileri karsilayacak Degisken Tanimlamalari 
declare @aranannumara varchar(50),
		@sure int ,
		@ivrNo int ,
		@endDate DateTime,
		@serviceId bigint
   
-- inserted tablosundaki verilere erisim 
select @aranannumara =i.ArananNo ,   
		@sure = DATEDIFF(minute,i.StartDate,i.EndDate),
		@ivrNo=i.IvrNo,
		@endDate = i.EndDate
from inserted as i
-- ServiceReport Tablosunda bu kayit varmi ?

 Select @serviceId= ID 
 from ServiceReports		
		Where Phone = @aranannumara and
		IvrNo = @ivrNo and
		year(trh) = year(@endDate) and  -- O yil
		Month(trh) = Month(@endDate) and -- O Ay 
		day(trh)   = day(@endDate) and   -- O Gun
		DatePart(hh,trh)  = datepart(hh,@endDate) and  -- O saat
		DatePart(MI,trh) = DatePart(MI,@endDate)  -- O Dakika 


if(@serviceId>0)		
Begin 
  Update ServiceReports  Set AramaSayisi = AramaSayisi +1 , Duration=Duration +@sure
  where ID= @serviceId

End
else Begin
  Insert into ServiceReports (Phone,trh,Duration,AramaSayisi,IvrNo)
  values (@aranannumara,@endDate,@sure,1,@ivrNo)
End


END --
GO