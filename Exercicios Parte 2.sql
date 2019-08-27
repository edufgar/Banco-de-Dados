--> Exercicio 1
--> Faça um consulta que retorne o nome e sobrenome do cliente, seu bairro, e os valores das suas
--> movimentações, a data ordenando as movimentações pelas mais recentes.

SELECT ClienteNome, ClienteSobrenome, ClienteBairro, MovimentoData, MovimentoValor
  FROM Clientes, Contas, Movimentos
  WHERE Clientes.ClienteCodigo=Contas.ClienteCodigo
  AND Contas.ContaNumero=Movimentos.ContaNumero
  ORDER BY MovimentoData desc;

--> Exercicio 2 
--> Mostre o nome do cliente, sobrenome e a sua renda convertida em dolar e euro.

SELECT ClienteNome, ClienteSobrenome,
   (ClienteRendaAnual / 3.9) AS Dolar,
   (ClienteRendaAnual / 4.4) AS Euro
       FROM Clientes;

--> Exercicio 3
--> Traga o nome dos clientes, o sobrenome, o bairro, o estado civil (descrito), o sexo (descrito) e 
--> classifique o cliente de acordo com a sua renda anual, C tem renda menor que 50.000, B tem 
--> renda menor que 70.000 e A tem renda acima de 70.000.

SELECT ClienteNome, ClienteSobrenome, ClienteBairro, ClienteEstadoCivil,
            CASE WHEN ClienteEstadoCivil = 'S' THEN 'Solteiro' ELSE 'Casado' END AS ESTADOCIVILDECRITO,
            ClienteSexo,
            CASE WHEN ClienteSexo = 'M' THEN 'Masculino' ELSE 'Feminino' END AS SEXODESCRITO,
            ClienteRendaAnual,
            CASE WHEN ClienteRendaAnual < 50000 THEN 'C'
            WHEN ClienteRendaAnual < 70000 THEN 'B'
            ELSE 'A'
            END AS 'CLASSIFICAÇÃO'
            FROM Clientes ;

--> Exercicio 4
--> Liste todos os clientes que moram no mesmo bairro das agências do banco.

SELECT ClienteNome, ClienteBairro, AgenciaBairro, AgenciaNome FROM Clientes, Agencias
  WHERE ClienteBairro=AgenciaBairro;

--> Exercicio 5
--> Mostre todos os clientes que possuem número no seu e-mail.

SELECT Clientes.ClienteNome, Clientes.ClienteEmail
  FROM dbo.Clientes
  WHERE Clientes.ClienteEmail LIKE '%[0-9]%';

--> Exercicio 6
--> Mostre todos os clientes em que o nome da rua começa começa com R. e não com RUA.

SELECT ClienteRua FROM dbo.Clientes WHERE
  ClienteRua LIKE 'R.%'
  AND ClienteRua NOT LIKE 'RUA%';


--> Exercicio 7
--> Mostre o nome do cliente e a renda apenas do 5 melhores clientes com base na sua renda.

SELECT TOP 5 ClienteNome, ClienteRendaAnual
    FROM dbo.Clientes
    ORDER BY ClienteRendaAnual DESC;



--> Exercicio 8
--> Mostre o nome do cliente e a renda apenas do 5 piores clientes com base na sua renda.

SELECT TOP 5 ClienteNome, ClienteRendaAnual
    FROM dbo.Clientes
    ORDER BY ClienteRendaAnual;


--> Exercicio 9
--> Mostre o nome e a rua dos clientes que moram em residencias cujo número está entre 300 e 500.

SELECT ClienteNome, ClienteRua FROM dbo.Clientes
            WHERE ClienteNumero BETWEEN 300 AND 500;


--> Exercicio 10
--> Utilizando o conceito de sub consulta, mostre quais clientes não possuem cartão de crédito.

SELECT * FROM dbo.Clientes WHERE ClienteCodigo NOT IN
            (SELECT ClienteCodigo FROM dbo.CartaoCredito);


--> Exercicio 11
--> Mostre o nome do cliente, o nome da agência e o bairro da agência, as movimentações dos clientes e o limite do cartão de crédito deles,
--> somente para os clientes em que a conta foi aberta a partir de 2008.

SELECT ClienteNome, AgenciaNome, AgenciaBairro, MovimentoValor
    FROM dbo.Clientes, dbo.Agencias, dbo.Contas, dbo.CartaoCredito, dbo.Movimentos
    WHERE clientes.ClienteCodigo=Contas.ClienteCodigo
    AND agencias.AgenciaCodigo=dbo.Contas.AgenciaCodigo
    AND CartaoCredito.ClienteCodigo=Clientes.ClienteCodigo
    AND dbo.Contas.ContaNumero=dbo.Movimentos.ContaNumero
    AND ContaAbertura >= '2008-01-01';


--> Exercicio 12
--> Faça uma consulta que classifique os clientes em Regiões conforme o bairro que moram.

SELECT dbo.Clientes.ClienteNome, dbo.Clientes.ClienteBairro,
            CASE WHEN ClienteBairro IN ('ITINGA','FLORESTA')
            THEN 'SUL' END  AS [REGIÃO]
            FROM Clientes;


--> Exercicio 13
--> Mostre o nome do cliente e o tipo de movimentação, apenas para as movimentações de débito.

SELECT ClienteNome, MovimentoValor, MovimentoTipo , TipoMovimentoDescricao
            FROM Clientes, Contas, Movimentos, TipoMovimento
            WHERE Clientes.ClienteCodigo=Contas.ClienteCodigo
            AND Contas.ContaNumero=dbo.Movimentos.ContaNumero
            AND dbo.Movimentos.MovimentoTipo=dbo.TipoMovimento.TipoMovimentoCodigo
            AND TipoMovimento.TipoMovimentoCodigo=-1;
			
