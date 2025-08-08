use NORTHWND;

SELECT *
FROM Categories;

SELECT*FROM	
Products;

SELECT*
FROM Suppliers;

SELECT*
FROM Customers;

SELECT*
FROM Employees;

SELECT*
FROM Shippers;

SELECT*
FROM Orders;

SELECT*
FROM [Order Details];

SELECT customerid,CompanyName,City
FROM Customers;






--Alias de columna 
SELECT Customers.CustomerID AS [Numero Cliente],
Customers.CompanyName AS [Empresa],
Customers.ContactName AS [Nombre de contacto]
FROM Customers

--Alias de columna 
SELECT CustomerID AS 'Numero Empleado',
		CompanyName Empresa,
		city AS Ciudad,
		ContactName AS [Nombre del Contacto]
FROM Customers;


--Alias de tabla
SELECT c.CustomerID AS [Numero Cliente],
c.CompanyName AS [Empresa],
c.ContactName AS [Nombre de contacto]
FROM Customers AS c;

SELECT c.CustomerID AS [Numero Cliente],
c.CompanyName AS [Empresa],
c.ContactName AS [Nombre de contacto]
FROM Customers  c;


--Campo calculado
SELECT od.OrderID AS [Numero de orden], 
od.ProductID AS [Numero de Producto] ,
od.UnitPrice AS [Precio],
od.Quantity AS [Cantidad]
,(UnitPrice * Quantity ) AS [Total]
FROM [Order Details] AS od;

--Seleccionar todos los roductos que 
--pertenezcan a la categoria 1 
SELECT*FROM 
Products WHERE CategoryID =1 ;


SELECT p.ProductID AS [Numero],
p.ProductName AS [Nombre],
p.CategoryID AS [Categoria],
p.UnitPrice AS [Precio],
p.UnitsInStock AS [Cantidad],
(p.UnitPrice * p.UnitsInStock) AS [Costo]
FROM Products AS p
 WHERE CategoryID =1;

 --Seleccionar todos los productos
 --de la categoria Contimens 
 SELECT*FROM Categories;
 
SELECT p.ProductID AS [Numero],
p.ProductName AS [Nombre],
p.CategoryID AS [Categoria],
p.UnitPrice AS [Precio],
p.UnitsInStock AS [Cantidad],
(p.UnitPrice * p.UnitsInStock) AS [Costo]
FROM Products AS p
 WHERE CategoryID =2;


 --Seleccionar todos los productos 
 --su precio sea mayor a 40.3
 --id, nombre producto,precio

 SELECT p.ProductID AS [Numero de producto],
 p.ProductName AS [Nombre de producto],
 p.UnitPrice AS [Precio]
 FROM Products AS p
 WHERE p.UnitPrice > 40.3;

  SELECT p.ProductID AS [Numero de producto],
 p.ProductName AS [Nombre de producto],
 p.UnitPrice AS [Precio]
 FROM Products AS p
 WHERE p.UnitPrice >= 40;

 --Seleccionar los productos que el numero de categoria sea diferebte a 3
  SELECT p.ProductID AS [Numero de producto],
 p.ProductName AS [Nombre de producto],
 p.UnitPrice AS [Precio]
 FROM Products AS p
 WHERE p.CategoryID <>3;  --o !=

 --Seleccionar todas las ordenes que sean de brazil - rio de janeiro
 --Mostrando solo el numero de orden, la fecha de orden 
 --Pais de envio, la ciudad y su transportista
 SELECT* FROM Orders;

 SELECT 
 o.OrderID AS [Numero de orden],
 o.OrderDate AS [Fecha de orden],
 o.ShipCity AS [Pais de envio],
 o.ShipVia AS [Transportista]
 
 FROM Orders AS o
 WHERE O.ShipCity = 'Rio de Janeiro';

   SELECT 
 o.OrderID AS [Numero de orden],
 o.OrderDate AS [Fecha de orden],
 o.ShipCity AS [Pais de envio],
 o.ShipVia AS [Transportista],
 O.ShipRegion AS [Region],
 o.ShipCountry AS [Pais]
 
 FROM Orders AS o
 WHERE O.ShipRegion is NULL;

    SELECT 
 o.OrderID AS [Numero de orden],
 o.OrderDate AS [Fecha de orden],
 o.ShipCity AS [Pais de envio],
 o.ShipVia AS [Transportista],
 O.ShipRegion AS [Region]
 
 FROM Orders AS o
 WHERE O.ShipRegion is not NULL;

  SELECT 
 o.OrderID AS [Numero de orden],
 o.OrderDate AS [Fecha de orden],
 o.ShipCity AS [Pais de envio],
 o.ShipVia AS [Transportista],
 O.ShipRegion AS [Region]
 
 FROM Orders AS o
 WHERE O.ShipRegion != 'NULL';

 --SELECCIONAR TODAS LAS ORDENES ENVIADAS A BRAZIL, ALEMANIA, MEXICO
 SELECT 
 o.OrderID AS [Numero de orden],
 o.OrderDate AS [Fecha de orden],
 o.ShipCity AS [Pais de envio],
 o.ShipVia AS [Transportista],
 o.ShipCountry AS [Pais]
 
 FROM Orders AS o
 WHERE (O.ShipCountry='Brazil' 
 or o.ShipCountry='Germany' 
 or o.ShipCountry='Mexico')
 and o.ShipRegion is not null;

 SELECT 
 o.OrderID AS [Numero de orden],
 o.OrderDate AS [Fecha de orden],
 o.ShipCity AS [Pais de envio],
 o.ShipVia AS [Transportista],
 o.ShipCountry AS [Pais]
 
 FROM Orders AS o
 WHERE(o.ShipCountry ='Brazil'
 or o.ShipCountry='Germany' 
 or o.ShipCountry='Mexico')
 and o.ShipRegion is not null
 ORDER BY [Pais] ASC, o.ShipCity DESC;
 --Seleccionar todas las ordenes de francia alemania y argentina
SELECT *
FROM Orders
WHERE ShipCountry in ('Germany', 'France', 'Argentina')

--Seleccionar tdos los productos descontinuados o con precio mayor a 50 y ordenados por el precio
SELECT* FROM Products;

SELECT p.ProductID AS [Numero proucto],
p.Discontinued AS [descont],
p.UnitPrice AS [Precio]
FROM Products AS p
WHERE Discontinued=1 or UnitPrice > 50
ORDER BY [Precio] DESC;
