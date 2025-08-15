--INNER JOIN 
SELECT r.Nombre, r.Jefe, r.Cuota, r.Ventas,r.Fecha_Contrato,
o.Ciudad
FROM Representantes AS r
INNER JOIN 
OFICINAS AS o
ON o.Oficina=r.Oficina_Rep
WHERE (o.Ciudad in ( 'Navarra','Castellón','Daimiel')) 
OR (r.Jefe is NULL AND   r.Fecha_Contrato>='1998-06-01' ) OR 
( r.ventas >r.Cuota AND NOT r.Ventas>600000)
ORDER BY r.Ventas DESC;

-----------------------------------------------------------------
SELECT p.Num_Pedido AS [Numero Pedido], 
p.Importe AS [Importe],
c.Empresa AS [Nombre],
c.Limite_Credito AS [Limite Credito]
FROM Pedidos AS p
INNER JOIN Clientes AS c
ON c.Num_Cli=p.Cliente
WHERE Limite_Credito BETWEEN 25000 AND 50000
AND Empresa LIKE 'A%'
ORDER BY Importe DESC
-----------------------------------------------------------------
USE NORTHWND;
--Seleccionar los productos incluyendo su categoria y el provvedor que lo surte
SELECT  ProductName,UnitPrice, UnitsInStock,CategoryID,SupplierID
FROM Products --Consulta simple

SELECT  ProductID AS [Numero de prducto]
,ProductName AS [Nombre de Producto],
UnitPrice AS [Pecio del producto], 
UnitsInStock AS [Existencia],
CategoryID AS [Categoria],
SupplierID AS [Proveedor]
FROM Products

SELECT *
FROM Products
INNER JOIN Categories
ON Products.CategoryID=Categories.CategoryID


SELECT pr.ProductID AS [Numero de prducto]
, pr.ProductName AS [Nombre de Producto]
,pr.UnitPrice AS [Pecio del Producto]
,pr.UnitsInStock AS [Existencia]
,ca.CategoryName AS [Categoria]
,su.CompanyName AS [Proveedor]
FROM Products AS [pr]
INNER JOIN Categories AS [ca]
ON pr.CategoryID=ca.CategoryID
INNER JOIN Suppliers AS [su]
ON pr.SupplierID=su.SupplierID

----------------------------------------------------------------------------------------------
USE pruebajoins;
SELECT*
FROM Productos;

SELECT*
FROM Categorias;

DELETE Categorias WHERE idcategoria=5;
--Inner join
SELECT c.idcategoria,c.Nombre,p.Nombre,p.Precio
FROM Categorias AS c
INNER JOIN Productos AS p
ON c.idcategoria=p.idcategoria

--Left join
SELECT c.idcategoria,c.Nombre,p.Nombre,p.Precio, p.idproducto
FROM Categorias AS c
LEFT OUTER JOIN Productos AS p
ON c.idcategoria=p.idcategoria

---Mostrarv todas las categorias 
SELECT c.idcategoria,c.Nombre AS [Categoria],
p.Nombre AS [Producto],p.Precio, p.idproducto
FROM Categorias AS c
LEFT  JOIN Productos AS p
ON c.idcategoria=p.idcategoria
WHERE p.idproducto IS NULL;

SELECT c.idcategoria,c.Nombre AS [Categoria],
p.Nombre AS [Producto],p.Precio, p.idproducto
FROM Productos AS p
 FULL JOIN Categorias AS c
ON c.idcategoria=p.idcategoria

USE BDEJEMPLO2
--Listar las oficinas y los nombres y puestos de sus jefes

SELECT r.Nombre,r.Puesto,o.Oficina,r.Num_Empl
FROM Oficinas AS [o]
INNER JOIN Representantes AS r
ON r.Num_Empl=o.Jef

-------------------------
--Listar las oficinas y los nombres y los puestos de sus jefes con el objetivo superior a 600,000
SELECT r.Nombre,r.Puesto,o.Oficina,o.Objetivo,o.Ciudad
FROM Oficinas AS [o]
INNER JOIN Representantes AS r
ON r.Num_Empl=o.Jef
WHERE o.Objetivo>=600000
------------
--Listar todos los pedidos mostrando el numero de pedidos 
--el importe y la descripcion de los productos

SELECT p.Num_Pedido,p.Importe, pr.Descripcion
FROM Productos AS pr
INNER JOIN Pedidos AS p
ON pr.Id_producto =p.Producto AND pr.Id_fab=p.Fab


-----------------
--Listar los pedidos superiores a 25000 incluyendo el numero de pedido
--importe el nombre del representante que tomo la nota del pedido y el nombre del cliente
SELECT p.Num_Pedido,p.Importe, r.Nombre,c.Empresa
FROM Pedidos AS p
INNER JOIN Representantes AS r
ON r.Num_Empl=p.Rep
INNER JOIN Clientes AS c
ON c.Num_Cli=p.Cliente
WHERE p.Importe>25000

--------------------
--Listar los pediudos superiores a 25000, mostrando el numero de pedido
 --el nombre del cliente que lo encarga y el nombre del representante 
 --asignado al cliente
 SELECT p.Num_Pedido AS [Número de pedido],
		c.Empresa AS [Nombre del cliente], 
		r.Nombre AS [Nombre del representante]
 FROM Pedidos AS p
 INNER JOIN Representantes as r
 ON r.Num_Empl = p.Rep
 INNER JOIN Clientes as c
 ON p.Cliente = c.Num_Cli
 WHERE p.Importe>25000
 -----------------------
 --Lista los pedidos superiores a 25000, mostrando el numero de pedido
 --el nombre del cliente que lo encargo, el representante del cliente y 
 --la oficina en la que trabaja el representante
  SELECT p.Num_Pedido AS [Número de pedido],
		c.Empresa AS [Nombre del cliente], 
		r.Nombre AS [Nombre del representante],
		o.Oficina AS [Oficina del representante]
 FROM Pedidos AS p
 INNER JOIN Clientes as c
 ON p.Cliente = c.Num_Cli
 INNER JOIN Representantes as r
 ON r.Num_Empl = p.Rep
 INNER JOIN Oficinas AS o
 ON o.Oficina=r.Oficina_Rep
 WHERE p.Importe>25000
SELECT
*FROM Clientes

SELECT 
* FROM Pedidos