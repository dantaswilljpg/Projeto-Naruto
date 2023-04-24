-- DROP DATABASE naruto;
CREATE DATABASE naruto;
USE naruto;

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    personagem VARCHAR(10)
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
nomePersonagem VARCHAR(45),
fkUsuario INT,
FOREIGN KEY(fkUsuario) REFERENCES Personagem (idPersonagem)
);




SELECT * FROM Usuario;
SELECT * FROM  Pontuacao;
SELECT * FROM Personagem;