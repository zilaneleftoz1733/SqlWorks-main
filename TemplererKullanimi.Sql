select Phone, day(Trh) Gun ,sum(AramaSayisi) Arama ,sum(Duration) Sure
from ServiceReports
Group by Phone, day(Trh)



-- rapor yazarsak eğer direkt localde oluşturur

--#rapor ->geçici tablo oluşuturur
create table #Rapor
(
Phone varchar(50),
Gun  varchar(2),
Arama int,
Sure int,
)
--##rapor -> herkesin ulaşabilidği global geçici tablo oluşturur
create table ##Rapor
(
Phone varchar(50),
Gun  varchar(2),
Arama int,
Sure int,
)
-- rapor yazarsak eğer direkt localde oluşturur
create table Rapor
(
Phone varchar(50),
Gun  varchar(2),
Arama int,
Sure int,
)
--silme işlemi 
--tabloları tmpdb den uçurmak için kullanılır
-- drop table #Rapor
-- drop table ##Rapor

--crud işlemleri bildiğimiz gibi insert olarak kullanılıyor.
Insert Into #Rapor (Phone,Gun,Arama,Sure) Values ('0850 7500000',18,11,111)
select *from #Rapor