-- Laboratorio de Banco de Dados
-- Luan Pascoal do Bem Silva

-- DML

CREATE DATABASE RecursosHumanos
GO

USE RecursosHumanos
GO

CREATE TABLE Funcionario ( 
idFuncionario INT NOT NULL, 
nome VARCHAR(50) NULL, 
endereco VARCHAR(100) NULL, 
cidade VARCHAR(50) NULL, 
estado CHAR(2) NULL, 
email VARCHAR(50) NULL UNIQUE, 
dataNascto DATE NULL, 
PRIMARY KEY(idFuncionario)
) 
GO

ALTER TABLE Funcionario 
ADD salario DECIMAL(7,2) NULL, 
cargos VARCHAR(2) NULL
GO

ALTER TABLE Funcionario 
DROP COLUMN cargos
GO

ALTER TABLE Funcionario ADD
cargo CHAR(2) NULL, 
ativo BIT
GO

CREATE INDEX FuncionarioNome 
ON Funcionario (nome) 
GO

CREATE INDEX FuncionarioEstado 
ON Funcionario (estado DESC)
GO

CREATE INDEX FuncionarioEstadoCidade 
ON Funcionario (estado DESC, cidade ASC) 
GO

INSERT INTO Funcionario
(idFuncionario, nome, endereco, cidade, estado, email, dataNascto)
VALUES
(1, 'Jos� da Silva', 'Av. S�o Paulo, 34', 'Itu', 'SP', 'zesilva@yahoo.com.br', '24-02-1991')
GO

INSERT INTO Funcionario
VALUES
(2, 'Jo�o de Oliveira', 'Rua da Sa�de, 138', 'Jundia�', 'SP', 'jojo@hotmail.com','11-01-1988',750,'TI',1)
GO

INSERT INTO Funcionario
VALUES
(3, 'Ana Pimenta', 'Rua da Sa�de, 11', 'Jundia�', 'SP','pimentinha@hotmail.com', '01-01-1987',750,'TI',0),
(4, 'M�rio Lopes', 'Rua Ang�lica, 143', 'Jundia�', 'SP', 'mlopes@ hotmail.com','01-04-1985',750,'TI',0)
GO

UPDATE Funcionario SET
cidade = 'Valinhos'
WHERE cidade = 'Itu'
GO

DELETE FROM Funcionario
WHERE idFuncionario = 2
GO

INSERT INTO Funcionario	 
(idFuncionario, nome, endereco, cidade, estado, email, dataNascto)
VALUES
(5, 'Carlos Dias','Av. Lapa, 121','Itu','SP','carlao@gmail.com','31-03-1990'),
(6,'Ana Maria da Cunha','Av. S�o Paulo, 388','Itu','SP','aninhacunha@gmail.com','12-04-1988'),
(7,'Cl�udia Regina Martins','Rua Holanda, 89','Campinas','SP','cregina@gmail.com','04-12-1988'),
(8,'Marcela Tatho','Rua B�lgica, 43','Campinas','SP','marctatho@hotmail.com','09-11-1987'),
(9,'Jorge Lu�s Rodrigues','Av. da Saudade, 1989','S�o Paulo','SP','jorgeluis@yahoo.com.br','05-05-1990'),
(10,'Ana Paulo Camargo','Rua Costa e Silva, 33','Jundia�','SP','apcamargo@gmail.com','30-06-1991'),
(11,'Ivo Cunha','Av. Raio de Luz, 100','Campinas','SP','ivo@bol.com.br','11-04-1987'),
(12,'Carlos Lu�s de Souza','Rua Nicolau Coelho, 22','S�o Paulo','SP','cls@bol.com.br','30-04-1988')
GO

UPDATE Funcionario SET
cidade = 'Valinhos' WHERE cidade = 'Itu'
GO

UPDATE Funcionario SET
cargo = 'AI', salario = 1100 WHERE cidade = 'Valinhos'
GO

UPDATE Funcionario SET
cargo = 'PC',salario = 1700 WHERE cidade = 'Campinas'
GO

UPDATE Funcionario SET
cargo = 'TI',salario = 750 WHERE cidade = 'Jundia�'
GO

--select nome, cargo from Funcionario

--select idFuncionario, email from Funcionario where estado = 'SP'

DELETE FROM Funcionario WHERE idFuncionario = 5

--select distinct cidade, estado from Funcionario where cargo = 'PC' 






-- OPERADORES



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


	