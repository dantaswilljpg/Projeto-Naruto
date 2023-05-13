DROP DATABASE naruto_projeto_individual;

CREATE DATABASE naruto_projeto_individual;


USE naruto_projeto_individual;

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
   fkpersonagem INT ,
   FOREIGN KEY (fkpersonagem) REFERENCES personagem(idPersonagem)
);
INSERT INTO Usuario VALUES
(NULL , 'Sophia Amaral','SophiaAmaral@gmail.com','sophia123',6);


INSERT INTO Usuario VALUES
(NULL , 'Luigi Tadeu','Luigi@gmail.com','Linguincina',6),
(NULL,'Will Dantas','Dantas@gmail.com','UchihaMadara12345',1),
(NULL,'Eduardo Verri','Eduardo@gmail.com','Eduardo123',2),
(NULL,'Vivian Silva','Vivian@gmail.com','Vivian123',3),
(NULL,'Fernanda Caramico','Fernanda@gmail.com','Fernanda123',4),
(NULL,'Monica Herrera','Monica@gmail.com','Monica123',5),
(NULL,'Caio Algorotimo','Caio@gmail.com','Caio123',1);







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
(NULL,'Jiraya Sama');
   

SELECT * FROM Usuario;
SELECT * FROM  Pontuacao;
SELECT * FROM Personagem;





SELECT nome, pontuacao,  percentualPontuacao FROM Pontuacao JOIN usuario ON fkUsuario = idUsuario ORDER BY  percentualPontuacao  DESC;


SELECT COUNT(Usuario.fkPersonagem) as voto, Personagem.nomePersonagem AS personagem 
FROM Usuario JOIN Personagem ON  personagem.idPersonagem = usuario.fkPersonagem group by usuario.fkPersonagem;


SELECT COUNT(Pontuacao.fkUsuario) as Nome, Pontuacao.percentualPontuacao AS Média
FROM Pontuacao JOIN Usuario ON   Pontuacao.idPontuacao = Pontuacao.fkUsuario group by Pontuacao.fkUsuario;



select  round(avg(pontuacao.percentualPontuacao) , 2) as 'Média do quiz' from Pontuacao;


select round(avg(pontuacao.percentualPontuacao)) from Pontuacao;