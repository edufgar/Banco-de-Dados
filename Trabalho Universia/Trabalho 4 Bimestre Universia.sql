CREATE DATABASE Universia

USE Universia

CREATE TABLE Alunos
(
matricula INT IDENTITY,
nomealuno VARCHAR(20)
)
 
INSERT Alunos (nomealuno) VALUES ('Doe')
GO 
CREATE TABLE Cursos
(
codcurso INT IDENTITY,
nomecurso VARCHAR(50)
)

INSERT Cursos (nomecurso) VALUES ('Administração')
SELECT @@IDENTITY
 
CREATE TABLE GRADE
(
codigocurso INT,
codigograde INT,
codigodisc INT,
anocurso int
)

INSERT GRADE (codigocurso, codigograde,codigodisc,ano)
VALUES (1,1,1,2019),(1,1,2,2019)
 
CREATE TABLE DISCIPLINA
(
codigodisc INT IDENTITY,
nomedisc VARCHAR(20)
)

INSERT DISCIPLINA (nomedisc) VALUES ('Economia')

DECLARE @cod_disc INT 
SET @cod_disc = (SELECT @@IDENTITY)
SELECT @cod_disc


INSERT DISCIPLINA (nomedisc) VALUES ('Filosofia')
SELECT @@IDENTITY

SELECT * FROM Alunos
SELECT * FROM Cursos--1
SELECT * FROM GRADE

CREATE TABLE MATRICULA 
(
matricula INT,
codcurso INT,
anocurso INT,
codigodisc int
)

CREATE PROCEDURE spMatriculaAluno
@nomealuno varchar(20),
@curso varchar(20),
@anocurso int
AS
BEGIN
	DECLARE @matricula INT 

	SET @matricula = 
	(SELECT matricula FROM Alunos WHERE nomealuno = @nomealuno)

	INSERT MATRICULA (matricula, codcurso, anocurso, codigodisc)
	SELECT @matricula, codigocurso, @anocurso,codigodisc
	FROM GRADE LEFT JOIN Cursos 
	ON GRADE.codigocurso = Cursos.codcurso
END

EXEC spMatriculaAluno 'Fulano','Geografia',2019

SELECT * FROM Alunos
