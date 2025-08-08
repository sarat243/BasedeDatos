--CREAR BD
CREATE DATABASE bdmorgan;
GO
--USAR LA BD
USE bdmorgan;

CREATE TABLE empleado
(
IdEmpleado int not null identity(1,1),
Nombre varchar(50) not null,
Apellido1 varchar(20) not null,
Apellido2 varchar(20) ,
edad int not null,
estatus char(1) not null default 'A',
IdDepto int not null,
);
GO

ALTER TABLE empleado
ADD jef int;
GO

ALTER TABLE empleado
ADD CONSTRAINT pk_idempleado
PRIMARY KEY (IdEmpleado)

ALTER TABLE empleado
ADD CONSTRAINT chk_edad
CHECK (edad between 18 and 60)
GO

ALTER TABLE empleado
ADD CONSTRAINT fk_empleado_empleadojefe
FOREIGN KEY (jef) 
REFERENCES empleado(IdEmpleado)

--Crear tabla departamentos
CREATE TABLE Departamentos
(
IdDepart int not null identity(1,1),
NombreDepto varchar(20) not null,
CONSTRAINT pk_depto
PRIMARY KEY (IdDepart)
);

ALTER TABLE empleado
ADD CONSTRAINT fk_empleado_Departamentos
FOREIGN KEY (IdDepto)
REFERENCES Departamentos(IdDepart)

ALTER TABLE Departamentos 
ADD  IdEmple int;



ALTER TABLE Departamentos 
ADD CONSTRAINT fk_Departamentos_empleado
FOREIGN KEY (IdEmple)
REFERENCES empleado(IdEmpleado)

SELECT*FROM empleado;
SELECT*FROM Departamentos;