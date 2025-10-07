-- Union
-- Luan Pascoal - 4° ADS

SELECT TOP 1 Descr, Preco FROM Produtos ORDER BY Preco DESC

SELECT TOP 5 NumPed, DataPed FROM Pedidos ORDER BY Frete

SELECT Nome, Cargo FROM Clientes
UNION
SELECT Nome, Cargo FROM Funcionarios
WHERE Pais = 'Reino Unido'

SELECT TOP 3 Nome, Sobrenome, Cargo, Salario FROM Funcionarios ORDER BY Salario DESC

SELECT TOP 1 Nome, Sobrenome FROM Funcionarios ORDER BY DataNasc 

SELECT TOP 5 * FROM Pedidos ORDER BY NumPed DESC

SELECT TOP 6 * FROM Pedidos WHERE YEAR(DataPed) = 1996 ORDER BY NumPed DESC

SELECT Nome, Cargo FROM Funcionarios WHERE Pais = 'EUA'
UNION
SELECT Contato, Cargo FROM Fornecedores WHERE Pais = 'EUA'

SELECT Nome, Contato, Pais FROM Clientes WHERE Pais = 'Brasil' 
UNION
SELECT Nome, Contato, Pais FROM Clientes WHERE Pais = 'Alemanha'

SELECT Nome, Contato, Cidade FROM Clientes WHERE Cidade = 'Madrid'
UNION
SELECT Nome, Contato, Cidade FROM Clientes WHERE Cidade = 'Paris'

SELECT Descr, Preco FROM Produtos WHERE CodCategoria = 2
UNION 
SELECT Descr, Preco FROM Produtos WHERE CodCategoria = 4

SELECT Nome, Cargo, Pais FROM Funcionarios WHERE Pais = 'Reino Unido'
UNION
SELECT Contato, Cargo, Pais FROM Fornecedores WHERE Pais = 'França'
