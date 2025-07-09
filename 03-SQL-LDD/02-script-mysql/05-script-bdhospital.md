```SQL
##CREAR LA BASE DE DATOS HOSPITAL
CREATE DATABASE Hospital;
##USAR LA BD
USE Hospital;
##CREAR LA  TABLA DOCTOR
CREATE TABLE Doctor
(
idDoctor int not null auto_increment,
Nombre NVARCHAR(20) not null,
Apellido1 NVARCHAR(20),
Apellido2 NVARCHAR(20),
CONSTRAINT pk_idDoct
PRIMARY KEY (idDoctor)
);

##CREAR LA TABLA PACIENTE
CREATE TABLE Paciente
(
idPaciente int not null auto_increment,
Nombre NVARCHAR(20),
Apellido1 NVARCHAR(20) not null,
Apellido2 NVARCHAR(20),
Edad int not null,
CONSTRAINT pk_idpaciente
PRIMARY KEY(idPaciente)
);
##CREAR LA TABLA M:N
CREATE TABLE Registro
(
IdDoctor int not null,
IdPaciente int not null,
Fecha NVARCHAR(10),
Diagnostico NVARCHAR(50),
CONSTRAINT pk_registro
PRIMARY KEY (IdDoctor,IdPaciente),
CONSTRAINT fk_Registro_Doctor
FOREIGN KEY (IdDoctor)
REFERENCES Doctor(idDoctor),
CONSTRAINT fk_Registro_Paciente
FOREIGN KEY (IdPaciente)
REFERENCES Paciente(idPaciente)
);
