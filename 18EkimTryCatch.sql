Alter procedure Shipper_Update(@shipperID int 
,@companyName varchar(40)
,@phone varchar(24))
as 
BEGIN

Begin TRY
    if(@shipperID<=0)
    RAISERROR ('ShipperId 0 dan buyuk olmalidir',16,1)
    if(@companyName is null)
    RAISERROR ('Company Name null olamaz',16,1)

    update Shippers 
    set CompanyName=@companyName,Phone=@phone 
    Where ShipperID =@shipperID
End try
Begin CATCH
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

    -- Use RAISERROR inside the CATCH block to return error
    -- information about the original error that caused
    -- execution to jump to the CATCH block.
    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
End CATCH


END




exec Shipper_Update 8 ,'XYZ Kargo',123
select * from Shippers