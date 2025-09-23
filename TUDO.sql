CREATE DATABASE Concessionaria;
 
USE Concessionaria;
 
CREATE TABLE Veiculo (
	chassi VARCHAR(17) PRIMARY KEY,
	marca VARCHAR(10) NULL,
	modelo VARCHAR(20) NULL,
	ano_fabricacao INT NULL,
	ano_modelo INT NULL,
	combustivel VARCHAR(1) NULL,
)
 
ALTER TABLE Veiculo
ADD valor DECIMAL(10,2) NULL,
	motor VARCHAR(20) NULL
 
SELECT * FROM Veiculo
 
ALTER TABLE Veiculo
DROP COLUMN motor
 
CREATE INDEX VeiculoMarcaModelo 
ON Veiculo (marca, modelo)
 
CREATE INDEX VeiculoAnoFabricacao 
ON Veiculo (ano_fabricacao DESC)
 
DROP INDEX VeiculoMarcaModelo ON Veiculo
 
DROP TABLE Veiculo
 
USE master
DROP DATABASE Concessionaria



--===========================================================================


  
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
(1, 'José da Silva', 'Av. São Paulo, 34', 'Itu', 'SP', 'zesilva@yahoo.com.br', '24-02-1991')
GO

INSERT INTO Funcionario
VALUES
(2, 'João de Oliveira', 'Rua da Saúde, 138', 'Jundiaí', 'SP', 'jojo@hotmail.com','11-01-1988',750,'TI',1)
GO

INSERT INTO Funcionario
VALUES
(3, 'Ana Pimenta', 'Rua da Saúde, 11', 'Jundiaí', 'SP','pimentinha@hotmail.com', '01-01-1987',750,'TI',0),
(4, 'Mário Lopes', 'Rua Angélica, 143', 'Jundiaí', 'SP', 'mlopes@ hotmail.com','01-04-1985',750,'TI',0)
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
(6,'Ana Maria da Cunha','Av. São Paulo, 388','Itu','SP','aninhacunha@gmail.com','12-04-1988'),
(7,'Cláudia Regina Martins','Rua Holanda, 89','Campinas','SP','cregina@gmail.com','04-12-1988'),
(8,'Marcela Tatho','Rua Bélgica, 43','Campinas','SP','marctatho@hotmail.com','09-11-1987'),
(9,'Jorge Luís Rodrigues','Av. da Saudade, 1989','São Paulo','SP','jorgeluis@yahoo.com.br','05-05-1990'),
(10,'Ana Paulo Camargo','Rua Costa e Silva, 33','Jundiaí','SP','apcamargo@gmail.com','30-06-1991'),
(11,'Ivo Cunha','Av. Raio de Luz, 100','Campinas','SP','ivo@bol.com.br','11-04-1987'),
(12,'Carlos Luís de Souza','Rua Nicolau Coelho, 22','São Paulo','SP','cls@bol.com.br','30-04-1988')
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
cargo = 'TI',salario = 750 WHERE cidade = 'Jundiaí'
GO

--select nome, cargo from Funcionario

--select idFuncionario, email from Funcionario where estado = 'SP'

DELETE FROM Funcionario WHERE idFuncionario = 5

--select distinct cidade, estado from Funcionario where cargo = 'PC' 



--===========================================================================



SELECT salario * 1.3 FROM Funcionario

SELECT nome,
salario,
salario * 0.8 AS salario_desconto
FROM Funcionario
WHERE cidade = 'Campinas'

SELECT nome,
salario
FROM Funcionario
WHERE salario > 1500

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
WHERE cidade <> 'Sao Paulo' and salario >= 1000

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



--===========================================================================

  

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



--===========================================================================



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



--===========================================================================


	
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


	
--===========================================================================



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

SELECT cargo, COUNT(*) as quantidade FROM Funcionario GROUP BY cargo ORDER BY quantidade

SELECT cargo, COUNT(*) FROM Funcionario WHERE cargo IS NOT NULL GROUP BY cargo 

SELECT cargo, AVG(salario) AS Media_Salarios_Cargo FROM Funcionario GROUP BY cargo

SELECT cargo, SUM(salario) FROM Funcionario GROUP BY cargo HAVING SUM(salario) > 3000

SELECT cargo, SUM(salario) FROM Funcionario WHERE estado = 'SP' GROUP BY cargo 

UPDATE Funcionario SET ativo = 1 WHERE cidade IN ('Jundiaí', 'São Paulo')

UPDATE Funcionario SET ativo = 0 WHERE cidade NOT IN ('Jundiaí', 'São Paulo')

SELECT ativo, COUNT(*) FROM Funcionario GROUP BY ativo

SELECT cidade, SUM(salario) FROM Funcionario GROUP BY cidade

SELECT cidade, AVG(salario) FROM Funcionario WHERE salario IS NOT NULL GROUP BY cidade 

SELECT cargo, SUM(salario) AS soma, AVG(salario) AS media FROM Funcionario GROUP BY cargo HAVING SUM(salario) < 5000

SELECT cidade, cargo, SUM(salario) AS soma, AVG(salario) AS media FROM Funcionario GROUP BY cidade, cargo



--===========================================================================



SELECT TOP 4 nome FROM Funcionario
  
SELECT TOP 2 * FROM Funcionario WHERE cidade = 'Valinhos'
  
SELECT TOP 1 nome,
dataNascto
FROM Funcionario
ORDER BY dataNascto

SELECT TOP 2 cidade, COUNT (*) AS quantidade
FROM Funcionario GROUP BY cidade

SELECT TOP 2 cargo, COUNT (*) AS quantidade
FROM Funcionario WHERE cargo IS NOT NULL
GROUP BY cargo 

SELECT TOP 30 PERCENT * FROM Funcionario

SELECT TOP 6 nome, email FROM Funcionario

SELECT TOP 70 PERCENT idFuncionario, cargo, ativo FROM Funcionario

SELECT TOP 1 idFuncionario, salario FROM Funcionario 
WHERE salario IS NOT NULL ORDER BY salario

SELECT TOP 1 nome, salario FROM Funcionario ORDER BY salario DESC

SELECT TOP 1 nome, endereco FROM Funcionario ORDER BY idFuncionario

SELECT TOP 90 PERCENT * FROM Funcionario

SELECT TOP 1 * FROM Funcionario WHERE cidade = 'São Paulo'

SELECT TOP 20 PERCENT nome, endereco, cidade, estado
FROM Funcionario

SELECT TOP 2 * FROM Funcionario
WHERE YEAR(dataNascto) = 1988



--===========================================================================


CREATE DATABASE Pizzaria_Fatec

USE Pizzaria_Fatec

CREATE TABLE Cliente (
	Telefone VARCHAR(11) NULL,
	Celular VARCHAR(11) NOT NULL,
	Cidade VARCHAR(30) NOT NULL,
	Estado VARCHAR(2) NOT NULL,
	End_Numero INT NOT NULL,
	End_Bairro VARCHAR(30) NULL,
	End_CEP INT NOT NULL,
	End_Logradouro VARCHAR(30) NOT NULL,
	CPF VARCHAR(11) UNIQUE,
	ID_Usuario INT IDENTITY,
	Email VARCHAR(50) NOT NULL UNIQUE,
	Senha VARCHAR(30) NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	PRIMARY KEY (ID_Usuario),
)

CREATE TABLE Categoria (
	Id_Categoria INT IDENTITY,
	Nome_Categoria VARCHAR(30) NOT NULL,
	PRIMARY KEY (Id_Categoria),
)

CREATE TABLE Administrador (
	ID_Usuario INT IDENTITY,
	Email VARCHAR(50) NOT NULL UNIQUE,
	Senha VARCHAR(30) NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	PRIMARY KEY (ID_Usuario),
)

CREATE TABLE Pedido (
	Data_Hora DATETIME NOT NULL,
	Numero_Pedido INT IDENTITY PRIMARY KEY,
	Tipo_Pagamento VARCHAR(20) NOT NULL,
	ID_Usuario INT,
	FOREIGN KEY (ID_Usuario) REFERENCES Cliente (ID_Usuario) ON DELETE CASCADE
)

CREATE TABLE Produto (
	Nome VARCHAR(100) NOT NULL,
	ID_Produto INT IDENTITY,
	Preco DECIMAL(4,2) NOT NULL,
	Descricao VARCHAR(100) NULL,
	Imagem VARCHAR(50) NULL,
	Id_Categoria INT,
	PRIMARY KEY (ID_Produto),
	FOREIGN KEY (Id_Categoria) REFERENCES Categoria (Id_Categoria) ON DELETE NO ACTION,
)
-- NO ACTION: Não deixa excluir a categoria enquanto tiver produto cadastrado com a categoria


CREATE TABLE Itens_Pedido (
	Quantidade INT NOT NULL,
	Preco DECIMAL(4,2) NOT NULL,
	Numero_Pedido INT,
	ID_Produto INT,
	FOREIGN KEY (ID_Produto) REFERENCES Produto (ID_Produto) ON DELETE SET NULL,
	FOREIGN KEY (Numero_Pedido) REFERENCES Pedido (Numero_Pedido) ON DELETE CASCADE,
)







