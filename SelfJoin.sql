-- Self join Kendi icerisinde Primary Key ve Forign Key barindiran yapilardir.

-- Asagida Calisanlarin kime rapor verdigi ilgili sorgu vardir.
select e2.EmployeeID ,e2.FirstName+ ' ' +e2.LastName,'=>' + e1.FirstName + ' ' + e1.LastName , e1.EmployeeID
from Employees e1
inner join Employees e2 on e1.EmployeeID=e2.ReportsTo

-- postgresql 
select e2.Employee_ID ,e2.First_Name|| ' '||e2.Last_Name,'=>' || e1.First_Name || ' ' || e1.Last_Name , e1.Employee_ID
from Employees e1
inner join Employees e2 on e1.Employee_ID=e2.Reports_To