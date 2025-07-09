##CREAR LA BASE DE DATOS
CREATE DATABASE Curso;
##USAR LA BD
USE Curso;
##REAR LA TABLA ESTUDIANTE
CREATE TABLE Estudiante
(
idEstudiante int not null auto_increment,
Nombre NVARCHAR(20) not null,
Apellido1 NVARCHAR(20) not null,
Apellido2 NVARCHAR(20) not null,
Matricula NVARCHAR(20) not null,
CONSTRAINT pk_idEstudiante
PRIMARY KEY (idEstudiante),
CONSTRAINT unique_matricula
UNIQUE(Matricula)
);

##CREAR LA TABLA CURSO
CREATE TABLE Curso
(
idCurso int not null auto_increment,
Nombre NVARCHAR(20) not null,
Codigo NVARCHAR(20) not null,
CONSTRAINT pk_idcurso
PRIMARY KEY (idCurso),
CONSTRAINT unique_codigo
UNIQUE (Codigo)
);

##CREAR LA TABLA M:N
CREATE TABLE Inscripcion
(
IdEstudiante int not null,
IdCurso int not null auto_increment,
CONSTRAINT pk_curso
PRIMARY KEY(IdEstudiante,IdCurso),
CONSTRAINT fk_Inscripcion_idestudiante
FOREIGN KEY (IdEstudiante)
REFERENCES Estudiante(idEstudiante),
CONSTRAINT fk_Inscripcion_Idcurso
FOREIGN KEY (IdCurso)
REFERENCES Curso (idCurso)
);