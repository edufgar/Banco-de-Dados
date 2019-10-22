USE MinhaCaixa

--- Trigger

CREATE TRIGGER trgINSERT_CLIENTE
ON Clientes
FOR INSERT
AS
BEGIN
INSERT clientes_audit 
(ClienteCodigo,ClienteCPF,ClienteNome)
SELECT ClienteCodigo,ClienteCPF, ClienteNome 
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




