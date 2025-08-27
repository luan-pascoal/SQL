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