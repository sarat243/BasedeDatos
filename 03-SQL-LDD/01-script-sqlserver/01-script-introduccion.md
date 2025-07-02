```sql

--Lenguaje SQL-LDD (create,alter,drop)

--Crear la base de datos empresag2

CREATE DATABASE empresaG2;
GO
--Utilizar la BD
USE empresaG2;
--Crear la tabla categoria
CREATE TABLE Categorias
(
categoriaId int primary key,
nombrecategoria nvarchar(30) not null unique
);
GO
--Crear tabla empleado
CREATE TABLE empleado
(
EmpleadoId int not null identity(1,1),
Nombre nvarchar(20) not null,
Apellidopaterno nvarchar(15) not null,
curp char(18) not null,
telefono char(15) null,
sexo char(1) not null,
activo bit not null
CONSTRAINT pk_empleado
PRIMARY KEY(EmpleadoID),
CONSTRAINT unique_curp
UNIQUE(curp),
CONSTRAINT chhk_sexo
CHECK(sexo in ('M','F'))
);
GO

--Insertar categorias
INSERT INTO Categorias(categoriaId,nombrecategoria)
values (1,'Carnes Frias');

INSERT INTO Categorias(categoriaId,nombrecategoria)
values (2,'Vinos y Licores');

SELECT * FROM Categorias;

--Insertar en empleado
INSERT INTO empleado(Nombre,Apellidopaterno,curp,telefono,sexo,activo)
values('Monico','Panfilo','ae3erdwe','24300688','M','1');

INSERT INTO empleado(Nombre,Apellidopaterno,curp,telefono,sexo,activo)
values('Saraih','Victorio','gcuwdh','24300687','F','1');

SELECT*FROM empleado;

