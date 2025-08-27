-- OPERADORES
-- Luan Pascoal - 4° ADS

SELECT salario *1.3 FROM Funcionario

SELECT nome,
salario,
salario*0.8 AS salario_desconto
FROM Funcionario
WHERE cidade = 'Campinas'

SELECT nome,
salario
FROM Funcionario
WHERE salario>1500

SELECT nome,
cidade
FROM Funcionario
WHERE NOT cidade = 'Valinhos'

SELECT idFuncionario,
cidade
FROM Funcionario
WHERE cidade = 'Valinhos' or cidade = 'Campinas'

SELECT idFuncionario,
cargo,
salario
FROM Funcionario
WHERE cidade <> 'Sao Paulo' and salario >=1000

SELECT nome
FROM Funcionario
WHERE cargo IS NULL

SELECT nome,
salario
FROM Funcionario
WHERE salario BETWEEN 500 AND 1500

SELECT nome
FROM Funcionario
WHERE email LIKE '%hotmail%'

SELECT nome,
email
FROM Funcionario
WHERE email LIKE '%br'
ORDER BY nome

SELECT nome,
email
FROM Funcionario
WHERE email NOT LIKE '%com'

SELECT nome, 
email
FROM Funcionario
WHERE nome LIKE '__r%'
