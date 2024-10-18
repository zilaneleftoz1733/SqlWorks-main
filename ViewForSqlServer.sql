
create VIEW UrunlerListesi
as 
select p.productname,c.categoryname ,s.companyname
from products p
inner join categories c on p.categoryid = c.categoryid
inner join suppliers s on s.supplierid = p.supplierid

select categoryname,count(*) Adet
from UrunlerListesi 
Group by categoryname