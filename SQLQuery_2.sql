select p.ProductID,p.ProductName,
s.CompanyName,c.CategoryName
from Products p 
inner join Categories c on p.CategoryID=c.CategoryID
inner JOIN Suppliers s  on s.SupplierID=p.SupplierID

SELECT [p].[ProductID] AS [UrunId], [p].[ProductName] AS [UrunAdi], [c].[CategoryName] AS [Kategori], [s].[CompanyName] AS [Tedarikci]
FROM [Products] AS [p]
LEFT JOIN [Categories] AS [c] ON [p].[CategoryID] = [c].[CategoryID]
LEFT JOIN [Suppliers] AS [s] ON [p].[SupplierID] = [s].[SupplierID]

SELECT [t].[Key] AS [Calisan], COUNT(*) AS [Adet]
FROM (
    SELECT [e].[FirstName] + N' ' + [e].[LastName] AS [Key]
    FROM [Employees] AS [e]
    INNER JOIN [Orders] AS [o] ON [e].[EmployeeID] = [o].[EmployeeID]
    WHERE DATEPART(year, [o].[OrderDate]) = 1997
) AS [t]
GROUP BY [t].[Key]