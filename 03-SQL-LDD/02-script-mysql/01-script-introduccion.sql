#Lenguaje SQL-LDD (create,alter,drop)

#Crear la base de datos empresag2

CREATE DATABASE empresaG2;

#Utilizar la BD
USE empresaG2;
#Crear la tabla categoria

CREATE TABLE Categorias
(
categoriaId int primary key,
nombrecategoria nvarchar(30) not null unique
);

#Crear tabla empleado
CREATE TABLE empleado
(
EmpleadoId int not null auto_increment,
Nombre nvarchar(20) not null,
Apellidopaterno nvarchar(15) not null,
curp char(18) not null,
telefono char(15) null,
sexo char(1) not null,
activo boolean not null,
CONSTRAINT pk_empleado
PRIMARY KEY(EmpleadoID),
CONSTRAINT unique_curp
UNIQUE(curp),
CONSTRAINT chhk_sexo
CHECK(sexo in ('M','F'))
);

drop table empleado;

#Insertar categorias
INSERT INTO Categorias(categoriaId,nombrecategoria)
values (1,'Carnes Frias');

INSERT INTO Categorias(categoriaId,nombrecategoria)
values (2,'Vinos y Licores');

SELECT * FROM Categorias;

#Insertar en empleado
INSERT INTO empleado(Nombre,Apellidopaterno,curp,telefono,sexo,activo)
values('Monico','Panfilo','ae3erdwe','24300688','M','1');

INSERT INTO empleado(Nombre,Apellidopaterno,curp,telefono,sexo,activo)
values('Saraih','Victorio','gcuwdh','24300687','F','1');

SELECT*FROM empleado;


#Creacion de Primary Keys compuestas
CREATE TABLE Tabla1
(
tabla1id1 int  not null,
tabla1id2 int not null,
Nombre nvarchar(20) not null,
CONSTRAINT pk_Tabla1
PRIMARY KEY(tabla1id1,tabla1id2)
);
CREATE TABLE tabla2
(
Tabla2id int not null auto_increment,
Nombre varchar(20),
tabla1id1 int,
tabla1id2 int,
CONSTRAINT ps_Tabla2
PRIMARY KEY(Tabla2id),
CONSTRAINT fk_tabla2_tabla1
FOREIGN KEY (tabla1id1,tabla1id2)
REFERENCES Tabla1 (tabla1id1,tabla1id2)
);

CREATE TABLE  Employe
(
Id int not null auto_increment,
Nombre varchar(20) not null,
Ap1 nvarchar(20) not null,
Ap2 nvarchar(20),
Sexo char(1) not null,
Salario Numeric (10,2) not null,
CONSTRAINT pk_employee
PRIMARY KEY(Id),
CONSTRAINT chk_Sexo
CHECK (Sexo in ('M','F')),
CONSTRAINT chk_Salario
CHECK (Salario>0.0)

);


CREATE TABLE Department
(
Id int not null auto_increment,
NombreProyecto varchar(20) not null,
Ubicacion varchar(15) not null,
FechaInicio Date not null,
IdEmployee int not null,
CONSTRAINT pk_deparment
PRIMARY KEY (Id),
CONSTRAINT unique_nombreproyecto
UNIQUE(NombreProyecto),
CONSTRAINT unique_idemployee
UNIQUE (IdEmployee ),
CONSTRAINT fk_deparment_employee
FOREIGN KEY (IdEmployee)
REFERENCES Employe(Id)


);

CREATE TABLE Proyect 

(
Proyectid int not null auto_increment,
Nombre nvarchar(20) not null,
CONSTRAINT pk_proyect
PRIMARY KEY (Proyectid)

);

#Razon de cardinalidad N:M
CREATE TABLE WorkOn
(
employeeid int not null,
proyectid int not null,
Horas int not null,
CONSTRAINT pk_WorkOn
PRIMARY KEY(employeeid,proyectid),
CONSTRAINT fk_WorkOn_employee
FOREIGN KEY (employeeid)
REFERENCES Employe(Id),
CONSTRAINT fk_WorkOn_Proyect
FOREIGN KEY (proyectid)
REFERENCES Proyect(Proyectid)

);
