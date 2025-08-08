--CREAR BASE DE DATOS 
CREATE DATABASE empresacucha;
--USARA LA BD
USE empresacucha;

--CREAR TABLA EMPLEADO
CREATE TABLE empleados
(
IdEmpleado int not null IDENTITY(1,1),
Nombre VARCHAR(20) not null,
Puesto VARCHAR(20),
FechaIngreso date,
Salario decimal(10,2),
CONSTRAINT pk_emopleado
PRIMARY KEY(IdEmpleado)

);

--crear la tabla departamanetos
CREATE TABLE departamentos
(
idDeoto int not null primary key,
NombreDepto varchar(50)
);
GO
--Agregar una columna a la tabla empleados
ALTER TABLE empleados
ADD CorreoElectronico varchar(20) null;
GO
/*Modificar un tipo de dato de salario
la tabla empleados

*/
ALTER TABLE empleados
ALTER COLUMN Salario money not null;
GO
--Renombrar columna correoelectronico de 
--la tabla empleados
EXECUTE sp_rename 
'empleados.CorreoElectronico', 
'Email','COLUMN';
GO
--Agregar una columna a empleados para foreing key
ALTER TABLE empleados
ADD idDepto int;
GO

--Agregar un CONSTRAINT de Foreign key
ALTER TABLE empleados
ADD CONSTRAINT fk_empleado_depto
FOREIGN KEY(idDepto)
REFERENCES departamentos(idDeoto)
GO
--Agregar un constraint a salario
ALTER TABLE empleados
ADD CONSTRAINT chk_salario
CHECK (Salario>=100 and salario<=100000)
GO
--Agregar un constraint unique al nombre del
--departamento
ALTER TABLE departamentos
ADD CONSTRAINT unique_nombredepto
UNIQUE(NombreDepto);
GO


--Eliminar un constraint
ALTER TABLE empleados
DROP CONSTRAINT fk_empleado_depto
--
SELECT *FROM empleados;
SELECT*FROM departamentos;
GO

ALTER TABLE departamentos
DROP CONSTRAINT unique_nombredepto;
GO

--Eliminar la PK de empleados
ALTER TABLE empleados
DROP CONSTRAINT pk_emopleado;

--Eliminar la Pk de departamentos
ALTER TABLE departamentos
DROP CONSTRAINT PK__departam__F1CAE002F2EC6E31;


ALTER TABLE empleados
DROP CONSTRAINT f_empleado_depto;
GO

--Eliminar columnas 
ALTER TABLE empleados
DROP COLUMN Email;
--Eliminar tabla
DROP TABLE departamentos;
GO

DROP TABLE empleados;