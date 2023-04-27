DROP DATABASE naruto_projeto_individual;
CREATE DATABASE naruto_projeto_individual;
USE naruto_projeto_individual;

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
   fkpersonagem int ,
   foreign key(fkpersonagem) references personagem(idPersonagem)
);


CREATE TABLE Pontuacao (
	idPontuacao INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT, 
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
	pontuacao INT,
    perPont FLOAT
);

CREATE TABLE Personagem(
idPersonagem INT PRIMARY KEY AUTO_INCREMENT,
nomePersonagem VARCHAR(45)
);

INSERT INTO Personagem VALUES
(NULL,'Uchiha Madara'),
(NULL,'Uchiha Sasuke'),
(NULL,'Uchiha Obito'),
(NULL,'Uzumaki Naruto');

SELECT * FROM Usuario;
SELECT * FROM  Pontuacao;
SELECT * FROM Personagem;