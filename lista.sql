--LISTA FUNÇÃO DATA E HORA

SELECT nome, DAY(dataNascto), MONTH(dataNascto), YEAR(dataNascto) FROM Funcionario

SELECT DISTINCT DATENAME(MONTH, dataNascto) as Mes FROM Funcionario ORDER BY Mes

SELECT idFuncionario FROM Funcionario WHERE YEAR(dataNascto) = 1987

SELECT nome,DAY(dataNascto) FROM Funcionario WHERE MONTH(dataNascto) = 4 AND YEAR(dataNascto) = 1988

SELECT nome, DATEADD(MONTH,2, dataNascto) FROM Funcionario

SELECT nome, DATEDIFF(YEAR, dataNascto, GETDATE()) FROM Funcionario

SELECT idFuncionario, nome, dataNascto FROM Funcionario WHERE YEAR(dataNascto) = 1990 AND MONTH(dataNascto) BETWEEN 3 AND 5

SELECT nome, YEAR(dataNascto) FROM Funcionario WHERE estado = 'SP'

SELECT nome, dataNascto FROM Funcionario WHERE YEAR(dataNascto) < 1990

SELECT DISTINCT cidade, estado FROM Funcionario WHERE YEAR(dataNascto) > 1989

SELECT * FROM Funcionario WHERE YEAR(dataNascto) BETWEEN 1988 AND 1990

SELECT nome FROM Funcionario WHERE DAY(dataNascto) = 30

--LISTA FUNÇÕES MATEMATICAS

SELECT nome, salario + PI() FROM Funcionario 

SELECT SQRT(DAY(dataNascto)) FROM Funcionario WHERE cidade = 'Valinhos'

select * from Funcionario

SELECT LOG(MONTH(dataNascto)) FROM Funcionario WHERE YEAR(dataNascto) = 1990

SELECT nome, DAY(dataNascto) FROM Funcionario WHERE POWER(DAY(dataNascto),3) >= 1000

SELECT ROUND(salario * 1.155,0) FROM Funcionario WHERE salario > 1000

SELECT ABS(1500 - salario) FROM Funcionario 

SELECT idFuncionario, SQRT(idFuncionario) FROM Funcionario WHERE dataNascto < '01-04-1989'

SELECT nome, ROUND(salario * 0.65, 1) FROM Funcionario

SELECT LOG(idFuncionario) FROM Funcionario

SELECT SQRT(idFuncionario) FROM Funcionario

SELECT POWER(idFuncionario,2) FROM Funcionario

SELECT ABS(idFuncionario - 10) as absoluteCinema FROM Funcionario ORDER BY absoluteCinema DESC

--LISTA STRING

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
