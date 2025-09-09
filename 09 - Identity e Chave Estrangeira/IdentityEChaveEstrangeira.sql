-- Autonumeracao e Chave Estrangeira
-- Luan Pascoal - 4° ADS

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

