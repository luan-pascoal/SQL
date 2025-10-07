

SELECT Nome, Cargo FROM Clientes
UNION
SELECT Nome, Cargo FROM Funcionarios

--

SELECT Nome, Cargo, 'clientes' AS Tipo FROM Clientes
UNION
SELECT Nome, Cargo, 'funcionários' AS Tipo FROM Funcionarios

--

SELECT Nome, Cargo, 'clientes' AS Tipo FROM Clientes
UNION
SELECT Nome, Cargo, 'funcionários' AS Tipo FROM Funcionarios
ORDER BY Tipo

-- 

SELECT Nome, Cargo, 'clientes' AS Tipo FROM Clientes
WHERE Pais = 'Brasil'
UNION
SELECT Nome, Cargo, 'funcionários' AS Tipo FROM Funcionarios
ORDER BY Tipo