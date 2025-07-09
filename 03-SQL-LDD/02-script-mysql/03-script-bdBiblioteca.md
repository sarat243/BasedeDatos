```SQL
## CREAR LA BASE DE DATOS BIBLIOTECA
CREATE DATABASE Biblioteca;
## Usamos la BD
USE Biblioteca;
-- CREAR LA TABLA LIBRO
CREATE TABLE Libro
(
Numlibro int not null auto_increment,
Isbn nvarchar(20) not null,
Titulo nvarchar(20) not null,
Autor nvarchar(20) not null,
CONSTRAINT pk_Numlibro
PRIMARY KEY (Numlibro)

);

##CREAR LA SEGUNDA TABLA LECTOR
CREATE TABLE Lector
(
Numlector int not null auto_increment,
NumMenbresia nvarchar (20) not null,
Nombre nvarchar(20) not null,
Ape1 nvarchar(20) not null,
Ape2 nvarchar(20),
CONSTRAINT pk_Lector
PRIMARY KEY (Numlector),
CONSTRAINT unique_Menbresia
UNIQUE (NumMenbresia)
);

##CREAR LA TABLA M:N 
CREATE TABLE Prestamo
(
NumLibro int not null auto_increment,
NumLector int not null ,
FechaPrestamo nvarchar(10),
CONSTRAINT pk_Presta
PRIMARY KEY(NumLibro,NumLector),
CONSTRAINT fk_Prestamo_Libro
FOREIGN KEY (NumLibro)
REFERENCES Libro(Numlibro),

CONSTRAINT fk_Prestamo_Lector
FOREIGN KEY (NumLector)
REFERENCES Lector(Numlector)
);

