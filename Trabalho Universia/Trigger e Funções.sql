USE Universia

--- Trigger

CREATE TRIGGER trgINSERT_Aluno
ON Alunos
FOR INSERT
AS
BEGIN
INSERT alunos_audit 
(matricula,nomealuno)
SELECT matricula,nomealuno 
FROM  Inserted
END

--- Funções

CREATE FUNCTION fnRetornaAno (@data DATETIME)
RETURNS int
AS
  BEGIN
  DECLARE @ano int
  SET @ano = YEAR(@data)

      RETURN @ano

END




