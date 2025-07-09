```SQL
--CREAR LA BASE DE DATOS
CREATE DATABASE Curso;
--USAR LA BD
USE Curso;
--CREAR LA TABLA ESTUDIANTE
CREATE TABLE Estudiante
(
idEstudiante int not null identity(1,1),
Nombre NVARCHAR(20) not null,
Apellido1 NVARCHAR(20) not null,
Apellido2 NVARCHAR(20) not null,
Matricula NVARCHAR(20) not null,
CONSTRAINT pk_idEstudiante
PRIMARY KEY (idEstudiante),
CONSTRAINT unique_matricula
UNIQUE(Matricula)
);
GO
--CREAR LA TABLA CURSO
CREATE TABLE Curso
(
idCurso int not null identity(1,1),
Nombre NVARCHAR(20) not null,
Codigo NVARCHAR(20) not null,
CONSTRAINT pk_idcurso
PRIMARY KEY (idCurso),
CONSTRAINT unique_codigo
UNIQUE (Codigo)
);
GO
--CREAR LA TABLA M:N
CREATE TABLE Inscripcion
(
IdEstudiante int not null,
IdCurso int not null identity(1,1),
CONSTRAINT pk_curso
PRIMARY KEY(IdEstudiante,IdCurso),
CONSTRAINT fk_Inscripcion_idestudiante
FOREIGN KEY (IdEstudiante)
REFERENCES Estudiante(idEstudiante),
CONSTRAINT fk_Inscripcion_Idcurso
FOREIGN KEY (IdCurso)
REFERENCES Curso (idCurso)
);