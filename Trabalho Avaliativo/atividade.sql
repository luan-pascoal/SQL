SELECT 
	dataNascto,
    CONVERT(VARCHAR, dataNascto, 103) as DataConvertida,
    ISDATE(CONVERT(VARCHAR, dataNascto, 103)) AS DataValida -- formato DD/MM/YYYY
FROM 
    Funcionario;


SELECT TAN(idFuncionario) FROM Funcionario

SELECT nome, (cidade + SPACE(1) + estado) as Cidades FROM Funcionario

SELECT VARP(salario) AS variancia_populacional FROM Funcionario WHERE idFuncionario <= 3;
