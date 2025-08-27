-- LISTA STRING
-- Luan Pascoal - 4° ADS

SELECT UPPER(nome) FROM Funcionario

SELECT DISTINCT DATENAME(MONTH, dataNascto),  LEN(DATENAME(MONTH,dataNascto)) FROM Funcionario

SELECT REPLACE(nome,' ', '-') FROM Funcionario

SELECT LEFT(nome,3), RIGHT(nome,3) FROM Funcionario

SELECT SQRT(LEN(nome)) FROM Funcionario

SELECT DISTINCT SUBSTRING(cidade,3,5) FROM Funcionario

SELECT REPLACE(nome, ' ','') FROM Funcionario

SELECT ASCII(idFuncionario) FROM Funcionario WHERE cidade = 'Campinas'

SELECT ASCII(nome) FROM Funcionario WHERE DAY(dataNascto) > 20

SELECT RTRIM(LEFT(cidade,4)) FROM Funcionario

SELECT LTRIM(RIGHT(cidade,6)) FROM Funcionario

SELECT DISTINCT LOWER(cidade) FROM Funcionario
