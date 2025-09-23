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



===========================================================================

INSERT INTO Funcionario

(idFuncionario, nome, endereco, cidade, estado, email, dataNascto)

VALUES

(1, 'José da Silva', 'Av. São Paulo, 34', 'Itu', 'SP', 'zesilva@yahoo.com.br', '24-02-1991')



INSERT INTO Funcionario

VALUES

(2, 'João de Oliveira', 'Rua da Saúde, 138', 'Jundiaí', 'SP', 'jojo@hotmail.com','11-01-1988',750,'TI',1)



INSERT INTO Funcionario

VALUES

(3, 'Ana Pimenta', 'Rua da Saúde, 11', 'Jundiaí', 'SP','pimentinha@hotmail.com', '01-01-1987',750,'TI',0),

(4, 'Mário Lopes', 'Rua Angélica, 143', 'Jundiaí', 'SP', 'mlopes@ hotmail.com','01-04-1985',750,'TI',0)



UPDATE Funcionario SET

cidade = 'Valinhos'

WHERE cidade = 'Itu'



DELETE FROM Funcionario

WHERE idFuncionario = 2



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



UPDATE Funcionario SET

cidade = 'Valinhos' WHERE cidade = 'Itu'



UPDATE Funcionario SET

cargo = 'AI',salario = 1100 WHERE cidade = 'Valinhos'



UPDATE Funcionario SET

cargo = 'PC',salario = 1700 WHERE cidade = 'Campinas'



UPDATE Funcionario SET

cargo = 'TI',salario = 750 WHERE cidade = 'Jundiaí'



--select nome, cargo from Funcionario



--select idFuncionario, email from Funcionario where estado = 'SP'



delete from Funcionario where idFuncionario = 5



--select distinct cidade, estado from Funcionario where cargo = 'PC' 



===========================================================================



SELECT salario \*1.3 FROM Funcionario



SELECT nome,

salario,

salario\*0.8 AS salario\_desconto

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

WHERE nome LIKE '\_\_r%'



===========================================================================

SELECT nome,

DAY (dataNascto) as Dia,

MONTH (dataNascto)as Mês,

YEAR (dataNascto) as Ano

FROM Funcionario



SELECT DATENAME (MONTH, dataNascto)

FROM Funcionario



SELECT idFuncionario,

nome

FROM Funcionario

WHERE YEAR (dataNascto) = 1987



SELECT nome,

DAY (dataNascto)

FROM Funcionario

WHERE MONTH (dataNascto) = 4 AND YEAR (dataNascto) = 1988



SELECT nome, 

DATEADD (MONTH, 2, dataNascto)

FROM Funcionario



SELECT nome,

DATEDIFF (YEAR, dataNascto, GETDATE()) as idade

FROM Funcionario



SELECT idFuncionario,

nome,

YEAR (dataNascto) as anoNascto

FROM Funcionario

WHERE MONTH (dataNascto) BETWEEN 3 AND 5 AND YEAR (dataNascto) = 1990



SELECT nome,

(dataNascto)

FROM Funcionario

WHERE estado = 'SP'



SELECT nome,

(dataNascto)

FROM Funcionario

WHERE YEAR (dataNascto) < 1990



SELECT DISTINCT cidade,

estado

FROM Funcionario

WHERE YEAR (dataNascto) > 1989



SELECT \*

FROM Funcionario

WHERE YEAR (dataNascto) = 1988 OR YEAR (dataNascto) = 1990



SELECT nome

FROM Funcionario

WHERE DAY (dataNascto) = 30



===========================================================================



SELECT nome,

salario + PI() AS salario\_mais\_pi

FROM Funcionario



SELECT SQRT (DAY (dataNascto)) AS raiz\_dia\_nascto

FROM Funcionario

WHERE cidade = 'valinhos'



SELECT LOG (MONTH (dataNascto)) AS logaritimo\_mes\_nascto

FROM Funcionario

WHERE YEAR (dataNascto) = 1990



SELECT nome,

(dataNascto)

FROM Funcionario

WHERE POWER (DAY (dataNascto), 3) >= 1000



SELECT ROUND (salario\*1.155, 0)

FROM Funcionario

WHERE salario > 1000



SELECT ABS (1500 - salario)

FROM Funcionario



SELECT idFuncionario,

SQRT (idFuncionario)

FROM Funcionario

WHERE (dataNascto) < '01-04-1989'



SELECT nome, 

ROUND (salario \*0.65, 1)

FROM Funcionario



SELECT LOG (idFuncionario) AS log\_idFunc

FROM Funcionario



SELECT SQRT (idFuncionario) AS raiz\_idFunc

FROM Funcionario



SELECT POWER (idFuncionario, 2) AS idFunc\_aoQuadrado

FROM Funcionario



SELECT ABS (idFuncionario - 10) AS absolute 

FROM Funcionario

ORDER BY absolute DESC



===========================================================================

SELECT UPPER (nome) AS num\_carac\_mes

FROM Funcionario



SELECT REPLACE (nome,' ','-') AS nome\_com\_traço

FROM Funcionario



SELECT LEFT (nome, 3) AS esquerda,

RIGHT (nome,3) AS direita

FROM Funcionario



SELECT SQRT (LEN (nome)) AS raizquad\_numcarc\_nome

FROM Funcionario



SELECT SUBSTRING (cidade, 3, 5) 

FROM Funcionario



SELECT REPLACE (nome,' ', '') AS nome\_sem\_espaço

FROM Funcionario



SELECT ASCII (idFuncionario) AS idFuncCampinas\_emAscii

FROM Funcionario

WHERE cidade = 'Campinas'



SELECT ASCII (nome) 

FROM Funcionario

WHERE DAY(dataNascto) > 20



SELECT RTRIM (LEFT(cidade,4))

FROM Funcionario



SELECT LTRIM (RIGHT(cidade,6))

FROM Funcionario



SELECT DISTINCT LOWER (cidade) AS cidades\_minusculo

FROM Funcionario



===========================================================================



SELECT MAX (salario) AS maior\_salario, MIN (salario) AS menor\_salario

FROM Funcionario

WHERE estado = 'SP'



SELECT SUM (salario)

FROM Funcionario

WHERE nome LIKE '%Cunha%'



SELECT AVG(salario)

FROM Funcionario

WHERE email LIKE '%yahoo%'



SELECT COUNT (\*) 

FROM Funcionario

WHERE email NOT LIKE '%br'



SELECT MIN (dataNascto) AS menor\_dataNascto

FROM Funcionario



SELECT MAX(dataNascto) AS Maior\_Nascimento

FROM Funcionario



SELECT COUNT (\*) AS Quantidade\_De\_Valinhos

FROM Funcionario

WHERE cidade = 'Valinhos'



SELECT SUM (salario) AS soma\_salario\_campinas

FROM Funcionario

WHERE cidade = 'Campinas'



SELECT AVG (salario) AS media\_salario\_saoPaulo

FROM Funcionario

WHERE cidade = 'São Paulo'



SELECT SUM (salario) 

FROM Funcionario

WHERE nome LIKE 'Ana%'



SELECT COUNT (\*) 

FROM Funcionario

WHERE nome LIKE '%Luís%'



SELECT MIN (salario),

MAX (salario)

FROM Funcionario

WHERE endereco LIKE '%Av. São Paulo%'



SELECT cargo, COUNT(\*) AS num\_func

FROM Funcionario

GROUP BY cargo 

ORDER BY num\_func ASC



SELECT cargo, COUNT(\*) AS qtd\_func

FROM Funcionario

GROUP BY cargo

HAVING cargo IS NOT NULL



SELECT cargo, AVG (salario) AS Media\_Salarios\_Cargo

FROM Funcionario

GROUP BY cargo



SELECT cargo, SUM(salario) 

FROM Funcionario

GROUP BY cargo

HAVING SUM(salario) > 3000



SELECT cargo, SUM (salario)

FROM Funcionario

WHERE estado = 'SP'

GROUP BY cargo 



UPDATE Funcionario

SET ativo = 1

WHERE cidade = 'Jundiaí' OR cidade = 'São Paulo'



UPDATE Funcionario

SET ativo = 0

WHERE cidade NOT IN ('Jundiaí', 'São Paulo')



SELECT ativo,

COUNT (\*) AS qtd

FROM Funcionario

GROUP BY ativo



SELECT cidade,

SUM (salario)

FROM Funcionario

GROUP BY cidade



SELECT cidade,

AVG (salario)

FROM Funcionario

WHERE salario IS NOT NULL

GROUP BY cidade



SELECT cargo,

SUM (salario) AS soma,

AVG (salario) AS media

FROM Funcionario

GROUP BY cargo

HAVING SUM(salario) < 5000



SELECT cidade,

cargo,

SUM (salario),

AVG (salario)

FROM Funcionario

GROUP BY cidade, cargo



===========================================================================



SELECT TOP 4 nome

FROM Funcionario

ORDER BY idFuncionario ASC



SELECT TOP 2 \*

FROM Funcionario

WHERE cidade = 'Valinhos'



SELECT TOP 1 nome,

dataNascto

FROM Funcionario

ORDER BY dataNascto ASC



SELECT TOP 2 cidade, COUNT (\*) AS qtdFunc

FROM Funcionario

GROUP BY cidade



SELECT TOP 2 cargo, COUNT (\*) AS qtdFunc

FROM Funcionario

WHERE cargo IS NOT NULL

GROUP BY cargo



SELECT TOP 30 PERCENT\*

FROM Funcionario



SELECT TOP 6 nome, email

FROM Funcionario



SELECT TOP 70 PERCENT idFuncionario,

cargo,

ativo

FROM Funcionario



SELECT TOP 1 idFuncionario,

salario

FROM Funcionario 

WHERE salario IS NOT NULL

ORDER BY salario ASC



SELECT TOP 1 nome,

salario

FROM Funcionario

ORDER BY salario DESC



SELECT TOP 1 nome,

endereco

FROM Funcionario

ORDER BY idFuncionario ASC



SELECT TOP 90 PERCENT \*

FROM Funcionario



SELECT TOP 1 \*

FROM Funcionario

WHERE cidade = 'São Paulo'



SELECT TOP 20 PERCENT

nome,

endereco,

cidade,

estado

FROM Funcionario



SELECT TOP 2 \*

FROM Funcionario

WHERE YEAR(dataNascto) = 1988



===========================================================================



CREATE DATABASE Pizzaria\_Fatec

&nbsp;

USE Pizzaria\_Fatec

&nbsp;

CREATE TABLE Cliente (

&nbsp;	Telefone VARCHAR(11) NULL,

&nbsp;	Celular VARCHAR(11) NOT NULL,

&nbsp;	Cidade VARCHAR(30) NOT NULL,

&nbsp;	Estado VARCHAR(2) NOT NULL,

&nbsp;	End\_Numero INT NOT NULL,

&nbsp;	End\_Bairro VARCHAR(30) NULL,

&nbsp;	End\_CEP INT NOT NULL,

&nbsp;	End\_Logradouro VARCHAR(30) NOT NULL,

&nbsp;	CPF VARCHAR(11) UNIQUE,

&nbsp;	ID\_Usuario INT IDENTITY,

&nbsp;	Email VARCHAR(50) NOT NULL UNIQUE,

&nbsp;	Senha VARCHAR(30) NOT NULL,

&nbsp;	Nome VARCHAR(100) NOT NULL,

&nbsp;	PRIMARY KEY (ID\_Usuario),

)

&nbsp;

CREATE TABLE Categoria (

&nbsp;	Id\_Categoria INT IDENTITY,

&nbsp;	Nome\_Categoria VARCHAR(30) NOT NULL,

&nbsp;	PRIMARY KEY (Id\_Categoria),

)

&nbsp;

CREATE TABLE Administrador (

&nbsp;	ID\_Usuario INT IDENTITY,

&nbsp;	Email VARCHAR(50) NOT NULL UNIQUE,

&nbsp;	Senha VARCHAR(30) NOT NULL,

&nbsp;	Nome VARCHAR(100) NOT NULL,

&nbsp;	PRIMARY KEY (ID\_Usuario),

)

&nbsp;

CREATE TABLE Pedido (

&nbsp;	Data\_Hora DATETIME NOT NULL,

&nbsp;	Numero\_Pedido INT IDENTITY PRIMARY KEY,

&nbsp;	Tipo\_Pagamento VARCHAR(20) NOT NULL,

&nbsp;	ID\_Usuario INT,

&nbsp;	FOREIGN KEY (ID\_Usuario) REFERENCES Cliente (ID\_Usuario) ON DELETE CASCADE

)

&nbsp;

CREATE TABLE Produto (

&nbsp;	Nome VARCHAR(100) NOT NULL,

&nbsp;	ID\_Produto INT IDENTITY,

&nbsp;	Preco DECIMAL(4,2) NOT NULL,

&nbsp;	Descricao VARCHAR(100) NULL,

&nbsp;	Imagem VARCHAR(50) NULL,

&nbsp;	Id\_Categoria INT,

&nbsp;	PRIMARY KEY (ID\_Produto),

&nbsp;	FOREIGN KEY (Id\_Categoria) REFERENCES Categoria (Id\_Categoria) ON DELETE NO ACTION,

)

-- NO ACTION: Não deixa excluir a categoria enquanto tiver produto cadastrado com a categoria

&nbsp;

&nbsp;

CREATE TABLE Itens\_Pedido (

&nbsp;	Quantidade INT NOT NULL,

&nbsp;	Preco DECIMAL(4,2) NOT NULL,

&nbsp;	Numero\_Pedido INT,

&nbsp;	ID\_Produto INT,

&nbsp;	FOREIGN KEY (ID\_Produto) REFERENCES Produto (ID\_Produto) ON DELETE SET NULL,

&nbsp;	FOREIGN KEY (Numero\_Pedido) REFERENCES Pedido (Numero\_Pedido) ON DELETE CASCADE,

)





