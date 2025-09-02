-- LISTA AGREGAÇÃO
-- Luan Pascoal - 4° ADS

SELECT MAX(salario), MIN(salario) FROM Funcionario WHERE estado = 'SP'

SELECT SUM(salario) FROM FUNCIONARIO WHERE nome LIKE '%Cunha%'

SELECT AVG(salario) FROM Funcionario WHERE email LIKE '%yahoo%'
