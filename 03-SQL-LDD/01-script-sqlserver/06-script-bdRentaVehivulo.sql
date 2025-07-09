--CREAR LA BASE DE DATOS RENTA
CREATE DATABASE RentaVehiculo;
--USAR LA BD
USE RentaVehiculo;
--CREAR LA TABLA CLIENTE
CREATE TABLE Cliente
(
NumCliente int not null identity(1,1),
Nombre NVARCHAR(20) not null,
Apellido1 NVARCHAR(20) not null,
Apellido2 NVARCHAR(20),
Curp char(18) not null,
Telefono int,
Calle NVARCHAR(20) not null,
Numero int not null,
Ciudad NVARCHAR(20) not null,
CONSTRAINT pk_cliente
PRIMARY KEY(NumCliente),
CONSTRAINT unique_curp
UNIQUE (Curp)
);
--CREAR LA SEGUNDA TABLA SUCURSAL
CREATE TABLE Sucursal
(
NumSucursal int not null identity(1,1),
Nombre NVARCHAR(20) not null,
Ubicacion NVARCHAR(20) not null,
CONSTRAINT pk_sucursal
PRIMARY KEY (NumSucursal)
);
--CREAR LA TABLA M:N VEHICULO
CREATE TABLE Vehiculo
(
NumVehiculo int not null identity(1,1),
Numcliente int not null,
Numsucursal int not null,
Palca char(9) not null,
Marca NVARCHAR(20) not null,
Modelo NVARCHAR(20) not null,
Anio int not null,
CONSTRAINT pk_vehiculo
PRIMARY KEY (NumVehiculo,Numcliente,Numsucursal),
CONSTRAINT fk_Vehiculo_Cliente
FOREIGN KEY(Numcliente)
REFERENCES Cliente(NumCliente),
CONSTRAINT fk_Vehiculo_Sucursal
FOREIGN KEY (Numsucursal)
REFERENCES Sucursal(NumSucursal)

);