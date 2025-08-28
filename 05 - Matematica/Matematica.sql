-- LISTA FUNÇÕES MATEMATICAS
-- Luan Pascoal - 4° ADS

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

SELECT ABS(idFuncionario - 10) as absoluto FROM Funcionario ORDER BY absoluto DESC