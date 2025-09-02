-- LISTA AGREGAÇÃO
-- Luan Pascoal - 4° ADS

SELECT MAX(salario), MIN(salario) FROM Funcionario WHERE estado = 'SP'

SELECT SUM(salario) FROM FUNCIONARIO WHERE nome LIKE '%Cunha%'

SELECT AVG(salario) FROM Funcionario WHERE email LIKE '%yahoo%'

SELECT COUNT(*) FROM Funcionario WHERE email NOT LIKE '%br'

SELECT MIN(dataNascto) FROM Funcionario

SELECT MAX(dataNascto) AS Maior_Nascimento FROM Funcionario

SELECT COUNT(*) AS Quantidade_de_Valinhos FROM Funcionario WHERE cidade = 'Valinhos'

SELECT SUM(salario) FROM Funcionario WHERE cidade = 'Campinas'

SELECT AVG(salario) FROM Funcionario WHERE cidade = 'São Paulo'

SELECT SUM(salario) FROM Funcionario WHERE nome LIKE 'Ana%'

SELECT COUNT(*) FROM Funcionario WHERE nome LIKE '%Luís%'

SELECT MIN(salario), MAX(salario) FROM Funcionario WHERE endereco LIKE '%Av. São Paulo%'

SELECT cargo, COUNT(*) FROM Funcionario GROUP BY cargo ORDER BY quantidade

SELECT cargo, COUNT(*) FROM Funcionario GROUP BY cargo WHERE cargo IS NOT NULL

SELECT cargo, AVG(salario) AS Media_Salarios_Cargo FROM Funcionario GROUP BY cargo

SELECT cargo, SUM(salario) FROM Funcionario GROUP BY cargo WHERE cargo > 3000

SELECT cargo, SUM(salario) FROM Funcionario GROUP BY cargo WHERE estado = 'SP'

UPDATE Funcionario SET ativo = 1 WHERE cidade IN ('Jundiaí', 'São Paulo')

UPDATE Funcionario SET ativo = 0 WHERE cidade NOT IN ('Jundiaí', 'São Paulo')

SELECT ativo, COUNT(*) FROM Funcionario GROUP BY ativo

SELECT cidade, SUM(salario) FROM Funcionario GROUP BY cidade

SELECT cidade, AVG(salario) FROM Funcionario GROUP BY cidade WHERE salario IS NOT NULL

SELECT cargo, SUM(salario) AS soma, AVG(salario) AS media FROM Funcionario GROUP BY cargo WHERE soma < 5000

SELECT cidade, cargo, SUM(salario) AS soma, AVG(salario) AS media FROM Funcionario GROUP BY cidade, cargo

