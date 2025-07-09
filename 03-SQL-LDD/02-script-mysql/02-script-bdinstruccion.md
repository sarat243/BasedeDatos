```SQL
#Creacion de Base de Datos 
CREATE DATABASE Instruccion;
#Usar la BD
USE Instruccion;
#Crear tabla Instructor
CREATE TABLE Instructor
(
ssnId int not null auto_increment,
Lname varchar(20) not null,
Fname varchar(20) not null,
CONSTRAINT pk_ssn
PRIMARY KEY (ssnId)

);

#Crear segunda tabla
CREATE TABLE Class
(
courseNum int not null,
years int not null,
term varchar(20) not null,
section varchar(20) not null,
CONSTRAINT pk_class
PRIMARY KEY(courseNum,years,term,section)
);

#crear tercera tabla M:N
CREATE TABLE Teaches
(
SSN int not null ,
CourseNum int not null,
Years int not null,
Term varchar(20) not null,
Section varchar(20) not null,

CONSTRAINT fk_teaches_Instructor
FOREIGN KEY (SSN)
REFERENCES Instructor(ssnId),


CONSTRAINT fk_teaches_Class
FOREIGN KEY (CourseNum,Years,Term,Section)
REFERENCES Class(courseNum,years,term,section),

CONSTRAINT pk_teaches
PRIMARY KEY(SSN,CourseNum,Years,Term,Section)
);


