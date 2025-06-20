--Crear la base de datos bdrestricciones

CREATE DATABASE bdrestricciones;

--Utilizar la base de datos bdrestricciones
USE bdrestricciones;

--Crear tabla categoria 
CREATE TABLE categoria (
categriaid int,
nombe nvarchar(50)
)

--Revisar los datos de la tabla
SELECT*FROM categoria;

--Agregar registro
INSERT INTO categoria 
values (1,'carnes fria');

INSERT INTO categoria 
values (2,'Linea blanca');

INSERT INTO categoria 
values (1,'carnes fria');

--Eliminar datos
DELETE FROM categoria;

--Eliminar la tabla categoria
DROP TABLE categoria;

CREATE TABLE categoria(
categoriaid int not null,
nombrecategoria nvarchar(50) not null,
constraint pk_categoria
primary key (categoriaid)
);

INSERT INTO categoria 
values (1,'carnes fria');

INSERT INTO categoria 
values (2,'Linea blanca');

INSERT INTO categoria 
values (3,'Dulces');


INSERT INTO categoria 
values (4,'Dulces');

SELECT*FROM categoria;

DROP TABLE categoria;

CREATE TABLE categoria(
categoriaid int not null,
nombrecategoria nvarchar(50) not null,
constraint pk_categoria
primary key (categoriaid),
constraint unico_nombrecategoria
unique(nombrecategoria)
);

INSERT INTO categoria 
values (1,'carnes fria');

INSERT INTO categoria 
values (2,'Linea blanca');

INSERT INTO categoria 
values (3,'Dulces');


INSERT INTO categoria 
values (4,'Dulces');

--Crear la tabla producto

CREATE TABLE producto(
productoid int not null,
nombreproducto nvarchar(50) not null,
precio money not null,
existencia int not null,
constraint pk_producto
primary key(productoid),
constraint unico_nombreproducto
unique(nombreproducto),
constraint chk_precio
check(precio>=1 and precio <=3000),
constraint chk_existencia
check(existencia>=1)
);

INSERT INTO producto 
values (1,'Don Julio',3000,56);

INSERT INTO producto 
values (2,'Don Julio2',3000,56);

INSERT INTO producto 
values (3,'Don Julio3',3000,56);

INSERT INTO producto 
values (4,'Terrible Mezcal',1,56);

INSERT INTO producto 
values (5,'Terrible Mezcalito',1,3001);

SELECT*FROM producto;
DELETE FROM producto;
DROP TABLE producto;

CREATE TABLE producto(
productoid int not null,
nombreproducto nvarchar(50) not null,
precio money not null,
existencia int not null,
categoriaid int,
constraint pk_producto
primary key(productoid),
constraint unico_nombreproducto
unique(nombreproducto),
constraint chk_precio
check(precio>=1 and precio <=3000),
constraint chk_existencia
check(existencia>=1)
);

INSERT INTO producto
values(1, 'mazapan',10, 100,3);

INSERT INTO producto
values(2, 'piruli',10, 100,null);

INSERT INTO producto
values(3, 'transforme',10, 100,7);

DELETE producto;
DROP TABLE producto;

CREATE TABLE producto(
productoid int not null,
nombreproducto nvarchar(50) not null,
precio money not null,
existencia int not null,
categoriaid int,
constraint pk_producto
primary key(productoid),
constraint unico_nombreproducto
unique(nombreproducto),
constraint chk_precio
check(precio>=1 and precio <=3000),
constraint chk_existencia
check(existencia>=1),
constraint fk_producto_categoria
foreign key (categoriaid)
references categoria(categoriaid)
);

INSERT INTO producto
values(1, 'mazapan',10, 100,3);

INSERT INTO producto
values(2, 'piruli',10, 100,null);

INSERT INTO producto
values(3, 'transforme',10, 100,7);

SELECT*FROM categoria;
SELECT*FROM producto;