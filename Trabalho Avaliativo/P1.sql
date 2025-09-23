CREATE DATABASE JundBio;
 
GO
USE JundBio;
 
CREATE TABLE USUARIO (
    Id INTEGER IDENTITY PRIMARY KEY,
    Nome VARCHAR(128) NOT NULL,
    Tipo VARCHAR(10) NOT NULL DEFAULT 'COMUM',
    Email VARCHAR(256) NOT NULL,
    Senha VARCHAR(64) NOT NULL,
    Pontos INTEGER NOT NULL DEFAULT 0,
    Ativo TINYINT NOT NULL DEFAULT 1,
    Foto VARCHAR(256),
    Biografia VARCHAR(256),
    Ocupacao VARCHAR(64),
    DataRegistro DATETIME,
    UltimoLogin DATETIME
);
 
CREATE TABLE ESPECIE (
    Id INTEGER IDENTITY PRIMARY KEY,
    NomeComum VARCHAR(128) DEFAULT 'Desconhecido',
    NomeCientifico VARCHAR(128),
    Familia VARCHAR(128),
    Classificacao VARCHAR(128),
    Descricao VARCHAR(512),
    StatusExtincao VARCHAR(64),
    Invasor TINYINT NOT NULL DEFAULT 0,
    Tipo VARCHAR(5)
);
 
CREATE TABLE LOCALIZACAO (
    Id INTEGER IDENTITY PRIMARY KEY,
    Latitude FLOAT NOT NULL,
    Longitude FLOAT NOT NULL,
    Descricao VARCHAR(256)
);
 
CREATE TABLE ESPECIALISTA (
    Id_Usuario INTEGER PRIMARY KEY,
    Registro VARCHAR(11) NOT NULL,
    Area VARCHAR(128) NOT NULL,
    Lattes VARCHAR(20) NOT NULL,
    FOREIGN KEY (Id_Usuario) REFERENCES USUARIO(Id) ON DELETE CASCADE
);
 
CREATE TABLE POSTAGEM (
    Id INTEGER IDENTITY PRIMARY KEY,
    Tipo VARCHAR(32) NOT NULL,
    Texto VARCHAR(1024),
    Status VARCHAR(16) NOT NULL DEFAULT 'PENDENTE',
    DataHora_Envio DATETIME,
    Id_Usuario INTEGER,
    FOREIGN KEY (Id_Usuario) REFERENCES USUARIO(Id) ON DELETE SET NULL
);
 
CREATE TABLE CURTIDA (
    Id_Usuario INTEGER,
    Id_Postagem INTEGER,
    DataHora DATETIME,
    PRIMARY KEY(Id_Usuario, Id_Postagem),
    FOREIGN KEY (Id_Usuario) REFERENCES USUARIO(Id) ON DELETE CASCADE,
    FOREIGN KEY (Id_Postagem) REFERENCES POSTAGEM(Id) ON DELETE CASCADE
);
 
CREATE TABLE FOTO (
    Id INTEGER IDENTITY PRIMARY KEY,
    URL VARCHAR(256) NOT NULL,
    Descricao VARCHAR(256),
    DataHora_Foto DATETIME,
    Status VARCHAR(16) NOT NULL DEFAULT 'PENDENTE',
    Id_Especie INTEGER,
    Id_Localizacao INTEGER,
    Id_Postagem INTEGER,
    FOREIGN KEY (Id_Especie) REFERENCES ESPECIE(Id) ON DELETE SET NULL,
    FOREIGN KEY (Id_Localizacao) REFERENCES LOCALIZACAO(Id) ON DELETE SET NULL,
    FOREIGN KEY (Id_Postagem) REFERENCES POSTAGEM(Id) ON DELETE NO ACTION
);
 
CREATE TABLE HISTORICO (
    Id_Postagem INTEGER,
    Id_Especialista INTEGER,
    DataHora DATETIME,
    Acao VARCHAR(128),
    PRIMARY KEY (Id_Postagem, Id_Especialista),
    FOREIGN KEY (Id_Postagem) REFERENCES POSTAGEM(Id) ON DELETE CASCADE,
    FOREIGN KEY (Id_Especialista) REFERENCES ESPECIALISTA(Id_Usuario) ON DELETE CASCADE
);
 
 CREATE TABLE COMENTARIO (
    Id INTEGER IDENTITY PRIMARY KEY,
    Texto VARCHAR(512),
    DataHora DATETIME,
    Id_Usuario INTEGER,
    Id_Postagem INTEGER,
    FOREIGN KEY (Id_Usuario) REFERENCES USUARIO(Id) ON DELETE CASCADE,
    FOREIGN KEY (Id_Postagem) REFERENCES POSTAGEM(Id) ON DELETE CASCADE
);

INSERT INTO USUARIO (Nome, Tipo, Email, Senha, Pontos, Ativo, DataRegistro) VALUES 
('João Silva', 'COMUM', 'joao.silva@jundbio.com', '$2y$10$tyFfjtEPqBQRuMxN4bTXEOwIhW7Dw.zMsKcbAj2Z7SHyUgVnbc0Sq', 120, 1,'2025-05-01T10:23:45'), 
('Maria Oliveira', 'ADMIN', 'maria.oliveira@jundbio.com', '$2y$10$EeQnB7vfdQiVBtzsdFDYne.mBKJP42ji795xqxnP/DkJxSAUv1x1W', 0, 1,'2025-05-15T18:12:09'), 
('Carlos Souza', 'COMUM', 'carlos.souza@jundbio.com', '$2y$10$CPTZypHi5LOpSWBKnPZAFOK0pDBnl4wqTHo//T8Mdzjlsju8H1TD.', 45, 1,'2025-06-01T09:45:30'), 
('Fernanda Lima', 'COMUM', 'fernanda.lima@jundbio.com', '$2y$10$pFmhk7nHOlplsTAqeYXaXerm3Rx36HH0Vz5kfcjgFWiIOnYm7h1oa', 300, 1,'2025-06-15T14:17:58'), 
('Ricardo Almeida', 'ADMIN', 'ricardo.almeida@jundbio.com', '$2y$10$u6uO6WIe5mgWDrM8csNdUOGUC9tPtEG3nk9We7PPPIulFsfXKv0p2', 15, 1,'2025-07-01T22:33:11'), 
('Ana Paula', 'COMUM', 'ana.paula@jundbio.com', '$2y$10$tZPlVfOYPcyWWM/wzI9scOxcp/gl0/U0q9kWlnTZRhjFsDpFmMYBe', 210, 1,'2025-07-15T08:50:02'), 
('Lucas Martins', 'COMUM', 'lucas.martins@jundbio.com', '$2y$10$YRlLoH8/hitdW78RPTb62.H9dbdsHGT4YHiQ2JohztQRUY5cLjXC6', 5, 0,'2025-08-01T16:41:37'), 
('Juliana Rocha', 'ADMIN', 'juliana.rocha@jundbio.com', '$2y$10$SrBirBGyr.ZUpHGuCqJv9uyChJ4uEfT0NX2vUUe1N.aau4t6kbipS', 0, 1,'2025-08-15T12:29:55'), 
('Pedro Henrique', 'COMUM', 'pedro.henrique@jundbio.com', '$2y$10$lOfEnb2YonajzFYbBRvDMuW0EmORYyKfcoab/bk4aGYBBMEdXplw2', 87, 1,'2025-09-01T20:14:16'), 
('Camila Ferreira', 'COMUM', 'camila.ferreira@jundbio.com', '$2y$10$6nTkQbscwvqkXlNSk1I9uunEAO.s2FZBewgifJSkAWhmHiNGrKewG', 162, 1,'2025-09-10T07:55:42'),
('João Assis', 'COMUM', 'joao.assis@jundbio.com', '$2y$10$tyFfjtEPqBQRuMxN4bTXEOwIhW7Dw.zMsKcbAj2Z7SHyUgVnbc0Sq', 13, 1,'2025-05-05T17:49:45'), 
('Luan Tega', 'COMUM', 'luan.tega@jundbio.com', '$2y$10$EeQnB7vfdQiVBtzsdFDYne.mBKJP42ji795xqxnP/DkJxSAUv1x1W', 98, 1,'2025-05-20T08:19:51'), 
('Eric Lima', 'COMUM', 'eric.lima@jundbio.com', '$2y$10$CPTZypHi5LOpSWBKnPZAFOK0pDBnl4wqTHo//T8Mdzjlsju8H1TD.', 981, 1,'2025-06-01T01:31:30');

INSERT INTO POSTAGEM (Tipo, Texto, DataHora_Envio, Id_Usuario) VALUES
('AVISTAMENTO', 'Hoje avistei um grupo de aves migratórias no parque da cidade.', '2025-08-25T09:15:00', 1),
('AVISTAMENTO', 'Observei um cervo vermelho próximo à trilha do bosque esta manhã.', '2025-08-28T11:30:00', 1),
('AVISTAMENTO', 'Registrei um ninho de gaviões no topo de uma árvore alta.', '2025-08-30T14:45:00', 1),
('ATROPELAMENTO', 'Presenciei um tamanduá-bandeira atropelado na estrada rural.', '2025-09-01T10:00:00', 7),
('AVISTAMENTO', 'Vi um casal de capivaras às margens do rio.', '2025-09-04T16:20:00', 10),
('AVISTAMENTO', 'Avistei um lobo-guará perto da estrada durante o fim de semana.', '2025-09-06T18:05:00', 12),
('ATROPELAMENTO', 'Um veado foi atropelado próximo à trilha da floresta.', '2025-09-08T08:40:00', 3),
('ATROPELAMENTO', 'Acidente envolvendo um tamanduá-mirim na estrada, todos devem redobrar atenção.', '2025-09-11T12:10:00', 5),
('ATROPELAMENTO', 'Vi um capivara adulto atropelada na ponte do rio.', '2025-09-15T13:50:00', 11),
('AVISTAMENTO', 'Hoje observei uma família de quatis atravessando a trilha da mata.', '2025-09-18T15:25:00', 8);



-- Consulta 1: Listar os usuários cadastrados nos últimos 6 meses, mostrando nome, e-mail e data de registro, para monitorar os novos cadastros recentes no sistema.
SELECT Nome, Email, DataRegistro
FROM USUARIO
WHERE DataRegistro >= DATEADD(MONTH, -6, GETDATE())

-- Consulta 2: Exibir os cinco usuários com maior quantidade de pontos no sistema, permitindo identificar os usuários mais ativos ou premiados.
SELECT TOP 5 Nome, Pontos
FROM USUARIO
ORDER BY Pontos DESC

-- Consulta 3: Listar as postagens de avistamentos mais recentes no período de 20 dias, mostrando tipo, texto, data/hora de envio e o id do usuário.
SELECT Tipo, Texto, DataHora_Envio, Id_Usuario
FROM POSTAGEM
WHERE Tipo = 'AVISTAMENTO' AND DataHora_Envio >= DATEADD(DAY, -20, GETDATE());

-- Consulta 4: Identificar o usuário com o maior número de postagens, mostrando o nome e a quantidade de posts.
SELECT Id_Usuario,
(SELECT nome FROM USUARIO WHERE Id = Id_Usuario) AS Nome,
COUNT(*) as Quantidade FROM POSTAGEM 
WHERE Id_Usuario IS NOT NULL 
GROUP BY Id_Usuario 
ORDER BY Quantidade DESC

-- Consulta 5: Listar todas as postagens que mencionam a palavra “capivara”, mostrando o autor e a data/hora da postagem.
 SELECT Id as Id_Postagem, (SELECT nome FROM USUARIO WHERE Id = Id_Usuario) as Nome, DataHora_Envio, Texto 
 FROM POSTAGEM
 WHERE LOWER (Texto) LIKE '%capivara%'

-- Consulta 6: Contar o número de usuários cadastrados por mês/ano, permitindo analisar padrões sazonais de registro no site.
SELECT 
CONCAT(YEAR(DataRegistro) , '-' , MONTH(DataRegistro)) as Mes,
COUNT(*) AS QuantidadeCadastros
FROM USUARIO
GROUP BY YEAR(DataRegistro), MONTH(DataRegistro)
ORDER BY YEAR(DataRegistro) DESC, MONTH(DataRegistro) DESC
