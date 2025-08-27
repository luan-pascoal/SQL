-- LISTA FUNÇÃO DATA E HORA
-- Luan Pascoal - 4° ADS

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

SELECT * FROM Funcionario WHERE YEAR(dataNascto) = 1988 OR YEAR(dataNascto) = 1990

SELECT nome FROM Funcionario WHERE DAY(dataNascto) = 30