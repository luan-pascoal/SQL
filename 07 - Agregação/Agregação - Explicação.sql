
SELECT COUNT(*) FROM Funcionario

SELECT COUNT(DISTINCT cidade) FROM Funcionario

SELECT SUM(salario) FROM Funcionario

SELECT AVG(salario) FROM Funcionario

SELECT MAX(salario) FROM Funcionario

SELECT MIN(salario) FROM Funcionario


SELECT cidade, COUNT(*) AS QtdadeFuncCidade FROM Funcionario GROUP BY cidade

SELECT cidade, COUNT(*) AS QtdadeFuncCidade FROM Funcionario GROUP BY cidade HAVING COUNT(*) > 2
