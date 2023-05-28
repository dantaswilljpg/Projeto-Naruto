CREATE DATABASE naruto_projeto_individual;


USE naruto_projeto_individual;

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
   fkpersonagem INT ,
   FOREIGN KEY (fkpersonagem) REFERENCES Personagem (idPersonagem)
);



CREATE TABLE Pontuacao (
	idPontuacao INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT, 
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
	pontuacao INT,
    percentualPontuacao FLOAT
);



CREATE TABLE Personagem(
idPersonagem INT PRIMARY KEY AUTO_INCREMENT,
nomePersonagem VARCHAR(45)
);

INSERT INTO Personagem VALUES
(NULL,'Uzumaki Naruto'),
(NULL,'Uchiha Sasuke'),
(NULL,'Hatake Kakashi'),
(NULL,'Gaara Deserto'),
(NULL,'Neji Hyugaa'),
(NULL,'Rock Lee'),
(NULL,'Gaara Deserto'),
(NULL,'Sakura'),
(NULL,'Hinata Hyugaa');   

SELECT * FROM Usuario;
SELECT * FROM  Pontuacao;
SELECT *FROM Personagem;



-- SELECT DE MÉDIA DO QUIZ E SOMA
SELECT fkUsuario, ROUND(AVG(pontuacao), 2) AS Média, ROUND(SUM(pontuacao), 2) AS Soma FROM Pontuacao GROUP BY fkUsuario;




-- SELECT DE MENOR PERCENTUAL DO QUIZ E MAIOR PERCENTUAL
SELECT fkUsuario,  MAX(percentualPontuacao) AS MaiorPercentual FROM Pontuacao GROUP BY fkUsuario;





-- SELECT DE NOME, PONTUACAO E PERCENTUAL DO QUIZ--
SELECT nome, pontuacao,  percentualPontuacao FROM Pontuacao JOIN usuario ON fkUsuario = idUsuario ORDER BY  pontuacao  DESC;





-- SELECT (DASHBOARD) PEGAR PERSONAGEM FAVORITOS DE CADA USUARIO
SELECT COUNT(Usuario.fkPersonagem) as voto, Personagem.nomePersonagem AS personagem 
FROM Usuario JOIN Personagem ON  personagem.idPersonagem = usuario.fkPersonagem group by usuario.fkPersonagem;





-- SELECT (DASHBOARD) PEGAR MÉDIA DO QUIZ
SELECT round(AVG(pontuacao.percentualPontuacao) , 2) AS 'Média do quiz' FROM Pontuacao;


